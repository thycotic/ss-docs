[display]: # (search,content,print)
[priority]: #
[tags]: # (Release Notes)
[title]: # (Secret Server Release Notes 7.x)

# Secret Server Release Notes 7.x

## Release Notes 7.9.000004

Main Focus: Security Update

- Fixed issue with launchers and Secret Check Out.
  - (This was reported by a customer – the issue was confirmed, fixed and released within 24 hours by the Secret Server team.)

## Release Notes 7.9.000003

### Bug Fixes

- Fixed issue that prevents upgrades on a non-default collation on the SQL Server database.

- Fixed issue where a scheduled report email would show an image link when no image was specified on the report.

## Release Notes 7.9.000001

Main Focus: Layout and Bug Fixes

- Fixed display issue in Folder Tree for Bulk Move to Folder for Chrome.

- Fixed layout issues in Admin Network View for IE 7.

- Fixed display issue in Folder Tree for Bulk Move to Folder for Chrome.

- Fixed error when manually emailing a report with parameters.

## Release Notes 7.9.000000

### Main Focus: Automatic Import of Local Accounts

- Secret Server Discovery now includes automatically creating Secrets when Local Accounts are found using "rules" (Enterprise Plus Edition)
  - Administrators can specify users that should be alerted when Local Accounts are discovered.
  - Administrators can create search rules to create Secrets when Local Accounts are discovered.
- Service Account Discovery for all Service Accounts (Enterprise Edition)
  - Secret Server will scan machines on the domain and retrieve Windows Services that run under a domain service Account.
  - Administrators can manually import these as Secrets with Dependencies, or if the Secret already exists, import the Windows Service as a Dependency.
- Linked Accounts for Custom Launchers
  - If a Secret Template is tied to a custom launcher, the owner can link other Secrets to either run the custom process, or to use for command line parameters.
- Added bulk operations for "Hide Launcher Password".

- When Unlimited Administrator is turned on, a banner is displayed on the dashboard warning users that it is on.

- Added bulk operations for "Hide Launcher Password".

- Updated error display icons to be more prominent on Event Subscription, and Password Rule screens.

- Added bulk operations for "Hide Launcher Password".

- Added installer check to prevent installation on non-compatible SQL Server collations.

- Improved performance for reports that checked Folders and Permissions. 

### Bug Fixes

- Fixed issue where certain unpatched versions of IE8 would not display Dashboard correctly.

- Fixed bug where th" pas"word compliance status of a Secret was not updated after a remote password change.

- Fixed issue where certain unpatched versions of IE8 would not display Dashboard correctly.

- Fixed error in the system log due to incorrect parsing of Dates in certain locales.

- Fixed issue where certain unpatched versions of IE8 would not display Dashboard correctly.

- Fixed bug where Secret Owners could change Share permissions on Secrets that were set for Approval for Access without getting approved.

## Release Notes 7.8.000062

Main Focus: Security/Bug Fixed

- Fixed security issue found during internal security review. (All customers are recommended to upgrade)

- Fixed locale issue on web browsers for unusual locales.

## Release Notes 7.8.000061

Main Focus: Scheduled Reports

- Added scheduled reports
  - Administrators can now set up Report generation on specific schedules.
  - Reports can be emailed to a subscription list.
  - Reports can be set as "Health Checks" that will only be delivered if the conditions of the Report are met.
- Added #STARTWEEK and #ENDWEEK as dynamic Report parameters.

- Updated Active Directory Synchronization to make adding synchronization Groups in large Domains easier.

- Added #STARTWEEK and #ENDWEEK as dynamic Report parameters.

- Updated calendar and search controls throughout the application for formatting and consistency.

- Improved inactivity timeout
  - If a tab is closed but not the browser, inactivity timeout will now work.
  - If multiple tabs are open for Secret Server, being active on any tab will prevent inactivity timeout from occurring (Except for IE).
  - If inactivity timeout occurs, all open Secret Server tabs will be redirected to the logout page (Except for IE). Bug Fixes
- Recorded IP Address in the Secret Audit record when a Dependency is updated.

- Added guard to prevent the expiration of Secrets through web services when Expiration is disabled on the Secret Template.

