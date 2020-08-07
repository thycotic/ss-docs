[title]: # (REST API PowerShell Script Examples)
[tags]: # (REST API,API,Scripting,PowerShell,PowerShell examples)
[priority]: # (1000)

# REST API PowerShell Script Examples

> **Note:** The REST API is available as of SS 9.1.

>**Note:** For a full reference of the REST endpoints and parameters, see the [REST API Guide](../rest-api-reference-download/index.md).

> **Note:** When using the API to search secrets, the account used must have at least “view” permissions on the full folder path to find the secret.

 >  **Note:** Secret Server Cloud exclusively supports TLS 1.2. This version includes fixes for known vulnerabilities in older TLS versions and will eventually be required for PCI compliance. The following will need to be added to the top of your scripts because PowerShell defaults to TLS 1.0:
 >  `[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12`

> **Note:** Secret Server Cloud API users: If Thycotic One is enabled, _and_ an API user logging on has an email address set in Secret Server, the user *must* use the Thycotic One password, instead of the local SS password. Using a local account password will fail. Use one of these workarounds:
> * Disable Thycotic One, if not needed
> * Use the Thycotic One password instead
> * Use a user account that does not have an email address in SS

## OAuth Authentication

> **Note:**  If your account is secured with 2FA, use the `-UseTwoFactor` switch to be prompted to enter your two-factor OTP code.

```powershell

$application = "https://<Secret Server URL>";

# Define the user credentials
$username = "< username >";
$password = "< password >"; # Read-Host -Prompt "Enter your password: "

Function Get-Token
{
    [CmdletBinding()]
    Param(
        [Switch] $UseTwoFactor
    )

    $creds = @{
        username = $username
        password = $password
        grant_type = "password"
    };

    $headers = $null
    If ($UseTwoFactor) {
        $headers = @{
            "OTP" = (Read-Host -Prompt "Enter your OTP for 2FA: ")
        }
    }

    try
    {
        $response = Invoke-RestMethod "$application/oauth2/token" -Method Post -Body $creds -Headers $headers;
        $token = $response.access_token;
        return $token;
    }
    catch
    {
        $result = $_.Exception.Response.GetResponseStream();
        $reader = New-Object System.IO.StreamReader($result);
        $reader.BaseStream.Position = 0;
        $reader.DiscardBufferedData();
        $responseBody = $reader.ReadToEnd() | ConvertFrom-Json
        Write-Host "ERROR: $($responseBody.error)"
        return;
    }
}
```

## Windows Authentication

```powershell
$api = "https://<Secret Server URL>/winauthwebservices/api/v1"
$endpoint = "$api/secrets/3844"
$secret = Invoke-RestMethod $endpoint -UseDefaultCredentials
```

## Searching Secrets

