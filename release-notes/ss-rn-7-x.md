[display]: # "search,content,print"
[priority]: #
[tags]: # "Release Notes"
[title]: # "Secret Server Release Notes 7.x"

# Secret Server Release Notes 7.x

## Release Notes 7.9.000004

### Main Focus: Security Update

- Fixed issue with launchers and Secret Check Out. o (This was reported by a customer – the issue was confirmed, fixed and released within 24 hours by the Secret Server team.)

## Release Notes 7.9.000003

### Bug Fixes

- Fixed issue that prevents upgrades on a non-default collation on the SQL Server database.
- Fixed issue where a scheduled report email would show an image link when no image was specified on the report.

## Release Notes 7.9.000001

### Main Focus: Layout and Bug Fixes

- Fixed display issue in Folder Tree for Bulk Move to Folder for Chrome.
- Fixed layout issues in Admin Network View for IE 7.
- The Windows Auth Web Services will now resolve an authenticated user by friendly domain name in addition to the previous authentication methods.
- Fixed error when manually emailing a report with parameters.

## Release Notes 7.9.000000

### Main Focus: Automatic Import of Local Accounts

- Secret Server Discovery now includes automatically creating Secrets when Local Accounts are found using "rules" (Enterprise Plus Edition) o Administrators can specify users that should be alerted when Local Accounts are discovered. o Administrators can create search rules to create Secrets when Local Accounts are discovered.
- Service Account Discovery for all Service Accounts (Enterprise Edition) o Secret Server will scan machines on the domain and retrieve Windows Services that run under a domain service Account. o Administrators can manually import these as Secrets with Dependencies, or if the Secret already exists, import the Windows Service as a Dependency.
- Linked Accounts for Custom Launchers o If a Secret Template is tied to a custom launcher, the owner can link other Secrets to either run the custom process, or to use for command line parameters.
- Added bulk operations for "Hide Launcher Password".
- When Unlimited Administrator is turned on, a banner is displayed on the dashboard warning users that it is on.
- Added Check In / Check Out events to Event Subscriptions and SIEM events.
- Updated error display icons to be more prominent on Event Subscription, and Password Rule screens.
- The search grid on Dashboard now expands to full screen if no widgets are in the rightmost column.
- Added installer check to prevent installation on non-compatible SQL Server collations.
- Improved performance for reports that checked Folders and Permissions. Bug Fixes
- Fixed issue where certain unpatched versions of IE8 would not display Dashboard correctly.
- Fixed bug where the password compliance status of a Secret was not updated after a remote password change.
- Fixed issue on the Discovery page where Accounts linked to deleted Secrets were not returned when searching for Unmanaged accounts.
- Fixed error in the system log due to incorrect parsing of Dates in certain locales.
- Fixed bug where Application Accounts could be set as Secret Approvers.
- Fixed bug where Secret Owners could change Share permissions on Secrets that were set for Approval for Access without getting approved.

## Release Notes 7.8.000062

### Main Focus: Security/Bug Fixes

- Fixed security issue found during internal security review. (All customers are recommended to upgrade)
- Fixed locale issue on web browsers for unusual locales.

## Release Notes 7.8.000061

### Main Focus: Scheduled Reports

- Added scheduled reports o Administrators can now set up Report generation on specific schedules. o Reports can be emailed to a subscription list. o Reports can be set as "Health Checks" that will only be delivered if the conditions of the Report are met.
- Added #STARTWEEK and #ENDWEEK as dynamic Report parameters.
- Updated Active Directory Synchronization to make adding synchronization Groups in large Domains easier.
- Added Event Subscription for support license expirations. Admins can now be notified when support licenses need to be renewed.
- Updated calendar and search controls throughout the application for formatting and consistency.
- Improved inactivity timeout o If a tab is closed but not the browser, inactivity timeout will now work. o If multiple tabs are open for Secret Server, being active on any tab will prevent inactivity timeout from occurring (Except for IE). o If inactivity timeout occurs, all open Secret Server tabs will be redirected to the logout page (Except for IE). Bug Fixes
- Recorded IP Address in the Secret Audit record when a Dependency is updated.
- Added guard to prevent the expiration of Secrets through web services when Expiration is disabled on the Secret Template.
- Fixed the installer so it properly detects a local instance of Microsoft SQL Server 2012.
- Fixed Windows Live Password Changer due to updates on the Windows Live site.
- Updated Chrome Copy To Clipboard extension, it now installs from the Chrome web store to comply with the latest release of Chrome.
- Fixed bug where updating personal notifications for a single Secret could update personal notifications for other Secrets.