- Recorded IP Address in the Secret Audit record when a Dependency is updated.

- Fixed Windows Live Password Changer due to updates on the Windows Live site.

- Recorded IP Address in the Secret Audit record when a Dependency is updated.

- Fixed bug where updating personal notifications for a single Secret could update personal notifications for other Secrets.

## Release Notes 7.8.000048

### Main Focus: Windows Live password changer and COM+ dependencies

- Added support for changing Windows Live web passwords.

- Added support for COM+ Applications as Dependencies.

- Added new Bulk Operations
  - Disable AutoChange
  - Disable Comment On View
  - Undelete
- Added Folder Name on Secret Audit header.

- Added Configuration option to prevent duplicate Secret names.

- Added Folder Name on Secret Audit header.

- Added additional web service methods to the windows authenticated web service.

- Added Folder Name on Secret Audit header.

- Added new Folder Slider on Dashboard to make navigating highly nested Folder trees simpler.

- Added additional tooltips to the Secret View page. 

### Bug Fixes

- Fixed issue where Agent connections could sometimes fail due to the version not being handled properly.

- Fixed issue where SQL Password Changing could fail when the target SQL instance was configured to use a dynamic port.

- Fixed issue where Agent connections could sometimes fail due to the version not being handled properly.

- Fixed missing localizations on the IP Address page.

- Fixed issue where Agent connections could sometimes fail due to the version not being handled properly.

- Fixed bug where Template Name could be set to blank.

- Fixed issue where Agent connections could sometimes fail due to the version not being handled properly.

- Added file attachment support.

## Release Notes 7.8.000040

### Bug Fixes

- Added support for Next TokenCode mode for RADIUS servers.

- Fixed performance issues in Folders for IE on dashboard.

- Added support for Next TokenCode mode for RADIUS servers.

- Fixed issue where a Secret Field specified in the Parameters value of a Custom Launcher would not get masked if Hide Launcher Password was enabled.

- Added support for Next TokenCode mode for RADIUS servers.

- Fixed duplicate Folder name shown in Reports for highly nested Folders.

- Fixed bug where OK button would not enable on folder picker for bulk operations sometimes in certain browsers.

## Release Notes 7.8.000039

Main Focus: SonicWALL Integration and SSH 

### Enhancements

- Added support for changing passwords on SonicWALL NSA devices.

- Added support for SSH password changing where no user authentication is required to establish a connection. Used for BlueCoat Packet Shaper devices.

- Added support for changing passwords on SonicWALL NSA devices.

- Added a column to show whether a Group is Active on the Group Membership report.

- Added support for changing passwords on SonicWALL NSA devices.

- Made it more clear when a folder is selected for non-default themes. Bug Fixes

- Added support for changing passwords on SonicWALL NSA devices.

- Fixed issue where Folders might not return in a sorted order on Dashboard.

- Added support for changing passwords on SonicWALL NSA devices.

- Fixed bug where Configuration Change event subscriptions did not fire.

- Added support for changing passwords on SonicWALL NSA devices.

- Fixed bug that caused Windows Authentication Web Services to not work.

## Release Notes 7.8.000036

### Main Focus : Application API and Ticket System Integration

- Added Application User type for use with the Application API.

- Added support for Authenticated SMTP.

- Added Application User type for use with the Application API.

- New Bulk Operations
  - Change Check Out Status.
  - Convert Secret Template.
- New Web Service API methods
  - Secret Status to show whether a Secret is checked out.
  - Import XML to automate the advanced import.
  - Enable Check Out.
  - Expire Now.
  - Get Secret Audit.
- Discovery
  - Added new Reports for Discovery diagnostics.
  - The Full Scan log is now stored per computer.
  - Added Re-Scan button for each computer.
- Ticket System Integration
  - Administrators can enter a support system URL to navigate to Tickets from the Secret Audit.
  - Users can enter a ticket number for Require Comment and Approval for Access.
- Configuration option to change Default Secret permissions to Secret Creator only.

- Added option to allow Editors to bypass Approval for Access.

- Configuration option to change Default Secret permissions to Secret Creator only.

- Added new role permission for the Advanced Import.

- Configuration option to change Default Secret permissions to Secret Creator only.