```powershell
try
{

    $api = "https://<Secret Server URL>/api/v1"
    $tokenRoute = "https://<Secret Server URL>/oauth2/token";

    $creds = @{
        username = "<username>"
        password = "<password>"
        grant_type = "password"
    }

    $token = ""

    $response = Invoke-RestMethod $tokenRoute -Method Post -Body $creds
    $token = $response.access_token;

    #Write-Host $token

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "Bearer $token")

    $filters = "?filter.HeartbeatStatus=1&filter.includeRestricted=true&filter.searchtext=< mySearchText >"

    Write-Host "------------------------------"
    Write-Host "----- Secret Search Values -----"
    Write-Host "------------------------------"

    #?filter.searchfield=username&filter.searchfield=displayname&filter.searchfield=filter.searchText=mister&filter.includeinactive=true" -Headers $headers

    $result = Invoke-RestMethod "$api/secrets$filters" -Headers $headers

    Write-Host $result.filter.searchField
    Write-Host $result.total

    foreach($secret1 in $result.records)
    {
       Write-Host $secret1.id" - "$secret1.name" - "$secret1.folderId - $secret1.lastHeartBeatStatus
    }

    Write-Host "------------------------------"
    Write-Host "----- Secret Lookup Values -----"
    Write-Host "------------------------------"

    #?filter.searchfield=username&filter.searchfield=displayname&filter.searchfield=filter.searchText=mister&filter.includeinactive=true" -Headers $headers

    $result = Invoke-RestMethod "$api/secrets/lookup$filters" -Headers $headers

    Write-Host $result.filter.searchField
    Write-Host $result.total

    foreach($secret in $result.records)
    {
       Write-Host $secret.id" - "$secret.value
    }
    Write-Host "------------------------------"
}
catch [System.Net.WebException]
{
    Write-Host "----- Exception -----"
    Write-Host  $_.Exception
    Write-Host  $_.Exception.Response.StatusCode
    Write-Host  $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($result)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $responseBody = $reader.ReadToEnd() | ConvertFrom-Json
    Write-Host  $responseBody.errorCode " - " $responseBody.message
    foreach($modelState in $responseBody.modelState)
    {
        $modelState
    }
}
````
## Creating a Secret

````powershell
try
{
    $site = "https://<Secret Server URL>"
   $api = "$site/api/v1"
   $creds = @{
       username = "<username>"
       password = "<password>"
       grant_type = "password"
   }

    $token = ""

    $response = Invoke-RestMethod "$site/oauth2/token" -Method Post -Body $creds
    $token = $response.access_token;

    Write-Host $token

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "Bearer $token")

    #stub
    $templateId = 6001
    $secret = Invoke-RestMethod $api"/secrets/stub?filter.secrettemplateid=$templateId" -Headers $headers

    #modify
    $timestamp = Get-Date

    $secret.name = "$timestamp"
    $secret.secretTemplateId = $templateId
    $secret.AutoChangeEnabled = $true
    $secret.autoChangeNextPassword = "NextpA$$w0rd"
    $secret.SiteId = 1

    $secret.IsDoubleLock = $true

    foreach($item in $secret.items)
    {
      if($item.fieldName -eq "Domain")
      {
        $item.itemValue = "theDomain"
      }
      if($item.fieldName -eq "Username")
      {
        $item.itemValue = "myaccountname"
      }
      if($item.fieldName -eq "Password")
      {
        $item.itemValue = "!@#ssword1"
      }
      if($item.fieldName -eq "Notes")
      {
        $item.itemValue = "TheNotes"
      }
    }

    $secretArgs = $secret | ConvertTo-Json

    #create
    Write-Host ""
    Write-Host "-----Create secret -----"

    $secret = Invoke-RestMethod $api"/secrets/" -Method Post -Body $secretArgs -Headers $headers -ContentType "application/json"

    $secret1 = $secret | ConvertTo-Json
    Write-Host $secret1
    Write-Host $secret.id
}
catch [System.Net.WebException]
{
    Write-Host "----- Exception -----"
    Write-Host  $_.Exception
    Write-Host  $_.Exception.Response.StatusCode
    Write-Host  $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($result)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $responseBody = $reader.ReadToEnd()

    Write-Host $responseBody
}

````

## Editing a Secret

````powershell

try
{
   $site = "https://<Secret Server URL>"
   $api = "$site/api/v1"

   $creds = @{
       username = "<username>"
       password = "<password>"
       grant_type = "password"
   }

    $token = ""

    $response = Invoke-RestMethod "$site/oauth2/token" -Method Post -Body $creds
    $token = $response.access_token;

    Write-Host $token

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "Bearer $token")

    #get
    $secretId = 45
    $secret = Invoke-RestMethod $api"/secrets/$secretId/" -Headers $headers

    #modify
    $timestamp = Get-Date

    $secret.Active = $true
    $secret.Name = "Updated Secret$timestamp.Ticks"
    $secret.folderId = 1101
    $secret.LauncherConnectAsSecretId = -1
    $secret.AutoChangeEnabled = $false
    $secret.RequiresComment = $false
    $secret.CheckOutEnabled = $false
    $secret.CheckOutIntervalMinutes = 17
    $secret.CheckOutChangePasswordEnabled  = $true
    $secret.ProxyEnabled = $true
    $secret.SessionRecordingEnabled  = $true
    $secret.PasswordTypeWebScriptId = -1
    $secret.SiteId = 1
    $secret.EnableInheritSecretPolicy = $false
    $secret.SecretPolicyId = -1
    $secret.AutoChangeNextPassword = "pass1232"

    $secretArgs = $secret | ConvertTo-Json

    #update
    Write-Host ""
    Write-Host "-----Update secret -----"

    $secret = Invoke-RestMethod $api"/secrets/$secretId" -Method Put -Body $secretArgs -Headers $headers -ContentType "application/json"

    $secretUpdate = $secret | ConvertTo-Json
    Write-Host $secretUpdate
}
catch [System.Net.WebException]
{
    Write-Host "----- Exception -----"
    Write-Host  $_.Exception
    Write-Host  $_.Exception.Response.StatusCode
    Write-Host  $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($result)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $responseBody = $reader.ReadToEnd()

    Write-Host $responseBody
}
````


## Checking in a Secret

````powershell

try
{
  $site = "https://<Secret Server URL>"
  $api = "$site/api/v1"

  $creds = @{
      username = "<username>"
      password = "<password>"
      grant_type = "password"
  }

    $token = ""

    $response = Invoke-RestMethod "$site/oauth2/token" -Method Post -Body $creds
    $token = $response.access_token;

    Write-Host $token

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "Bearer $token")

    $secretId = 3803
    #SecretArgs are only required as needed for the REST endpoint. ForceCheckIn may be relevant if the secret has been checked out by another user since you will need to force checkin to use the secret. This removes the other user's checkin and rotates the password if the secret is configured to do so.
    $secretArgs = @{
        #DoubleLockPassword
        #TicketNumber
        #TicketSystemId
        #Comment ="Passing a comment"
        #ForceCheckIn = $false
        #ExposeFieldValues
        #IncludeInactive
    }| ConvertTo-Json

    $secret = Invoke-RestMethod $api"/secrets/$secretId/check-in" -Method Post -Body $secretArgs -Headers $headers -ContentType "application/json"

    Write-Host $secret
    Write-Host $secret[0].message
    Write-Host $secret[0].code

    Write-Host "Name: " = $secret.name
    Write-Host "Active: " = $secret.active
    Write-Host "Template: " = $secret.secretTemplateName
    Write-Host "Heartbeat Status: " = $secret.lastHeartBeatStatus
    Write-Host "RPC" = $secret.lastPasswordChangeAttempt
    Write-Host "Checkout" = $secret.CheckedOut
    Write-Host "Checkout User" = $secret.CheckOutUserDisplayName
}
catch [System.Net.WebException]
{
    Write-Host "----- Exception -----"
    Write-Host  $_.Exception
    Write-Host  $_.Exception.Response.StatusCode
    Write-Host  $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($result)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $responseBody = $reader.ReadToEnd()

    Write-Host $responseBody
}

````

## Deleting a Secret

````powershell
try
{
   $site = "https://<Secret Server URL>"
   $api = "$site/api/v1"

   $creds = @{
       username = "<username>"
       password = "<password>"
       grant_type = "password"
   }

    $token = ""

    $response = Invoke-RestMethod "$site/oauth2/token" -Method Post -Body $creds
    $token = $response.access_token;

    Write-Host $token

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "Bearer $token")

    $secretId = 11231

    Write-Host "----- Delete a Secret -----"

    $timestamp = Get-Date

    $deletemodel = Invoke-RestMethod "$api/secrets/$secretId" -Headers $headers -Method DELETE -ContentType "application/json"
    Write-Host $deletemodel
}
catch [System.Net.WebException]
{
    Write-Host "----- Exception -----"
    Write-Host  $_.Exception
    Write-Host  $_.Exception.Response.StatusCode
    Write-Host  $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($result)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $responseBody = $reader.ReadToEnd() | ConvertFrom-Json
    Write-Host  $responseBody.errorCode " - " $responseBody.message
    foreach($modelState in $responseBody.modelState)
    {
        $modelState
    }
}

````

## Creating a User

````powershell
try
{
    $site = "https://<Secret Server URL>"
    $api = "$site/api/v1"

    $creds = @{
        username = "<username>"
        password = "<password>"
        grant_type = "password"
    }

    $token = ""

    $response = Invoke-RestMethod "$site/oauth2/token" -Method Post -Body $creds
    $token = $response.access_token;

    Write-Host $token

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "Bearer $token")

    # create user
    Write-Host ""
    Write-Host "----- Create a User -----"

    $timestamp = Get-Date
    $userCreateArgs = @{
        userName = "newuser$timestamp"
        password = "faW1fs@3S@"
        DisplayName = "new user$timestamp"
        enabled = $true
        emailAddress = "newuser$timestamp@v.com"
        twoFactor = $false
        radiusUserName = "aRadiusName"
        radiusTwoFactor = $false
        DomainId =  1
        isApplicationAccount = $true
    } | ConvertTo-Json

    $user = Invoke-RestMethod "$api/users" -Headers $headers -Method Post -ContentType "application/json" -Body $userCreateArgs
    Write-Host "New User ID : " $user.id
}
catch
{
    Write-Debug "----- Exception -----"
    Write-Host  $_.Exception.Response.StatusCode
    Write-Host  $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($result)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $responseBody = $reader.ReadToEnd() | ConvertFrom-Json
    Write-Host  $responseBody.errorCode " - " $responseBody.message
    foreach($modelState in $responseBody.modelState)
    {
        $modelState
    }
}
````

## Field Update, Get, File Upload, and Download

>**Note:** This script requires SS 10.1 or later.

````powershell
try
{
$site = "https://<Secret Server URL>"
echo $site

echo ----------------------------------------------------------------------------------------------------

#secret id and field to test against
$secretId = 283;
$fieldToUpdate = "machine"

#secretid and file to upload
$fileSecretId = 283;
$fileFieldToUpdate = "private-key"

$creds = @{
    username = "<username>"

password = "<password>"
grant_type = "password"
}

$response = $null
$token = $null
$response = Invoke-RestMethod -Method Post -Uri "$site/oauth2/token" -Body $creds
$token = $response.access_token;
echo $token


echo ----------------------------------------------------------------------------------------------------


$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $token")

$endpoint ="$site/api/v1/secrets/$secretId/fields/$fieldToUpdate"

$body = @{
    value = "newhost"
}| ConvertTo-Json



echo $endpoint
echo ----------------------------------------------------------------------------------------------------

echo ----------------------------------------------------------------------------------------------------
echo "Updating Field $fieldToUpdate"


$response = $null
$response = Invoke-RestMethod -Method Put -Uri $endpoint -Headers $headers -ContentType "application/json" -Body $body
echo $response;

echo ----------------------------------------------------------------------------------------------------
echo "Getting value from $fieldToUpdate"

$response = $null
$response = Invoke-RestMethod -Method Get -Uri $endpoint -Headers $headers
echo $response;

echo ----------------------------------------------------------------------------------------------------
echo "Uploading file from $fileFieldToUpdate"

$endpoint ="$site/api/v1/secrets/$fileSecretId/fields/$fileFieldToUpdate"
echo $endpoint

$secretArgs = @{
    fileName = "test.pem"
    fileAttachment = [IO.File]::ReadAllBytes("C:\temp\test.pem")
} | ConvertTo-Json

$response = $null
$response = Invoke-RestMethod -Method Put -Uri $endpoint -Headers $headers -Body $secretArgs -ContentType "application/json"

echo $response

echo ----------------------------------------------------------------------------------------------------
echo "Downloading file from $fileFieldToUpdate"
echo $endpoint

$response = $null
$response = Invoke-RestMethod -Method Get -Uri $endpoint -Headers $headers #-OutFile "c:\temp\outfile2.pem"


Write-Host $response.Length
Write-Host $response


echo ----------------------------------------------------------------------------------------------------

}
catch [System.Net.WebException]
{
    Write-Host "----- Exception -----"
    Write-Host  $_.Exception
    Write-Host  $_.Exception.Response.StatusCode
    Write-Host  $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($result)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $responseBody = $reader.ReadToEnd()
    Write-Host  $responseBody.errorCode " - " $responseBody.message
    foreach($modelState in $responseBody.modelState)
    {
        $modelState
    }
}

````

## Expiring a Token

>**Note:** This script requires SS 10.1 or later.

````powershell
try
{
   $site = "https://<Secret Server URL>"
   $api = "$site/api/v1"

   $creds = @{
       username = "<username>"
       password = "<password>"
       grant_type = "password"
   }

    $response = $null
    $token = $null
    $response = Invoke-RestMethod -Method Post -Uri "$site/oauth2/token" -Body $creds
    $token = $response.access_token;
    echo $token


    $response = Invoke-RestMethod "$site/oauth2/token" -Method Post -Body $creds

    $token = $response.access_token;

    Write-Host $token

    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Authorization", "Bearer $token")


    foreach($user in $pagedUsers.records)
    {
        Write-Host $user.userName
    }

    # expire token
    Write-Host ""
    Write-Host "----- Expire Token -----"

    $expireToken = Invoke-RestMethod "$site/api/v1/oauth-expiration" -Headers $headers -Method Post

    # This part should fail with a 403 Forbidden
    Write-Host ""
    Write-Host "----- Expect an error -----"

    $secrets = Invoke-RestMethod "$site/api/v1/secrets" -Headers $headers
}
catch [System.Net.WebException]
{
    Write-Host "----- Exception -----"
    Write-Host  $_.Exception
    Write-Host  $_.Exception.Response.StatusCode
    Write-Host  $_.Exception.Response.StatusDescription
    $result = $_.Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($result)
    $reader.BaseStream.Position = 0
    $reader.DiscardBufferedData()
    $responseBody = $reader.ReadToEnd()
    Write-Host  $responseBody.errorCode " - " $responseBody.message
    foreach($modelState in $responseBody.modelState)
    {
        $modelState
    }
}
````

## Managing Folders (Basic)

>**Note:** This script requires SS 10.1 or later.

````powershell

function Get-Token ($adminUserName, $adminPassword, $adminDomain, $api){
    try
    {
        $creds = @{
           username = $adminUserName
           password = $adminPassword
           domain = $adminDomain
           grant_type = "password"
       }

        $token = ""
        #echo "----------------"
        #echo "--Authenticate--"
        #echo "----------------"
        $response = Invoke-RestMethod "$uri/oauth2/token" -Method Post -Body $creds -ContentType "application/json"

        if($response -and $response.access_token)
        {
           # echo ""
           # echo "---------------------------------"
           # echo "--Authenticatication Successful--"
           # echo "---------------------------------"
           # echo ""
            $token = $response.access_token;
            return $token;
        }
        else
        {
            echo "ERROR: Failed to authenticate."
            return
        }
    }
    catch [System.Net.WebException]
    {
        Write-Host "----- Exception -----"
        Write-Host  $_.Exception
        Write-Host  $_.Exception.Response.StatusCode
        Write-Host  $_.Exception.Response.StatusDescription
        $result = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($result)
        $reader.BaseStream.Position = 0
        $reader.DiscardBufferedData()
        $responseBody = $reader.ReadToEnd()

        Write-Host $responseBody
    }
}

Write-Host "Start"
$adminUsername = '<username>'
$adminPassword = '<password>'
$adminDomain = $null
$uri = "https://<Secret Server URL>"

$api = "$uri/api/v1"

$token = Get-Token -adminUserName $adminUsername -adminPassword $adminPassword -api $api
Write-Host "Token is"
Write-Host $token
Write-Host "Get token end"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization", "Bearer $token")

#Get Folder Stub
$folderStub = Invoke-RestMethod $api"/folders/stub" -Method GET -Headers $headers -ContentType "application/json"

######################## Add Folder ##################################

$timeStamp = Get-Date
$folderStub.folderName = "Rest Folder" + $timeStamp
$folderStub.folderTypeId = 1
$folderStub.inheritPermissions = $false
$folderStub.inheritSecretPolicy = $false

$folderArgs = $folderStub | ConvertTo-Json

$folderAddResult = Invoke-RestMethod $api"/folders" -Method POST -Body $folderArgs -Headers $headers -ContentType "application/json"
$folderId = $folderAddResult.id

if($folderId-gt 1)
{
    echo ""
    echo "-----------------------"
    echo "--Add Folder Successful--"
    echo "-----------------------"
    echo ""
    echo $folderAddResult | ConvertTo-Json
}
else
{
    Write-Error "ERROR: Failed to Add a folder."
    return
}

######################## Delete Folder ##################################

#DeleteFolder is not implemented. Must be done through the UI.
echo ""
echo "---------------------------------"
echo "--Delete Folder Not Implemented--"
echo "---------------------------------"
echo ""

######################## Get Folder ##################################

$folderGetResult = Invoke-RestMethod $api"/folders/$folderid" -Method GET -Headers $headers -ContentType "application/json"

if($folderGetResult.id -eq $folderId)
{
    echo ""
    echo "-----------------------"
    echo "--Get Folder Successful--"
    echo "-----------------------"
    echo ""
    echo $folderGetResult | ConvertTo-Json
}
else
{
    Write-Error "ERROR: Failed to Get a folder."
    return
}

######################## Add Child Folder ##################################

    $timeStamp = Get-Date
    $folderStub.folderName = "Rest Child Folder" + $timeStamp
    $folderStub.folderTypeId = 1
    $folderStub.inheritPermissions = $false
    $folderStub.inheritSecretPolicy = $false
    $folderStub.parentFolderId = $folderGetResult.id

    $folderArgs = $folderStub | ConvertTo-Json

    $folderChildAddResult = Invoke-RestMethod $api"/folders" -Method POST -Body $folderArgs -Headers $headers -ContentType "application/json"
    $childfolderId = $folderChildAddResult.id

    if($childfolderId-gt 1)
    {
        echo ""
        echo "-----------------------"
        echo "--Add Child Folder Successful--"
        echo "-----------------------"
        echo ""
        echo $folderChildAddResult | ConvertTo-Json
    }
    else
    {
        Write-Error "ERROR: Failed to Add a Child folder."
        return
    }

######################## Update Folder ##################################

    $childFolderId = $folderChildAddResult.id
    $childFolderGetResult = Invoke-RestMethod $api"/folders/$childFolderId" -Method GET -Headers $headers -ContentType "application/json"

    $foldername = "UpdatedFolderNAME"
    $childFolderGetResult.folderName = $foldername
    $childFolderGetResult.folderTypeId = 1
    $childFolderGetResult.inheritPermissions = $true
    $childFolderGetResult.inheritSecretPolicy = $false

    $childFolderUpdateArgs = $childFolderGetResult | ConvertTo-Json

    $childFolderUpdateResult = Invoke-RestMethod $api"/folders/$childFolderId" -Method PUT -Body $childFolderUpdateArgs -Headers $headers -ContentType "application/json"

    if($childFolderUpdateResult.folderName -eq $foldername)
    {
        echo ""
        echo "-----------------------"
        echo "--Update Folder Successful--"
        echo "-----------------------"
        echo ""
        echo $childFolderUpdateResult | ConvertTo-Json
    }
    else
    {
        Write-Error "ERROR: Failed to Update a folder."
        return
    }

######################## Search Folders ##################################

    $searchFilter ="?filter.searchText=UpdatedFolderNAME"

    $searchResults = Invoke-RestMethod $api"/folders$searchFilter" -Method GET -Headers $headers -ContentType "application/json"
    $folder = $searchResults.records[0]
    echo $searchResults
    echo $folder

    $name =  "UpdatedFolderNAME"
    if($searchResults.total -gt 0 -and $folder.folderName -eq $name)
    {
        echo ""
        echo "------------------------------"
        echo "--Search Folder Successful--"
        echo "------------------------------"
        echo ""
        echo $group
    }
    else
    {
        Write-Error "ERROR: Failed to Search Folders."
        return
    }

######################## Lookup Groups ##################################

    $lookupFilter = "?filter.searchText=Updated"

    $lookupResults = Invoke-RestMethod $api"/folders/lookup$lookupFilter" -Method GET -Headers $headers -ContentType "application/json"
    $folder = $lookupResults.records[0]
    echo $lookupResults
    echo $folder

   if($searchResults.total -gt 0 -and $folder.value -eq $name)
   {
       echo ""
       echo "------------------------------"
       echo "--Lookup Folder Successful--"
       echo "------------------------------"
       echo ""
       echo $folder
   }
   else
   {
       Write-Error "ERROR: Failed to Lookup Folders."
       return
   }

######################## Add Group To Folder ##################################

$folderPermissionCreateArgs = Invoke-RestMethod $api"/folder-permissions/stub?filter.folderId=$folderId" -Method GET -Headers $headers -ContentType "application/json"
#To give permissions to a group, populate the GroupId variable and leave UserId $null.
#To give permissions to a user, populate the UserId variable and leave GroupId $null.
$folderPermissionCreateArgs.GroupId = 3
$folderPermissionCreateArgs.UserId = $null
$folderPermissionCreateArgs.FolderAccessRoleName = "Owner"
$folderPermissionCreateArgs.SecretAccessRoleName = "View"

$permissionArgs = $folderPermissionCreateArgs | ConvertTo-Json

$permissionResults = Invoke-RestMethod $api"/folder-permissions" -Method POST -Headers $headers -Body $permissionArgs -ContentType "application/json"
if($permissionResults.FolderId -eq $folderId)
{
    echo ""
    echo "-------------------------------------"
    echo "--Add Folder Permissions Successful--"
    echo "-------------------------------------"
    echo ""
    echo $permissionResults
}
else
{
    Write-Error "ERROR: Failed to Add Folder Permissions."
    return
}
$folderPermissionId = $permissionResults.id

######################## Remove Group From Folder ##################################

$permissionDeleteResult = Invoke-RestMethod $api"/folder-permissions/$folderPermissionId" -Method DELETE -Headers $headers -ContentType "application/json"
if($permissionDeleteResult.id -eq $folderPermissionId)
{
    echo ""
    echo "----------------------------------------"
    echo "--Remove Folder Permissions Successful--"
    echo "----------------------------------------"
    echo ""
}
else
{
    Write-Error "ERROR: Failed to Remove Folder Permissions."
    return
}
````