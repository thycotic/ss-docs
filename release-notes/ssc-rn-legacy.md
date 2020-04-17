[title]: # (Secret Server Cloud: Legacy Release Notes)
[tags]: # (Release Notes)
[priority]: # ()
[display]: # (search,content,print)

# Secret Server Cloud: Legacy Release Notes

> **Note:** This document covers releases prior to 9/21/2019.

## Cloud Release 6/15/2019 

### Security Advisory

Cloud instances are no longer vulnerable to this issue. For details about this security update, please see <https://thycotic.force.com/support/s/article/Security-Advisory-for-Secret-Server-06-18-19>. 

### Upgrade Notes 

#### New UI Wizard 

After June's Cloud upgrade, the first admin who logs in to Secret Server Cloud (SSC) is prompted with a wizard that walks through the new user interface (UI) configuration settings for their instance. Users can adjust these settings at any time from Admin > Configuration in the User Interface section. See <https://thycotic.force.com/support/s/article/SS-ADM-EXT-Admin-Guide>. 

#### Radius IP Addresses 

> **Important Note:** IP addresses used by SSC for Radius clients will change during this release. 

If you use Radius with SSC and have firewall rules or Radius configuration that specifies the SSC IP addresses, then you must update those rules prior to June 15th to maintain continuity of service. The new IP addresses will be active after the upgrade on June 15th: 

- US Cloud: 40.76.197.147 and 40.121.181.52 

- EU Cloud: 51.4.141.94 and 51.4.194.120 

- AU Cloud: 20.36.47.199 and 20.36.45.106 

Details of the IP ranges used by SSC are available from <https://thycotic.force.com/support/s/article/Secret-Server-Cloud-Architecture>. 

#### Zero Downtime for Cloud Upgrades 

Scheduled releases no longer block access to the website during the upgrade window. The SSC UI remains accessible during the migration process as customers are moved to the new version. A customer's typical migration period is 5 to 15 minutes. 

### New Features 

#### New User Interface 

We are incrementally introducing feature parity between the new and classic UIs. In this upgrade the new UI added support for:
- Emailing reports to users.
- Deleting reports.
- Converting secret templates.
- Uploading files to secrets.
- Copying and converting file attachments.
- Setting automatic password change rotations when creating new secrets.
- Rotating SSH Keys and Passphrases for SSH secrets.
- Rotating SSH Keys and SSH passwords using a bulk operation.
- Displaying custom columns in the folder view.
- Updated the Secret Picker to include a folder tree browser when selecting a privileged secret for Remote Password Changing.
- Added a password complexity indicator that displays when editing a Secret's password.
- Updated Search functionality to include folders.
- Users can now "favorite" folders by clicking stars on folders in a table view or by right-clicking folders in the left navigation pane.
- Additional "View" audits were added to the new UI to track users who view Next Passwords, SSH Keys, and Passphrases.
- Optimized SQL queries when searching for secrets in the new UI. This includes:
  - Faster searches, the paging and sorting is now performed in the database instead of the web server
  - Ability to filter by secret permission, extended type id, password type id, RPC enabled, recently used date range
  - Can now return extended fields
  - Sorting by an invalid field now returns an exception instead of sorting by the secret ID 

#### Advanced Session Recording Without Launcher

- Added video recording capability to the Advanced Session Recording agent, with a new configuration setting that can enable recording of a video on an endpoint even when a launcher is not used to begin a session. See <https://thycotic.force.com/support/s/article/SS-INST-EXT-Adv-Session-Rec-Agent>.
- Advanced "headless" session recordings will show a 'Session Minimized' notification for periods during which the session was minimized, or otherwise hidden from the user such as during the final stages of logging out.
- To prevent unnecessarily long session recording sessions, added a "Max Session Length" setting for recorded videos. The default for Cloud users is 8 hours. Administrators can set this to a maximum of 12 hours. 

#### Secret Templates

- Added a new "No Password" template for SSH/Linux Key rotation. These templates allow users to rotate SSH and Linux keys without the password field requirement that exists on other Unix secret templates in SS. When creating a new secret, select Unix Account (SSH Key Rotation - No Password) as the template to use this new feature.
- Added a native Amazon (IAM key) rotation template. When creating a new secret, select Amazon IAM Key as the Template to use this new feature.
- Updated launcher and password changing for the IBM iSeries secret template. 

#### Integrations

Added a new biometrics eWBM integration for FIDO2 authentication with SS. eWBM's website at <http://www.e-wbm.com/>. Learn how to setup an eWBM device with SS at <https://thycotic.force.com/support/s/article/SS-CFG-EXT-Yubikey>.
A connector application is now available to link SS to identity management tools using the System for Cross-Domain Identity Management (SCIM) standard. For further information please see the SCIM Connector documentation: 

- Install Guide: <https://thycotic.force.com/support/s/article/SS-INST-EXT-SCIM-Connector> 
- Getting Started Guide: <https://thycotic.force.com/support/s/article/SS-INTG-EXT-SCIM-Connector> 

### Enhancements 

#### Session Recording

- Updated the "View Session Data" feature for session recording to keep users from viewing session data on any ongoing session.
- Added searching by date and time for session recording videos.
- Updated the advanced session recording agent (ASRA) so that the SecretLauncherSessionMatchingService can now match the ShortName to the NETBIOS name of domain objects in SS. Windows terminal sessions report the pre-2000 domain NetBIOS name, which is relayed from the ASR agent to SS and used for matching Windows terminal sessions to secret launcher sessions. This is an issue if the domain on the secret is the domain FQDN or friendly name and matching fails. For example:

  - You have the ASR agent installed on a machine which is joined to a domain (mydomain.com) with a pre-2000 NetBIOS domain name "SOMETHINGELSE"
  - Your secret has the domain name "mydomain.com"
  
  When you launch into the machine, SS attempts to match "mydomain.com" (from the secret) with "SOMETHINGELSE" (the domain NetBIOS which the ASR agent relays) and fails. SS resolves this issue by trying multiple methods to get the appropriate FQDN for the Windows terminal session and using the best result from those methods, which should result in matching correctly more frequently.

- Updated advanced session recording matching by automatically mapping to the secret template's RDP fields automatically. Matching was improved by checking the secret template's RDP launcher mappings. Now, no matter what the fields are named on the secret template, the correct username and domain fields are used, based on the launcher mappings.
- Advanced session recording can now match sessions using DNS resolution. When using an RDP launcher on a secret with a machine or computer name, instead of an IP address, the protocol handler does a DNS resolution of the hostname and reports the IP back to SS, which is saved for the entry in tbSecretSession. This helps advanced session recording find additional matches when the hostname does not match the computer name, only if the hostname resolves to an IP address found directly on the target computer. If there is any NAT used, this will still fail to find a match because the NAT IP is not found on the target computer. 

#### Secret Folder Import and Export
- Added subfolder creation during secret importation. 

#### Performance
- Enhanced performance of request/response time for SecretsController API methods by resolving Autofac dependency chain issues. 

#### Search
Added default index separators to include the following characters: 
 - \? Question mark 
 - \! Exclamation point 
 - \@ At symbol
 - \# Pound symbol
 - \( left parenthesis 
 - \) right parenthesis 
 - \[ left square bracket 
 - \] right square bracket 
 - \{ left brace 
 - \} right brace 
 - \' apostrophe 
 - \" double quotation mark
 - \- hyphen 