- Added option to exclude Secrets from the User Audit Report that have been changed since the User last viewed them. 

### Bug Fixes

- Fixed issue when removing more than one field during a Template Convert.

- Fixed issue with Event Subscriptions Dependency Failure Events that caused the alerts to be sent every time a dependency was changed.

- Fixed issue when removing more than one field during a Template Convert.

- Added support for UTF-8 characters for the service account's password for Active Directory Synchronization.

- Fixed issue when removing more than one field during a Template Convert.

- Fixed issue where password requirements would validate on non-required password fields.

- Fixed issue when removing more than one field during a Template Convert.

- Fixed issues with data grid paging on the Event Subscriptions screen.

- Fixed issue when removing more than one field during a Template Convert.

- Fixed issue with Telnet Password Changer not always respecting the correct line endings.

- Fixed issue when removing more than one field during a Template Convert.

- Fixed error on Event Subscription page when running Secret Server in FIPS compliant mode.

- Fixed issue when removing more than one field during a Template Convert.

- Fixed error when returning a large number of Secrets in a Dashboard search.

- Fixed issue when removing more than one field during a Template Convert.

- Improved performance on Discovery Network View.

- Fixed issue when removing more than one field during a Template Convert.

- Prevented potential XSS attack on the Discovery dialog.

## Release Notes 7.8.000015

Main Focus : Bug Fixes

- Fixed issue with Active Directory Synchronization for some cases where if a group was disabled, it did not get re-enabled after being resynchronized.

- Fixed issue with Active Directory Synchronization where groups with a custom schema would not be synchronized correctly.

- Fixed issue with Active Directory Synchronization for some cases where if a group was disabled, it did not get re-enabled after being resynchronized.

- Fixed issue on Password Requirement Edit screen where a Password Requirement would fail validation if a description was not entered.

- Fixed issue with Active Directory Synchronization for some cases where if a group was disabled, it did not get re-enabled after being resynchronized.

- Fixed issue with the advanced XML import where a Folder with trailing spaces in the Folder Name could be created, but no Secrets in the import would be added to the Folder.

## Release Notes 7.8.000014

Main Focus : Bug Fixes and Usability 

### Enhancements

- Added extra detail to the Export and Unlimited Administrator email alerts.

- Added arrow key support for the Folder search on Dashboard and the quick search in the header.

- Added extra detail to the Export and Unlimited Administrator email alerts.

- Added Check All option for Windows Services found by the Dependency Searcher.

- Added extra detail to the Export and Unlimited Administrator email alerts.

- Added support for updating Windows Services Dependencies that are on the same machine as an Agent or the Secret Server application.

- Added extra detail to the Export and Unlimited Administrator email alerts.

- Added explanation on the Secret Audit page and the Secret Security tab for how often View Audits are recorded.

- Added extra detail to the Export and Unlimited Administrator email alerts.

- Changed "Indexable" to "Searchable" in the Secret Template Designer.

- Added extra detail to the Export and Unlimited Administrator email alerts.

- Modified privileges required to change a Secret's Folder. Secret Owners can change a folder regardless of whether they have the "Share Secret" permission and the Folder is inheriting permission. See the User Guidefor the full details on Folder and Secret inheritance rules.

- Added extra detail to the Export and Unlimited Administrator email alerts.

- Improved error notification for the Advanced Import dialog.

- Added extra detail to the Export and Unlimited Administrator email alerts.

- Added Audit record for when Hide Launcher Password is changed.

- Added additional validation for Active Directory Domains to automatically resolve the Domain Name to the Fully Qualified Domain Name.

### Bug Fixes

- Fixed issue with Dollar signs in custom UNIX\Cisco accounts.

- Fixed bug with large result sets when searching for linked accounts.

- Fixed issue with Dollar signs in custom UNIX\Cisco accounts.

- Fixed bug where `$$CHECKFOR` and `$$CHECKINFO` commands did not work on the Password Changer test dialogs.

- Fixed issue with Dollar signs in custom UNIX\Cisco accounts.

- Fixed a bug where the database backups would not get deleted if in a separate folder from the web application backups.

## Release Notes 7.8.000010

### Main Focus: Configuration file support for Service Accounts

