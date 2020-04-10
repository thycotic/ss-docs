[title]: # "Secret Server Release Notes 10.1.x"
[tags]: # "Release Notes"
[priority]: #
[display]: # "search,content,print"

# Secret Server Release Notes 10.1.x

 ## Release Notes 10.1.000023

*Release Date: 2/22/2017*

 ### Enhancements

- Added additional actions to user audit for when 2-factor is changed on the user.

- Added status icon to the Heartbeat field on Secrets. Going forward new Heartbeat and Password Change errors can be viewed in a Secret's audit log for quicker diagnosis and reporting. Note that these error messages are not backfilled so only new errors will show in the log going forward.

- Added support for multiple domain controller IP addresses in the domain field of an Active Directory Secret for cases when the domain name isn't resolvable for heartbeat and password changing.

- Updated behavior in the SOAP API for disabling Check Out on Secrets that are currently checked out to match bulk operations behavior. A Secret Owner can now call SetCheckOutEnabled to turn off check out on a currently checked out Secret.

- Added a new role permission for creating application user accounts.

- The SSH Proxy now restricts the default cipher suite for incoming connections.

- SOAP API – Added new method for GetReport to get report data via the API

 ### Bug Fixes

- Fixed issue where password changing through Distributed Engine would not run in Professional Edition
- Fixed localization issues in logs
- Fixed engine upgrade error when upgrading from the legacy agent to distributed engine.
- Fixed issue where the database field tracking when the Secret expiration field was initially set using the server time instead of UTC
- Fixed issues with the Secret Search Filter for Discovery
- Fixed issue where getting redirected to the Logged in at other Location could cause the user to be logged out at both locations.
- Fixed issue in AD sync where an error was logged in some cases if the client was accessing from behind a load balancer.
- Fixed issue where using the Folder Slider on dashboard and deleting the currently selected folder would break dashboard search.
- Fixed issue where you could set an approval group that only contained an application account user
- Fixed exception that could occur in the system log for license expiration checks.
- Fixed issue where the only privileged account options in Secret Policy were for LDAP or Active Directory Secrets.
- Fixed issue where the Configuration Edit Event Subscription didn't fire if email settings were modified
- Fixed issue where a large custom expiration data, such as 12/1/9999 on a Secret caused 500 errors on Dashboard search
- Fixed SQL Replication issues where web server nodes connected to subscribers redirected to replication page and audit insert errors could occur.

 ### Security Fixes

- Fixed XSS issue on Discovery Scanners.
- Fixed XSS issue on Secret View for certain launcher configurations.

 ## Release Notes 10.1.000000

*Release Date: 1/18/2017*

 ### Enhancements

**SSH Key Management (May require an additional license)** 

- Added ability to automatically generate new public / private key pairs and rotate the public key on servers.
- See [this KB](https://thycotic.force.com/support/s/article/SSH-Key-Rotation-Quick-Start) for a walkthrough of managing SSH Key Pairs

**z/OS RACF Support (Requires Premium Edition or higher)** 

- Added support for automatically manage IBM z/OS RACF credentials

**Dual Control** 

- Added options to enforce dual control when viewing recorded sessions, shadowing sessions, and running reports to enforce 4 eyes principle for potentially sensitive audit information.

**New Built in Reports** 

- Unlimited Administrator Activity: Shows actions done by users with the unlimited administrator permission when break the glass mode is enabled.
- What Secrets Changed Passwords in Last 90 Days: Shows Secrets that have had their passwords changed in the last 90 days.
- What Secrets Have Not Had Passwords Changed in Last 90 Days: Shows Secrets that have not had a password change in the last 90 days.
- What Folders Have Policies Assigned: Shows what Secret Policies are assigned to folders.
- What Secrets Have Different Policies Than Their Folders: Shows Secrets that aren't inheriting their policies from their Folder.
- What Secrets have Policies Assigned: Shows what policies are assigned to each Secret.
- User Activity Report: Added User's current locked out status to the user activity report.

- Added ability to auto enable Google Authenticator, Duo, and email two factor as part of domain synchronization.

- Dependencies on Secrets can now be grouped so they can be assigned to different Sites when a service account is used across segregated networks.

- The Delete Secrets role permission has been split into separate permissions for delete secrets and delete secrets from reports.

- When session recordings are stored to disk rather than in the database there is now an option to encrypt the videos.

- Renamed Domain Friendly Name to NetBIOS name on Active Directory administration page.

- Application API Accounts can now log in directly to both the SOAP and REST API's

**REST API** 

See [this KB](https://thycotic.force.com/support/s/article/REST-API-PowerShell-Scripts-Getting-Started) for examples in PowerShell 

- **Token Expiration:**
New expiration endpoint to invalidate an issued token
- **File Upload / Download:** Upload and download files from Secrets
- **Field Update / Get:** Get or update a specific Secret field value with a single call rather than getting the full Secret object and posting an updated Secret object
- **SSH Keys:** Added options to change password and create Secret for generating new SSH keys and passphrases.

>**Note**: As of 10.0 the REST API and SOAP API tokens are not interchangeable due to added support for OAUTH. Each API requires its own authentication call and token.

 ### Bug Fixes

- Fixed issue where emailing reports wouldn't use the selected date range.
- Fixed issue where a backslash in the dashboard search wouldn't return any results.
- Fixed issue where scheduled backups were not available in Free edition.
- Updated the Windows Password Changer to support changing the built in administrator accounts without having to specify a privileged Secret due to Microsoft Patches [3177108 ](https://support.microsoft.com/en-us/kb/3177108)and [316769](https://support.microsoft.com/en-us/kb/3167679).
- Fixed issue where an admin could convert the only local admin account to an Active Directory Account.
- Fixed foreign key error in Discovery when an OU is deleted that is part of a discovery import rule
- Fixed issue where testing PowerShell scripts failed when a PSObject was returned by the script.
- Fixed issue where reports did not email with the correct date range.
- Removed special characters from SSH Proxy one time credentials to prevent issues with some custom launchers where special characters break command line arguments.
- Fixed issue where SSH Command Sets were not available in Professional Edition for Discovery.
- Fixed issue where Discovery could return an error when matching found accounts against Secrets with an inactive Secret Type.
- Fixed issue where adding an Active Directory Domain with the same name as an SSH based Discovery Source would cause an error.
- Fixed issue with REST tokens that could occur in some environments when FIPS mode was enabled.
- Fixed issue where the Database verify step fails in the web installer when Maintenance Mode is enabled. Note that since this is a change to the installer it will not take effect during the upgrade to 10.1 because the upgrade is running off of the current version.
- Fixed issues with the Mac Session Launcher when running on Sierra.
- **REST API:** Fixed permission check issues in the REST API where editing a Secret with check out enabled was improperly allowed.
- **REST API:** Fixed permission check issues in the REST API where users with View access could see the AutoChangeNextPassword field