Configure indexing separators at Admin > Search Indexer. 

#### Discovery

- Updated the ESX discovery scanner to updated versions of the VMWare/VSphere SDK. Logs
- Enhanced verbose logging. Added additional logging for the Scheduled Task Scanner, Discovery Classes, Active Directory, and Password Changer logs. 

## Bug Fixes 

### Launchers

- Fixed an issue where the Mac launcher was not automatically populating unique password prompts when connecting with PuTTY.
- Fixed an issue where the Custom Launcher screen resolution setting for Mac Launchers was not properly applied. Previously, custom launcher sessions used full-screen resolution. Note: If there are no custom values set, session resolution will default to 1024×768.
- Fixed an issue where using a Windows account launcher with a domain account would fail if the launcher was configured with an IP address in the machine field. The logic detected the computer name as an IP address and then returned before setting the domain field.
- Updated the Mac Launcher to hide the session recording indicator for users when Configuration > Session Recording > Hide Recording Indicator is enabled for the launcher. The mac launcher now uses the "hideRecordingIndicator" variable stored in the sessionInfo object. Initially, there was no logic involving hiding the indicator. Added the "hideRecordingInidicators" function to the object ALaunchedTask. Updated logic under "refreshRecordingIndicator" under TaskMonitor to call "hideRecordingIndicators" when determining if it should show any icon for active watchdogs. Updated watchdog to contain a public property that is passed on instantiation--"hideWatchdogMessages". On watchdog start or stop, it now validates the "hideWatchdogMessages" is false before displaying alerts about the session being recorded.
- Fixed a custom URL issue where launcher images did not properly display when accessing SS from different sites. The custom URL was a different sub-domain from the URL that the site was accessed from. The images were served from the custom URL and our content security policy was blocking those requests. The content security policy is used to prevent cross-site scripting attacks. The solution uses the URL given instead of the custom URL.
- Updated the Mac launcher to include support of TLS versions 1.2 and 1.3.
- Changed the default launcher setting for RDPUseComputerForDomain to "True" to allow the launcher to work on all Windows versions currently supported by Microsoft upon install. This was tested on Windows 8.1, 10, Server 2008, Server 2012, Server 2016, as well as on MacOS 10 Sierra, High Sierra, and Mojave. It prevents launchers from failing unintentionally when connected to some Windows OS versions.
- Updated launchers to accept upper case characters in URL strings on a Web password secret. Previously, launchers set all uppercase characters to lowercase before launching, which caused launch failures for URLs that are case sensitive.
- Fixed an issue where a user launched a session recording but then immediately exited, SS still attempted to record the session, resulting in inaccessible videos that were 00:00 seconds long. To resolve, zero-length sessions are no longer turned into videos and now returns the error: "Session too short - no video." 

#### New User Interface
- Fixed a bug in Internet Explorer for the new UI where the Download File button threw an "access denied" error.
- Fixed a bug where the dependency log view did not sort correctly on the Date Recorded column.
- Fixed a bug in the new UI where users with "edit" and "administer folders" permissions were unable to create subfolders within a parent folder.
- Fixed a bug in the new UI where users without the "Assign Secret Policy" role permission were unable to create new secrets in a folder. The internal logic for validating whether a user may assign a secret policy to a secret did not consider the special case of secret creation. The user's personal permission to assign a secret policy should be ignored during the creation process if they did not assign one, but the code acted as if the user had assigned the policy, not that the policy was assigned by the folder.
- Fixed a bug in the new UI where breadcrumbs for the Workflow and Teams audit pages displayed "audit" instead of the component's name. This issue also caused breadcrumbs to reload when switching between tabs on the page. 

#### Time Conversion

- Fixed a date-time issue where abbreviations for the month of the year in languages other than English were not properly logging to Syslog.
- Fixed an issue where records in custom reports were logging as the UTC time zone 

#### Scripting

- Updated REST API call "Get Folder Permissions" parameter for filter.userId to return all user permission information.
- Added enhanced error logging for Oracle scripts.
- Fixed a bug where the API incorrectly required Owner permissions on a secret to change the password on that secret. Edit permissions are now required when changing a password through the API.
- Fixed an issue where the "Webservice Password Displayed" audit was logged incorrectly when non-password-related API calls to "Get Secret Fields" occurred. The REST endpoint GET /secrets/{id}/fields/{slug}, when used to view a non-password secret's field was incorrectly recording an audit stating "WEBSERVICE PASSWORD DISPLAYED." This was due to the endpoint's implementation using the existing GetSecret REST logic, which manages the creation of this audit. This logic assumed you would respond or display to the user with the secret's fields (items and data) when getting a secret that contains a password, recording an audit. To correct this, the GetSecret logic now supports an optional parameter that specifies which of the secret's fields (items or data) you will be responding with (displaying) to the user. If the items supplied to this method do not contain a password field, then the password displayed audit is not recorded. The corresponding GET /secrets/{id}/fields/{slug} endpoint was then updated to supply this method with the requested secret field, fixing this bug.
- Fixed a bug where Web services incorrectly returned SecretDependencyTemplateIDs as null. The SecretDependencyTemplateId is now returned with every dependency found by GetDependencies in SSWebServiceHandler.
- Fixed a bug where an "Application Account License limit has been reached" error was incorrectly displayed after editing existing application accounts, instead of only when creating new user accounts. This bug was due to a flaw in the user license logic where application account licenses were incorrectly returning the API_MetApplicationAPILimit error code when editing and attempting to save an existing application account user, while at the current application account user limit. Specifically, the logic assumed the addition of a new application account user--it did not support editing an existing user. The error occurred at the application account user limit where adding a new user is not permitted. The fix was to check if users were adding a new application account user or editing an existing user when determining whether to return the error code, API_MetApplicationAPILimit.
- Fixed a bug where API group membership changes were not properly audited. This bug was due to a lack of auditing logic in the CreateGroupUser and DeleteGroupUser REST endpoints. The fix was to observe what audits the UI were doing upon adding and removing users to and from groups, then applying that same logic to the CreateGroupUser and DeleteGroupUser REST endpoints. Some extra logic was added to prevent recording audits if no operation was executed, such as moving a user to a group it already belonged to or removing a member from a group it was not a member of.
- Fixed a bug where users were unable to create subfolders that inherit folder permissions through the REST API, despite the user having "Edit Folder" permission.
- Updated REST API documentation for SSC. 

#### Authentication

