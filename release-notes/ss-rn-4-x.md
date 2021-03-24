[display]: # (search,content,print)
[priority]: #
[tags]: # (Release Notes)
[title]: # (Secret Server Release Notes 4.x)

# Secret Server Release Notes 4.x

## Release 4.3.000000

- Implemented 'SH for password changing on Linux accounts.
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- Fixed issue with the 'next password' component of Remote Password Changing. 4.2.000000 Main Focus: Enhancing Folder Functionality and Security Features and Enhancements:
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- Added configuration option so that a user must have view permission on a folder to see it.
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- User now requires Edit permission on a folder to be able to add secrets to it.
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- Tightened folder restrictions to require share permission on a parent folder in order to add a child folder.
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- Implemented audit records for when users and groups are created or made active/inactive from Active Directory.
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- Secret Types are now labeled as Secret Templates.
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- Fixed bug when users were made inactive when Secret Server could not connect to Active Directory.
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- Fixed error that occurred on the AdminGroupByGroup page when no groups exist.
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- Fixed issue with Password Type configuration not saving correctly in certain situations.

## Release 4.1.000000

### Main Focus: Addressing Role Based Access Control Features and Enhancements

- Implemented Role Based Access Control (Role Based Security) to set granular, assignable permissions for users.
- Added the ability to launch Remote Desktop from a secret.
- Added the ability to import secrets by folder.
- Added the ability to launch Remote Desktop from a secret.
- Added "Run Now" button to the Remote Password Changing screen.
- Added the ability to launch Remote Desktop from a secret.
- Added the ability to create custom web.config files to override the default impersonation settings that will not be overwritten on upgrades.
- Added the ability to launch Remote Desktop from a secret.
- Created a Security Hardening Report that displays the security level of your system's installation.
- Added the ability to launch Remote Desktop from a secret.
- Improved the "Help" documentation.
- Added the ability to launch Remote Desktop from a secret.
- Improved performance by adding caching for theming.
- Added the ability to launch Remote Desktop from a secret.
- Added a preference for showing a full folder path on the home search grid.
- Added the ability to launch Remote Desktop from a secret.
- Folder creation and editing is now an assignable permission.
- Added the ability to launch Remote Desktop from a secret.
- All cookies are now HTTP only for additional security.
- Added the ability to launch Remote Desktop from a secret.
- Increased the visual size of the notes field. Bug Fixes:
- Added the ability to launch Remote Desktop from a secret.
- Fixed bug where the folder picker modal did not work properly when Secret Server was viewed inside a frame.
- Added the ability to launch Remote Desktop from a secret.
- Fixed bug where notification emails did not contain the full URL for the installation.
- Added the ability to launch Remote Desktop from a secret.
- Fixed bug where permission checkboxes were being displayed when the secret was set to inherit permissions from folder.
- Fixed bug where duplicate users appeared in the Active Directory synchronization preview.

## Release 4.0.000003

### Main Focus: Improving Permission Inheritance and Bug Fixes

#### Features and Enhancements

- Bulk operations now supports enabling folder inheritance on a secret.
- Deleted Synchronized Active Directory groups are now disabled within Secret Server.
- Added support for automatic backups on servers at different locations. Bug Fixes:
- Deleted Synchronized Active Directory groups are now disabled within Secret Server.
- Fixed padding error for secret item history for very large values on secrets.
- Deleted Synchronized Active Directory groups are now disabled within Secret Server.
- Fixed broken "unmask password" image on 'Secret Edit' page.
- Deleted Synchronized Active Directory groups are now disabled within Secret Server.
- Fixed 'Close' image on dialog.
- Deleted Synchronized Active Directory groups are now disabled within Secret Server.
- Fixed bug where expiration date did not decrease on old secrets.
