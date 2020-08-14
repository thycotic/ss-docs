[title]: # (RabbitMQ Durable Exchanges)
[tags]: # (RabbitMQ Durable Exchanges)
[priority]: # (1000)

# RabbitMQ Durable Exchanges

## Overview

As of SS 10.7.59, the SS MessageQueue Client attempts to create RabbitMQ durable exchanges, logging the activity. A durable exchange is normally automatically re-created if RabbitMQ restarts for any reason. Any legacy non-durable exchanges disappear when RabbitMQ goes down and can only be manually recreated.

If the MessageQueue client detects that creating a durable exchange failed, it will log an error and attempt to create a non-durable one.

> **Important:** Any existing non-durable exchanges, from previous versions of SS, will also cause durable exchange creation to fail. See [Manually Creating Durable RabbitMQ Exchanges](#manually-creating-durable-rabbitmq-exchanges).

Non-durable RabbitMQ exchanges for SS would look similar to this, whether created by an earlier SS version or by a durable-version-creation failure:

![image-20200401122232607](images/image-20200401122232607.png)

Note the absence of a 'D' in the Features column, meaning that exchange is not durable. Durable exchanges, created by the current SS version (10.7.59+), look like this:

![image-20200401122335657](images/image-20200401122335657.png)

Earlier versions of SS (before 10.7.59) created non-durable RabbitMQ exchanges during a SS server or IIS restart. If the environment is clustered, the same is true of every node in that cluster. The current durable exchanges persist during any IIS restart, eliminating the need to restart SS or recreate the exchanges.

However, any existing non-durable exchanges prevent the creation of the newer durable ones. To remedy that, you need to restart all of the RabbitMQ servers in the cluster at the same time or manually delete the non-durable exchanges.

## Manually Creating Durable RabbitMQ Exchanges

To enjoy the benefits of the durable exchanges, you must first eliminate any legacy non-durable exchanges from your RabbitMQ server or servers. There are two ways to do this:

- Restart the RabbitMQ server or all of the RabbitMQ servers in the cluster at the same time.  You can also stop the RabbitMQ service in `services.msc`.

>**Note:** Customers usually reset or turn off all servers via third party tools, but some prefer to shut off the service via services.msc because of their system configuration.

- Delete the exchanges manually:

  1. Click to select each SS non-durable exchange, including distributed engine ones.
  1. Scroll to the bottom of the window.
  1. Click the **Delete** button.
  1. Restart all of the SS instances and distributed engines to recreate the exchanges and connections.

## Creating Durable RabbitMQ Exchanges with a PowerShell Script

### Using the Script

```powershell
powershell.exe -file exchangedurability.ps1 -username "guest" -password "guest" -computerName "localhost" -port "15672"
```
The user has access to the RabbitMQ admin interface. The computername and port is where the admin interface is located.

The script:

1. Removes all of the exchanges that are not durable and any that are not the `thycotic-sr*` ones for legacy ASRAs.

1. Kills all of the connections. This forces the distributed engines and SS to reconnect to the durable exchanges.

### Script

```powershell
param([string] $computerName = "",
    [string] $userName = "",
    [string] $password = "",
    [string] $port = ""
)


$defaultComputerName = if ($computerName -eq "") { "localhost" }else { $computerName }
$defaultVirtualhost = "/"
$defaultUserName = if ($userName -eq "") { "guest" }else { $userName }
$defaultPassword = if ($password -eq "") { "guest" }else { $password }
$defaultPort = if ($port -eq "") { "15672" }else { $port }
$defaultHttp = "http" #Use https if ssl

$defaultCredentials = New-Object System.Management.Automation.PSCredential ($defaultUserName, $(ConvertTo-SecureString $defaultPassword -AsPlainText -Force))

#LICENSE FOR LINKS - All the RabbitMQ PowerShell calls are based on this:

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/LICENSE

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/GetConnection.ps1

function Get-RabbitMQConnection
{
    [CmdletBinding(DefaultParameterSetName='defaultLogin', SupportsShouldProcess=$true, ConfirmImpact='None')]
    Param
    (
        # Name of RabbitMQ Connection.
        [parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
        [Alias("Connection", "ConnectionName")]
        [string[]]$Name = "",

        # Name of the computer hosting RabbitMQ server. Default value is localhost.
        [parameter(ValueFromPipelineByPropertyName=$true)]
        [Alias("HostName", "hn", "cn")]
        [string]$ComputerName = $defaultComputerName,

        # UserName to use when logging to RabbitMq server.
        [Parameter(Mandatory=$true, ParameterSetName='login')]
        [string]$UserName,

        # Password to use when logging to RabbitMq server.
        [Parameter(Mandatory=$true, ParameterSetName='login')]
        [string]$Password,

        # Credentials to use when logging to RabbitMQ server.
        [Parameter(Mandatory=$true, ParameterSetName='cred')]
        [PSCredential]$Credentials
    )

    Begin
    {
        $Credentials = NormaliseCredentials
    }
    Process
    {
        if ($pscmdlet.ShouldProcess("server $ComputerName", "Get connection(s): $(NamesToString $Name '(all)')"))
        {
            $result = GetItemsFromRabbitMQApi -ComputerName $ComputerName $Credentials "connections"

            $result = ApplyFilter $result 'name' $Name

            $result | Add-Member -NotePropertyName "ComputerName" -NotePropertyValue $ComputerName

            SendItemsToOutput $result "RabbitMQ.Connection"
        }
    }
    End
    {
    }
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/PreventUnEscapeDotsAndSlashesOnUri.ps1
if (-not $UnEscapeDotsAndSlashes) { Set-Variable -Scope Script -name UnEscapeDotsAndSlashes -value 0x2000000 }
function GetUriParserFlags {

    $getSyntax = [System.UriParser].GetMethod("GetSyntax", 40)
    $flags = [System.UriParser].GetField("m_Flags", 36)

    $parser = $getSyntax.Invoke($null, "http")
    return $flags.GetValue($parser)
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/PreventUnEscapeDotsAndSlashesOnUri.ps1
function SetUriParserFlags([int]$newValue) {
    $getSyntax = [System.UriParser].GetMethod("GetSyntax", 40)
    $flags = [System.UriParser].GetField("m_Flags", 36)

    $parser = $getSyntax.Invoke($null, "http")
    $flags.SetValue($parser, $newValue)
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/PreventUnEscapeDotsAndSlashesOnUri.ps1
function PreventUnEscapeDotsAndSlashesOnUri {
    if (-not $uriUnEscapesDotsAndSlashes) { return }

    Write-Verbose "Switching off UnEscapesDotsAndSlashes flag on UriParser."

    $newValue = $defaultUriParserFlagsValue -bxor $UnEscapeDotsAndSlashes

    SetUriParserFlags $newValue
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/PreventUnEscapeDotsAndSlashesOnUri.ps1
function RestoreUriParserFlags {
    if (-not $uriUnEscapesDotsAndSlashes) { return }

    Write-Verbose "Restoring UriParser flags - switching on UnEscapesDotsAndSlashes flag."

    try {
        SetUriParserFlags $defaultUriParserFlagsValue
    }
    catch [System.Exception] {
        Write-Error "Failed to restore UriParser flags. This may cause your scripts to behave unexpectedly. You can find more at get-help about_UnEsapingDotsAndSlashes."
        throw
    }
}

if (-not $defaultUriParserFlagsValue) { Set-Variable -Scope Script -name defaultUriParserFlagsValue -value (GetUriParserFlags) }
if (-not $uriUnEscapesDotsAndSlashes) { Set-Variable -Scope Script -name uriUnEscapesDotsAndSlashes -value (($defaultUriParserFlagsValue -band $UnEscapeDotsAndSlashes) -eq $UnEscapeDotsAndSlashes) }


#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/Invoke_RestMethodProxy.ps1
function Invoke-RestMethod {
    [CmdletBinding(HelpUri = 'http://go.microsoft.com/fwlink/?LinkID=217034')]
    param(
        [Microsoft.PowerShell.Commands.WebRequestMethod]
        ${Method},

        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [uri]
        ${Uri},

        [Microsoft.PowerShell.Commands.WebRequestSession]
        ${WebSession},

        [Alias('SV')]
        [string]
        ${SessionVariable},

        [pscredential]
        ${Credential},

        [switch]
        ${UseDefaultCredentials},

        [ValidateNotNullOrEmpty()]
        [string]
        ${CertificateThumbprint},

        [ValidateNotNull()]
        [System.Security.Cryptography.X509Certificates.X509Certificate]
        ${Certificate},

        [string]
        ${UserAgent},

        [switch]
        ${DisableKeepAlive},

        [int]
        ${TimeoutSec},

        [System.Collections.IDictionary]
        ${Headers},

        [ValidateRange(0, 2147483647)]
        [int]
        ${MaximumRedirection},

        [uri]
        ${Proxy},

        [pscredential]
        ${ProxyCredential},

        [switch]
        ${ProxyUseDefaultCredentials},

        [Parameter(ValueFromPipeline = $true)]
        [System.Object]
        ${Body},

        [string]
        ${ContentType},

        [ValidateSet('chunked', 'compress', 'deflate', 'gzip', 'identity')]
        [string]
        ${TransferEncoding},

        [string]
        ${InFile},

        [string]
        ${OutFile},

        [switch]
        ${PassThru},

        [switch]
        ${AllowEscapedDotsAndSlashes})

    begin {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
                $PSBoundParameters['OutBuffer'] = 1
            }

            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('Microsoft.PowerShell.Utility\Invoke-RestMethod', [System.Management.Automation.CommandTypes]::Cmdlet)

            # check whether need to disable UnEscapingDotsAndSlases on UriParser
            $requiresDisableUnEscapingDotsAndSlashes = ($AllowEscapedDotsAndSlashes -and $Uri.OriginalString -match '%2f')

            # remove additional proxy parameter to prevent original function from failing
            if ($PSBoundParameters['AllowEscapedDotsAndSlashes']) { $null = $PSBoundParameters.Remove('AllowEscapedDotsAndSlashes') }

            $scriptCmd = { & $wrappedCmd @PSBoundParameters }
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        }
        catch {
            throw
        }
    }

    process {
        try {
            # Disable UnEscapingDotsAndSlashes on UriParser when necessary
            if ($requiresDisableUnEscapingDotsAndSlashes) {
                PreventUnEscapeDotsAndSlashesOnUri
            }

            $steppablePipeline.Process($_)
        }
        finally {
            # Restore UnEscapingDotsAndSlashes on UriParser when necessary
            if ($requiresDisableUnEscapingDotsAndSlashes) {
                RestoreUriParserFlags
            }
        }
    }

    end {
        try {
            $steppablePipeline.End()
        }
        catch {
            throw
        }
    }
}
<#
.ForwardHelpTargetName Invoke-RestMethod
.ForwardHelpCategory Cmdlet
#>

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/GetRabbitMQCredentials.ps1
function GetRabbitMQCredentials {
    Param
    (
        [parameter(Mandatory = $true)]
        [string]$userName,

        [parameter(Mandatory = $true)]
        [string]$password
    )

    $secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
    return New-Object System.Management.Automation.PSCredential ($userName, $secpasswd)
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/NamesToString.ps1
function NamesToString {
    Param
    (
        [string[]]$name,
        [string]$altText = ""
    )

    if (-not $name) { return $altText }

    return $name -join ';'
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/ApplyFilter.ps1
function ApplyFilter {
    Param (
        [parameter()]
        [PSObject[]]$items,

        [parameter(Mandatory = $true)]
        [string]$prop,

        [string[]]$name
    )

    if (-not $name) { return $items }

    # apply property filter
    $filter = @()
    foreach ($n in $name) { $filter += '$_.' + $prop + '-like "' + $n + '"' }

    $sb = [scriptblock]::create($filter -join ' -or ')
    return $items | ? $sb
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/NormaliseCredentials.ps1
function NormaliseCredentials() {
    switch ($PsCmdlet.ParameterSetName) {
        "defaultLogin" { return GetRabbitMqCredentials $defaultUserName $defaultPassword }
        "login" { return GetRabbitMqCredentials $UserName $Password }
        "cred" { return $Credentials }
    }
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/SendItemsToOutput.ps1
function SendItemsToOutput {
    Param
    (
        [parameter()]
        [PSObject[]]$items,

        [parameter(Mandatory = $true)]
        [string[]]$typeName
    )

    foreach ($i in $items) {
        $i.PSObject.TypeNames.Insert(0, $typeName)
        Write-Output $i
    }
}



#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/GetItemsFromRabbitMQApi.ps1
function GetItemsFromRabbitMQApi {
    [CmdletBinding(DefaultParameterSetName = 'login')]
    Param
    (
        [parameter(Mandatory = $true, ParameterSetName = 'login', Position = 0)]
        [string]$cn,

        [parameter(Mandatory = $true, ParameterSetName = 'login', Position = 1)]
        [string]$userName,

        [parameter(Mandatory = $true, ParameterSetName = 'login', Position = 2)]
        [string]$password,

        [parameter(Mandatory = $true, ParameterSetName = 'login', Position = 3)]
        [string]$fn,


        [parameter(Mandatory = $true, ParameterSetName = 'cred', Position = 0)]
        [string]$computerName,

        [parameter(Mandatory = $true, ParameterSetName = 'cred', Position = 1)]
        [PSCredential]$cred,

        [parameter(Mandatory = $true, ParameterSetName = 'cred', Position = 2)]
        [string]$function
    )

    Add-Type -AssemblyName System.Web
    #Add-Type -AssemblyName System.Net

    if ($PsCmdlet.ParameterSetName -eq "login") {
        $computerName = $cn
        $cred = GetRabbitMqCredentials $userName $password
        $function = $fn
    }
    Write-Output $computerName
    $url = $defaultHttp + "://$([System.Web.HttpUtility]::UrlEncode($computerName)):$defaultPort/api/$function"
    Write-Verbose "Invoking REST API: $url"

    return Invoke-RestMethod $url -Credential $cred -DisableKeepAlive -AllowEscapedDotsAndSlashes
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/GetExchange.ps1
function Get-RabbitMQExchange {
    [CmdletBinding(DefaultParameterSetName = 'defaultLogin', SupportsShouldProcess = $true, ConfirmImpact = 'None')]
    Param
    (
        # Name of RabbitMQ Exchange.
        [parameter(ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [Alias("ex", "Exchange", "ExchangeName")]
        [string[]]$Name = "",

        # Name of RabbitMQ Virtual Host.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias("vh")]
        [string]$VirtualHost = "",

        # Name of the computer hosting RabbitMQ server. Defalut value is localhost.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias("HostName", "hn", "cn")]
        [string]$ComputerName = $defaultComputerName,


        # UserName to use when logging to RabbitMq server.
        [Parameter(Mandatory = $true, ParameterSetName = 'login')]
        [string]$UserName,

        # Password to use when logging to RabbitMq server.
        [Parameter(Mandatory = $true, ParameterSetName = 'login')]
        [string]$Password,

        # Credentials to use when logging to RabbitMQ server.
        [Parameter(Mandatory = $true, ParameterSetName = 'cred')]
        [PSCredential]$Credentials
    )

    Begin {
        $Credentials = NormaliseCredentials
    }
    Process {
        if ($pscmdlet.ShouldProcess("server $ComputerName", "Get exchange(s): $(NamesToString $Name '(all)')")) {
            $exchanges = GetItemsFromRabbitMQApi -ComputerName $ComputerName $Credentials "exchanges"

            $result = ApplyFilter $exchanges 'vhost' $VirtualHost
            $result = ApplyFilter $result 'name' $Name

            $result | Add-Member -NotePropertyName "ComputerName" -NotePropertyValue $ComputerName

            SendItemsToOutput $result "RabbitMQ.Exchange"
        }
    }
    End {
    }
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/RemoveExchange.ps1
function Remove-RabbitMQExchange {
    [CmdletBinding(DefaultParameterSetName = 'defaultLogin', SupportsShouldProcess = $true, ConfirmImpact = "High")]
    Param
    (
        # Name of RabbitMQ Exchange.
        [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
        [Alias("Exchange", "ExchangeName")]
        [string[]]$Name,

        # Name of RabbitMQ Virtual Host.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias("vh", "vhost")]
        [string]$VirtualHost = $defaultVirtualhost,

        # Name of the computer hosting RabbitMQ server. Defalut value is localhost.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias("HostName", "hn", "cn")]
        [string]$ComputerName = $defaultComputerName,


        # UserName to use when logging to RabbitMq server.
        [Parameter(Mandatory = $true, ParameterSetName = 'login')]
        [string]$UserName,

        # Password to use when logging to RabbitMq server.
        [Parameter(Mandatory = $true, ParameterSetName = 'login')]
        [string]$Password,

        # Credentials to use when logging to RabbitMQ server.
        [Parameter(Mandatory = $true, ParameterSetName = 'cred')]
        [PSCredential]$Credentials
    )

    Begin {
        $Credentials = NormaliseCredentials
        $cnt = 0
    }
    Process {
        if ($pscmdlet.ShouldProcess("server: $ComputerName, vhost: $VirtualHost", "Remove exchange(s): $(NamesToString $Name '(all)')")) {
            foreach ($n in $Name) {
                $url = $defaultHttp + "://$([System.Web.HttpUtility]::UrlEncode($ComputerName)):$defaultPort/api/exchanges/$([System.Web.HttpUtility]::UrlEncode($VirtualHost))/$([System.Web.HttpUtility]::UrlEncode($n))"
                Write-Output $url
                $result = Invoke-RestMethod $url -Credential $Credentials -AllowEscapedDotsAndSlashes -DisableKeepAlive -ErrorAction Continue -Method Delete

                Write-Verbose "Deleted Exchange $n on server $ComputerName, Virtual Host $VirtualHost"
                $cnt++
            }
        }
    }
    End {
        if ($cnt -gt 1) { Write-Verbose "Deleted $cnt Exchange(s)." }
    }
}

#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/AddExchange.ps1
function Add-RabbitMQExchange {
    [CmdletBinding(DefaultParameterSetName = 'defaultLogin', SupportsShouldProcess = $true, ConfirmImpact = "Medium")]
    Param
    (
        # Name of RabbitMQ Exchange.
        [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
        [Alias("Exchange", "ExchangeName")]
        [string[]]$Name,

        # Type of the Exchange to create.
        [parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateSet("topic", "fanout", "direct", "headers")]
        [string]$Type,

        # Determines whether the exchange should be Durable.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [switch]$Durable,

        # Determines whether the exchange will be deleted once all queues have finished using it.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [switch]$AutoDelete,

        # Determines whether the exchange should be Internal.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [switch]$Internal,

        # Allows to set alternate exchange to which all messages which cannot be routed will be send.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias("alt")]
        [string]$AlternateExchange,

        # Name of RabbitMQ Virtual Host.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias("vh", "vhost")]
        [string]$VirtualHost = $defaultVirtualhost,

        # Name of the computer hosting RabbitMQ server. Defalut value is localhost.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias("HostName", "hn", "cn")]
        [string]$ComputerName = $defaultComputerName,


        # UserName to use when logging to RabbitMq server.
        [Parameter(Mandatory = $true, ParameterSetName = 'login')]
        [string]$UserName,

        # Password to use when logging to RabbitMq server.
        [Parameter(Mandatory = $true, ParameterSetName = 'login')]
        [string]$Password,

        # Credentials to use when logging to RabbitMQ server.
        [Parameter(Mandatory = $true, ParameterSetName = 'cred')]
        [PSCredential]$Credentials
    )

    Begin {
        $Credentials = NormaliseCredentials
    }
    Process {
        if ($pscmdlet.ShouldProcess("server: $ComputerName, vhost: $VirtualHost", "Add exchange(s): $(NamesToString $Name '(all)')")) {

            $body = @{
                type = "$Type"
            }

            if ($Durable) { $body.Add("durable", $true) }
            if ($AutoDelete) { $body.Add("auto_delete", $true) }
            if ($Internal) { $body.Add("internal", $true) }
            if ($AlternateExchange) { $body.Add("arguments", @{ "alternate-exchange" = $AlternateExchange }) }

            $bodyJson = $body | ConvertTo-Json

            foreach ($n in $Name) {
                $url = $defaultHttp+"://$([System.Web.HttpUtility]::UrlEncode($ComputerName)):$defaultPort/api/exchanges/$([System.Web.HttpUtility]::UrlEncode($VirtualHost))/$([System.Web.HttpUtility]::UrlEncode($n))"
                Write-Verbose "Invoking REST API: $url"

                $result = Invoke-RestMethod $url -Credential $Credentials -AllowEscapedDotsAndSlashes -DisableKeepAlive -ErrorAction Continue -Method Put -ContentType "application/json" -Body $bodyJson

                Write-Verbose "Created Exchange $n on server $ComputerName, Virtual Host $VirtualHost"
                $cnt++
            }
        }
    }
    End {
        if ($cnt -gt 1) { Write-Verbose "Created $cnt Exchange(s)." }
    }
}

#Modified to allow + in url.
#https://github.com/mariuszwojcik/RabbitMQTools/blob/master/RemoveQueue.ps1
function Remove-RabbitMQConnection {
    Param
    (
        # Name of RabbitMQ connection.
        [parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, Position = 0)]
        [Alias("ConnectionName")]
        [string] $Name = "",

        # Name of the computer hosting RabbitMQ server. Defalut value is localhost.
        [parameter(ValueFromPipelineByPropertyName = $true)]
        [Alias("HostName", "hn", "cn")]
        [string]$ComputerName = $defaultComputerName,

        # Credentials to use when logging to RabbitMQ server.
        [Parameter(Mandatory = $false)]
        [PSCredential]$Credentials = $defaultCredentials
    )

    $url = $defaultHttp + "://$([System.Web.HttpUtility]::UrlEncode($ComputerName)):$defaultPort/api/connections/$([System.Web.HttpUtility]::UrlEncode($name))"
    $url = $url.Replace("+", "%20")
    Write-Output $url
    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("X-Reason", "Removing To Create Durable Exchanges")
    $result = Invoke-RestMethod $url -Credential $Credentials -Headers $headers -DisableKeepAlive:$InvokeRestMethodKeepAlive -ErrorAction Continue -Method Delete
    Write-Output "$url closed."

    Write-Verbose "Closed connection $n to server $ComputerName"
}

function MakeExistingExchangesDurable() {
    Param(
        [string] $HostName = $defaultComputerName,
        [string] $UserName = $defaultUserName,
        [string] $Password = $defaultPassword,
        [string] $VirtualHost = "/",
        [bool] $IgnoreConfirms = $false
    )

    $exchanges = Get-RabbitMQExchange
    $nondurableExchanges = New-Object System.Collections.ArrayList
    Foreach ($exchange in $exchanges) {
        if ($exchange.name -and -not ($exchange.durable) -and -not $exchange.name.Contains("thycotic-sr")) {
            $nondurableExchanges.Add($exchange) > $null
        }
    }
    if ($nondurableExchanges.Count -eq 0) {
        Write-Output "All the exchanges are durable."
        return
    }

    Write-Output "`r`nFound these exchanges as not durable:"
    Write-Output $nondurableExchanges | ForEach-Object { '{0}' -f $_.Name }

    $confirmation = ''
    if ($IgnoreConfirms -eq $false) {
        $confirmation = Read-Host "Are you Sure You Want To Proceed [y/n]"
    }
    if ($confirmation -eq 'y' -or $IgnoreConfirms -eq $true) {
        try {
            Foreach ($nondurableExchange in $nondurableExchanges) {
                Remove-RabbitMQExchange -Name $nondurableExchange.Name -VirtualHost $nondurableExchange.vhost -Confirm:$(-not $IgnoreConfirms)
                Add-RabbitMQExchange -Name $nondurableExchange.Name -Durable:$true -Type $nondurableExchange.type -AutoDelete:$nondurableExchange.auto_delete -Internal:$nondurableExchange.Internal -VirtualHost $nondurableExchange.vhost -Confirm:$(-not $IgnoreConfirms)
            }
            $connections = Get-RabbitMQConnection
            Foreach ($connection in $connections) {
                if ($connection.Name)
                {
                    Remove-RabbitMQConnection $connection.Name
                }
            }

        }
        catch {
            throw $_
        }
        Write-Output "Exchanges are now durable."
    }
    else {
        Write-Output "Not going to make the exchanges durable."
    }
}


MakeExistingExchangesDurable -IgnoreConfirms $true
```

