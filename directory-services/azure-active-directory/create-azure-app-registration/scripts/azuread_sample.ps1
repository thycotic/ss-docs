<#
    Connect to your tenant
#>
$tenantId = ''
Connect-AzureAd -TenantId $tenantId

<#
    Variables - Adjust for your environment/requirements
#>
$appName = "Thycotic Secret Server2"
$appRedirect = "https://vault.company.com/signin-oidc"

<#
    DO NOT CHANGE
#>
$appPerms = 'Group.Read.All','GroupMember.Read.All','Member.Read.Hidden','User.Read.All'

<#
    Pull the Service App ID for Microsoft Graph
#>
$msGraphService = Get-AzureADServicePrincipal -Filter "DisplayName eq 'Microsoft Graph'"

<#
    Create object for Resource Access - assigning app role permissions
#>
$msGraphResourceAccess = New-Object -TypeName "Microsoft.Open.MSGraph.Model.RequiredResourceAccess"
$msGraphResourceAccess.ResourceAppId = $msGraphService.AppId

<#
    This grabs the ID for each permission listed in $appPerms variable
#>
$permissions = $msGraphService.AppRoles.Where({$_.Value -in $appPerms})
foreach ($p in $permissions) {
    $appPermissions = New-Object -TypeName "Microsoft.Open.MSGraph.Model.ResourceAccess" -ArgumentList $p.Id,"Role"
    <# Add the role to the resource access object #>
    $msGraphResourceAccess.ResourceAccess += $appPermissions
}

<#
    Create the App Registration
#>
$paramsApp = @{
    DisplayName = $appName
    Web = @{ RedirectUris = $appRedirect }
    RequiredResourceAccess = $msGraphResourceAccess
}
$thycoticApp = New-AzureADMSApplication @paramsApp

<#
    Create the Client Secret and assign to the App Registration created

    !!NOTE!! MSGraph only supports the expiration being set to 2 years, no configuration option is provided
#>
$paramsClientSecret = @{
    ObjectId = $thycoticApp.Id
    PasswordCredential = @{ displayName = "Secret Server $(Get-Date -Format yyyy-MM-dd)"}
}
$clientSecret = New-AzureADMSApplicationPassword @paramsClientSecret

<#
    Output object data needed for configuring Secret Server
#>
[pscustomobject]@{
    Details = "These values required for Secret Server Configuration"
    TenantId = (Get-AzureADTenantDetail).ObjectId
    ClientID = $thycoticApp.AppId
    ClientSecret = $clientSecret.SecretText
} | Format-List