[title]: # (Atlassian JIRA Integration)
[tags]: # (atlassian,jira,integration,powershell)
[priority]: # (1000)

# Ticket System Integration - Atlassian JIRA (PowerShell)

Secret Server can integrate with Atlassian's JIRA via PowerShell. This integration includes validating ticket numbers and their status, and adding comments.

For more information about integrating Ticket Systems with PowerShell, see [PowerShell Ticketing Integration](../powershell-integration/index.md)

## Requirements

* PowerShell, see [Creating and Using PowerShell Scripts](../../api-scripting/creating-using-powershell-scripts/index.md)
* Access to your ManageEngine ServiceDesk Plus instance's REST API
* Configure CredSSP for use with WinRM/PowerShell, see [Configuring CredSSP for WinRM with PowerShell](../../authentication/configuring-credssp-for-winrm-with-powershell/index.md)

>**Note**: You may need to enable TLS 1.2 as Atlassian has deprecated TLS 1.0 and 1.1 and will support only TLS 1.2 and 1.3 going forward. See [Deprecating TLSv1 and TLSv1.1 for Atlassian Cloud Products](https://community.atlassian.com/t5/Jira-articles/Deprecating-TLSv1-and-TLSv1-1-for-Atlassian-Cloud-Products/ba-p/857357).

## Ticket Number Validation Pattern (Regex)

Before making a call to the ticket validation script, you can have Secret Server validate that the number matches a pattern. For more information, see **Setting a Ticket Pattern Regex** on the [Ticketing System Integration](../index.md) page.

If you are using ticketing system integration, a ticket pattern can be set on the Ticket System Integration tab of the configuration page. If you don't want to restrict what ticket numbers a user can enter, you can leave the Ticket Number Validation Pattern (Regex) check box blank. If you do want to restrict it, than you can enter a regular expression in the text box. The ticket number entered must match the regular expression.

For more information on regular expressions, please see [Regular Expressions](
http://www.grymoire.com/Unix/Regular.html)

If you are supported and need assistance setting up a validation pattern, feel free to email support@thycotic.com.

Here is an example for a ticket pattern that must be a valid number:

`^[0-9]+$`

## Validating Ticket Status

To validate tickets you will need to create a PowerShell script to retrieve and validate the ticket. This integration assumes that the user will pass in the full ticket name including the project name. For example: (PROJ-123). This could easily be extended so that multiple JIRA instances could be made for each specific project. In that case, you could have the user only provide the ticket number and pass in an argument to the script that specifies the project. This implementation also assumes that any ticket not in "Closed" status is invalid.
$ticket = $args[0]
$user = $args[1]
$password = $args[2]
$url = $args[3]
$closedStatus = "Closed"
$fields = "status"

$p = $password | ConvertTo-SecureString -AsPlainText -Force

$credentials = New-Object System.Management.Automation.PsCredential($user,$p)
$getStatusMethod = "$url/rest/api/latest/issue/$ticket"

function ConvertTo-UnsecureString([System.Security.SecureString][parameter(mandatory=$true)]$SecurePassword)
{
    $unmanagedString = [System.IntPtr]::Zero;
    try
    {
        $unmanagedString = [Runtime.InteropServices.Marshal]::SecureStringToGlobalAllocUnicode($SecurePassword)
        return [Runtime.InteropServices.Marshal]::PtrToStringUni($unmanagedString)
    }
    finally
    {
        [Runtime.InteropServices.Marshal]::ZeroFreeGlobalAllocUnicode($unmanagedString)
    }
}

function ConvertTo-Base64($string) 
{
   $bytes  = [System.Text.Encoding]::UTF8.GetBytes($string);
   $encoded = [System.Convert]::ToBase64String($bytes);
   return $encoded;
}

function ConvertFrom-Base64($string) 
{
   $bytes  = [System.Convert]::FromBase64String($string);
   $decoded = [System.Text.Encoding]::UTF8.GetString($bytes);
   return $decoded;
}

function Get-HttpBasicHeader($Credentials, $Headers = @{})
{
	$b64 = ConvertTo-Base64 "$($Credentials.UserName):$(ConvertTo-UnsecureString $Credentials.Password)"
	$Headers["Authorization"] = "Basic $b64"
	return $Headers
}

try
{
    $headers = Get-HttpBasicHeader $credentials
    $response = Invoke-RestMethod -Method Get -uri $getStatusMethod -Headers $headers -ContentType 'application/json'

    if($response.fields.status.name -eq $closedStatus)
    {
        throw "JIRA ticket ($ticket) is closed."
    }
}
catch
{
    $exception = $_.Exception
    if ($exception.Response.StatusCode.value__ -eq 404)
    {
        throw "JIRA ticket ($ticket) does not exist."
    }
}
 
Adding Comments to Tickets
To add a comment to tickets you will need to create the following script.
$ticket = $args[0]
$comment = $args[1]
$user = $args[2]
$password = $args[3]
$url = $args[4]

$p = $password | ConvertTo-SecureString -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PsCredential($user,$p)

function ConvertTo-UnsecureString([System.Security.SecureString][parameter(mandatory=$true)]$SecurePassword)
{
    $unmanagedString = [System.IntPtr]::Zero;
    try
    {
        $unmanagedString = [Runtime.InteropServices.Marshal]::SecureStringToGlobalAllocUnicode($SecurePassword)
        return [Runtime.InteropServices.Marshal]::PtrToStringUni($unmanagedString)
    }
    finally
    {
        [Runtime.InteropServices.Marshal]::ZeroFreeGlobalAllocUnicode($unmanagedString)
    }
}

function ConvertTo-Base64($string) 
{
   $bytes  = [System.Text.Encoding]::UTF8.GetBytes($string);
   $encoded = [System.Convert]::ToBase64String($bytes);
   return $encoded;
}

function ConvertFrom-Base64($string) 
{
   $bytes  = [System.Convert]::FromBase64String($string);
   $decoded = [System.Text.Encoding]::UTF8.GetString($bytes);
   return $decoded;
}

function Get-HttpBasicHeader($Credentials, $Headers = @{})
{
	$b64 = ConvertTo-Base64 "$($Credentials.UserName):$(ConvertTo-UnsecureString $Credentials.Password)"
	$Headers["Authorization"] = "Basic $b64"
	return $Headers
}

try
{
    $updateObject = @{'body'=$comment}
    $body = $updateObject | ConvertTo-Json
    $addComment = "$url/rest/api/latest/issue/$ticket/comment"
    $headers = Get-HttpBasicHeader $credentials
    $response = Invoke-RestMethod -uri $addComment -Headers $headers -Method Post -ContentType "application/json" -Body $body

    if ($response.body -ne $comment)
    {
        throw "There was an issue adding a comment to the ticket ($ticket)."
    }
}
catch
{
    $exception = $_.Exception
    if ($exception.Response.StatusCode.value__ -eq 404)
    {
        throw "The ticket ($ticket) does not exist.";
    }
    if ($exception.Response.StatusCode.value__ -eq 400)
    {
        throw "There was an issue adding a comment to the ticket ($ticket)."
    }

    throw "There was an unhandled issue with adding a comment: " + $exception.ToString()
}
