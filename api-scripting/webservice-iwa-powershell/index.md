[title]: # (Using Web Services with IWA via PowerShell)
[tags]: # (REST API,API,Scripting,PowerShell,webservices,IWA,authentication)
[priority]: # (1000)

# Using Webservices with IWA via PowerShell

## Overview 

You can enable webservices at **Admin \> Configuration** on the **General** tab. Checking the **Enable Webservices** check box makes the ASP.NET SOAP and REST webservices built into SS available for use. Additional steps are needed in IIS to ensure proper access. 

> **Note:** Integrated Windows Authentication (IWA) does **not** work on Secret Server Cloud. 

> **Note:** This procedure only works if SS on-premises is installed on IIS 7 or greater.

## Procedure 

 To enable IWA for webservices in IIS:
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
   > **Note:** If you are using IIS7 or greater and do not see this option, the option will need to be added through the server roles (webserver). IIS may give an alert about using both challenge and redirect-based authentication, which you can ignore.)
$1
$2$1
$2$1
$2
## Access Examples

### SOAP

The SOAP web service URL for IWA is `<Secret Server URL>/winauthwebservices/sswinauthwebservice.asmx`.

Example script:

```powershell
# Sample Powershell Script
# demonstrating retrieval of a Secret from Secret Server
# via web service protected by IWA 

$where = 'http://mysecretserver/winauthwebservices/sswinauthwebservice.asmx';
$secretId = 1
$ws = New-WebServiceProxy -uri $where -UseDefaultCredential 
$wsResult = $ws.GetSecret($secretId, $false, $null)
if ($wsResult.Errors.length -gt 0){
	$wsResult.Errors[0]
}
else
{
	$wsResult.Secret
}
```

### REST

REST web service references the same winauthwebservices folder as SOAP when doing IWA, but in code the URL endpoint  does not need to change.

Example script:

```powershell
# Sample Powershell Script
# demonstrating authentication via web service protected by IWA 

$api = 'http://mysecretserver/winauthwebservices/api/v1';
$endpoint = $api'/secrets/3844'
$secret = Invoke-RestMethod $endpoint -UseDefaultCredentials
```

