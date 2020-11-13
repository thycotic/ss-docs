<# Connect to your tenant #>
$tenantId = ''
Connect-AzureAd -TenantId $tenantId

<# Variables - Adjust for your environment/requirements #>
$appName = "Thycotic Secret Server"
$appRedirect = "https://vault.company.com/signin-oidc"
$yearsValidSecret = 3

# do not change
$appPerms = 'Group.Read.All','GroupMember.Read.All','Member.Read.Hidden','User.Read.All'

<# Create the App Registration & Assigning Microsoft Graph Permissions #>
# Pull the Service App ID for Microsoft Graph
$msGraphService = Get-AzureADServicePrincipal -Filter "DisplayName eq 'Microsoft Graph'"

# Create object for Resource Access - assigning app role permissions
$msGraphResourceAccess = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
$msGraphResourceAccess.ResourceAppId = $msGraphService.AppId
# This grabs the ID for each permission listed in $appPerms variable
$permissions = $msGraphService.AppRoles.Where({$_.Value -in $appPerms})
foreach ($p in $permissions) {
    $appPermissions = New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList $p.Id,"Role"
    #Add the role to the resource access object
    $msGraphResourceAccess.ResourceAccess += $appPermissions
}

# Create the App Registration
$paramsApp = @{
    DisplayName = $appName
    ReplyUrls = $appRedirect
    RequiredResourceAccess = $msGraphResourceAccess
    Oauth2AllowImplicitFlow = $true
}
$thycoticApp = New-AzureADApplication @paramsApp

<# Create the Client Secret and assign to the App Registration created #>
$paramsClientSecret = @{
    ObjectId = $thycoticApp.ObjectId
    EndDate = (Get-Date).AddYears($yearsValidSecret)
    CustomKeyIdentifier = "Secret Server $(Get-Date -Format yyyy-MM-dd)"
}
$clientSecret = New-AzureADApplicationPasswordCredential @paramsClientSecret

[pscustomobject]@{
    Details = "These values required for Secret Server Configuration"
    TenantId = (Get-AzureADTenantDetail).ObjectId
    ClientID = $thycoticApp.AppId
    ClientSecret = $clientSecret.Value
} | Format-List