- Fixed a SAML login issue that could cause login failures if multiple users had the same User Principle Name (UPN) in SS. The account that was created first would be prompted for SAML authentication even if that account was in a disabled state. This caused login failures with an error saying the user's account was disabled. Updated GetUserByUserPrincipalName to return a user only if there was exactly one user found with that UPN that was active. If there is not exactly one, it returns null. Handled a few logic flows where a GetUserByUserPrincipalName request is followed with a request to GetUserbyUsername. In cases where a valid UPN is entered, an error is produced at GetUserByUsername. These errors are now handled and logged.
- Fixed a bug where if an instance had two users with the same username (one active user, one disabled user) across different domains two-factor authentication (2FA) enabled for login, a user trying to reset their login might get a validation error because the reset code they entered would be checked against the code of the other user with the same name. SS now checks the domain of the user who is trying to login when determining which user account should be used for the 2FA reset request. This removes ambiguity when users in different domains have the same username, thus ensuring the correct 2FA validation is used.
- Fixed an issue where 2FA failures were not showing up in the "Failed login attempts" report. The 2FA failure message was different from a normal login failure message. The report SQL was changed to display any login failure message.
- Corrected a configuration error that changed the 'Disable Radius NAS-IP-Address Attribute' setting to have the opposite effect. See <https://thycotic.force.com/support/s/article/SS-TSG-EXT-MFA-Fails-after-Upgrading-Secret-Server>. The logic using the DisableRadiusNasIpAddressAttribute setting was set to return if false instead of true. This was an old application setting that would normally be false for most customers. When it was added to the UI configuration pages, the setting was implemented incorrectly, reversing the logic. In versions 10.5.14, 10.6 and 10.6.1, it is being disabled by default due to the backwards logic. This release corrects the configuration setting to work as described in the UI.
- Fixed a bug where the authentication function for the "Attempt User Password" Radius setting did not work when using the REST API. 

#### Discovery

- Updated the PowerShell local account and dependency scanners to timeout after a set timeout. The application settings DiscoveryScannerTimeout and DependencySearchTimeout have been moved to settings on the individual scanners. If this setting was only set in an application setting, it needed to be reset on the scanner setting. Wrapped the PowerShell dependency and local account scanners in a System.Task to cancel after a timeout period.
- Fixed an issue where out-of-the box dependency scanners (scheduled tasks, application pools, and service accounts) were not correctly copying as the same specified scanner's type.
- Fixed an issue where discovery imported group-managed service accounts (gMSAs) as new computers and subsequently attempted to scan them for accounts. 

#### Password Changing

- Fixed an issue with Oracle privileged password changers. Before this update, Oracle password changing logic for privileged accounts was not correctly using the designated privileged secret to perform password rotations, leading to failed password change attempts.
- Fixed an issue where missing parameters in the Sonic Wall password changer resulted in multi-factor-authentication (MFA) failure. The info sent to the Sonic Wall password changer now includes default values for MFA code and future MFA codes so those do not reference null. The PhantomJS script for Sonic Wall now looks for the host name at a different place in the parameters list.
- Fixed a bug where the IBMi mainframe password changer timed out during process cleanup. IBM iSeries password changer has two threads during a session, the primary thread processing the session or request and a subsequent one that is spooled up during the process to ensure the interface framework (ws3270) does not get stuck in the wait state when the wait command is called. The second thread may detect false stuck wait states and attempt to close the session. If this happens after the primary session has completed the wait and has already closed, an "Access Denied" exception occurs. That exception can still be due to permissions, so it is worth checking, but most of the time this is the error thrown by the .Net Process framework when attempting to exit a process that has already exited.
- Resolved issues with error handling, command pause handling, and session termination/logoff when using remote password changing (RPC) with IBM z/OS and IBM iSeries. IBM z/OS and IBM iSeries use the same base architecture within RPC to manage and execute commands. In some cases, the password change process did not correctly resume after a pause command. In others, the pause did not take effect, causing commands to execute prematurely and showing incorrect failures. Code was also added to clean up failed RPC/heartbeats once a user is logged in. An identifier to the logoff command now informs RPC of the correct command to kill sessions in cases where it needs to terminate prematurely.
- Fixed an issue after a Google update where changing Google account passwords returned incorrect messaging whether a password change failed or succeeded. 

  Important Notes:
  - The Google RPC only works if the user has previously logged into the Google account from the IP address that is trying to change it. In other words, the user needs to log into their Google account from a Web browser and allow the sign-in from an unrecognized IP address before attempting to rotate the password from that IP.
  - If there are too many failed login attempts, Google may block the login for some time.
  - If Google prompts a reCAPTCHA field to verify a human is changing the password, the RPC for the Google account will fail. 
  
  Technical Details: 
  
  Updated the URL check for the password changed test to fix the failed password change when it was a success. Updated the missing error code to fix the successful password change when it was failing. Also added better error checks to inform the user of the specific password change error.
- Added logging to provide details when password change attempts for Google accounts fail, including:
  - NewPasswordLengthTooShort
  - NewPasswordLengthTooLong
  - InvalidCharactersInNewPassword
  - NewPasswordNotComplex
  - IsAPreviousPassword
  - SameAsCurrentPassword 

#### Secret Import and Export

