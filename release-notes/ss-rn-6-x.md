[display]: # (search,content,print)
[priority]: #
[tags]: # (Release Notes)
[title]: # (Secret Server Release Notes 6.x)

# Secret Server Release Notes 6.x

## Release 6.2.000013 

Main Focus: Bug fixes

- Fixed bug where Folders would not be visible in Unlimited Admin Mode.

- Fixed bug when adding a new domain with a non-Administrator account.

- Fixed bug where Folders would not be visible in Unlimited Admin Mode.

- Fixed bug that would incorrectly enable an AD user that exists in AD and Secret Server but are not in a synch group.

- Fixed bug related to Remember Me value and Inactivity Timeout.

## Release 6.2.000012 

Main Focus: Responding to customer requests

- Added support for child domain users being members in parent domain groups.

- Remote Desktop Preferences for the Launcher o Copy to clipboard, admin/console, attach drives, share printers

- Added support for child domain users being members in parent domain groups.

- Embedded mode to Hide Headers and Footers o Running Secret Server in Embedded Mode KB

- Added support for child domain users being members in parent domain groups.

- Added Permission and confirmation for force expiring secrets on the User Audit Report.

- Added support for child domain users being members in parent domain groups.

- Improved the performance on the Domain Synchronization for selecting AD groups.

- Added support for child domain users being members in parent domain groups.

- Terminology Change: "Owner" permission replaces "Share."

- Added support for child domain users being members in parent domain groups.

- Added better support for incomplete language files, so defaults to English if item is not found.

- Added support for child domain users being members in parent domain groups.

- Updated Domain Synchronization to set the DisplayName for new users and support username changes in Active Directory.

- Updated display issues with listboxes being too small on the Group Edit page and Domain Synchronization page. 

## Release 6.2.000006

- Fixed bug with the Role Assignment screen showing duplicate groups.

- Fixed bug where the Everyone group was not appearing in the Group assignment dropdown list on the permission screens. 

## Release 6.2.000005 

Main Focus: Remote Password Changing enhancements and performance tuning 

### Features and Enhancements

- Disabled autocomplete on the Next Password textbox for Remote Password Changing.

- Service account credentials in these formats are now found by the dependency finder: 
  
  o username@fulldomainname 

  o username@shortdomainname 

  o shortdomainname\username 

  o fulldomainname\username

- Updated the Expired Secret log to include when the Secret is not changed due to the expiration time schedule.

- Performance improvements when using Unlimited Administrator Mode.

- Performance improvements on the Folder edit page. 

### Bug fixes

- Remote Password Changing will no longer fail when a privileged account on a dependency is not set. Instead, it will attempt to use the credentials on the Secret. 

## Release 6.2.000004

- Fixed minor bug that incorrectly displayed encrypted values after saving a Secret. 

## Release 6.2.000003

Main Focus: Usability and Workflow 

### Features and Enhancements

- Streamlined the Secret creation process 

  o Single click for folder selection 

  o Remembers last selected folder o Allow changing Secret Template on the Create page 

  o Combined Search and Browse last selected Folder

- Option to allow Secrets to require approval for access o Email Notifications to approvers and requesters o Audit is kept of all approve and deny actions o Secret Access Request Manager page 

### Bug fixes

- Fixed the missing folder indentation in IE 

## Release 6.0 6.2.000000

Main Focus: Responding to customer requests 

### Features and Enhancements

- Users can now reset their login password through a password reset email.

- Added configuration option to AD synchronization to prevent enabling and disabling users during synchronization.

- Users can now reset their login password through a password reset email.

- Added "LockedOut" feature so that failed authentication attempts locks out a user instead of disabling them.

- Users can now reset their login password through a password reset email.

- Added ability to handle AD hierarchies that contain cycles in their groups.

- Users can now reset their login password through a password reset email.

- Added a password migration tool for Password Corral (See the Tools page in Secret Server for more details).

- Users can now reset their login password through a password reset email.

- Added an audit record for when the launcher is used. 

### Bug fixes

- Fixed bug where inactivity timeout did not work correctly.

