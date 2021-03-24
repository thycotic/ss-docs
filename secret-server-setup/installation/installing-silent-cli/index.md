[title]: # (Installing Secret Server via the Command Line)
[tags]: # (Setup,Install,cli,silent install)
[priority]: # (1000)

# Installing Secret Server via the Command Line

## Overview

ThycoticSetup.exe accepts command line arguments for a silent or automated installation. This topic discusses how to do that. 

Basic usage:

`ThycoticSetup.exe -q -s PARAMETER=<value> PARAMETER2=<value> (/nodetect) (/l <log file path>)`

Important considerations:

- Always pass `-q -s` to `ThycoticSetup.exe` and then pass in your parameters or switches.
- There are two stages to the installer. The first (optional) stage is to install the prerequisites such as IIS and .NET 4.8. Then in a second stage, once all required pre-reqs are present, you can install Secret Server (SS) or Privilege Manager (PM).
- The installer UI performs additional validation steps, such as testing the database connection information, that a silent CLI one does not. Thus, this install can fail if you provide incorrect settings.
- There are two stages to the installer. The first (optional) stage is to install the prerequisites such as IIS and .NET 4.8. Then in a second stage, once all required pre-reqs are present, you can install Secret Server (SS) or Privilege Manager (PM).
- Due to how MSI installers work, if you need to pass in parameters that contain spaces, use the special `CMDLINE` parameter, using extra double quotes to delineate each parameter. For instance:

  `ThycoticSetup.exe -q -s PARAM1=some_string PARAM2=1234 CMDLINE=" PARAM3=""Something with a space"" PARAM 4=""Another value with spaces"" "`

  Note:
  - You can mix and match regular parameters (numerical values, or strings without spaces) with `CMDLINE`.
  - Any parameters sent inside of `CMDLINE` are treated as strings. Numerical parameters inside of `CMDLINE` are ignored.

- Be aware of how you call `ThycoticSetup.exe` and what special characters need escaping in your shell. This includes passwords containing symbols. What is required is shell dependent. For example, running the installer from PowerShell (or a .ps1 script) rather than an older command prompt (or a .bat file) would require escaping a different set of special symbols.
- We recommend using the `/l <logfile>` option to create a log file, which you can use to verify your parameters are correctly passed to the installer. This is especially useful when using `CMDLINE` for parameters with spaces, which is prone to mistakes. 

  > **Note:** For security, parameters involving passwords are not logged.

## Install Prerequisites

As of SS 10.11, you can silently install all required prerequisites. These are the same prerequisites the “Fix Issues” button in the installer UI fixes. The important difference is missing prerequisites are not auto detected—you must tell the installer which ones you want installed. Older versions will not do a silent command line installation unless these necessary prerequisites are already installed.

### Parameters

**Table:** ThycoticSetup.exe Parameters

| Parameter | Value | Required (if not present) | Purpose |
|--|:-:|--|--|
| `InstallPreReqs` | Boolean | Yes | Triggers the prerequisites installation. Enable this to install prerequisites with no application. This overrides `InstallSecretServer=1` and `InstallPrivilegeManager=1`. |
| `PRE_REQS_TO_INSTALL` | Comma separated list (see below) | Yes | Specifies which prerequisites to install. |
[]()

### Prerequisites

**Table:** Prerequisite (`PRE_REQS_TO_INSTALL`) Values

| Prerequisite | Required (if not present) | Purpose |
|--|:-:|--|
| `CONFIGURE_FIPS` | No | Ensures the AES 256 and 128 ciphers are enabled in Windows. |
| `ENABLE_FIPS` | No | Enables FIPS mode in Windows. Generally, not needed, unless required by your environment. |
| `INSTALL_HTTPS_BINDING` | No | Enables HTTPS binding in IIS for the default website. Tries to pick an existing valid SSL certificate and creates a self-signed certificate if necessary for temporary use. Always use HTTPS with a valid certificate in production environments. |
| `INSTALL_IIS` | Yes | Installs the Web Server (IIS) Windows Role. |
| `INSTALL_IIS_COMPS` | Yes | Installs various required IIS features. |
| `INSTALL_NET_WCF` | Yes | Installs the WCF HTTP and TCP activation features. |
| `INSTALL_NetFx48` | Yes | Installs .NET 4.8. This **requires a reboot.** |
[]()