## Release Notes 7.8.000048

### Main Focus: Windows Live password changer and COM+ dependencies

- Added support for changing Windows Live web passwords.
- Added support for COM+ Applications as Dependencies.
- Added new Bulk Operations o Disable AutoChange o Disable Comment On View o Undelete
- Added Folder Name on Secret Audit header.
- Added Configuration option to prevent duplicate Secret names.
- Added name of Template created to Create Template Event Subscription emails.
- Added additional web service methods to the windows authenticated web service.
- Added Copy Secret Template.
- Added new Folder Slider on Dashboard to make navigating highly nested Folder trees simpler.
- Added additional tooltips to the Secret View page. Bug Fixes
- Fixed issue where Agent connections could sometimes fail due to the version not being handled properly.
- Fixed issue where SQL Password Changing could fail when the target SQL instance was configured to use a dynamic port.
- Added missing audit record for when a Secret moves to the root folder due to the Folder getting deleted.
- Fixed missing localizations on the IP Address page.
- Fixed issue where users could import Secrets without Folders when the configuration option to require Folders was turned on.
- Fixed bug where Template Name could be set to blank.
- Fixed bug where Secret permissions could get in an inconsistent state when Bulk Changing permissions and inheritance was enabled. Java API Release Notes
- Added file attachment support.

## Release Notes 7.8.000040

### Bug Fixes

- Added support for Next TokenCode mode for RADIUS servers.
- Fixed performance issues in Folders for IE on dashboard.
- Fixed issue where the custom commands for UNIX Remote Password Changers would not correctly parse Fields with adjacent special characters in the test dialogs.
- Fixed issue where a Secret Field specified in the Parameters value of a Custom Launcher would not get masked if Hide Launcher Password was enabled.
- Fixed incorrect display width of Folders in Folder Administration.
- Fixed duplicate Folder name shown in Reports for highly nested Folders.
- Fixed bug where OK button would not enable on folder picker for bulk operations sometimes in certain browsers.

## Release Notes 7.8.000039

### Main Focus : SonicWALL Integration and SSH Enhancements

- Added support for changing passwords on SonicWALL NSA devices.
- Added support for SSH password changing where no user authentication is required to establish a connection. Used for BlueCoat Packet Shaper devices.
- CSV Import with Folder now creates the Folders if they do not exist.
- Added a column to show whether a Group is Active on the Group Membership report.
- Updated the Get Secret Audit API method to not check out a Secret if Check Out is enabled.
- Made it more clear when a folder is selected for non-default themes. Bug Fixes
- Fixed potential issue with heartbeat on SSH Secrets that would cause heartbeat to stay in pending and shut down the web application due to incompatible SSH versions.
- Fixed issue where Folders might not return in a sorted order on Dashboard.
- Fixed display issues on Dashboard for IE 9.
- Fixed bug where Configuration Change event subscriptions did not fire.
- Fixed line ending issue that caused password changing on HP iLO devices to not work.
- Fixed bug that caused Windows Authentication Web Services to not work.

## Release Notes 7.8.000036

### Main Focus : Application API and Ticket System Integration