- Fixed bug that allowed users to delete folders containing Secrets when the "Require folder for Secret" option was turned on.

- Fixed bug where inactivity timeout did not work correctly.

- Fixed bug where some AD hierarchies that had root folders with no users in them could cause null reference exceptions.

- Fixed bug where inactivity timeout did not work correctly.

- Fixed bug that allowed users to view folders and their audits without the appropriate permission setting.

- Fixed bug where inactivity timeout did not work correctly.

- Fixed webservices to observe IP address restrictions.

- Fixed bug where inactive roles were being displayed on Admin Role Assignment pages. 

## Release 6.1.000002 

Main Focus: Minor updates to 6.1 

### Features and Enhancements

- Introduced the Failover Partner on Step 3 of the installer to support mirrored database environments.

- Added the use of the legacy Search / Browse functionality before 6.1 as a preference.

- Introduced the Failover Partner on Step 3 of the installer to support mirrored database environments.

- Added a Diagnostics page to assist troubleshooting Secret Server. 

### Bug fixes

- Fixed bug where certain operating system settings would prevent users from being able to create a Doublelock password.

- Fixed bug where the Launcher application did not start correctly.

- Fixed bug where certain operating system settings would prevent users from being able to create a Doublelock password.

- Fixed link to a Knowledge Base article on the Backup Configuration page due to KB article restructuring.

- Fixed minor security issue where creating a user with a special sequence of characters would cause unexpected behavior. 

## Release 6.1.000000 

Main Focus: DoubleLock for sensitive Secrets and bug fixes 

### Features and Enhancements

- Implemented DoubleLock to provide an additional security layer for sensitive Secrets

- Enhanced performance for Active Directory authentication

- Implemented DoubleLock to provide an additional security layer for sensitive Secrets

- HTML now renders using "standards mode" (may affect user customized themes) 

### Bug Fixes

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed bug pertaining to an infinite redirect loop related to session expiration and password expiration

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed bug with bulk operations where progress was not reported to the user

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed bug where folder name appeared outside of the dialog when viewing a folder

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed bug to not allow Checkout to be enabled when Remote Password Changing is disabled

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed bug where users with permanent cookies disabled were always redirected to LogoutAnotherLocation screen

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed bug where IOException was occasionally thrown during installation due to file permissions

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed bug that caused NullReferenceException when inactivating a Secret without the required role permission

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed UI layout on the dependencies tab related to the explain link

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed bug when unmasking passwords that have XML special characters 6.0.000001 Main Focus: Minor Updates to 6.0 Features and Enhancements

- Passwords generated for expired Secrets now meet domain credential requirements

- Changed installer to not overwrite customized configuration files in future releases.

- Passwords generated for expired Secrets now meet domain credential requirements

- Fixed bug where expired password and expired license caused redirects.

- Passwords generated for expired Secrets now meet domain credential requirements

- Improved stability of AD Synchronization capabilities. 

## Release 6.0.000000 

Main Focus: Remote Password Changing and user experience 

### Features and Enhancements

- Enhanced Remote Password Changing to allow setting a specific date and time schedule for changing service account passwords and their dependencies.

- Dependent Windows Services are now automatically restarted when a service account credential is changed.

- Enhanced Remote Password Changing to allow setting a specific date and time schedule for changing service account passwords and their dependencies.

- Users can now specify their preferred date/time format.

- Enhanced Remote Password Changing to allow setting a specific date and time schedule for changing service account passwords and their dependencies.

- Added AJAX support to various features to enhance the user experience.

- Enhanced Remote Password Changing to allow setting a specific date and time schedule for changing service account passwords and their dependencies.

- Improved performance of initial AD sync page load.

- Updated Russian Localization to support new features. 

### Bug fixes

- Fixed bug where content was not correctly displayed on the 'Expired Secret' report page.

- Fixed intermittent JavaScript error related to the scroll position on pages. Compatibility:

- Secret Server 6.0 no longer supports Windows 2000 due to our upgrade to the Microsoft .NET Framework 3.5.


