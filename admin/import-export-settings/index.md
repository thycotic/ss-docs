# Importing and Exporting Secret Server Settings

## Overview

Secret Server (SS) can now export and import SS settings as a JavaScript Object Notation (JSON) file. With this, you can more easily move settings from an existing SS environment to another. 

## Prerequisites

### Required General Permissions

There are the permissions required to access and perform the process. These are:

To view the Export/Import page or menu link:

- Administer Export or View Export
- Administer Import

To view audits (at least one is required):

- Administer Users
- Own User
- View Users

Exporting to a JSON file:

- Administer Configuration
- Administer Export

Importing from a JSON file:

- Administer Configuration
- Advanced Import

### Required Additional Permissions

Some of the settings require additional permissions to export or import:

**Table:** Required Additional Permissions

| Setting             | Permission                                 |
| ------------------- | ------------------------------------------ |
| OpenID Log on       | Administer Thycotic One                    |
| SAML                | Administer Configuration SAML              |
| Security            | Administer Configuration Security          |
| Session Recording   | Administer Configuration Session Recording |
| SSH Commands        | Administer SSH Menus                       |
| Thycotic One Log on | Administer Thycotic One                    |
| Two Factor Log on   | Administer Configuration Two Factor        |

### Required Licenses

Additional licenses may be required to import or export some settings.

#### Advanced Auditing License 

license required

- ApplicationSettings
  - SyslogCefServer
  - SyslogCefPort
  - SyslogCefProtocol
  - SyslogCefTimeZone
  - SyslogCefLogSite

#### Enterprise Edition

> Note: this settings are also available with the Professional Edition and Approval Workflow Add-on licenses.

- LauncherSettings
  - CheckInSecretOnLastLauncherClose
  - CloseLauncherOnCheckInSecret
- PermissionOptions
  - ForceSecretApproval
  - EnableApprovalFromEmail
- TicketSystems

#### Pro Edition

- SAML
- Session Recording

#### Platinum Edition 

(or Pro Edition and Unix SUPM) license required

- SSH Commands

## Procedures

### Exporting Settings

To export SS settings:

1. Go to **Admin \> All**.  The Admin page appears:

   ![image-20210225141709284](images/image-20210225141709284.png)

1. Click the **Setup & System Maintenance** button. A menu appears alongside the button:

   ![image-20210225142002960](images/image-20210225142002960.png)

1. Click the Export / Import menu item. The Secrets tab of the Export / Import page appears:

   ![image-20210225142257671](images/image-20210225142257671.png)

1. Click the **Secret Server Settings** tab:

   ![image-20210225142447869](images/image-20210225142447869.png)

1. Click the **Export** button. 

1. Select the Setting Categories to export
   
   1. Selecting Configuration will select all available categories
   
1. Click Export Secret Server Settings

1. Enter your password

1. Click Export
   
   1. This will export a JSON file

Export Secret Server Settings screen shots

















## Import

This feature allows you to import settings from an existing Secret Server environment to aid in gaining congruently configured environments.

To Import Secret Server Settings:

1. Go to Admin menu, then select Export / Import (under Setup & System Maintenance)
1. Click Import button
1. In General, click Change to select a JSON file to import
1. Select the Setting Categories to import
   1. Selecting Configuration will select all available categories
   1. Validations
      1. Some categories will be unavailable to import, so the checkbox will be disabled and a message will show. Examples:
         1. A Setting Category is not in the import JSON file
         1. Do not have permissions to update
         1. Do not have a license
1. Click Export Secret Server Settings
1. Enter your password
1. Click Export

Import Secret Server Settings screen shots















## Setting Categories



Note: Some settings are unavailable in certain environments or if requiring a license or permission. 

### Application Settings

 - These settings correspond to the Application Settings section on the Configuration General page.

Settings unavailable in an on premise environment:

- DisplayDowntimeMessageToAdminsOnly 

Settings unavailable in a cloud environment:

- AllowSoftwareUpdateChecks
- EnableKeepAliveThread 
- WriteSyslogToEventLog 	
- TmsRootUrl 	
- CustomURL

Settings unavailable in an IBM environment:

- AllowSendTelemetry

### Launcher Settings (Runtime)

 - These settings correspond to the Launcher Settings (Runtime) section on the Configuration General page.

Launcher Deployment Type can be one of the following:

- 0 - Click Once
- 1 - Protocol Handler

Settings unavailable in a cloud environment:

- LauncherDeploymentType

### Protocol Handler Settings (Install-Time) 

- These settings correspond to the Launcher Settings (Runtime) section on the Configuration General page.

### Permission Options

 - These settings correspond to the Permission Options section on the Configuration General page.

Default Secret Permissions can be one of the following:

- 0 - Secrets inherit permissions from folder
- 1 - New Secrets copy permissions from folder
- 2 - Only creator has permissions to new Secrets

**User Experience** - These settings correspond to the User Experience section on the Configuration General page.

- Server Time Zones can be found in the server registry: Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Time Zones
- Default Date Formats can be found in the tbDateOptions table.
- Default Time Formats can be found in the tbTimeOptions table.
- Default New User Roles can be found in the tbRoles table
- Application Language 

**User Interface** - These settings correspond to the User Interface section on the Configuration General page.

Settings unavailable in an IBM environment:

- AllowUserToSelectTheme
- CustomLogoFullSize
- CustomLogoCollapsed

**Advanced Settings** - These settings correspond to the Advanced Settings section on the Configuration Advanced page.

**Login** - These settings correspond to the Login tab on the Configuration Login page.

Settings unavailable in a cloud environment:

- CacheAdCredentials
- TwoFactor.Radius.ClientPortRange

**Folder Settings** - These settings correspond to the Folders tab on the Configuration Folders page.

**Local User Passwords** - These settings correspond to the Local User Passwords tab on the Configuration Local User Passwords page.

**Security** - These settings correspond to the Security tab on the Configuration Security page.

Settings unavailable in a cloud environment:

- ForceHttps
- EnableHSTS
- HSTSMaxAge
- FipsEnabled
- EnableDatabaseIntegrityMonitoring
- DatabaseIntegrityMonitoringSymmetricKey

**Email** - These settings correspond to the Email tab on the Configuration Email page.

Settings unavailable in a cloud environment:

- SmtpServer
- SmtpUseCredentials
- SmtpUserName
- SmtpPassword
- SmtpDomain
- SmtpUseSSL
- SmtpPort
- SmtpUseImplicitSSL

### Ticket System 

- These settings correspond to the Ticket System tab on the Configuration Ticket System page. To insert a new Ticket System, in the same instance the export file came from, the TicketSystemId must be set to 0, otherwise it will treat it as an update (see External Instance Id). Ticket System Name cannot match another already in the database.

### Session Recording

 - These settings correspond to the Session Recording tab on the Configuration Session Record page.  Launcher must be enabled and a valid license for Session Monitoring is required to export and import this feature.

Settings unavailable in a cloud environment:

- EnableHardwareAcceleration
- StoreInDatabase
- EnableArchive
- ArchiveLocationBySite
- ArchivePath
- DaysUntilArchive
- VideoCodecId

To update SSHProxyRecordVideo or SSHProxyRecordKeyStrokes - SSH Proxy must be enabled

To update RDPProxyRecordVideo or RDPProxyRecordKeyStrokes - RDP Proxy must be enabled

### SAML 

- These settings correspond to the SAML tab on the Configuration SAML page. To insert a new Identity Provider, in the same instance the export file came from, the IdentityProviderId must be set to 0, otherwise it will treat it as an update (see External Instance Id). The Identity Provider Name cannot match another already in the database.

### Licenses

 - These settings correspond to the Licenses listed on the Licenses page.

### SSH Commands

 - These settings correspond to the SSH Command Restrictions, the SSH Commands, Allowed Command Menus and Blocked Command Lists.