### Single-Line Example

`ThycoticSetup.exe -q -s InstallPreReqs=1 PRE_REQS_TO_INSTALL=INSTALL_IIS,INSTALL_IIS_COMPS,INSTALL_NET_WCF,INSTALL_HTTPS_BINDING,INSTALL_NetFx48 /l C:\temp\install-prereqs.log`

## Installing Applications

Secret Server or Privilege Manager can be installed and pre-configured using these parameters. If the required prerequisites are not already present, the installer exits. They can both be installed at the same time but will then share the same database and email settings.

If you need more control over configuring the website, you can create a site and configure it in advance (that is, using IIS’s `AppCmd.exe`), and then pass the preconfigured website name as `SecretServerSiteName` or `PrivilegeManagerSiteName`.

### Secret Server Parameters

**Table:** Secret Server Parameters

| Parameter | Value | Default | Notes |
|--|--|--|--|
| `CreateWebSite` | Boolean | 0 | Required if the `SecretServerSiteName` website does not  exist. |
| `InstallSecretServer` | Boolean | 1 | Whether or not to install SS.  Must also use the `/nodetect` switch to avoid this  being set to 1 if not already installed. |
| `SecretServerApplicationName` | String | `SecretServer` | Used for the application pool name as well as the website application or subfolder. |
| `SecretServerAppPassword` | String | Optional | Only required if you are configuring  `SecretServerAppUserName`. |
| `SecretServerAppUserName` | String | `ApplicationPoolIdentity` | What identity to run the app pool as. The user must already exist. |
| `SecretServerConfigLogFile` | String | ` <logname>_SS_Configuration.log` | Optional. The base `<logname>` is specified with  the `/l` option. |
| `SecretServerDestinationFolderPath` | String | `C:\inetpub\wwwroot\SecretServer` | If you would like to use a directory containing  spaces, see note above about how to use the `CMDLINE` parameter to pass it in. |
| `SecretServerSiteHttpsPort` | Integer | Optional | HTTPS port. Always use HTTPS in production. If using the  default website, this port is an additional HTTP binding, along with the default.  If you use this option to bind HTTPS on another port, configure the HTTPS binding yourself and choose a certificate after the installer completes. `INSTALL_HTTPS_BINDING` only configures the certificate on the normal 443 binding. |
| `SecretServerSiteName` | Integer | Default website | Used by both SS and PM. Must already exist, unless you also use `CreateWebSite=1` (see the Website  Parameters section below). |
| `SecretServerSitePort` | Integer | Optional | HTTP port. If using the default website, this port HTTP binding is in addition to any defaults. |
| `SecretServerUserDisplayName` | String | None | The display name for `SecretServerUserName`. |
| `SecretServerUserEmail` | String | None | The email address for `SecretServerUserName`. |
| `SecretServerUserName` | String | None | The initial SS administrator user. If not set, once Secret Server is installed, the first person to visit the website will  be able to pick the details on the “Create Initial Administrator” page. |
| `SecretServerUserPassword` | String | None | The password for `SecretServerUserName`. |
[]()

### Privilege Manager Parameters

**Table:** Privilege Manager Parameters

| Parameter | Value | Default | Notes |
|--|--|--|--|
| `CreateWebSite` | Boolean | 0 | Required if the `PrivilegeManagerSiteName` website does not exist. |
| `InstallPrivilegeManager` | Boolean | 1 | Whether or not to install PM. Must also use the `/nodetect` switch to avoid this being set to 1 if not already  installed. |
| `PrivilegeManagerApplicationName` | String | `TMS`, `TMSAgent`, `TMSWorker` | Used as the base name of the PM application pools (Regular, Agent, and Worker), plus the website application or subfolder. |
| `PrivilegeManagerAppPassword` | String | None | Only required if you are configuring `PrivilegeManagerAppUserName`. |
| `PrivilegeManagerAppUserName` | String | None | What identity  to run the app pool as. User must already exist. |
| `PrivilegeManagerDestinationFolderPath` | String | `C:\inetpub\wwwroot\TMS` | If you would  like to use a directory containing spaces, see above on using the `CMDLINE` parameter. |
| `PrivilegeManagerLogFile` | String | None | Optional |
| `PrivilegeManagerSiteName` | String | Default website | `CreateWebsite=1`  must also be set to customize this. |
[]()

