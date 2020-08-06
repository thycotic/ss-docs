[display]: # (search,content,print)
[priority]: #
[tags]: # (Release Notes)
[title]: # (Secret Server Release Notes 9.x)

# Secret Server Release Notes 9.x

## Release Notes 9.1.000001

_Release Date: 10/13/2016_

### Enhancements

- It is required to upgrade to 9.1.000001 before Secret Server will upgrade to 10.0.000000

- Added installer enhancements to support the 10.0.000000 release. Release Notes 9.1.000000 Release Date: 7/13/2016 Enhancements

- REST API
  - REST based web services API for managing Secrets, Users, and Groups.
  - For more information see the REST API Guide on the Secret Server documents page
- Web Password Filler
  - A new Chrome extension for website logins is available, for more info see this KB article.
  - NOTE: After upgrade, Chrome users will be prompted automatically to install this extension. Firefox and Internet Explorer users will continue to use the existing add on or bookmarklet.
- Site per OU in Discovery
  - Assign an Engine Site at the OU level in Discovery
  - Set a different Secret per OU in Discovery
- Added option to set owners on user accounts to delegate account management

- Added support for SCP through the SSH proxy

- Added option to set owners on user accounts to delegate account management

- Disabled dependencies are hidden by default on the Secret Dependency page

- Added option to set owners on user accounts to delegate account management

- Editing a password field on a Secret with password changing enabled now gives the user a dismissable prompt to help prevent mistaken password edits

- Domain user accounts can now be marked as Application Accounts for integrated auth web service access only

### Bug Fixes

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- Fixed issue where multiple syslog destinations using the FQDN did not work

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- Fixed issue where Oracle error ORA-12170 was treated as heartbeat failed rather than unable to connect.

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- Fixed issue where commas in group names were not parsed correctly on AD Sync

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- Fixed issue with AD sync when the OU has asterisks in the name

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- Fixed syslog error when the event details exceeded 4000 characters

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- Check In web service method now respects the Force Checkin role permission.

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- Fixed potential licensing error when running the PowerShell password changer

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- Added support for HMAC-SHA2-256 and HMAC-SHA-512 ciphers for SSH Heartbeat and Password Changing

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- Added additional information to the Subscription Dependency failure email to include machine name and dependency name that failed

- ConnectWise integration now uses the API rather than database table integration. See this KB for information on setting up API access to ConnectWise.

- The Thycotic PAM Android app has been republished. Existing Android users will need to uninstall and re-install to get the new version.

## Release Notes 9.0.000000

_Release Date: 4/13/2016_

### Enhancements

- Mac Session Launcher
  - RDP, SSH, and Custom Launchers are now supported with the new Mac OS X protocol handler.
  - For more information see this KB.
- Geo Replication
  - MS SQL Replication is now supported as an additional add on module. Contact your account rep if you are interested.
- UNIX Privilege Manager
  - Administrators can configure SSH command menus to limit what users can do with root and other privileged credentials.
  - Requires a separate add on, contact your account rep if you are interested.
- Remember Me is now available for 2 factor.

- New option for SSH launchers to specify a Connect As Secret to make the initial connection before switching to the current Secret's user for cases when accounts are denied SSH login.

- Remember Me is now available for 2 factor.

- The Tree View on Dashboard and Discovery Network View is now collapsible.

- Windows Discovery now finds:
  - If an account is Local Administrator
  - If an account is in the Local Administrators Group
  - Password last set date
  - Password expiration date
  - Password expiration status

### Bug Fixes

- Fixed issue where domain FQDN wasn't populated during Active Directory Sync.

- Fixed issue with syncing an Active Directory Group with more than 1,500 members.

- Fixed issue where domain FQDN wasn't populated during Active Directory Sync.

- Fixed issue where searching wouldn't work on Secret name's starting with ":"

- Fixed issue where domain FQDN wasn't populated during Active Directory Sync.

- Added optional remember me setting for two factor authentication.

### Security Fixes

- The version of PuTTY shipped with Secret Server has been updated to version 0.67 to include the latest security fixes. For more information please refer to the PuTTY change log.