- Configuration files can now be managed for Service Accounts.
  - Secret Server can update hardcoded values stored in configuration files using Regular Expressions when changing service account passwords. (Dependency Regex KB)
- Secret Dependency Page updated to more easily handle ordering (drag and drop) and Dependency specific information.

- Added Active Directory synchronization optimizations for large domains.

- Secret Dependency Page updated to more easily handle ordering (drag and drop) and Dependency specific information.

- Added Group handling to Advanced XML Import.

- Secret Dependency Page updated to more easily handle ordering (drag and drop) and Dependency specific information.

- Secret Template edit automatically re-focuses to next row when adding fields.

### Bug Fixes

- Fixed XSS vulnerability with the privileged account picker control.

- Fixed open redirect vulnerability on the Login page when already logged in.

- Fixed XSS vulnerability with the privileged account picker control.

- Fixed auto complete issue on some sensitive fields.

- Fixed XSS vulnerability with the privileged account picker control.

- Fixed issue with Oracle password changing failing on passwords with certain special characters.

- Fixed XSS vulnerability with the privileged account picker control.

- Fixed issues in advanced XML import when loading items with duplicate permissions.

- Fixed XSS vulnerability with the privileged account picker control.

- Fixed error for Event Subscriptions with inactive users.

- Fixed potential timeout errors on Diagnostics page.

## Release Notes 7.8.000002

### Bug Fixes

- Fixed issue with web services for Windows Authentication not enabling properly.

## Release Notes 7.8.000001

### Bug Fixes

- Fixed wording of confusing instruction text when changing a Secret's Template.

- Fixed header version to reflect the correct version.

## Release Notes 7.8.000000

### Main Focus: Password Changing Integrations and Custom Launchers

- Created Java API for use in embedded scripts without hardcoding a password.
  - Examples: Java API Examples KB
  - Deployment instructions : Java Console Instructions KB
- Added MySQL Password Changer and Template.

- Added OpenLDAP Password Changer and Template.

- Added MySQL Password Changer and Template.

- SQL Server password changes can now use a privileged account.

- Added MySQL Password Changer and Template.

- Added Custom Process Launchers to start user specified applications on a client machine with credentials from the Secret.
  - Added PowerShell, SQL Management Studio, and Sybase iSQL custom launchers.
- Added XML Export option to simplify restoring or migrating from an export.

- Added support for sys accounts for Oracle password changes.''

- Added XML Export option to simplify restoring or migrating from an export.

- Added Convert Secret Template.

- Added XML Export option to simplify restoring or migrating from an export.

- Added new report to show Secrets with pending approval requests.

- Added XML Export option to simplify restoring or migrating from an export.

- Fixed bug where disabled accounts in Active Directory did not get automatically disabled in Secret Server.

- Added XML Export option to simplify restoring or migrating from an export.

- Fixed issues with Oracle connection strings exceeding allowed length.

- Added XML Export option to simplify restoring or migrating from an export.

- Fixed bug with Secret Server user password history.

## Release Notes 7.7.000012

## Main Focus: Secret Server Installer Improvements

- Added MSI for initially installing Secret Server.

- Added ability to create the database if it does not exist during installation.

- Added MSI for initially installing Secret Server.

- Added more descriptive message when secret is checked out and then accessed from mobile devices.

- Added message to Role page to highlight any permissions that are not currently assigned.

### Bug Fixes

- Fixed bug with visual keyboard that caused it to not submit correctly.

- Fixed bug where error occurred when using Unlimited Administrator and attempting to checkout a Secret.

## Release Notes 7.7.000009

### Main Focus: Secret Template Improvements

- Added auditing to all Secret Template and Secret Field actions.

- Updated Secret Fields to use a soft-delete so the data can be retrieved.

- Added auditing to all Secret Template and Secret Field actions.

- Added clustering support for Remote Password Changing Agents.

- Added auditing to all Secret Template and Secret Field actions.

- Added exception logging to SQL Account Password Changing.

### Bug Fixes

- Fixed issue with Expired Secrets not sending event alerts.

- Security Fix for restricting the search textboxes to a max length.

- Security Fix to prevent XPath expressions with the language resources.

## Release Notes 7.7.000002

### Enhancements

- Created the Password Compliance Report Category.

