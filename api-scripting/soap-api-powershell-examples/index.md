[title]: # (SOAP API PowerShell Script Examples)
[tags]: # (SOAP API,API,Scripting,PowerShell,PowerShell examples)
[priority]: # (1000)

# SOAP API PowerShell Script Examples

> **Note:** To use the SOAP API you first must enable Webservices. To do so, go to Admin > Configuration general tab. Enabling Webservices simply makes the ASP.NET SOAP and REST Webservices built into Secret Server available.

## Basic Authentication

```powershell
# Define the proxy
$url = "< your secret server url >/webservices/sswebservice.asmx"
$proxy = New-WebServiceProxy -uri $url -UseDefaultCredential -Namespace "ss"

# Define the user credentials
$username = "< username >" 
$password = "< password >"
$domain = "" 

# Get a auth token
echo "------------------------"
echo "----- Authenticate -----"
echo "------------------------"

$tokenResult = $proxy.Authenticate($username, $password, '', $domain)
if($tokenResult.Errors.Count -gt 0)
{
    echo "Authentication Error: " +  $tokenResult.Errors[0]
    Return
}
$token = $tokenResult.Token

echo $token
```

## Basic Two-Factor Authentication

```powershell
# Define the proxy
$url = "< your secret server url >/webservices/sswebservice.asmx"
$proxy = New-WebServiceProxy -uri $url -UseDefaultCredential -Namespace "ss"

# Define the user credentials
$username = "< username >" 
$password = "< password >"
$domain = "" 

# Get a auth token
echo "------------------------"
echo "----- Authenticate -----"
echo "------------------------"

$otp = Read-Host -Prompt "Enter your OTP for 2FA (displayed in your 2FA app): "
$tokenResult = $proxy.AuthenticateRADIUS($username, $password, '', $domain, $otp)
if($tokenResult.Errors.Count -gt 0)
{
    echo "Authentication Error: " +  $tokenResult.Errors[0]
    Return
}
$token = $tokenResult.Token

echo $token
```

## Windows Authentication

```powershell
# Define the proxy
$where = "< your secret server url >/winauthwebservices/sswinauthwebservice.asmx."
$ws = New-WebServiceProxy -uri $where -UseDefaultCredential
```

## Searching Secrets

```powershell
# Define the proxy
$url = "< your secret server url >/webservices/sswebservice.asmx"
$proxy = New-WebServiceProxy -uri $url -UseDefaultCredential -Namespace "ss"

# Define the user credentials
$username = "ssadmin" 
$password = "sspass1"
$domain = "" 

# Get a auth token
echo "------------------------"
echo "----- Authenticate -----"
echo "------------------------"

$tokenResult = $proxy.Authenticate($username, $password, '', $domain)
if($tokenResult.Errors.Count -gt 0)
{
    echo "Authentication Error: " +  $tokenResult.Errors[0]
    Return
}
$token = $tokenResult.Token

echo $token

# Set the FolderId
$folderId = "< folder Id >"

echo "Searching for secrets in folder $folderId"
# SearchSecretsByFolder(token, searchTerm, folderId, includeSubFolders, includeDeleted, includeRestriced)
$secretSummaries = $proxy.SearchSecretsByFolder($token, "", $folderId, $false, $false, $false).SecretSummaries

echo "--------------------------------------------"
echo "----- List Secrets in folder $folderId -----"
echo "--------------------------------------------"
foreach($secretSummary in $secretSummaries)
{
    $msg = $secretSummary.SecretName + "(ID : " +  $secretSummary.SecretId + ")"
    echo $msg
    # Load the secret
    $secret = $proxy.GetSecret($token, $secretSummary.SecretId, $true, $null).Secret;
}
echo "--------------------------------------------"
```

Creating Secrets

