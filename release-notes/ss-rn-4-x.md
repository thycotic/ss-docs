[display]: # (search,content,print)
[priority]: #
[tags]: # (Release Notes)
[title]: # (Secret Server Release Notes 4.x)

# Secret Server Release Notes 4.x

## Release 4.3.000000

- Implemented 'SH for password changing on Linux accounts.
- Fixed bug with Active Directory Synchronization when pulling users and groups from an organizational unit.
- Fixed issue with the 'next password' component of Remote Password Changing. 4.2.000000 Main Focus: Enhancing Folder Functionality and Security Features and Enhancements:
- Added configuration option to allow Secrets to inherit folder permissions by default.
- Added configuration option so that a user must have view permission on a folder to see it.
- Users can now create and manage their own folders without them being visible to all users.
- User now requires Edit permission on a folder to be able to add secrets to it.
- Added a new 'Everyone' group to include each existing user for easier management and legacy folder permission support.
- Tightened folder restrictions to require share permission on a parent folder in order to add a child folder.
- Implemented audit records for when Groups are created, made inactive/active within Secret Server.
- Implemented audit records for when users and groups are created or made active/inactive from Active Directory.
- Renamed two Role Based Security permissions: Administer Roles is now Administer Role Permissions and Administer Group Roles is now Administer Role Assignment.
- Secret Types are now labeled as Secret Templates.
- Added an 'Evaluation Expiry' notice to alert users when their evaluation is about to expire. Bugs:
- Fixed bug when users were made inactive when Secret Server could not connect to Active Directory.
- Fixed bug where Backup did not work properly if a database name contained certain characters.
- Fixed error that occurred on the AdminGroupByGroup page when no groups exist.
- Fixed error when trying to import folders with line breaks in a Secret field.
- Fixed issue with Password Type configuration not saving correctly in certain situations. 

## Release 4.1.000000 

### Main Focus: Addressing Role Based Access Control Features and Enhancements

- Implemented Role Based Access Control (Role Based Security) to set granular, assignable permissions for users.
- Added the ability to launch Remote Desktop from a secret.
- Added the ability to import secrets by folder.
- Secrets can now be exported with a folder name.
- Added "Run Now" button to the Remote Password Changing screen.
- Implemented a visual keyboard on the login screen to thwart keyloggers.
- Added the ability to create custom web.config files to override the default impersonation settings that will not be overwritten on upgrades.
- Added a dropdown on the results screen for users to define the amount of secrets to display.
- Created a Security Hardening Report that displays the security level of your system's installation.
- Created the SecretTypeSetActive.aspx page for quickly setting the active status on Secret Types.
- Improved the "Help" documentation.
- Groups deleted from Active Directory will now be disabled.
- Improved performance by adding caching for theming.
- Specific passwords can be set on the Remote Password Changing – AutoChange feature.
- Added a preference for showing a full folder path on the home search grid.
- Implemented robot.txt file to stop search engines from indexing Secret Server installations.
- Folder creation and editing is now an assignable permission.
- Added a search textbox to the Users screen.
- All cookies are now HTTP only for additional security.
- Added "Save and Add New" button SecretView.aspx.
- Increased the visual size of the notes field. Bug Fixes:
- Fixed bug where an exception was thrown when invalid information was entered in the "minimum password length" configuration option.
- Fixed bug where the folder picker modal did not work properly when Secret Server was viewed inside a frame.
- Fixed error where Secret Type export XML format was incorrect.
- Fixed bug where notification emails did not contain the full URL for the installation.
- Fixed bug where Integrated Authentication was not setting last login.
- Fixed bug where permission checkboxes were being displayed when the secret was set to inherit permissions from folder.
- Fixed bug where duplicate users appeared in the Active Directory synchronization preview. 

## Release 4.0.000003 

### Main Focus: Improving Permission Inheritance and Bug Fixes 

#### Features and Enhancements

- Bulk operations now supports enabling folder inheritance on a secret.
- Deleted Synchronized Active Directory groups are now disabled within Secret Server.
- Added support for automatic backups on servers at different locations. Bug Fixes:
- Fixed bug when editing folder permissions that include a disabled user.
- Fixed padding error for secret item history for very large values on secrets.
- Fixed bug in Remote Password Changing due to new column for inherited permissions.
- Fixed broken "unmask password" image on 'Secret Edit' page.
- Fixed 'Remember Me' bug due to .NET 2.0 migration.
- Fixed 'Close' image on dialog.
- Fixed paging problem on AdminExport grid.
- Fixed bug where expiration date did not decrease on old secrets.