###  Required Database Parameters

**Table:** Required Database Parameters

| **Parameter** | **Value** | **Default** | **Notes** |
|--|--|--|--|
| `DatabaseConnectionTimeout` | Integer | 15 | Database connection timeout in seconds. |
| `DatabaseEnableMultiSubnetFailover` | Boolean | 0 | If your  application connects to an AlwaysOn availability group (AG) on different  subnets, setting `MultiSubnetFailover=true` provides faster detection of and connection to the (currently) active server. For more information about  SqlClient support for AlwaysOn availability groups, see [SqlClient support for High Availability, Disaster Recovery](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/sql/sqlclient-support-for-high-availability-disaster-recovery). |
| `DatabaseEnableSslEncryption` | Boolean | 0 | Whether or not to use SSL/TLS for the database connection. |
| `DatabaseFailoverPartner` | String | None | The name or address of the partner server to connect to if the primary server is down.  Only used if `DatabaseEnableMultiSubnetFailover=1`. |
| `DatabaseIsUsingWindowsAuthentication` | Boolean |  | Whether or not to use integrated Windows authentication  for MSSQL access. If enabled, before running the install, you must configure  your IIS application pool to run a Windows account permission to access the `DatabaseServer`, and the `DatabaseUserName` and `DatabasePassword` will not be  used. |
| `DatabaseName` | String | None | Database name. Is created if it does not exist. Defaults to `SecretServer` if installing SQL Express. |
| `DatabasePassword` | String | None | Database SQL login password. Ignored if using Windows authentication. |
| `DatabaseServer` | String | None | Database server hostname or IP. |
| `DatabaseTrustServerCertificate` | Boolean | 0 | Only used if `DatabaseEnableSslEncryption=1` is set. Do not enable in production if you are using SSL encryption; certificate  trust validation is critical to security. `Certutil.exe` can be used to diagnose untrusted certificates.     When `TrustServerCertificate` is set to `true`, the  transport layer uses SSL to encrypt the channel and bypass walking the certificate chain to validate trust. If `TrustServerCertificate` is set to `true` and encryption is turned on, the encryption level specified on the server is used even if `Encrypt` is set to false. The connection fails  otherwise. |
| `DatabaseUserName` | String | None | Database SQL login username. Ignored if using Windows authentication. |
| `InstallSqlExpress` | Boolean | 0 | Whether or not to install the free SQL Express to use as a database server. If enabled, none of the other database parameters are used.  We only recommended this for testing. , do not use in production due to performance limits. |
[]()

### Email Parameters

You can set email parameter either in the UI after installation or by using these parameters at install time.

**Table:** Optional Email Parameters

| Parameter | Value | Default | Notes |
|--|--|--|--|
| EmailDomain | String (optional) | None | Domain for SMTP credentials. Used if `EmailUseCredentials=1`. |
| EmailFromAddress | String (required) | None | The "from" address to use when sending emails. |
| EmailPassword | String (optional) | None | Password for SMTP credentials, used if `EmailUseCredentials=1`. |
| EmailPort | Integer | 25 | The TCP port used to connect to the SMTP server. |
| EmailServerName | String (required) | None | Hostname or IP of a SMTP server. |
| EmailUseCredentials | Boolean | 0 | Whether or not SMTP credentials should be sent when connecting. |
| EmailUseCustomPort | Boolean | 0 | Whether or not to use a custom port connecting to  the email server. |
| EmailUserName | String (optional) | None | Username for SMTP credentials. Used if `EmailUseCredentials=1`. |
| EmailUseSSL | Boolean | 0 | Whether or not to use SSL/TLS when connecting to the email server |
[]()

### Single-Line Example

This example installs SS and not PM, leaving variable for the database parameters:

`ThycoticSetup.exe -q -s InstallSecretServer=1 InstallPrivilegeManager=0 DatabaseServer=<hostname> DatabaseName=<SecretServer> DatabaseUserName=<username> DatabasePassword=<password> /l C:\temp\ss-install.log /nodetect`