```powershell
# Helper Function

function GetFieldId($template, [string]$name) {
    Return ($template.Fields | Where {$_.DisplayName -eq $name}).Id
}


# Define the function of creating a Secret
function CreateNewSecret {

    param($accountUserName)
   
    # Define the proxy
    $url = "< your secret server url >/webservices/sswebservice.asmx"
    $proxy = New-WebServiceProxy -uri $url -UseDefaultCredential -Namespace "ss"

    # Define the user credentials
    $username = "ssadmin" 
    $password = "sspass1"
    $domain = "" 

    # Get a auth token
    echo "------------------------"
    echo "----- Authenticate -----"
    echo "------------------------"

    $tokenResult = $proxy.Authenticate($username, $password, '', $domain)
    if($tokenResult.Errors.Count -gt 0)
    {
        echo "Authentication Error: " +  $tokenResult.Errors[0]
        Return
    }
    $token = $tokenResult.Token

    echo $token

    # Define the Secret Template
    $templateName = "Windows Account"
    $template = $proxy.GetSecretTemplates($token).SecretTemplates | Where {$_.Name -eq $templateName}
    if($template.id -eq $null)
    {
        echo "Error: Unable to find Secret Template " +  $templateName
        Return
    }

    # Define the machine name on the Secret
    $machine = "< target machine >"
 
    # Show that the Secret is in process of cfreation
    echo "Creating Local Windows Account Account: " + $machine + "\" + $accountUserName;
    
    # Password is set to null so will generate a new one based on settings on template
    $newPass = $null
    if($newPass -eq $null)
    {
        echo "Generating New Password for account"        
        $secretFieldIdForPassword = (GetFieldId $template "Password")
        $newPass = $proxy.GeneratePassword($token, $secretFieldIdForPassword).GeneratedPassword
    }

    # Define the Secret's name format ($machine and $accountUserName)
    $secretName = $machine + "\" + $accountUserName

    # Load and set values on the Secret
    $secretItemFields = ((GetFieldId $template "Machine"), (GetFieldId $template "Username"), (GetFieldId $template "Password"), (GetFieldId $template "Notes"))
    $secretItemValues=($machine,$accountUserName,$newPass, "")

    # Define the folder where the Secret is created
    $folderId = -1;
        
    # Shows whether Secret was successfully created
    $addResult = $proxy.AddSecret($token, $template.Id, $secretName, $secretItemFields, $secretItemValues, $folderId)
    if($addResult.Errors.Count -gt 0)
    {
        $msg = "Add Secret Error: " +  $addResult.Errors[0]
        echo $msg
        Return
    }
    else
    {
        $msg = "Successfully added Secret: " +  $addResult.Secret.Name + " (Secret Id:" + $addResult.Secret.Id + ")"
        echo $msg
        Return
    }
}

# Define the username on the Secret and name of the Secret after $machine\
CreateNewSecret '<username for the Secret>’
```

## Editing Secrets

```powershell
# Define the proxy
$url = "< your secret server url >/webservices/sswebservice.asmx"
$proxy = New-WebServiceProxy -uri $url -UseDefaultCredential -Namespace "ss"

# Define the user credentials
$username = "ssadmin" 
$password = "sspass1"
$domain = "" 

# Get a auth token
echo "------------------------"
echo "----- Authenticate -----"
echo "------------------------"

$tokenResult = $proxy.Authenticate($username, $password, '', $domain)
if($tokenResult.Errors.Count -gt 0)
{
    echo "Authentication Error: " +  $tokenResult.Errors[0]
    Return
}
$token = $tokenResult.Token

echo $token

# Retrieves the Secret to be editted, replace <Secret ID> with the appropriate number
$secretId = "1"

echo "Get secret $secretId"
$secret = $proxy.GetSecret($token, $secretId, $false, $null)

# Chooses the field and value to update the Secret with. 
# Choose either 0,1,2, or 3 in Secret.Items[].value where 0 = the first field below the Secret name, 1 = the second field, etc
$secret.Secret.Items[0].value = '< new value >'

# Applies changes to the Secret
$update = $proxy.UpdateSecret($token, $secret.Secret)
```

## Checking Secrets in and out

```powershell
# Define the proxy
$url = "< your secret server url >/webservices/sswebservice.asmx"
$proxy = New-WebServiceProxy -uri $url -UseDefaultCredential -Namespace "ss"

# Define the user credentials
$username = "ssadmin" 
$password = "sspass1"
$domain = "" 

# Get a auth token
echo "------------------------"
echo "----- Authenticate -----"
echo "------------------------"

$tokenResult = $proxy.Authenticate($username, $password, '', $domain)
if($tokenResult.Errors.Count -gt 0)
{
    echo "Authentication Error: " +  $tokenResult.Errors[0]
    Return
}
$token = $tokenResult.Token

echo $token

# Check whether the Secret is checked out

echo "Get checkout status...";

$secretId = "< secret Id >"

$proxy.GetCheckOutStatus($token, $secretId)

# Enable Checkout if it is not enabled already

echo "Enabling CheckOut...";

$proxy.SetCheckOutEnabled($token, $secretId, $true, $false, $null)


# Check out Secret
echo "Checkout secret..."

$result = $proxy.GetSecret($token, $secretId , $true, $null) 
$result.Secret

# Check in Secret

echo "Check in secret..."

$proxy.CheckIn($token, $secretId)

echo  "Secret Was Checked In"
```

## Creating an Active Directory Account