- Added Application User type for use with the Application API.
- Added support for Authenticated SMTP.
- Added LDAPS support for Active Directory.
- New Bulk Operations o Change Check Out Status. o Convert Secret Template.
- New Web Service API methods o Secret Status to show whether a Secret is checked out. o Import XML to automate the advanced import. o Enable Check Out. o Expire Now. o Get Secret Audit.
- Discovery o Added new Reports for Discovery diagnostics. o The Full Scan log is now stored per computer. o Added Re-Scan button for each computer.
- Ticket System Integration o Administrators can enter a support system URL to navigate to Tickets from the Secret Audit. o Users can enter a ticket number for Require Comment and Approval for Access.
- Configuration option to change Default Secret permissions to Secret Creator only.
- Added option to allow Editors to bypass Approval for Access.
- Increased the maximum length on all Secret fields from 1991 characters to 10000 characters.
- Added new role permission for the Advanced Import.
- Increased security in the PuTTY launcher to prevent password exposure in the command line arguments.
- Added option to exclude Secrets from the User Audit Report that have been changed since the User last viewed them. Bug Fixes
- Fixed issue when removing more than one field during a Template Convert.
- Fixed issue with Event Subscriptions Dependency Failure Events that caused the alerts to be sent every time a dependency was changed.
- Fixed issue where Application Pool Dependencies would sometimes not verify due to casing in Dependency Name.
- Added support for UTF-8 characters for the service account's password for Active Directory Synchronization.
- Added support for UTF-8 characters for RADIUS two factor.
- Fixed issue where password requirements would validate on non-required password fields.
- Updated the Automatic Backup so it will not try to delete backup types that are not enabled.
- Fixed issues with datagrid paging on the Event Subscriptions screen.
- Fixed error when saving the Backup Log to a file.
- Fixed issue with Telnet Password Changer not always respecting the correct line endings.
- Fixed issue where Active Directory Group renames would not correctly resolve when synchronizing a low number of Groups.
- Fixed error on Event Subscription page when running Secret Server in FIPS compliant mode.
- Fixed display issues on Dashboard for Internet Explorer 9.
- Fixed error when returning a large number of Secrets in a Dashboard search.
- Improved email address validation for Activation.
- Improved performance on Discovery Network View.
- Fixed issue where Secrets with a 1 Day Expiration interval could change every 2 days.
- Prevented potential XSS attack on the Discovery dialog.

## Release Notes 7.8.000015

### Main Focus : Bug Fixes

- Fixed issue with Active Directory Synchronization for some cases where if a group was disabled, it did not get re-enabled after being resynchronized.
- Fixed issue with Active Directory Synchronization where groups with a custom schema would not be synchronized correctly.
- Fixed issue with Active Directory Synchronization where distribution groups would incorrectly get synchronized if manually added to the synchronization group list. Distribution groups will no longer work in AD sync – you must use Security Groups in AD.
- Fixed issue on Password Requirement Edit screen where a Password Requirement would fail validation if a description was not entered.
- Fixed issue with the advanced XML import where Secret data would not be created properly if there was a case sensitivity difference in the Secret Field Name and the Secret Template Field Name.
- Fixed issue with the advanced XML import where a Folder with trailing spaces in the Folder Name could be created, but no Secrets in the import would be added to the Folder.

## Release Notes 7.8.000014

### Main Focus : Bug Fixes and Usability Enhancements

- Added extra detail to the Export and Unlimited Administrator email alerts.
- Added arrow key support for the Folder search on Dashboard and the quick search in the header.
- Dependency Searcher now alpha sorts machines and shows the target OS when possible.
- Added Check All option for Windows Services found by the Dependency Searcher.
- Domain and Username are remembered on the Dependency Searcher.
- Added support for updating Windows Services Dependencies that are on the same machine as an Agent or the Secret Server application.
- Added help text for IP Address ranges.
- Added explanation on the Secret Audit page and the Secret Security tab for how often View Audits are recorded.
- Added option to separately backup the application and database.
- Changed "Indexable" to "Searchable" in the Secret Template Designer.
- Added IP Address auditing for the imports.
- Modified privileges required to change a Secret's Folder. Secret Owners can change a folder regardless of whether they have the "Share Secret" permission and the Folder is inheriting permission. See the User Guidefor the full details on Folder and Secret inheritance rules.
- Removed option to specify minutes for offline access in Configuration.
- Improved error notification for the Advanced Import dialog.
- SecretID Columns are now clickable links in the Reports.
- Added Audit record for when Hide Launcher Password is changed.
- Added additional validation for Active Directory Domains to automatically resolve the Domain Name to the Fully Qualified Domain Name.

### Bug Fixes

- Fixed issue with Dollar signs in custom UNIX\Cisco accounts.
- Fixed bug with large result sets when searching for linked accounts.
- Fixed issue with inactivity timeout on the server prompt for launcher for AD Secrets.
- Fixed bug where $$CHECKFOR and $$CHECKINFO commands did not work on the Password Changer test dialogs.
- Fixed issue where the Keep Alive monitor would log an error if the site certificate wasn't trusted.
- Fixed a bug where the database backups would not get deleted if in a separate folder from the web application backups.