- Renamed the Non-Alphanumeric Character Set to Symbol.

### Bug Fixes

- Fixed bug where the Remote Desktop Launcher was not properly cleaning up configuration files.

- Updated the Password Requirement edit page to prevent overriding the minimum length while entering the maximum length.

## Release Notes 7.7.000001

### Bug Fix

- Fixed bug where Secret Update email alerts are triggered by checking Password Compliance. Release Notes 7.7.000000

### Main Focus: Advanced Password Requirements

- Advanced rules can now be applied to password fields on the Secret Template.
  - Multiple custom character sets can be created and used in these rules to more exactly limit the type of password generated.
  - New reports to show what passwords do not meet complexity requirements.
  - Validation can be enabled to prevent saving Secrets that do not meet the password complexity requirements.
- Added audit record for machine when using an Active Directory account to launch Remote Desktop and PuTTY.

- The advanced XML import now includes Secret dependencies. Bug Fixes

- Added audit record for machine when using an Active Directory account to launch Remote Desktop and PuTTY.

- Fixed bug that could cause the Local Account Finder in Discovery to fail for some sets of credentials.

- Fixed bug where the default folder was not always being set on Dashboard.

## Release Notes 7.6.000000

### Main Focus: Discovery

- Discovery: Account Import (Enterprise Plus)
  - Administrators can now scan for domain joined machines and import local Windows accounts into Secret Server.
- Dependency Ordering
  - Dependencies can now be ordered and a wait time can be specified which will be observed before the Dependency is updated.
- Added new Password Changers for Juniper, HP ILO, and Blue Coat Devices.

- Added option on custom password changers to specify line ending type (CR/LF).

- Added new Password Changers for Juniper, HP ILO, and Blue Coat Devices.

- Added new Bulk Operation to set the privileged account for Windows and AD Secrets.

- Added new Password Changers for Juniper, HP ILO, and Blue Coat Devices.

- Added configuration option to send Syslog/CEF messages by TCP instead of UDP.

### Bug Fixes

- Fixed bug where Secret Copy created an Edit Audit Record.

- Fixed bug where dates in reports did not observe the user's date format preference.

- Fixed bug where Secret Copy created an Edit Audit Record.

- Fixed bug where unchecking All on Secret Template History caused error.

## Release Notes 7.5.000002

### Bug Fixes

- Fixed cross-site scripting (XSS) vulnerability on Secret View screen related to URL fields.

- Fixed command injection vulnerability in the PuTTY Launcher.
  - (These were reported by a customer performing a security audit – the issues were confirmed, fixed and released within 24 hours by the Secret Server team.)
- Fixed issue with limited number of concurrent Agents being able to connect.

## Release Notes 7.5.000001

### Bug Fixes

- Fixed Configuration page to only show video codec option when Session Recording is on.

- Fixed bug where Secret Server uses excessive CPU resources related to new Discovery capabilities.

## Release Notes 7.5.000000

### Main Focus: Discovery and Session Recording

- New Discovery Network View (Enterprise Plus)
  - Brings together the view of the network and the Secret Server repository to show Administrators whether local accounts on Domain Computers have corresponding Secrets.
- Session Recording (Enterprise Plus)
  - Remote Desktop or PuTTY sessions can now be recorded and the full movie is available as part of the audit. This setting can be configured per Secret and role permissions control who can access the audit movie.
- Hide Launcher Password setting can now be configured per Secret as an alternative to the role permission.

- Users are now automatically redirected from the pending request page when their request for access has been approved.

### Bug Fixes

- Fixed copy to clipboard bug in Remote Desktop launcher.

- Fixed bug where users were not correctly removed from Groups in Secret Server during synchronization when the AD Group is empty.

- Fixed bug where CEF port defaulted to -1 in Configuration.

## Release Notes 7.4.000002

### Bug Fixes

- Fixed bug in Approval for Access Quick Pick control.

## Release Notes 7.4.000000

### Features and Enhancements

- New Enterprise Plus Edition
  - Added SIEM integration using CEF and Syslog formats.
  - Support for front end server clustering.
- Added Group filter on Active Directory Synchronization screen.

- New Copy Secret option.

- Added Group filter on Active Directory Synchronization screen.