```powershell
# Create the AD account

# Enter the Name, SamAccountName, DisplayName, and Password for the AD account and create it in AD
Import-Module ActiveDirectory
$name = "< name >"
$samUsr = "< sam user name >"
$displayName = "< display name >"
$pwd = "< ad user password >"

New-ADUser `
 -Name $name `
 -Path  "OU=Webservices Sandbox,OU=UNLOCKED,DC=thycotic,DC=unlocked" `
 -SamAccountName  $samUsr `
 -DisplayName $displayName `
 -AccountPassword (ConvertTo-SecureString $pwd -AsPlainText -Force) `
 -ChangePasswordAtLogon $true  `
 -Enabled $true

# Helper Function
function GetFieldId($template, [string]$name) {

    Return ($template.Fields | Where {$_.DisplayName -eq $name}).Id
} 

# Define the function of creating a Secret
function CreateNewSecret {

    param($accountUserName)
   
    # Define the proxy
    $url = "< your secret server url >/webservices/sswebservice.asmx"
    $proxy = New-WebServiceProxy -uri $url -UseDefaultCredential -Namespace "ss"

    # Define the user credentials
    $username = "ssadmin" 
    $password = "sspass1"
    $domain = "" 

    # Get a auth token
    echo "------------------------"
    echo "----- Authenticate -----"
    echo "------------------------"

    $tokenResult = $proxy.Authenticate($username, $password, '', $domain)
    if($tokenResult.Errors.Count -gt 0)
    {
        echo "Authentication Error: " +  $tokenResult.Errors[0]
        Return
    }
    $token = $tokenResult.Token

    echo $token

    # Define the Secret Template
    $templateName = "Active Directory Account"
    $template = $proxy.GetSecretTemplates($token).SecretTemplates | Where {$_.Name -eq $templateName}
    if($template.id -eq $null)
    {
        $msg =  "Error: Unable to find Secret Template " +  $templateName
        echo $msg
        Return
    }

    # Enter the domain for the AD account you are creating
    $domain = "unlocked"

    # Show that the Secret is in the process of creation
    $msg = "Creating Active Directory Account: " + $domain + "\" + $accountUserName;
    echo $msg
       
    # Define the password on the Secret using the password you specified earlier when creating the AD account
    $newPass = $pwd
    if($newPass -eq $null)
    {
        echo "Generating New Password for account"
        $secretFieldIdForPassword = (GetFieldId $template "Password")
        $newPass = $proxy.GeneratePassword($token, $secretFieldIdForPassword).GeneratedPassword
    }

    # Define the Secret's name format ($domain(Line 58) and $accountUserName(Line 102)
    $secretName = $domain + "\" + $accountUserName

    # Load and set values on the Secret
    $secretItemFields = ((GetFieldId $template "Domain"), (GetFieldId $template "Username"), (GetFieldId $template "Password"), (GetFieldId $template "Notes"))
    $secretItemValues=($domain,$accountUserName,$newPass, "")

    # Define the folder where the Secret is created
    $folderId = -1;
        
    # Shows whether Secret was successfully created
    $addResult = $proxy.AddSecret($token, $template.Id, $secretName, $secretItemFields, $secretItemValues, $folderId)
    if($addResult.Errors.Count -gt 0)
    {
        $msg = "Add Secret Error: " +  $addResult.Errors[0]
        echo $msg
        Return
    }
    else
    {
        $msg = "Successfully added Secret: " +  $addResult.Secret.Name + " (Secret Id:" + $addResult.Secret.Id + ")"
        echo $msg
        Return
    }
}

# Define the username on the Secret and name of the Secret after $domain\
CreateNewSecret $samUsr
```

## Setting Secret Permissions

```powershell
# Define the proxy
$url = "< your secret server url >/webservices/sswebservice.asmx"
$proxy = New-WebServiceProxy -uri $url -UseDefaultCredential -Namespace "ss"

# Define the user credentials
$username = "ssadmin" 
$password = "sspass1"
$domain = "" 

# Get a auth token
echo "------------------------"
echo "----- Authenticate -----"
echo "------------------------"

$tokenResult = $proxy.Authenticate($username, $password, '', $domain)
if($tokenResult.Errors.Count -gt 0)
{
    echo "Authentication Error: " +  $tokenResult.Errors[0]
    Return
}
$token = $tokenResult.Token

echo $token

# Get Secret
$secretId = "< your secret Id >"

echo "Get secret $secretId"

$result = $proxy.GetSecret($token, $secretId, $true, $null) 
$result.Secret

# Set the Group in this case groupId 3 = Human Resources
$group = @{
    groupId = 3
    IsUser = $false 
}

# Apply the Group set beforehand with either View, Edit, or Owner permissions
echo "Update permision for secret $secretId"

$proxy.UpdateSecretPermission($token, $secretId, $group, $false, $true, $false)
```