## Release Notes 7.8.000010

### Main Focus: Configuration file support for Service Accounts

- Configuration files can now be managed for Service Accounts. o Secret Server can update hardcoded values stored in configuration files using Regular Expressions when changing service account passwords. (Dependency Regex KB)
- Secret Dependency Page updated to more easily handle ordering (drag and drop) and Dependency specific information.
- Added Active Directory synchronization optimizations for large domains.
- New Folders default to inherit permissions.
- Added Group handling to Advanced XML Import.
- Diagnostics page now includes database name for configuration purposes.
- Secret Template edit automatically re-focuses to next row when adding fields.

### Bug Fixes

- Fixed XSS vulnerability with the privileged account picker control.
- Fixed open redirect vulnerability on the Login page when already logged in.
- Fixed possible database connection error for long running Active Directory synchronizations and other background threads.
- Fixed auto complete issue on some sensitive fields.
- Heartbeat status is now automatically updated when RPC succeeds.
- Fixed issue with Oracle password changing failing on passwords with certain special characters.
- Fixed issue with Agents not properly failing over in clustered instances.
- Fixed issues in advanced XML import when loading items with duplicate permissions.
- Fixed issue with incorrect lockout warning on Group and Role Assignment page.
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

- Created Java API for use in embedded scripts without hardcoding a password. o Examples: Java API Examples KB o Deployment instructions : Java Console Instructions KB
- Added MySQL Password Changer and Template.
- Added OpenLDAP Password Changer and Template.
- Added DSEE Password Changer.
- SQL Server password changes can now use a privileged account.
- Admins can now create configurable LDAP based Password Changers.
- Added Custom Process Launchers to start user specified applications on a client machine with credentials from the Secret. o Added PowerShell, SQL Management Studio, and Sybase iSQL custom launchers.
- Added XML Export option to simplify restoring or migrating from an export.
- Added support for sys accounts for Oracle password changes.
- Updated Activation to handle VM environments better.
- Added Convert Secret Template.
- Added option to Check Out a Secret without changing the password on Check In.
- Added new report to show Secrets with pending approval requests.
- Added change password web service method. Bug Fixes
- Fixed bug where disabled accounts in Active Directory did not get automatically disabled in Secret Server.
- Fixed bug with dependency finder when using Agent.
- Fixed issues with Oracle connection strings exceeding allowed length.
- Fixed bug with Login Other Location in Firefox.
- Fixed bug with Secret Server user password history.

## Release Notes 7.7.000012

### Main Focus: Secret Server Installer Improvements

- Added MSI for initially installing Secret Server.
- Added ability to create the database if it does not exist during installation.
- Added support for a RADIUS failover server.
- Added more descriptive message when secret is checked out and then accessed from mobile devices.
- Added message to Role page to highlight any permissions that are not currently assigned.

### Bug Fixes

- Fixed bug with visual keyboard that caused it to not submit correctly.
- Fixed bug where error occurred when using Unlimited Administrator and attempting to checkout a Secret.

## Release Notes 7.7.000009

### Main Focus: Secret Template Improvements

- Added auditing to all Secret Template and Secret Field actions.
- Updated Secret Fields to use a soft-delete so the data can be retrieved.
- Added Chrome support for Copy-to-Clipboard.
- Added clustering support for Remote Password Changing Agents.
- Added embedded searching and Page Size settings to most Admin Logs and Grids.
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

- Advanced rules can now be applied to password fields on the Secret Template. o Multiple custom character sets can be created and used in these rules to more exactly limit the type of password generated. o New reports to show what passwords do not meet complexity requirements. o Validation can be enabled to prevent saving Secrets that do not meet the password complexity requirements.
- Added audit record for machine when using an Active Directory account to launch Remote Desktop and PuTTY.
- The advanced XML import now includes Secret dependencies. Bug Fixes
- Fixed bug in the color column on custom reports.
- Fixed bug that could cause the Local Account Finder in Discovery to fail for some sets of credentials.
- Fixed bug where the default folder was not always being set on Dashboard.

## Release Notes 7.6.000000

