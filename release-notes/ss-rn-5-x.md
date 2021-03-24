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
- Added ability to receive email alerts when secrets are viewed
- Changed folder creation/movement to only require edit permissions on the parent folder
- Added ability to receive email alerts when secrets are viewed
- Added new bulk operations for deactivating and setting autochange on secrets
- Added ability to receive email alerts when secrets are viewed
- Added a Languages page for Administrators to update and translate content to their language of choice
- Added ability to receive email alerts when secrets are viewed
- Added additional folder management buttons to the top of the Folder Administration screen
- Added ability to receive email alerts when secrets are viewed
- Searching on all fields no longer splits words up by periods Bug fixes
- Added ability to receive email alerts when secrets are viewed
- Fixed bug with Windows Service Dependency Changers when using Windows Accounts due to a missing prefix of the machine name
- Added ability to receive email alerts when secrets are viewed
- Fixed null reference bug on Secret Audit when user does have "View Secret" role permission
- Fixed bug where an incorrect validation message was displayed when password history was set to 'all'

## Release 5.0.000002

Main Focus: Minor enhancements to 5.0

- Improved database indexes for search functionality.
- BUG: Fixed issue that intermittently occurred in older Secret Server instances when upgrading.
- BUG: Fixed to not send alerts when search indexing.
- BUG: Fixed issue that intermittently occurred in older Secret Server instances when upgrading.
- Fix: Cleaned up the CSS and layout on several pages.

## Release 5.0.00000

Main Focus:Changing Passwords for Scheduled Tasks and
Service Accounts Features and Enhancements:

- Enhanced Remote Password Changing to update dependent Scheduled Tasks, IIS AppPools and Windows Services.
- Added Checkout option to provide accountability for the use of a secret – the password gets changed automatically on checking.
- Enhanced search functionality to allow users to search by all fields.
- Added Checkout option to provide accountability for the use of a secret – the password gets changed automatically on checking.
- Added new default theme to enhance the readability of the UI.
- Added Checkout option to provide accountability for the use of a secret – the password gets changed automatically on checking.
- Added the SecretID field to SS webservices to provide integration for custom development.
- Added Checkout option to provide accountability for the use of a secret – the password gets changed automatically on checking.
- Added configurable minimum password age requirements for local user passwords.
- Added Checkout option to provide accountability for the use of a secret – the password gets changed automatically on checking.
- Webservices and Secret Assistant usage now creates view audit records.
- Added Checkout option to provide accountability for the use of a secret – the password gets changed automatically on checking.
- Added ability to automatically delete excess database backups on the application server. Bug fixes
- Added Checkout option to provide accountability for the use of a secret – the password gets changed automatically on checking.
- Fixed unlimited remember me bug with Secret Assistant.
- Added Checkout option to provide accountability for the use of a secret – the password gets changed automatically on checking.
- Fixed bug where SSH remote password changing left open connections.
- Fixed bug where Secret Assistant would return inactive secrets.