- New Events for Users.
  - Login, Logout, Login Failure, and Password Change
- File attachments are now stored in the database rather than the file system.

- Added new Advanced Import option from XML. Bug Fixes

- File attachments are now stored in the database rather than the file system.

- Fixed Tab and Copy to Clipboard bugs in IE9.

- File attachments are now stored in the database rather than the file system.

- Search box on Dashboard is now automatically given focus.

- File attachments are now stored in the database rather than the file system.

- Fixed bug where option to view deleted secrets showed incorrectly on Dashboard.

- File attachments are now stored in the database rather than the file system.

- Fixed security issue with Ajax services.

- Fixed bug with alternative Active Directory account name formats not being supported.

## Release Notes 7.3.000002

### Security Update

- Fixed potential cross-site scripting vulnerabilities on Administration screens. (This was reported by a customer who performed a security audit – the issue was fixed and released within 24 hours by the Secret Server team.)

- View this Knowledge Base article for having Secret Server require secure cookies. This is done through changing a setting in the web.config.

## Release Notes 7.3.000001

### Main Focus – Bug Fixes

### Features and Enhancements:

- Updated the Browse widget on Dashboard to highlight the search term when the tab loads.

- Added Activate Offline button. Bug Fixes:

- Updated the Browse widget on Dashboard to highlight the search term when the tab loads.

- Fixed bug in the phonetic icon on Secret View. 7.3 Main Focus – User Interface Improvements Features and Enhancements:

- Added a new front end home page called Dashboard. For a movie preview click here
  - Multiple Customizable Tabs.
  - Draggable Widgets.
  - Report Widgets.
  - Expandable Secret View in search results.
  - Streamlined Folder and Secret search.
- Added new setting for how unmasking a password works (hold versus single click).

- Added new header menu with drop down navigation.

- Added new setting for how unmasking a password works (hold versus single click).

- Added license activation to Secret Server, existing customers have 30 days to activate. Bug Fixes:

- Added new setting for how unmasking a password works (hold versus single click).

- Fixed bug in Users Activity Report.

- Added new setting for how unmasking a password works (hold versus single click).

- Fixed validation bug in assigning Role by User.

- Added new setting for how unmasking a password works (hold versus single click).

- Fixed bug in Search having to do with inactive groups.

- Added new setting for how unmasking a password works (hold versus single click).

- Added Folder Path, whether child folders were exported, and number of secrets exported to Export Log grid.

- Added audit records to each secret when exported. 7.2.000002

### Bug Fixes

- Fixed issue in 7.2.000001 that could cause duplicate users to be created during an AD sync.

## Release Notes 7.2.000001

### Bug Fixes

- Fixed bug in Active Directory Synchronization for custom schemas.

- Fixed memory issue in Active Directory Synchronization for large domains.

- Fixed bug in Active Directory Synchronization for custom schemas.

- Fixed bug with two factor pin code email timeouts.

### Release Notes 7.2

Main Focus: Event Subscriptions ("Custom Alerts") and Active Directory Synchronization Performance

### Features and Enhancements

- Event Subscription feature:
  - Users can receive email alerts for custom event subscriptions.
  - Subscription events include: Unlimited Administration Mode toggle, Secret Edit/Add/View, Role and Group Assignment changes, Secret Expiration, Configuration changes, and many more.
- Improved Active Directory Synchronization to reduce time spent retrieving domain information.

- Added option to additionally force owners and approvers to request access on a Secret.

- Improved Active Directory Synchronization to reduce time spent retrieving domain information.

- Added optional port field to the default Oracle Template and Oracle Remote Password Changer.

- Improved Active Directory Synchronization to reduce time spent retrieving domain information.

- Removed Security Code from Credit Card Template for new installations for PCI compliance.

### Bug Fixes

- Fixed bug where duplicate Secrets could occur during create.

- Fixed bug with assigning groups by users for administrator role validation.

- Fixed bug where duplicate Secrets could occur during create.

- Updated Heartbeat to perform additional validation in cases where accounts may not have the login privilege.

- Fixed web launcher for Chrome and Safari.

## Release Notes 7.1.000015

### Main Focus: Usability and Performance