### Main Focus: Discovery

- Discovery: Account Import (Enterprise Plus) o Administrators can now scan for domain joined machines and import local Windows accounts into Secret Server.
- Dependency Ordering o Dependencies can now be ordered and a wait time can be specified which will be observed before the Dependency is updated.
- Added new Password Changers for Juniper, HP ILO, and Blue Coat Devices.
- Added option on custom password changers to specify line ending type (CR/LF).
- Added new Web Services methods for file upload and download from Secrets.
- Added new Bulk Operation to set the privileged account for Windows and AD Secrets.
- Added Secret Copy event for use in Event Subscriptions.
- Added configuration option to send Syslog/CEF messages by TCP instead of UDP.

### Bug Fixes

- Fixed bug where Secret Copy created an Edit Audit Record.
- Fixed bug where dates in reports did not observe the user's date format preference.
- Fixed bug with dates as report parameters on non-US SQL installations.
- Fixed bug where unchecking All on Secret Template History caused error.

## Release Notes 7.5.000002

### Bug Fixes

- Fixed cross-site scripting (XSS) vulnerability on Secret View screen related to URL fields.
- Fixed command injection vulnerability in the PuTTY Launcher. o (These were reported by a customer performing a security audit – the issues were confirmed, fixed and released within 24 hours by the Secret Server team.)
- Fixed issue with limited number of concurrent Agents being able to connect.

## Release Notes 7.5.000001

### Bug Fixes

- Fixed Configuration page to only show video codec option when Session Recording is on.
- Fixed bug where Secret Server uses excessive CPU resources related to new Discovery capabilities.

## Release Notes 7.5.000000

### Main Focus: Discovery and Session Recording

- New Discovery Network View (Enterprise Plus) o Brings together the view of the network and the Secret Server repository to show Administrators whether local accounts on Domain Computers have corresponding Secrets.
- Session Recording (Enterprise Plus) o Remote Desktop or PuTTY sessions can now be recorded and the full movie is available as part of the audit. This setting can be configured per Secret and role permissions control who can access the audit movie.
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

- New Enterprise Plus Edition o Added SIEM integration using CEF and Syslog formats. o Support for front end server clustering.
- Added Group filter on Active Directory Synchronization screen.
- New Copy Secret option.
- New Delete Secret Role Permission.
- New Events for Users. o Login, Logout, Login Failure, and Password Change
- File attachments are now stored in the database rather than the file system.
- Added new Advanced Import option from XML. Bug Fixes
- Calendar on Approve Access now respects all date formats.
- Fixed Tab and Copy to Clipboard bugs in IE9.
- Fixed issue where users assigning groups needed Administer Roles permission.
- Search box on Dashboard is now automatically given focus.
- Fixed bug with Secret data not always formatting correctly in Dashboard Widgets.
- Fixed bug where option to view deleted secrets showed incorrectly on Dashboard.
- Fixed bug with single quote in search breaking not working on dashboard.
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
- Updated License Activation to support Unicode characters in the license name.
- Fixed bug in the phonetic icon on Secret View. 7.3 Main Focus – User Interface Improvements Features and Enhancements:
- Added a new front end home page called Dashboard. For a movie preview click here o Multiple Customizable Tabs. o Draggable Widgets. o Report Widgets. o Expandable Secret View in search results. o Streamlined Folder and Secret search.
- Added new setting for how unmasking a password works (hold versus single click).
- Added new header menu with drop down navigation.
- Added additional auditing to the upgrade process.
- Added license activation to Secret Server, existing customers have 30 days to activate. Bug Fixes:
- Fixed bug in DBConnectionReset page.
- Fixed bug in Users Activity Report.
- Fixed bug where the application would sometimes give an error after a fresh install.
- Fixed validation bug in assigning Role by User.
- Fixed bug in Dependency finder where unchecking the 'select all' did not unselect all computers.
- Fixed bug in Search having to do with inactive groups.
- Extended RADIUS two factor timeout. 7.2.000003 Features and Enhancements:
- Added Folder Path, whether child folders were exported, and number of secrets exported to Export Log grid.
- Added audit records to each secret when exported. 7.2.000002

### Bug Fixes

- Fixed issue in 7.2.000001 that could cause duplicate users to be created during an AD sync.

