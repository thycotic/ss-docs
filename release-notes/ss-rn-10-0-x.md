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

- Added Secret Search Filter to Discovery Scanners to dynamically find a Secret to authenticate to a machine for scanning. See this KB for instructions on creating Secret Search Filters.

- Scan Item Template has been renamed to Scan Template in the Scriptable Discovery Admin UI

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

- Added Secret as an option for the Domain Synchronization credential

- Added support for AES-CTR with SSH password changers when running in FIPS mode.

- Added Secret as an option for the Domain Synchronization credential

- NOTE: Secret Server 10.0.000000 requires configuring integrated pipeline mode on the Secret Server Application Pool Please see this KB for details on configuring integrated pipeline mode in IIS. If using Integrated Windows Authentication you will also need to update IIS authentication settings as detailed in this KB.

- Added Secret as an option for the Domain Synchronization credential

- NOTE: As of Secret Server 10.0 REST and SOAP API tokens are not interchangable. Each API requires it's own authentication call and token. Bug Fixes

- Added Secret as an option for the Domain Synchronization credential

- Fixed issues where 2-factor remember me and inactivity timeout could conflict

- Added Secret as an option for the Domain Synchronization credential

- Fixed issue where Remote Password Changing and Heartbeat would fail on the same machine as a Distributed Engine

- Added Secret as an option for the Domain Synchronization credential

- Fixed issue where the REST API folder search permissions were too restrictive

- Added Secret as an option for the Domain Synchronization credential

- Fixed issue in Audits when using mapped IPv4 addresses that exceeded 40 characters.

- Added Secret as an option for the Domain Synchronization credential

- Fixed issue where the Syslog RT field did not respect the UTC time setting.

- Added Secret as an option for the Domain Synchronization credential

- Fixed issue where a foreign key constraint from a deleted Discovery Rule could stop Discovery

- Added Secret as an option for the Domain Synchronization credential

- Fixed incorrect text warning when creating an Application Account

- Added Secret as an option for the Domain Synchronization credential

- Fixed issue where the delete action on Event Subscriptions could delete the incorrect row. Security Fixes

- Added Secret as an option for the Domain Synchronization credential

- Fixed XSS issues on multiple pages

- Added Secret as an option for the Domain Synchronization credential

- Fixed issue where Distributed Engine did not work when restricted to TLS 1.2

- Fixed issue with MS SQL password changing where the new password showed in SQL Trace on the target database server Are you an IBM Security Secret Server customer? Access IBM-specific documentation here.