>NOTE: An important security update has been released for the Microsoft .NET Framework. Please ensure that this update is installed on your server to ensure maximum security. For further detail and how to obtain the patch, please click here.

>NOTE: We are phasing out support for Microsoft SQL Server 2000\. Future releases will not support Microsoft SQL Server 2000.
 Features and Enhancements:


- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Improved Search performance for highly nested folders.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Database Connection Reset page now resets the application automatically.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Require Comment to View coincides with checking out a Secret.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Notification emails sent for Request Reason now contain the user entered reason comment.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Backup file path now allows all valid special characters.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Fixed bug in Integrated Authentication with local Windows Accounts.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Fixed exception that occurs on Remote Password Changing Agents after upgrades.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- The Enter key now works on home page search box.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Fixed Active Directory Synchronization login error on Domain search when fully qualified username was not used.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Fixed bug in the autopopulate search where clicking a Secret failed to navigate to the Secret view page.

- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.

- Updated Error Reporting in order to address a vulnerability in ASP.Net. For more information see this Knowledge Base article

## Release Notes 7.1.000000

### Secret Server Agent

- Use Remote Password Changing, Heartbeat, Dependency Finder on external networks.

- Easy Agent Installation with MSI.

- Use Remote Password Changing, Heartbeat, Dependency Finder on external networks.

- Requires no incoming ports on the Agent network.

- Use Remote Password Changing, Heartbeat, Dependency Finder on external networks.

- Light-weight bandwidth usage.

- Use Remote Password Changing, Heartbeat, Dependency Finder on external networks.

- Require Comment when a Secret is Viewed (useful for tracking change control numbers).

- Use Remote Password Changing, Heartbeat, Dependency Finder on external networks.

- Major Database Performance increases in Home, Secret View, and background threads.

- Use Remote Password Changing, Heartbeat, Dependency Finder on external networks.

- Improved Search in Navigation Bar to go directly to the selected Secret (when unique name).

### Bugs

- Updated Search Indexer to run as a batch process.

- Fixed performance issue when Unlimited Administration Mode is turned on.

- Fixed RDP Launcher to work consistently for local Windows Accounts on Windows XP machines.

## Release Notes 7.0.000040

### Remote Password Changing

- Added Cisco password changing support (SSH and legacy Telnet).

- Added Unix Root Account password changing using separate Secret for login.

- Added Cisco password changing support (SSH and legacy Telnet).

- Password change can be set up for Active Directory and Windows accounts using a privileged account instead of the account changing its own password.

- Added Cisco password changing support (SSH and legacy Telnet).

- Added the ability to test Password Reset and Verify from an admin dialog.

- Added Cisco password changing support (SSH and legacy Telnet).

- Added button to allow cancellation of Change Password Remotely.

### Heartbeat

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.

- Receive email alerts when a Secret fails the Heartbeat.

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.

- Web Launcher to automatically login to websites using credentials stored in Secret Server.

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.

- Note: Secret Assistant is being retired in favor of the Web Launcher and bookmarklet (Secret Assistant is still supported but no longer recommended).

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.

- Made extended Search Indexer split indexed terms into 3-12 character segments instead of just 3 character segments.

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.

- Improved order of search results. Exact matches on name will be on the top, followed by 'like' matches in the name (ordered by name) and then secret item hash matches (ordered by name). More

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.

- Updated Active Directory synchronization to support Child, Parent, and Sibling Domain Credentials.

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.

- Increased the hash iterations on both local user passwords and DoubleLock passwords to provide additional security against brute force attacks on the hashes.

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.

- Added Maximum Offline Minutes feature so that mobile devices can only cache data for a limited time.

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.

- Split Unlimited Administrator role into "Administer Unlimited Admin Configuration", "Unlimited Administrator", and "View Unlimited Admin Configuration".

- Changed minimizing on Copy to Clipboard to be a per user preference.

### Bug Fixes

- Fixed "No process is at end of pipe" SQL exception that occasionally occurred after doing an iisreset.

- Added email addresses to all users during Active Directory synchronization even if disabled in Secret Server.

- Fixed "No process is at end of pipe" SQL exception that occasionally occurred after doing an iisreset.

- Fixed SSH issues when changing passwords on SUSE Linux.