## Release Notes 7.2.000001

### Bug Fixes

- Fixed bug in Active Directory Synchronization for custom schemas.
- Fixed memory issue in Active Directory Synchronization for large domains.
- Fixed bug in the Event Engine administration section for Professional Edition.
- Fixed bug with two factor pin code email timeouts.

### Release Notes 7.2

### Main Focus: Event Subscriptions ("Custom Alerts") and Active Directory Synchronization Performance

### Features and Enhancements:

- Event Subscription feature: o Users can receive email alerts for custom event subscriptions. o Subscription events include: Unlimited Administration Mode toggle, Secret Edit/Add/View, Role and Group Assignment changes, Secret Expiration, Configuration changes, and many more.
- Improved Active Directory Synchronization to reduce time spent retrieving domain information.
- Added option to additionally force owners and approvers to request access on a Secret.
- When approving access to a Secret, users can specify the access window down to the minute.
- Added optional port field to the default Oracle Template and Oracle Remote Password Changer.
- Increased performance for folder permission updates.
- Removed Security Code from Credit Card Template for new installations for PCI compliance.

### Bug Fixes

- Fixed bug where duplicate Secrets could occur during create.
- Fixed bug with assigning groups by users for administrator role validation.
- Fixed bug where the custom command test action did not correctly replace all parameters.
- Updated Heartbeat to perform additional validation in cases where accounts may not have the login privilege.
- Fixed web launcher for Chrome and Safari.

## Release Notes 7.1.000015

### Main Focus: Usability and Performance


>NOTE: An important security update has been released for the Microsoft .NET Framework. Please ensure that this update is installed on your server to ensure maximum security. For further detail and how to obtain the patch, please click here.

>NOTE: We are phasing out support for Microsoft SQL Server 2000\. Future releases will not support Microsoft SQL Server 2000.
 Features and Enhancements:


- Added support for changing Scheduled Tasks on Windows Server 2008 and Windows 7 instances.
- Improved Search performance for highly nested folders.
- Offline upgrades can now be performed by uploading a local zip file.
- Database Connection Reset page now resets the application automatically.
- Require Comment to View and Approval for Access can now be applied to the same Secret.
- Require Comment to View coincides with checking out a Secret.
- Secret Access Request now shows full request history on Pending Requests page.
- Notification emails sent for Request Reason now contain the user entered reason comment.
- Added ability to encrypt the instance encryption key with DPAPI for added security.
- Backup file path now allows all valid special characters.
- Allow setting an AutoChange schedule on a Secret before enabling AutoChange. Bug Fixes
- Fixed bug in Integrated Authentication with local Windows Accounts.
- Secrets mapped to Users through inactive groups are no longer visible in custom reports.
- Fixed exception that occurs on Remote Password Changing Agents after upgrades.
- Fixed issue where updating file attachment did not save in certain situations.
- The Enter key now works on home page search box.
- Fixed sort for inactive users on User Administration page.
- Fixed Active Directory Synchronization login error on Domain search when fully qualified username was not used.
- Fixed bug in Oracle password changing by updating template to allow additional parameter specifications.
- Fixed bug in the autopopulate search where clicking a Secret failed to navigate to the Secret view page.
- Fixed error when running "Test Action" on remote password changer custom commands. 7.1.000001 Security Update
- Updated Error Reporting in order to address a vulnerability in ASP.Net. For more information see this Knowledge Base article

## Release Notes 7.1.000000

### Secret Server Agent

- Use Remote Password Changing, Heartbeat, Dependency Finder on external networks.
- Easy Agent Installation with MSI.
- High Security: Full over-the-wire Encryption.
- Requires no incoming ports on the Agent network.
- Customizable URL and Server Port.
- Light-weight bandwidth usage.
- Client automatically upgrades when Server is upgraded. Require Comment
- Require Comment when a Secret is Viewed (useful for tracking change control numbers).
- Bulk Operation to enable Require Comment on Secrets. More
- Major Database Performance increases in Home, Secret View, and background threads.
- Added Bulk Operation for Remotely Changing the Password. This can be used to keep multiple accounts in-sync with the same password.
- Improved Search in Navigation Bar to go directly to the selected Secret (when unique name).

### Bugs

