[display]: # (search,content,print)
[priority]: #
[tags]: # (Release Notes)
[title]: # (Secret Server Release Notes 10.0.x)

# Secret Server Release Notes 10.0.x

## Release Notes 10.0.000006

_Release Date: 10/20/2016_

### Enhancements

- Added Secret Search Filter to Discovery Scanners to dynamically find a Secret to authenticate to a machine for scanning. See this KB for instructions on creating Secret Search Filters.
- Custom PowerShell password changers are now configured and defined in Remote Password Changing rather than on the Secret Template. See this KB for updated instructions on creating PowerShell Password Changers
- Added option for matching Dependencies to Secrets based on a remote machine in addition to a domain for better support of database links and other local account type Dependencies
- Custom PowerShell password changers are now configured and defined in Remote Password Changing rather than on the Secret Template. See this KB for updated instructions on creating PowerShell Password Changers
- Added Scan Template column to the Discovery Network View results view

### Bug Fixes

- Fixed issue where launchers could periodically fail in a load balanced environment because session information was only stored on the web server the session was started from.
- Fixed issue where UNIX host ranges were not removed in the Discovery Network View after they were removed from the Discovery Source.
- Fixed issue where testing PowerShell scripts that returned PowerShell objects on the Admin Scripts page could return a 500 error from the server.

### Security Fixes

- Fixed issue in REST web services discovered during internal review. Only customers running 10.0.000000 are affected. See this advisory for more information

## Release Notes 10.0.000000

  _Release Date: 10/13/2016_

- Scriptable Discovery (Enterprise Plus or Advanced Scripting Add-On)
  - Administrators can create PowerShell scripts to customize Discovery for local accounts and service accounts
  - Domain specific settings for service accounts, remote connection type, and extended account information have been moved to the relevant scanner on the Discovery Source page
  - NOTE: Custom SSH, SQL, and PowerShell script Dependencies are now managed as Dependency Templates for simplification of administration and integration with custom Discovery sources. Custom scripts will no longer be directly assignable as Dependencies on Secrets.
  - See the Scriptable Discovery Overview KB article for more information and example usage
- Distributed Proxying
  - Distributed Engines can be set to proxy Secret Server sessions as an alternative to the Secret Server web server.
- Privilege Manager for Windows
  - Secret Server and Privilege Manager for Windows can be co-deployed and share authentication and management
  - Requires separate purchase of Privilege Manager for Windows (formerly Application Control Solution)
- Added Secret as an option for the Domain Synchronization credential
- Added CAPTCHA support for logins
- Added configuration setting to prevent password re-use when changing a Secret's password.
- Added CAPTCHA support for logins
- Added support for MFA tokens with AWS password changing
- Added CAPTCHA support for logins
- Step Upgrade: Upgrading to 10.0.000000 requires that you first upgrade to 9.1.000001, which has changes to the upgrader to support moving to 10.0.000000.
- Added CAPTCHA support for logins
- Fixed issue where discovery would return an error if there was a duplicate deleted user on a windows machine.
- Added CAPTCHA support for logins
- Fixed issue when synchronizing cross domain groups
- Added CAPTCHA support for logins
- Fixed issues with checking empty fields in REST API
- Added CAPTCHA support for logins
- Fixed impersonation error when running a SQL Script Dependency
- Added CAPTCHA support for logins
- Fixed issue where Password Changing, Heartbeat, and Discovery did not consistently work on the same machine as a Distributed Engine
- Added CAPTCHA support for logins
- Fixed issue with engine licensing enforcement.
- Added CAPTCHA support for logins
- Fixed issues with SonicWALL password chanagers
- Added CAPTCHA support for logins
- Fixed impersonation issue with SQL Dependencies
- Added CAPTCHA support for logins
- Fixed Open Redirect issues on multiple pages
- Added CAPTCHA support for logins
- Added an upper limit to local user passwords to prevent a denial of service attack with extremely long passwords
- Added CAPTCHA support for logins
- Fixed issue with MS SQL password changing where the new password showed in SQL Trace on the target database server Are you an IBM Security Secret Server customer? Access IBM-specific documentation here.