## Export JSON File

### External Instance Id

This corresponds to the instance the settings were exported from. If you change this id, then it will assume the export came from another database and will insert new records for the Ticket System or SAML (Identity Providers) categories. To add a new record in the same instance, set the id to 0 and it will be treated as a new item. (ex. TicketSystemId or IdentityProviderId)

### Configuration Version

This is the configuration version the settings were exported from. In there future when other settings are added, it will allow Secret Server to determine which settings are available and which are not in the database.

## Import JSON File



In the UI, the exported JSON file can be easily modified and used as the import JSON file.  But for the API, the exported JSON will need to be added in the Data object. Then manually update the desired filter category load to true to import.

### API Filter

- **Load All** - If set to true, this will update all available Secret Server Settings. 
- **General Load All** - If set to true, this will update all available General Settings (Application Settings, Launcher Settings, Protocol Handler Settings, Permission Options, User Experience, and User Interface)

### Audits



An audit will be recorded for each setting category that was exported or imported by user. The individual setting audits can be viewed on the Configuration Audit page.

 Audits

![img](blob:https://thycotic.atlassian.net/f3e95cfa-59c3-4f24-bc31-e2882cd54963#media-blob-url=true&id=9bbe1c0a-517e-4d58-b71f-933999293584&collection=contentId-1973290633&contextId=1973290633&mimeType=image%2Fpng&name=image-20210218-155756.png&size=57212&width=1255&height=421)

**Audit with errors:**



If there are errors, a log will also be saved with more details.

- Security, Login, Email, Ticket System, SAML - Completed with errors. Please check the System Log for details.

### Events



When Secret Server Settings are exported or imported, an event will be logged.

- **SECRETSERVERSETTINGS** - Event Type for the Secret Server Settings.

### Logs



When Secret Server Settings are exported or imported, or any validation errors occur, a new log will show in the SS.log file.

### System logs / CEF examples:

- USERNAME (USERID) - Secret Server Settings Import - Failed to import SAML for the following reason(s): TicketSystem=Only one ticket system can be default. (IsDefault);SAML=Identity Provider Id was not found in the database. Check that it was not modified after export. (IdentityProviderId)

### SS.log examples:

- ERROR Thycotic.Logging.ILogWriter - USERNAME (USERID) - Secret Server Settings Import - Failed to import SAML for the following reason(s): TicketSystem=Only one ticket system can be default. (IsDefault);SAML=Identity Provider Id was not found in the database. Check that it was not modified after export. (IdentityProviderId)
- ERROR Thycotic.Logging.ILogWriter - USERNAME (USERID) - Secret Server Settings Import - Failed to import some settings due to the following reason(s): Security=Access Denied;Login=Insufficient permissions to edit Radius settings. (Radius),Insufficient permissions to edit Thycotic One or OpenId settings. (OpenIdConnect),Insufficient permissions to edit Duo settings. (Duo);TicketSystem=Only one ticket system can be default. (IsDefault);SAML=Access Denied

## Errors and Resolutions

| **Sample Error**                                             | **Resolutions**                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| SAML=Access Denied                                           | Need Administer Configuration SAML permission to update SAML settings. |
| SAML=Identity Provider Id was not found in the database. Check that it was not modified after export. (IdentityProviderId) | For the SAML, the IdentityProviderId provided in the import file was not found in the database. If intending to add a new one, set this to 0. |
| TicketSystem=Only one ticket system can be default. (IsDefault) | For TicketSystem, the IsDefault is set to true when there is already one set to true in the database. If intending to set it to true, set the other one to false. |
| Insufficient permissions to edit Radius settings. (Radius)Insufficient permissions to edit Duo settings. (Duo) | Need Administer Configuration Two Factor permission to update Radius or Duo settings. |
| Insufficient permissions to edit Thycotic One or OpenId settings. (OpenIdConnect) | Need Administer OpenID Connect permission to update OpenIdConnect settings. |

 