- Updated Search Indexer to run as a batch process.
- Fixed performance issue when Unlimited Administration Mode is turned on.
- Fixed RDP Launcher to work consistently for local Windows Accounts on Windows XP machines.

## Release Notes 7.0.000040

### Remote Password Changing

- Added Cisco password changing support (SSH and legacy Telnet).
- Added Unix Root Account password changing using separate Secret for login.
- Added the Remote Password Changing tab for configuring options on a Secret (moved AutoChange checkbox to this tab).
- Password change can be set up for Active Directory and Windows accounts using a privileged account instead of the account changing its own password.
- Added the ability to create configurable command sets for handling different platforms and operating systems to do password reset using SSH or Telnet (including using credentials from other Secrets).
- Added the ability to test Password Reset and Verify from an admin dialog.
- Added the ability to specify the port for password changes when using SSH and Telnet.
- Added button to allow cancellation of Change Password Remotely.

### Heartbeat

- Secret Heartbeat will test the credentials stored in Secret Server on a periodic basis to ensure they are still valid.
- Receive email alerts when a Secret fails the Heartbeat.
- Supports all Remote Password Changing templates and Password Verify. Web Launcher
- Web Launcher to automatically login to websites using credentials stored in Secret Server.
- Web Launcher bookmarklet for single click login from the browser (supports all browsers).
- Note: Secret Assistant is being retired in favor of the Web Launcher and bookmarklet (Secret Assistant is still supported but no longer recommended).
- Automatic download option for the latest Web Launcher settings for commonly used sites from thycotic.com. Search
- Made extended Search Indexer split indexed terms into 3-12 character segments instead of just 3 character segments.
- Made extended Search Indexer not split the search term before searching.
- Improved order of search results. Exact matches on name will be on the top, followed by 'like' matches in the name (ordered by name) and then secret item hash matches (ordered by name). More
- Added webservice to use Integrated Windows Authentication to allow scripts to run without having embedded username/password and retrieve passwords from Secret Server.(see KB article)
- Updated Active Directory synchronization to support Child, Parent, and Sibling Domain Credentials.
- Changed all random number generation to use System.Cryptography.RandomNumberGenerator for improved security.
- Increased the hash iterations on both local user passwords and DoubleLock passwords to provide additional security against brute force attacks on the hashes.
- Extended IP Address Range restrictions to work for class A and B networks.
- Added Maximum Offline Minutes feature so that mobile devices can only cache data for a limited time.
- Added a Generate Password button to the "Change Password Remotely" page.
- Split Unlimited Administrator role into "Administer Unlimited Admin Configuration", "Unlimited Administrator", and "View Unlimited Admin Configuration".
- Changed minimizing on Copy to Clipboard to be a per user preference.

### Bug Fixes

- Fixed "No process is at end of pipe" SQL exception that occasionally occurred after doing an iisreset.
- Added email addresses to all users during Active Directory synchronization even if disabled in Secret Server.
- Fixed URL field on Secret to open correctly if http:// is not included.
- Fixed SSH issues when changing passwords on SUSE Linux.
- Fixed the ActivityDirectorySynchronization page, the AvailableGroups listbox no longer displays Groups that have been removed in AD.
- Added saving of the ADGuid for new groups when Save button clicked on the Group Synchronization page (instead of waiting for first AD sync).

## Release Notes 7.0.000001

### Features and Enhancements

- Added the ability to specify the characters to separate on when building the Search Index. Note: On upgrade the current search index will be rebuilt.
- Updated Dependency Finder to allow the user to manually specify the machine names to search.
- Disabled the trace and debug settings from the Web.config by default.
- BUG: Fixed Administration Export for IE when SSL is enabled.
- BUG: For XP machines, fixed the unsupported hash algorithm error for both the Email Pincode process and the Search Indexer.
- BUG: Updated RADIUS login to process passwords greater than 16 characters long to support Yubikeys.

## Release Notes 7.0.000000

### Main Focus: Custom reports, support for RADIUS, and more

### Features and Enhancements