- Fixed an issue where a user was able to edit the error message in the "Import Secrets' dialog box after importing a secret.
- Fixed an issue where secrets were not displaying for users when a left bracket appeared in the parent folder name. We replaced any instance of [ in a LIKE clause with [[] The first [ opens the character comparison list. The second [ is the character we allow for comparison. Finally, the closing ] closes the character comparison list. It is unnecessary to replace additional instances of ] because they mean nothing without a matching [
- Fixed an exportation issue where the double quotation mark (") was not included in CSV files. 

#### Security

- Resolved a security issue in the Protocol Handler.
- Fixed a security issue where users retained Unlimited Admin permissions for a short time after the Unlimited Admin Mode was turned off, due to a caching issue in the background worker. The issue was related to caching configuration data for 5 minutes and how the cache was being managed by the ServiceLocator used by the background worker. Turning Unlimited Admin Mode on or off would clear the configuration from the cache used by the UI, but the background worker had its own cache, which did not get cleared. The fix was to reinitialize the cache provider on the ServiceLocator whenever starting a bulk operation or secret importation to ensure these functions get a fresh copy of the configuration and Unlimited Admin setting.
- Resolved inconsistent behaviors in role-based permissions. 

#### Other Bug Fixes

- Updated session recording to address an issue where video recordings intermittently returned black frames during the session's video playback. This was observed on older laptops running Windows 7 (either 32-bit or 64-bit) with integrated Intel graphics. Neither metadata nor keystroke logging (for advanced session recordings) were affected by this issue, only the viewing experience of the video, which could be interrupted by black frames. The fix was to use a different Windows API call as a fallback whenever a black frame is returned from the original screen capture attempt. A drawback to this approach is that fallback API simply captures the whole window including whatever might be on top of it. To counter this, logic was added to ensure that the RDP window is topmost during image capture. There remains a small possibility of capturing an isolated black frame or two if another window is moved on top of the maximized RDP window when an image is captured.
- Fixed an issue where some SS background threads attempted to perform tasks when SS was disconnected from its database. The issue was that some background threads would exit their continuous monitoring loop. Specific conditions caused new SQL server connections to time out, but the open connections continued working. This resulted in SS working normally but caused the monitoring loop to exit and fail to restart, breaking the monitoring of the thread. This was fixed by catching the error that caused the loop's exit, allowing the monitoring process to continue.
- Fixed a bug where removing an event subscription item deleted the wrong item. When editing the events to trigger the event subscription, the ID of the event stored in the database identified which event to remove when an item was deleted. If an item was added, but the updated event subscription had not been saved, that ID was not generated yet. This caused the first event in the list to be deleted every time a newly added event was removed while editing. A temporary ID is now generated when a new item is added to the list so that if the item has not been saved to the database, the correct item in the list can now be identified.
- Resolved an issue where backups were unable to complete if a Web application file was in use by a worker process. When looping through the files to be backed up, we now catch errors for any files that cannot be accessed by the backup process due to being locked by another process. When an error is caught, the issue is logged, and the backup process continues to the next file.
- Fixed a bug in the old UI where a Safari browser repeatedly prompted Mac users to download and install the plug-in when attempting a copy-to-clipboard action. The old UI prompts for our Safari plug-in to be downloaded for using the user's clipboard. This is no longer used in the new UI. The link to the plug-in was removed. Now, the user loads the password by clicking the "load" image and then can copy the secret's value to the clipboard by clicking the copy image.
- Fixed an issue where a Distributed Engine would return "Unknown Error" for a secret heartbeat if there was a transient error publishing the real secret heartbeat result back to SS.
- Fixed a bug where sorting groups by the "Created" field did not properly order groups in the table.
- Improved page size restrictions when assigning roles and editing groups for customers with large numbers of users.
- Fixed a bug where searching from a tab did not correctly output search results until the user navigated back to the Home Dashboard. To fix this bug, users now are automatically redirected to the Home tab when performing a search.
- Fixed a bug that allowed SS Professional Edition users to set a Workflow Access Request secret policy that should be unavailable in Professional Edition, causing an error when adding secrets to folders using that policy.
- Lengthened the default maximum value for the transaction timeout on the installer from 10 to 90 minutes to prevent installs from failing due to longer database setup. The issue was caused by lengthy transaction times when running the installer against an Azure SQL database. The default maximum value for a transaction timeout is 10 minutes. We added code to allow us to make the transaction larger and set the timeout to 90 minutes.
- Fixed a bug where converting a secret to a different template created two active copies of the secret: one converted, one unconverted. Inside the SecretDataCopier, when setting permissions, the code did not know it was due to a conversion. It then copied the folder permissions down onto the secret, instead of using the secret permissions that were on the secret originally. This meant that in the scenario above, the user did not have edit rights, throwing an "Access Denied" error.
- Fixed an issue where launcher-based sessions were not displaying proper messaging during session recording. Message boxes are now correctly bound to their parent process (the launched process), and message box behavior has changed. Before this update, message boxes launched without a proper parent process would be minimized and would not display or block input if you restored the launched process, because they did not belong to the launched process. After this update, message boxes are launched with a proper parent process always appearing on top of that process and preventing input to that process until the message box is acknowledged.
- Fixed a bug where Distributed Engines configured to callback to multiple Web servers did not work if the server names were separated by semicolons.
- Fixed an issue where after an SSH key expiration occurred, uploading a new key remained in an expired state instead of properly updating the key.
- Resolved an exception error that occurred when closing an RDPWin session window after a secret-checkout session ended.
- Fixed an issue in customer environments configured with ticketing systems where approving a request from an event notification email caused an exception error to occur, rather than completing the approval.
- Fixed an issue where reports containing the #CUSTOMTEXT dynamic parameter failed to send emails.
- Fixed an issue where secret templates containing custom fields caused an error when Key Management was enabled.
- Fixed an issue where creating sub-folders from the folder menu did not use "No Policy" default settings when set to not inherit a policy. 

## Cloud Release Date 3/9/2019 

This Secret Server Cloud (SSC) release corresponds loosely with the on-prem version 10.6.00000\. The release date varies with location. First release is scheduled for March 9, 2019. 

### Upgrade Notes 

#### Installing the New Advanced Session Recording Agent 

Customers using Advanced Session Recording need to deploy the new agent once their SSC instance upgrades to SS 10.6\. SS 10.6 does not support the RDP Monitoring Agent from Privilege Manager for recording keystrokes or process auditing. For details, please see the Secret Server Advanced Session-Recording Agent Installation Guide. 

### New Features

#### New User Interface

SSC offers a new user interface (UI) with a redesigned left navigation panel and other improvements. New SSC users default to the new UI on first access to SSC 10.6, and existing users can enable the new UI as desired. For an overview of the SSC UI, see <https://thycotic.force.com/support/s/article/SSC-QS-EXT-UI-Quickstart>. 

#### Workflows

- Added a new enterprise feature--multi-tiered secret approvals, which grants secret access after navigating multiple approval layers. This feature is available in SS's new UI only. See <https://thycotic.force.com/support/s/article/SS-HOW-EXT-Workflows>.
- Added two new Roles to support multi-tiered secret approval workflows:
- Workflow Administrator–can administer workflow permissions.
- Workflow Designer–can create new workflow templates. 

#### Advanced Session Recording

- Enhanced speed and performance for both basic and advanced session recording. See new benchmarking and system requirements information at <https://thycotic.force.com/support/s/article/SS-REF-EX-Session-Recording-Requirements>
- Added a new agent to SS for advanced session recording that captures metadata from launcher sessions to targets.
- Customers using advanced session recording must deploy the new agent when upgrading to SS 10.6\. SS 10.6 does not support the RDP monitoring agent from Privilege Manager for recording keystroke or processing start data.
- The new advanced session recording agents uninstall themselves when deactivated from SS.
- Secret Server must have appropriate permissions required to access all file paths listed for saving the configuration and recordings.
- When creating a new site, a specific site-to-folder-path relationship will not be created automatically. Instead, the secret will use the default path (whatever path is used for the local site). When you edit, a row will show up with the default value per site already loaded.
- Added a warning for session recordings experiencing many unprocessed videos. 

#### Teams

- Added a new "teams" feature so that SS administrators can segment users and groups within one SS instance. See <https://thycotic.force.com/support/s/article/SS-CFG-EXT-Teams>.
- Designed as a convenience feature, users that lack an elevated role permission within a team cannot select users, groups, or sites that exists outside their team, including in dropdown options and searches.
- Added three new roles to support teams:
- Administer Teams--Can create, edit, and view teams.
- Unrestricted by Teams--Can view all users, groups, and sites. The default User role in SS now has this permission, so role permission customization is needed for teams to take effect.
- View Teams--Can view all teams. 

#### FIDO2 (YubiKey) Authentication

Added a new integration with Yubico and other FIDO2 implementations. SS can now be configured to use FIDO2 tokens (YubiKeys) as a method for multi-factor authentication. <https://thycotic.force.com/support/s/article/SS-CFG-EXT-Yubikey> 

#### Launcher Compatibility 

Added backwards and forwards compatibility to the SS launcher protocol handler. See <https://thycotic.force.com/support/s/article/SS-Forwards-and-Backwards-Compatibility-Launchers>. 

#### Telemetry 

Added a new feature that sends anonymized usage data to guide future research and development plans at Thycotic. See <https://thycotic.force.com/support/s/article/Do-Thycotic-Products-Call-Home>. 

#### Remote Password Changing

- The SS API can now conduct remote password changing on AWS secrets. That is, the API now supports PowerShell script password and dependency changes for AWS IAM token rotation. Generated values are passed back for saving on the secret. This is useful for tokens generated by an external system during rotation. This is only the underlying architecture for use via PowerShell scripts, not a full password changer.
- Added a new IBM iSeries password changer template to enhance 5280/IBM Series 7.1-7.3 systems support including features such as program functions. See <https://thycotic.force.com/support/s/article/SS-CFG-EXT-iSeries-Password-Changer>.
- Added a $$Pause command for the Custom SSH password changer so that administrators can prevent run commands executing immediately after login, which can cause failed executions. See <https://thycotic.force.com/support/s/article/SS-PAUSE-Command-SSH-Custom-Password-Changing>.
- Added support for VMWare password changing and discovery to work with PowerCLI up to version 10.1.1\. See <https://thycotic.force.com/support/s/article/SS-NTC-EXT-VMware-ESX-ESXi-Password-Changing-10-6>.
- Increased default RPC retry interval to run every 15 minutes and to cap at 10,000 consecutive tries. "Unlimited max attempts" is no longer an available option. Retry Interval can be manually configured by 5-minute increments. Heartbeat interval is also now capped at minimum of 15 minutes. See <https://thycotic.force.com/support/s/article/TS-SS-Cloud-Excessive-Remote-Password-Changing-Retries>. 

#### SDK 

A new SDK version is on nuget.org that supports targeting for .NET Framework 4.5.1 in all packages. The only external dependency is Newtonsoft.Json (v11.0.2). See <https://www.nuget.org/packages/Thycotic.SecretServer.Sdk>. 

#### RabbitMQ Helper 

Added federation and clustering support for RabbitMQ Helper:
- Federation: <https://thycotic.github.io/rabbitmq-helper/usecases/federation/>
- Clustering: <https://thycotic.github.io/rabbitmq-helper/usecases/clustering/> 

### Enhancements

- Added the ability to download a recorded session with the API. This new API call will not download metadata and only applies to basic session recordings. The call is api/v1/recorded-sessions/{id}/session-recordings.
- Added a PrefetchCount application setting to allow customization of engine response message processing and to enhance processing speed. <https://thycotic.force.com/support/s/secretserver/SS-TSG-EXT-Throttling-Engine-Load-PrefetchCount>.
- Enhanced load performance for discovery.
- Added a cache for session configuration to prevent excessive callbacks to SessionRecordingConfigurationProvider.Load during discovery scanning.
- Added a new setting for configuring the SSH RPC timeout interval to all applicable SSH secret template settings pages. Prior to this fix, users were not notified when a group name exceeded the maximum character length and instead experienced a web session hang.
- Added a setting to discovery that can check whether IIS is installed before scanning for application pools. To enable the "Verify IIS is Installed" setting:
  1. Navigate to Admin > Discovery.
  1. Click the Edit Discovery Sources button.
  1. Click the link for the desired source. Its page appears.
  1. Scroll down to the Find Dependencies section.
  1. Click the edit (pencil) icon next to the Application Pool Scanner entry. 
  
  In extensible discovery, scanners are setup to run in consecutive order across many organizational units within large environments. This setting was added to allow SS to skip the process of scanning for application pools whenever a machine does not have IIS already installed to enhance performance and cut down on run times.
- Added support for a RADIUS challenge in web services. SS will now return a "RadiusUSAccessChallenge" error if an additional prompt is needed. To use this functionality, on-premises SS needs to connect to the same node on both authentication calls. Previously, SS could only handle a single request from the RADIUS authentication process. This enhancement uses caching, so authenticating scripts need to hit the same web node to use a challenge authentication. This fails when using REST + SS On-Prem + Load Balancing + RADIUS Challenge Authentication combined. The workaround is to hardcode REST scripts by IP or FQDN.
- Added various enhancements to the Upgrader. Enhancements will not take effect until your next upgrading process.
- Upgrade enhancements include updated logging, the removal of unchanged files during the upgrade process, re-ordering of tasks to improve performance, and enhanced messaging.
- Enhanced error messaging when heartbeats fail due to an unavailable machine state. Prior to this enhancement, when heartbeats failed on a machine due to disconnection it flagged an "Unknown Error." Now, the machine will return an "Unable to Connect" status.
- Added and enhanced the Custom SSH password changer's console output logging for debugging. Prior to this issue, command set logging was removed from Custom SSH password changers due to a security concern in the logging messages. To resolve this issue, the original security messaging was addressed, and then debug logging was reinstated.
- Fixed an issue where heartbeat failed when changing a AS/400 Mainframe secret due to versioning requirements. When setting up an AS400 Password Changer for V7R1 or V7R2 systems, the a timeout response error was thrown from the password changing that failed to manage the WS3270 utility properly. We updated the supported versioning for the IBM iSeries Password Changer template to resolve this issue.
- Added the option to include subfolders when configuring event subscriptions. Users can now optionally apply event subscriptions to subfolders, previously folder subscriptions were limited to individual folders.
- Enhanced performance of the Event Subscriptions page. Page performance on the event subscription page in SS was increased by rearranging the logic and ordering of the event subscription processes.
- Increased the default LDAP processing throttling limit on SS distributed engines (SSDE) from 100 to 1000\. SSDE performance was slowed down by the low throttling threshold. Increasing the limit allows faster performance for engine tasks like heartbeat or password changing.
- Enhanced audit logging messages when viewing and displaying secrets and passwords. Unmasking a password or viewing a password's history is only logged in SS every five minutes when the same user performs the same action on a secret within a short period of time. Prior to this update, the description of behavior on the Audit View page did not include the action for "Password Displayed."
- Two-Factor Authentication now supports the User Principal Name (UPN) as a default for usernames when logging into SS. Configure this setting in Admin > Configuration > Login > RADIUS Default Username when RADIUS is enabled.
- Renamed the "Google Authenticator" dropdown option for multi-factor authentication to "TOTP Authenticator" (Time-based One-time Password algorithm) for accuracy.
- Updated SSDE to use REST instead of Windows Communication Foundation (WCF) when using HTTP to contact SS. WCF is no longer a prerequisite for installing SSDE.
- Added log message buffering. By default, log messages are not buffered and are written to logs immediately. For very active systems, log message buffering can increase performance. In the web-log4net.config file, the Thycotic.BufferingForwardingAppender parameter should be uncommented and then IIS reset. Buffer size can be configured using the bufferSize parameter in that configuration file.
- Increased the number of default index separators to include the following characters (separators can be configured under Admin > Search Indexer): ?, !, @, #, (, ), [, ], {, }, ', ", -
- Significantly improved performance of UI operations through SSDE, such as AD login through SSDE and site validation.
- Blocking calls on AzureServiceBus in cloud no longer create temporary queues, instead they use a persistent queue with a unique session within the queue. This substantially improves the performance of blocking calls. 

### Bug Fixes

- Fixed a bug where manually added fields in custom templates would not display in the table view. Prior to this fix, when creating a custom template with the "expose for display" option selected, the field would not display in the table as a new column.
- Corrected error messaging when deleting a dependency on secrets with large numbers of dependencies. When a secret had 1000+ dependencies, deleting one of them resulted in a "Failed to Execute" error prior to this fix.
- Fixed error reporting when a user enters a group name that exceeds the maximum character length.
- Resolved an issue with Amazon secret heartbeats and rotations because of a change in Amazon login page layout and flow. To create a new Amazon Web Services (AWS) secret, create a new web password secret, then select Remote Password Changing tab > Password Type (Amazon, Google, and Salesforce options).
- Fixed an issue where a RADIUS Authentication timeout would block other RADIUS requests from authenticating to SS, causing login delays for RADIUS users. Prior to this update there was a lock in the RadiusUSRequest.GetResponse() that only allowed one connection at a time. This fixes an issue when making more than one UDP connection to the same client port.
- Removed unnecessary logging on the OperationCanceledException in the system log.
- Fixed a bug where SSH key-rotation commands were not properly authenticating. The "Verify" command for password changing was ignored if no "Post Change" command existed in a Custom SSH Key Rotation template, resulting in being able to use the same key to connect for the verify command and the password change in certain cases.
- Fixed a broken documentation link on the Server Nodes page.
- Fixed a bug where duplication errors occurred if scheduling a report with the same name as another, already disabled, report in Custom Reports. The workaround for this issue was to undelete the original report and rename it before deleting it, but users are now able to delete and create reports with the same name, if the duplicated reports are not both active.
- Fixed an issue that prevented users from creating or editing an SSH command menu on individual secrets.
- Fixed an issue where the "Allowed" and "Available" Secret Templates columns did not populate on the "Create New Folder" page when restricting secret templates.
- Fixed a bug where editing checkout hooks saved changes instead of allowing users to cancel out of the edit page. After clicking cancel on the checkout hooks edit page, the updated data was not saved to the database but was updated on the page behind the UI modal.
- Edited PUT /secrets/{id}/fields/{slug} parameters in API documentation to use Secret ID instead of the secret name.
- Edited /secrets/{id}/check-in REST API call in API documentation. In this script, "Force Checkin" could bypass the access responses, then successfully check-in the secret, before attempting to return the access responses it previously skipped. This failed.
- Fixed an issue where ExpiredSecretMonitor stopped running in certain conditions due to a session recording call. Users were experiencing several days in between this issue. The SessionRecordingBlobWriter registered an exception error that stopped background threads from processing. This SQL call was irrelevant, and its elimination allowed the ExpiredSecretMonitor to update every minute as normal.
- Fixed an issue where "Language Resource Not Found" errors were thrown on the Themes page under the Advanced section. This issue resulted from missing resource strings on the page.
- Fixed an issue where the SSMS launcher did not send the correct password if a caret symbol (^) was in the password. This issue was specific to SQL Server Management Studio (SSMS.exe). The fix for this involved updating the SSMS process launcher configuration to allow for an optional escape character to be added, now configurable in the advanced section when setting up a launcher for a SQL Server Account secret.
- Fixed a bug where failed password changes on custom SSH secrets would not stop processing when CheckContains command failed. This issue stemmed from the CheckContains command script in the Custom SSH password changer.
- Fixed an issue where items could be imported into the root personal folder. Prior to this fix, administrators were able to migrate secrets into the Personal Folder (root) using the upload XML tool, which allowed all users to see the imported items.
- Fixed an issue where a language setting caused errors. Some language settings could cause an IIS crash with HTTP Error 503: The Service is Unavailable.
- Edited tooltip wording for the advanced "Auto Change Schedule Interval" setting.
- Fixed an issue where SSH key rotations were not properly rotating and then deleting the old SSH key at endpoint when the SSH Custom password changer was configured in a specific way. Key rotations for Linux SSH keys failed to cleanup old SSH keys on target machines after a key rotation occurred due to a missing command in the success script.
- Fixed an issue where users were unable to delete reports. Deleting and undeleting Reports threw an exception error due to a database ReportCategoryId mismatch.
- Fixed an issue where the API call "GET /secret-templates" did not support the inactive filter ("filter.includeinactive").
- Updated API Rest documentation to not label a dictionary object (enumerated KeyValuePair) as an object[].
- Fixed an issue where scheduling reports failed if the time zone was set to time zones ahead of UTC. Prior to this fix, any time zone that was UTC+x failed to properly populate ScheduleCustomReportEdit.aspx "Recurrence Scheduled Start Time."
- Fixed an issue with the API Folder Create method where folders created through the API would error when trying to access permissions. After creating a new folder via the REST API, a Get command for the new folder would return null permissions prior to this fix.
- Fixed a bug where Basic Users were not able to use the "Create New" secrets template when Active Directory template permissions were revoked. In Basic User mode the "Create New" secret templates dropdown list incorrectly started with  `<active directory="">`, causing permissions errors when the Active Directory template was revoked for Basic users. The dropdown list now starts with `<select>` in all user modes.
- Fixed a bug where searching for a subfolder would not return results when the user did not have permissions to view its parent folder.
- Fixed a bug where the bulk operation mode did not move multiple secrets to a folder. This issue specifically involved the search feature on the bulk operation dropdown when filtering for the folder location. Users were required to manually select the folder rather than being able to find it through search.
- Fixed issue where "Require Approval Access" on a secret policy did not follow default settings to not enforce the policy.
- Fixed a bug where a user's display name could be left null when creating new users.
- Fixed an issue where discovery computer scans using a "machine only" resolution type resulted in an exception error rather than completing the scan. A null exception was thrown when scanning for machine names rather than using the "Use Fully qualified name (recommended)" setting in discovery.
- Enhanced error messaging when running dependency scans in discovery. Error message fixes included:
  - If all scanners worked but did not find anything: "No Dependencies."
  - If one scanner fails, then it shows a failure message for the scanner.
  -  If multiple scanners fail, it only has room to show one failure.
  -  If a scan fails but no failure message exists, it shows "Unknown Error."
- Updated two collation settings in session recording tables to allow case insensitivity on table names and prevent collation errors when the SQL server collation mismatches. To set correct SQL Server collation settings, see https://thycotic.force.com/support/s/article/Microsoft-SQL-Collation-Requirements.
- Fixed a bug where the "Only change password when Secret is expired" check box would not save if Auto-Change Schedule was set to None.
- Fixed an issue where SAML authentication check could not be disabled. Prior to this fix, some accounts would receive an 'Invalid Relay State' error when logging in. This had to do with disabling the "SAML authn context" in SS.
- Enhanced error messaging when heartbeat is not assigned to a PowerShell Script password changer.
- Fixed a bug where log file exports were not downloading from the Manage Secret Access Request page.
- Fixed a bug where the "Use Custom Window Size" launcher setting was not implementing the correct resolution. Prior to this fix, when attempting to launch at a smaller 1024 × 768 resolution, a session launched instead as full screen.
- Fixed an issue where if the Response Bus Site Connector disconnected, it prevented the web site from loading. Updates were made to BackgroundScheduler, BackgroundWorker, and the EngineWorker. If a role cannot connect to its response bus an error will now be logged and the site will still load. 
- Fixed a bug where heartbeat on local administrator accounts on Windows Server 2012 pre-R2 was not compatible with Powershell v3.0\. See https://thycotic.force.com/support/s/article/SS-Windows-Local-Account-Access-Denied-Errors-PowerShell-Fix-Script-Windows-10-Server-2016. Added output logging to file and operating system information.
- Fixed a bug where API calls against restricted secrets threw an object reference error. This fix allows accessing "require comment," checkout, or other restricted secrets through the API. These secrets were returning errors due to a null reference linked to a "ViewTracker" secret attribute.
- Fixed an issue where web password secrets caused Bookmarklet JQuery Exceptions when the web password filler was used in the IE11 browser.
- Fixed a bug where EnableFrameBlocking was not respected on certain pages in SS. Middleware was added to send X-Frame-Options / SameOrigin header for everything but the bookmarklet if not installed, no one was logged in, or FrameBlocking was enabled. MainLayout also changed for MVC pages so that they will render with the frame blocking script.
- Fixed a bug where email configurations were not properly saving applied settings. Prior to this fix, changes to Email configuration page did not properly update the database.
- Fixed workflow issue where users were directed to the Setup Home page after saving changes on the Email configuration page.
- Fixed an issue where AD users were not receiving approval emails after an access request for a secret in some environments.
- Fixed a bug which caused audit tables to display date and time in UTC rather than the configured time zone.
- Fixed a bug that could cause a "Failed to load history" error when viewing the history data for a secret.
- Fixed a timeout on secret audit when there are very many audit entries. Audits with very large result sets only display the top 1000 entries.
- Resolved an error reporting issue with Unix Account (SSH) and Unix Account Custom (SSH) account types so that connection failures and login failures are correctly reported. Previously, Unix Account (SSH) would report login failure as UnknownError and Unix Account Custom (SSH) would report login failure as UnableToConnect.
- Updated the REST API call [Get folder-permissions] parameter for [filter.userId] to return all permission information specific to a user.
- Fixed an issue where discovery imported group managed service accounts (gMSAs) as new computers and subsequently attempted to scan them for accounts. 
- Fixed a bug where a javascript "page unresponsive" error was caused after moving multiple dependencies into multiple groups; then editing multiple dependencies.
- Fixed an issue where out-of-the box dependency scanners (Scheduled Task, Application Pool, Service Account) were not correctly copying as the same specified scanner's type.
- Fixed an issue where "Optimize Start Menu Cache Files" Windows 10 tasks were logging as dependencies during discovery for some customers, resulting in excessive logging that slowed cloud performance.
- Fixed an issue where converting a Unix Account (SSH Key Rotation) secret template did not allow the target field for "File" types to populate.
- Fixed a bug where incorrect domain names passed on the logon window for RDP Launcher sessions.

## Cloud Release Date 12/22/2018

### Bug Fixes

- Fixed an issue where SSH Keys were not being passed to the launcher.
- Fixed an issue where the Captcha script was prevented by Content Security Policy on the login page.
- Fixed an issue where processing recorded session failed with Null Reference Exception.
- Fixed a bug where data could be truncated when saving new user.
- Enhanced login workflow in Thycotic One

## Cloud Release Date 11/03/2018

### Enhancements

#### User Interface 

- The new and improved redesign of Secret Server is here. Click the banner in Secret Server to enable for use. For feedback opportunities please inquire at ux@thycotic.com. https://thycotic.force.com/support/s/article/SS-UI-Quickstart
- Included a "24 hours" option to the expiration Quick Picker for the Secret Access Request form.

#### Time Zone Enhancements 

Improved timezone handling in Remote Password Changing to correctly account for daylight saving time.

#### APIs 

- Added new service to API to Cancel Password Change.
- Updated the UserCreatedArgs to include AD Guid to account for possible duplicate users in Active Directory through the API.

#### Launchers 

Added backwards &amp; forwards compatibility to the Secret Server Launcher Protocol Handler. https://thycotic.force.com/support/s/article/SS-Forwards-and-Backwards-Compatibility-Launchers

#### Business Users 

SSC now has licensing to support Business users. https://thycotic.force.com/support/s/article/SS-Business-Users

#### Remote Password Changing

- The minimum RPC Retry Interval was increased to 5 minutes. Existing customers with RPC Retry Intervals set lower than 15 minutes will notice an increase upon upgrade to automatically run every 15 minutes, but this setting can be manually configured by 5-minute increments. https://thycotic.force.com/support/s/article/TS-SS-Cloud-Excessive-Remote-Password-Changing-Retries
- RPC Retries are now limited to 500 consecutive attempts.
- The minimum Heartbeat interval was increased to 60 minutes.
- Added the ability to use a $$Pause Command for the custom SSH Password Changer to allow the option to prevent run commands executing immediately after login. https://thycotic.force.com/support/s/article/SS-PAUSE-Command-SSH-Custom-Password-Changing

### Security Fixes

- Fixed an issue with Request Access when set to be required for Owners and Approvers where an Approver could approve their own request through JavaScript manipulation. Note an email detailing the approval would have been sent to all other approvers.
- Fixed a Security Vulnerability that allowed Cross-Site Scripting.

### Bug Fixes

- Fixed a bug where users with the "Administer Configuration" Role Permission could see but not access option settings under Admin &gt; Configuration.
- Fixed a bug where the Application Pool scanner and IIS tester did not properly initialize the ManagementScope for WMI calls to Local Machines.
- Fixed a bug where only one Discovery Scanner worked when Active Directory had more than one local account scanner setup.
- Fixed a bug where valid REST/SOAP API tokens did not permit login access.
- Fixed an issue with the Mac Launcher.
- Fixed an issue that allowed personal folders to be moved to the top level of the folder tree.
- Fixed an issue where after adding and saving an Identity Provider in advanced settings (SAML), the user observed an error stating 'Object reference not set to an instance of an object.'
- Fixed a bug where a user was unable to delete an approved user from the Edit Secret Policy page.
- Fixed a bug where there were inconsistencies in the time zone handling.
- Fixed a bug where there was an error message of 'Connection Failed' during Custom Unix (SSH) Remote Password Changing but the password changed successfully.
- Fixed a configuration issue with the SSH Key Rotation Privileged Account Password Changer that is used by the Unix Account (Privileged Account SSH Key Rotation) template and caused RPC to fail with an error saying 'Associated Secret is required.'
- Fixed a bug where new users assigned to Google/OATH 2FA could not login if the Remember Me time interval elapsed.
- Fixed a bug where Scan Item on Password Type would not save upon changing scan templates.
- Fixed an issue where Web Password secrets caused Bookmarklet JQuery Exceptions when the Web Password Filler was used in the IE11 browser.
- Fixed a bug where EnableFrameBlocking was not respected on certain pages in Secret Server.
- Fixed an issue where high volume of approvers were not all receiving approval emails after an Access Request for a Secret.
- Fixed an issue where users were able to disable Site Connectors assigned to the Response Bus.
- Added messaging to notify when a user enters a group name that exceeds the max character length.
- Fixed workflow issue where users were directed to Setup page after saving changes on the Email configuration page.
- Fixed a bug where changes to Email configuration page did not update the SQL database.
- Fixed a bug where SSH Key rotation commands were not properly authenticating.
- Fixed an issue where a Radius Authentication timeout would block other Radius requests from authenticating to Secret Server, causing login delays for Radius users.
- Enhanced a permission-related error message within Secret Server to be 'You do not have Owner permission on [Secret Name].'
- Fixed a bug where log file exports did not download from the Manage Secret Access Request page.
- Fixed a bug where the "Maximum Number of Entries" field was disabled after changing it from "Unlimited" on the System Log page.
- Fixed an issue where a WinRM warning message displayed even when WinRM is running and correctly configured on a server if authentication account did not have access to running services.
- Performance enhancement fixes to Distributed Engine.

## Cloud Release Date 8/17/2018

### Enhancements

- Customers are now able to configure the time when session recordings are moved from the database to disk.

### Bug Fixes 
- Fixed an issue where new Thycotic One customers were unable to access their personal folders after provisioned
- Fixed issue where after 10.5 upgrade, session recording could not be configured to use a file share
- Fixed an issue where there was an intermittent first login fail on fresh install
- Fixed issue where selecting "Now" for a password change in Autochange Schedule could set the incorrect time in situations where the user's computer is in a different time zone than the Secret Server host.
- Fixed issue where dependency scanning would miss Scheduled Task dependencies in situations where two domains with the same name (ex: example.com andexample.net) were used.
- Fixed an issue where Distributed Engines were inconsistently failing after upgrade.
- Fixed issue where the password for an account would be changed multiple times in a row if the "Only Change password when Secret is expired" box was selected in Autochange Schedule.
- Fixed issue where bulk operations could cause database deadlocks.
- Fixed issue where Distributed Engine callbacks could cause a race condition.
- Added a warning to the schedule page that specified the time will be saved in SS configuration time

## Cloud Release Date 8/4/2018 

### Enhancements

#### Login Flow 

- New Login authentication flow in Thycotic One is now available
- SAML 
- Added ability to a new SAML configuration page so SSO providers can be configured without modifying the saml.config file.
#### Cloud Key Management 
AWS Key Management is now supported

#### Session Recording 

- Cloud support for Session recording
- MP4 conversion through Azure Media Services
- Improved Robustness and speed when generating videos

#### SIEM 

Added new Syslog event messages for SIEM integration and enhanced log messaging.

#### UI Updates 
- Subfolders can now be created within a user's Personal Folder.
- The login screen domain dropdown menu can now be disabled for customers that wish to hide the list of domains.
- Added auditing for the following configuration changes: Character Sets, Password Requirements, Event Subscriptions, Role names, Backups, Custom Password Changers, Licenses, and Database Connections.
- Added export functionality for Heartbeat logs, Remote Password Changing logs, Discovery logs, and Computer Scan logs.
- Failed password changes now display an error within the Secret View UI and a link to a password changing errors KB article.
- If using multiple devices per user in Duo Security for Two-Factor logins, Secret Server will now show the Device Name set in the Duo admin portal next to each device.

#### Discovery 

- Added Discovery settings to scan for open ports on target machines, connect to specific ports, and set a default timeout for port scanning.
- Added a Discovery scanner setting for excluding services, tasks, or application pools by name.
- Added new Diagnostic logs to address duplicate Discovery Scan items.

#### Password Changing 

- Auto Change Schedules can now be configured so that they will trigger a password change even if the Secret is not expired.
- Added the ability to rotate SSH Keys with no passphrase required.

#### Reporting 

- Added Session Revocations to the User Audit report.
- Added IP addresses to the login failure report.
- Added new chart options for custom SQL reports.

#### Other Notable Enhancements 

- Enhanced Secret Server's ability to process larger message sizes.
- Distributed Engines now send operation results back to Secret Server through the Site Connector instead of sending them via website.
- Ticket System Integration can now be configured to work over Distributed Engine.
- Improved System Log Searching in active environments.

### Security Enhancements 

- Added a configuration setting to change the default role that a new user receives.
- Added a configuration setting to limit the file type and file size of files that are uploaded and attached to Secrets.
- Added the ability to audit certificate verification errors for Active Directory calls over LDAPS and syslog connections using Secure TCP.
- Added the ability to send a client certificate with Active Directory calls over LDAPS or syslog connection using Secure TCP.

### Bug Fixes 

- Fixed issue where Secret Policy changes would not apply to all Secrets.
- Fixed issue where Service Account Discovery could timeout and flag Secret Dependencies for removal.
- Fixed issue where Two-Factor could prevent a "Login Failed" audit on the user; added new logging details in the Audit User Log if errors do occur from Two-Factor authentication.
- Fixed issue where excluding OUs from Discovery scans prevented computers from being deleted when they were removed from AD.
- Fixed condition in certain environments where the auto-change Secrets were not changing properly. Improved performance of the Discovery Stored Procedure for specific OUs scanning to avoid timeout in large environments.
- Fixed a logging exception in Monitor Logging.
- Resolved a permission error in certain environments that occurred during Local Account Discovery Scans.
- Fixed issue where integrated Windows login requests were building up in the tbOauthExpiration table.
- Fixed issue where columns could not be sorted in Discovery Network View.
- Fixed bug where an email config port change was logging the new port as the old port.
- Fixed an issue with SQL Replication where indexes on indexed views were not replicated.
- Fixed issue where a DependencyResolutionException could occur on the Login page and prevent use of site until an IIS reset was performed.
- Fixed issue with SSH password rotation/Heartbeat connections that were reporting "Unexpectedly inactive."
- Fixed issue where the Secret Server Clipboard Utility could not be installed with Chrome 67.
- Fixed issue where the dashboard Add Content dropdown displayed below the Secrets table.
- Fixed null reference bug that occurred when autocomplete textboxes were used in lieu of a dropdown for the Group/User selector.
- Fixed bug in Password Changing where a large number of Secrets targeting the same resource for certain password changers could prevent processing.
- Fixed issue where root folders could be created through the CSV import process while that user did not have the Create Root Folders role permission.
- Fixed an issue that could cause occasional black flickering to appear in Session Recording videos.
- Fixed issue where users could be logged out of Secret Server due to inactivity while actively browsing certain pages.
- Fixed issue where new Secrets displayed the option to save to a user's Personal Folder even if Personal Folders were disabled.
- Fixed issue where Discovery local account scans were parsing unnecessary data and taking more time than necessary in large Active Directory domains
- Fixed issue where changes to Users would not save when extremely large numbers of AD groups were being synchronized.
- Fixed issue with custom Powershell Ticket System integrations where entering a ticket number to view a Secret would produce an error.
- Fixed issue where creating a new Event Subscription would fail when specifying a user or group.
- Fixed issue where the REST API would not correctly implement the "Require Two-Factor for Web Services" configuration option.
- Fixed issue where Heartbeat could be stuck in Pending status.
- Fixed issue where creating new Folders would fail when there were no other Folders.
- Fixed condition in certain environments where the auto-change Secrets were not changing properly.
- Fixed issue where Dashboard searching was slow in environments with large numbers of Secrets.
- Fixed an issue where after adding and saving an identity provider in advance settings (SAML), the user observed an error stating 'Object reference not set to an instance of an object.'

### Security Fixes 

- Fixed issue with Unlimited Admin permissions and managing Groups.
- Deprecated TLS 1.0 in Security Hardening Check.
- Fixed issue with script names.
- Secret data is now authenticated with HMAC-SHA-256.
- SOAP API updated to use the same token generation as the REST API.
- Previously issued SOAP or REST tokens are no longer valid.  If you have a saved token in your scripts or code, you must get a new token after updating Secret Server.
