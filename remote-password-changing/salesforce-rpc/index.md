[title]: # (Salesforce.com Password Changer)
[tags]: # (RPC, Remote Password Changing, Salesforce)
[priority]: # ()

# Salesforce.com Password Changer

As of version 8.6, Secret Server (SS) supports password changing for Salesforce.com accounts.

The password changer can be enabled on secrets that were created using the default Web Password Secret template or any custom template that is configured to use the Web User Account Password type.

The SS Web server's outbound IP Address must be added to the IP Address white list for your Saleforce.com organization. Please refer to the Salesforce.com documentation for instructions on how to set this up. See [Restricting Login IP Ranges for Your Organization](https://help.salesforce.com/apex/htviewhelpdoc?id=security_networkaccess.htm&language=en_US).

In cases where this is not set up correctly, you may see the follow error in the Remote Password Changing logs: 

`Login failed: LOGIN_MUST_USE_SECURITY_TOKEN: Invalid username, password, security token; or user locked out`.

Please note:

- Secret Server can only communicate to the following Salesforce default Login URLs: https://test.salesforce.com and https://login.salesforce.com.
- Having the domain URL in the secret will not work and will throw this exception: `Login failed: INVALID_LOGIN: Invalid username, password, security token; or user locked out`. Only those two URLs work.
- There are three required Salesforce configurations:
  - Go to **Setup \> Administration \> Users \> Profile**. Choose the user profile. Make sure that **Enabled API** is checked. This option is not available in all versions of Salesforce. Other versions  will not have this enabled by default. Please see this ["Enable API" not available](https://developer.salesforce.com/forums/?id=906F0000000BaW7IAK) article. If this setting is not enabled in salesforce you will get one of these errors: `ERROR: Secret 'Salesforce Test' (Id = 1063) on Site 'EARTH' returned (LoginFailed). Exception: Login failed: API_DISABLED_FOR_ORG: API is not enabled for this Organization` or `Partner,System.Web.Services.Protocols.SoapException: API_DISABLED_FOR_ORG: API is not enabled for this Organization or Partner`.
- Configure network access and whitelist the distribute engine or SS IP address. If this is internal, use the public IP address.
  - Go to **Setup \> Company Settings \> My Domain**. Edit my domain settings and make sure that **Prevent login from https://login.salesforce.com** is unchecked.
  