- Add-ons are now Professional and Enterprise Editions (explain Editions)
- Reporting o Reports page allows administrators to view standard reports, or to create reports with SQL and charting options. Reports can use a variety of 2D or 3D charts. o Reports can be displayed with all their associated data points (grid). o Reports can be placed into categories, and these categories and their reports can be organized using drag and drop. o Reports can have rows with different colors based on data values o Reports can be created using parameters such as start date, end date, and user ID.
- Added support for RADIUS integration to authenticate to Secret Server. This will work with AuthAnvil tokens, RSA tokens, and any other authentication scheme that supports RADIUS.
- Secret Server now uses FIPS 140 compliant algorithms and operates normally when limited to FIPS 140 only under Windows Security/Group Policy.
- Auto-complete added to Secret search textbox.
- Terminology change – renamed "inactive" to "deleted" for Secrets.
- Added scrollbars to Search and Browse tabs in homepage – makes it easier when you have lots of folders.
- Added icons to permission grids to indicate person or group.
- Groups in permission grid are clickable, which shows the list of users in the group.
- Date time picker works with the user's preferred date/time format.
- Added "copy to clipboard" support for Chrome and Safari.
- The layout of the Configuration page is now categorized into tabs for better organization.
- Added IP address logging for all failed authentication attempts. Previously, only attempts that caused lockouts were logged.
- Improved localization so that messages that do not exist in the localized XML file are rendered as "Resource Not Found:".
- Changed the inactivity timeout timer to reset on partial postbacks. This means that users will not get redirected due to inactivity when browsing folders or searching for secrets on the home page.
- Added on-screen notification for support license expiration.
- Added Configuration settings for an instance level default Time and Date format.
- Added separate page (DBConnectionReset.aspx) to allow users to change their database connection information without going through the installer.
- Added the ability to reset a forgotten DoubleLock password.
- Added Folder Search to the Folder picker.
- Added Folder Templates to support Folder (default), Customer, and Computer.
- Greatly improved Home page performance for running BulkOperations for larger instances.
- Improved the Change Password screen to give instructions for the password complexity guidelines.
- Improved System log to support having a maximum number of rows and to alert administrators when the log is truncated (by 50%).
- Updated the Launcher to support having a "blank" domain for local accounts.
- Updated the Launcher to support credentials for launching into multiple hosts. The user will be prompted to enter the Machine or Host before the RDP or Putty instance is opened when wired to the "user input" field.
- Added a User and Group picker to replace the dropdownlist for user and group assignment for large instances.
- Updated the User create process to automatically assign the "User" Role by default.
- Added a grid of the user's Roles on the user view page.
- Webservice additions and updates: o Added FolderId to the Secret get methods o Added the ability to specific the folder on Secret Create and Update  Added Folder webservices for Get, Create, Update, and Search
- Added support for RPC support for Sybase databases.
- Added the ability to migrate a local user to an Active Directory user and maintain the existing groups and permissions.
- Added the full Folder Path on the folder edit and create pages.
- Search Indexer will split by newline.
- Added icon for NATO phonetics translation of Secret field on Secret View page for reading information verbally.
- Added Login form to the "Logged in at another location" page.
- Update the Resource Provider to support changing a single element with custom resource such as the Help link.
- Session Timeout has been moved to external config file to prevent overriding settings on upgrade.
- Added folder picker and "include subfolders" option to the User Audit report.
- Added "Last Date" column to the user audit report page.
- Added "Save to File" functionality for many grids.
- Added common table expression functionality to folder database queries to improve performance on SQL Server 2005 and SQL Server 2008.
- Updated code signing certificate for Launcher.

### Bug Fixes

- Fixed bug that caused Dependency Finder to time out prematurely for some systems.
- Changed "lock out" for Web Services to be consistent with logging in through the Web interface.
- Removed unnecessary validation when entering a new domain that required the domain account to have reset password permissions.
- Fixed issues with Admin Secret Export for some browsers.
- Fixed Dependency to show all computers found in Active Directory.
- Fixed the Keep Alive thread and other background threads to avoid spamming the system log when thread cannot be stopped.
- Fixed the Active Directory Group Synchronization page to display the listboxes with a proper width for all Browsers.
- Expanded the SQL timeout on backups to support large instances.
- Updated Active Directory synchronization to properly assign membership for groups made up of both child and parent domain users.
- Fixed the display of login policy to fit inside the box.
- Turned off autocomplete for password textboxes on the "Secret Edit" screen.


