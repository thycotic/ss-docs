[display]: # (search,content,print)
[priority]: #
[tags]: # (Release Notes)
[title]: # (Secret Server Release Notes 5.x)

# Secret Server Release Notes 5.x

## Release 5.1.000001

Minor Updates to 5.1

- Changed link on Administration pages, from "Languages" to "Language Maintenance"

- BUG: Fixed issues with URL case sensitive localization causing mixed languages to be displayed.

## Release 5.1.000000

Main Focus: New email alerts and support for PuTTY Features and Enhancements

- Added support for launching PuTTY for UNIX-based secrets

- Added ability to receive email alerts when secrets are viewed

- Added ability to receive email alerts when a dependency fails to update on an automatic password change

- Added new role permission for searching/viewing inactive secrets

- Changed folder creation/movement to only require edit permissions on the parent folder

- Added support for Remote Desktop launcher with Windows Integrated Authentication

- Added new bulk operations for deactivating and setting autochange on secrets

- All pages now maintain scroll position on postback

- Added a Languages page for Administrators to update and translate content to their language of choice

- Added an OK button to the top of the Folder picker

- Added additional folder management buttons to the top of the Folder Administration screen

- Added functionality to make Secret Server 64 bit compatible

- Searching on all fields no longer splits words up by periods Bug fixes

- Fixed bug on Login where a minimum password age error was shown when creating a local user

- Fixed bug with Windows Service Dependency Changers when using Windows Accounts due to a missing prefix of the machine name

- Fixed bug related to unlimited setting on Remember Me

- Fixed null reference bug on Secret Audit when user does have "View Secret" role permission

- Fixed bug where an incorrect validation message was displayed when password history was set to 'all'

## Release 5.0.000002

Main Focus: Minor enhancements to 5.0

- Improved database indexes for search functionality.

- BUG: Fixed issue that intermittently occurred in older Secret Server instances when upgrading.

- BUG: Fixed to not send alerts when search indexing.

- BUG: Fixed Secret Template to not allow search indexing on file attachments.

- Fix: Cleaned up the CSS and layout on several pages.

## Release 5.0.00000

Main Focus:Changing Passwords for Scheduled Tasks and
Service Accounts Features and Enhancements:

- Enhanced Remote Password Changing to update dependent Scheduled Tasks, IIS AppPools and Windows Services.

- Added Checkout option to provide accountability for the use of a secret – the password gets changed automatically on checking.

- Enhanced search functionality to allow users to search by all fields.

- Implemented 'Change Password Remotely' feature to allow users to immediately change a password on a remote server.

- Added new default theme to enhance the readability of the UI.

- Export by folder now includes all child folders.

- Added the SecretID field to SS webservices to provide integration for custom development.

- Administrators can now force local user password expiration.

- Added configurable minimum password age requirements for local user passwords.

- Added password history configuration options to prevent users from using past local user passwords.

- Webservices and Secret Assistant usage now creates view audit records.

- SSH Remote Password Changing now works for "root" accounts.

- Added ability to automatically delete excess database backups on the application server. Bug fixes

- Fixed bug that occurred when trying to access the Administer Groups page with no active local groups.

- Fixed unlimited remember me bug with Secret Assistant.

- Fixed bug when trying to create a new secret from a Secret Template with no fields.

- Fixed bug where SSH remote password changing left open connections.

- Fixed bug where Secret Assistant would return inactive secrets.