- Fixed "No process is at end of pipe" SQL exception that occasionally occurred after doing an iisreset.

- Added saving of the ADGuid for new groups when Save button clicked on the Group Synchronization page (instead of waiting for first AD sync).

## Release Notes 7.0.000001

### Features and Enhancements

- Added the ability to specify the characters to separate on when building the Search Index. Note: On upgrade the current search index will be rebuilt.

- Updated Dependency Finder to allow the user to manually specify the machine names to search.

- Added the ability to specify the characters to separate on when building the Search Index. Note: On upgrade the current search index will be rebuilt.

- BUG: Fixed Administration Export for IE when SSL is enabled.

- Added the ability to specify the characters to separate on when building the Search Index. Note: On upgrade the current search index will be rebuilt.

- BUG: Updated RADIUS login to process passwords greater than 16 characters long to support Yubikeys.

## Release Notes 7.0.000000

Main Focus: Custom reports, support for RADIUS, and more

### Features and Enhancements

- Add-ons are now Professional and Enterprise Editions (explain Editions)

- Reporting
  - Reports page allows administrators to view standard reports, or to create reports with SQL and charting options. Reports can use a variety of 2D or 3D charts.
  - Reports can be displayed with all their associated data points (grid).
  - Reports can be placed into categories, and these categories and their reports can be organized using drag and drop.
  - Reports can have rows with different colors based on data values
  - Reports can be created using parameters such as start date, end date, and user ID.
- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Secret Server now uses FIPS 140 compliant algorithms and operates normally when limited to FIPS 140 only under Windows Security/Group Policy.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Terminology change – renamed "inactive" to "deleted" for Secrets.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Added icons to permission grids to indicate person or group.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Date time picker works with the user's preferred date/time format.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- The layout of the Configuration page is now categorized into tabs for better organization.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Improved localization so that messages that do not exist in the localized XML file are rendered as "Resource Not Found:".

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Added on-screen notification for support license expiration.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Added separate page (DBConnectionReset.aspx) to allow users to change their database connection information without going through the installer.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Added Folder Search to the Folder picker.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Greatly improved Home page performance for running BulkOperations for larger instances.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Improved System log to support having a maximum number of rows and to alert administrators when the log is truncated (by 50%).

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Updated the Launcher to support credentials for launching into multiple hosts. The user will be prompted to enter the Machine or Host before the RDP or Putty instance is opened when wired to the "user input" field.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Updated the User create process to automatically assign the "User" Role by default.

- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.

- Webservice additions and updates:
  - Added FolderId to the Secret get methods
  - Added the ability to specific the folder on Secret Create and Update  Added Folder webservices for Get, Create, Update, and Search
- Added support for RPC support for Sybase databases.

- Added the ability to migrate a local user to an Active Directory user and maintain the existing groups and permissions.

- Added support for RPC support for Sybase databases.

- Search Indexer will split by newline.

- Added support for RPC support for Sybase databases.

- Added Login form to the "Logged in at another location" page.

- Added support for RPC support for Sybase databases.

- Session Timeout has been moved to external config file to prevent overriding settings on upgrade.

- Added support for RPC support for Sybase databases.

- Added "Last Date" column to the user audit report page.

- Added support for RPC support for Sybase databases.

- Added common table expression functionality to folder database queries to improve performance on SQL Server 2005 and SQL Server 2008.

- Updated code signing certificate for Launcher.

### Bug Fixes

- Fixed bug that caused Dependency Finder to time out prematurely for some systems.

- Changed "lock out" for Web Services to be consistent with logging in through the Web interface.

- Fixed bug that caused Dependency Finder to time out prematurely for some systems.

- Fixed issues with Admin Secret Export for some browsers.

- Fixed bug that caused Dependency Finder to time out prematurely for some systems.

- Fixed the Keep Alive thread and other background threads to avoid spamming the system log when thread cannot be stopped.

- Fixed bug that caused Dependency Finder to time out prematurely for some systems.

- Expanded the SQL timeout on backups to support large instances.

- Fixed bug that caused Dependency Finder to time out prematurely for some systems.

- Fixed the display of login policy to fit inside the box.

- Turned off autocomplete for password textboxes on the "Secret Edit" screen.


