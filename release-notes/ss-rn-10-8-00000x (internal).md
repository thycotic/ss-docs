[title]: # (Secret Server Release Notes 10.8.00000x)
[tags]: # (Release Notes)
[priority]: # (1000)
[display]: # (none)

# Secret Server: 10.8.00000x Release Notes

==INTERNAL. DO NOT DISPLAY==

March 24, 2020

## Upgrade Notes

- 163223 - RMQ Helper was updated to install the latest RMQ version (3.8.2). See https://docs.thycotic.com/rabbitmq-helper/.
- 153205 - Enabled the "port scan enable" configuration by default for discovery scanners. To disable this setting or for more information, see https://thycotic.force.com/support/s/article/SS-Port-Scan-Settings-Discovery.

## New Features and Enhancements

### Licensing

153563 - The SS Professional license is changing to automatically include some features that were previously sold as separate add-ons.

- Session recording and monitoring for up to 50 secrets
- SDK (unlimited application accounts)
- SIEM integration


See https://thycotic.com/products/secret-server/features/ for the updated licensing list for Secret Server.

### RDP Proxy

163666 - SS now includes an RDP proxy that facilitates third-party session management tools without exposing connection credentials. RDP proxy also enables optional keystroke recording for an RDP session without the need for the advanced session recording agent.

### Event Pipelines

- 165209 - Pipelines provide event-driven process automation within SS. Users and administrators can save time by creating tailored workflows which are triggered automatically by events affecting secrets within SS.  Pipelines can be applied broadly across SS or restricted by folder, secret template, group, site, or a combination of these and other criteria. For example, a pipeline could be configured to automatically change the password on an Active Directory secret when heartbeat fails.
- 158515 - Infinite loops: By default, pipelines are configured to consider any event that executes five tasks within five minutes from the same trigger as an infinite loop. For example, "secret edit" is selected as a pipeline trigger, and "remote password change" is selected as the task. After the first edit is made on a secret, an RPC is triggered. Every time the RPC completes, a new edit is triggered, which, in turn, triggers another RPC. If this happens five times within five minutes, then an infinite loop is declared. If the RPC is slow, taking more than five minutes for five password changes to occur, then an infinite loop is **not** declared. In this case, use the "configuration advanced" page to change "event pipelines infinite loop time (minutes)" to a longer time.

### Session Recording

165861 - Can now record multiple windows, including child processes, when session recording. Some applications used for session management open multiple GUI windows at once or launch child processes to render the session to the user. SS can now record more than the main window of the parent process to ensure all user activity during a session is captured.

### Web Password Filler

> **Note:** This section covers the release notes for Web Password Filler (WPF) version 1.2.0, which is released with Secret Server 10.8.

This release includes updates for the following web browsers:

- Chrome
- Mozilla Firefox
- Edge (Chromium version)
- Opera

Enhancements:

- 117943 - Web session recording is now supported in the WPF (please see the below section on Web Session Recording).
- 163130 - Improved support for the refresh token. We improved the refresh token to better support SAML-configured SS environments, and the WPF is updated to use this improved token. This also makes better use of the timeout settings for the SAML token.
- 164884 - Added timing restriction to the refresh button on the "sign in as" pop-up window in the WPF. This is to limit the number of calls that can be made in a 10-second time frame from going back to SS to update the list of secrets.
- 163130 - Improved support for the refresh token. We improved the refresh token to better support SAML-configured SS environments, and the WPF is updated to use this improved token. This also makes better use of the timeout settings for the SAML token.
- 164490 - Improved support for sites that have second-level subdomains in the URL, such as sites that have ".co.uk" or ".online.com.""""""""""""
- 159832 – Added handling  when fetching secrets from SS for common second-level subdomains when filtering for applicable secrets on a website.

### Web Session Recording """"

- 117943 – Added web session recording to the WPF browser extension. If a Web secret is configured for recording, WPF will now record the web session and display a recording icon at the top of the tab. Any additional Web browser tabs that are opened from that session (provided they stay on URLs that require recording) will also be recorded. All recordings will be available in SS.
- 164887 - If Web session recording is configured to run for a site, but the site prevents the recording icon from being placed in the browser tab's title bar, the WPF instead displays a pop-up message that the session is being recorded.

### Connection Manager

160858 - Added two new settings for Connection Manager users on the Admin > Connection Manager page. Users with the "administer configuration" permission can modify these settings:

- Allow local connections
- Allow Connection Manager to save SS user passwords

> **Note:** These configuration options require Connection Manager 1.2 or later.

### Integrations

- Added support for Devolutions Remote Desktop Manager integration, which allows users to retrieve passwords from SS directly within Remote Desktop Manager. See https://updates.thycotic.net/secretserver/documents/SS-INTG-Devolutions.pdf.
- Added support for WitFoo Precinct to integrate with SS, which allows users to view incident or event logs. See https://updates.thycotic.net/secretserver/documents/SS-INTG-Witfoo.pdf.

### Smartcard Authentication

 143555 -  Added support for CAC/PIV smartcards pass-through authentication for RDP launchers.

### Compliance and User Data

158361 - Personally Identifiable Information (PII) for inactive user data in SS can now be anonymized to help organizations meet compliance regulations for GDPR.

### Roles

- 62003 - Added a new role permission, "session recording auditor," which allows a user to audit session recordings but not access the corresponding secrets.
- 164168 - Added a new user role, "view secret password history," that allows users to have access to a password without granting them access to the password history. Users with edit or owner permissions on a secret who do not have this new role will be able to view and update the current secret password but will not be able to view previous passwords on the secret.

  > **Note:** User roles that previously had the "view secret" permission will automatically gain "view secret password history" during the upgrade process.

### Discovery

- 162832 - Added an extensible discovery "run as" privilege credential. Users can now specify a secret for the default credentials for running all PowerShell scripts on a site. This allows sites in different data centers to have different default credentials. This applies to remote password changing, checkout hooks, and discovery PowerShell scripts. If you want a specific secret checkout hook, secret password changer, or discovery scanner to use different credentials, you can still provide credentials in those areas, which take precedence over the secret set for the site. See [Discovery](../discovery/index.md).

### Performance Improvements

- 163917 - Redesigned the "secret dependencies" page. Updates include database paging and filtering to fix page load performance issues in the new UI.
- 159962 - The audit REST API was improved to increase performance when viewing the secret audit log in the new UI
- 164149 - Added optimizations to improve secret search performance with very large secret sets. These include modifications to the secret list page, folder secret listings, search terms and other filters, the secret picker, and REST API endpoints. Endpoint improvements include options to not automatically count matching secrets and a method to count matching secrets rather than returning the set, both designed to remediate the overhead of secret filter set paging.

  > **Note:** The optimizations may cause issues when upgrading, so they are not on by default. They may also cause issues with extremely long secret names (400+ characters). Please contact technical support for more information if you believe you might benefit from the optimizations.

### Security

- 143628 - Fixed an issue where a local user could log in to the SS SSH terminal despite an expired password.
- 163910 - Fixed a reflected cross-site scripting (XSS) vulnerability.
- 163913 - Extended the default HSTS max age to one year and extended it to cover subdomains.
- 163910 - Fixed a reflected cross-site scripting (XSS) vulnerability.
- 163918 - Fixed an issue preventing a security header from being returned in certain locations within the application.

### API

- The rest API documentation has a new look and feel, including a table of contents.
- Added 67 new endpoints. See The [REST API Guide](../api-scripting/rest-api-reference-download/index.md) for details.
- Added the ability to autogenerate API clients for PS, C#, Java, Postman, and Insomnia.
- 142641 - Added PATCH API call methods, which are designed to update only values that are passed through the call. New object types include:

  `/secrets/{id}/email`
  `/secrets/{id}/general`
  `/secrets/{id}/security-checkout`
  `/secrets/{id}/security-general`

  An example of a PATCH call is:

  `PATCH/secrets/{id}/general{{secretPolicy: 1}}`

  or more descriptive:

  `PATCH/secrets/{id}/general{{secretPolicy: {value: 1, dirty: true}}}`

### Logging

- Added verbose logging for:
  - 125665 - Active Directory password changers
  - 125669 - SQL Server password changers
  - 125675 - MySQL password changers
  - 125681 - Oracle password changers
  - 125684 - Sybase password changers
  - 127468 - LDAP Privileged password changers
  - 127646 - Mainframe password changers
  - 147542 - Windows password changers
  - 147839 - SSH password changers
  - 148129 - AppPool dependency
  - 148156 - SSH dependency
  - 148162 - SQL dependency
  - 148245 - PowerShell dependency
  - 148489 - ComPlus dependency
  - 148491 - FlatFile password changers
  - 148509 - ScheduledTask password changers
  - 148524 - WindowsService password changers

- 141703 - Added a correlation ID to every request generated by new UI pages. This ID is tracked by the API and is included in the server log when relevant. To get the IDs, users can go to the new UI diagnostics page to download a log of all HTTP requests made within the past two days.
- 147916 -  Updated error handling to process unknown errors as "UnknownError." Previously unknown errors logged as "LoginFailed."

### Cloud

- 154886 - Fixed a caching issue where discovery scanning sometimes did not find an existing organizational unit (OU) for SSC instances.
- 152842 - Significantly improved shutdown and restart times for engines connected to SSC.
- 154931 - Added a new configuration setting to allow SSC admins to opt non-admin users out of seeing the SSC upgrade notification banner before a release. Access this "display maintenance message To administrators only" setting at Admin \> Configuration \> General tab \> User Experience.

### General

- 150770 - Updated the layout for configuration pages to include more details about  page sections.
- 153638 - Removed options such as "import secrets" and "launcher tools" from the grid icon menu. All menu items are available from the admin page.
- 155837 - Redesigned the "user preferences" page. Click the profile icon in the upper right, and then select User Preferences.
- 153638 - Removed options such as "import secrets" and "launcher tools" from the grid icon menu. All menu items are available from the admin page.
- 155953 - Added auditing for changes made to discovery source pages.
- 153638 - Removed options such as "import secrets" and "launcher tools" from the grid icon menu. All menu items are available from the admin page.
- 159780 - Added a checkbox to the settings of the scheduled task and Windows service scanners to use NETBIOS name instead of UPN when matching domains.
- 153638 - Removed options such as "import secrets" and "launcher tools" from the grid icon menu. All menu items are available from the admin page.
- 164130 - Added a "next password reveal" audit for secrets that are manually updated with a next password.
- 144344 - Converted active templates to new UI.

## Bug Fixes$1   - 127410 - Fixed an issue where request access emails did not send to some approvers.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 140009 - Fixed an issue where copying custom reports sometimes did not allow a user to save.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 148772 - Fixed an issue where folder permissions could be changed via REST API despite the "inherit permissions from parent" setting being enabled. Changes to folder inheritance through the API will now be reflected in the UI and will be messaged in the API.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 149752 - Fixed an issue where filter parameters were ignored when using `filter.searchField` in the API method. Users are now able to perform partial searches through the API.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 151022 - Fixed an issue where deleted engines were still shown on the engine status widget.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 153276 - Fixed an issue where the time format in the secret access request form page did not match the default time format in Admin \> Configuration.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 154289 - Added a notification message when a secret is forced to check in by another user.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 154407 - Fixed an issue where a folder name is truncated to 50 characters when imported via XML.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 155486 - Fixed an issue where Unicode characters would display as question marks on the SSH proxy session data page.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 155732 - Fixed an issue where proxied sessions (RDP or SSH) did not properly terminate if session recording was previously disabled for the secret.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 156480 - Fixed an issue where other users' personal sub-folders were still visible to users who did not have View permissions on them despite the "require view permission on specific folder for visibility" setting being enabled. This only occurred on the Admin > Folder Permissions & Audit page.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 158288 - Fix made to address error when attempting to export diagnostic logs which resulted in incomplete records.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 158920 - Fixed an issue where the `POST /secret-templates/generate-password/{secretfieldId}` endpoint did not properly handle password fields.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 160636 - On the security hardening report page, increased the maximum size of the zero-information disclosure message. For more information, see https://thycotic.force.com/support/s/article/Prevent-Secret-Server-from-displaying-error-message-details.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 160849 - Updated the distributed engine "processing" status query to exclude inactive secrets in its data count on the SiteView.aspx page.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 161300 - Fixed an issue where edits to a dependency modal did not save.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 161668 - Fixed an issue with attaching files while creating a new secret that had check-out or require comment enabled.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 161933 - Fixed an issue in folders that contain over 30 sub-folders where clicking to maximize the folder list threw an error.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 162450 - Fixed an issue in the new UI where require approval logic on a secret policy blocked users from creating secrets in a folder where the policy was assigned.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 163266 - Fixed an application error message when secret access was revoked by its owner, while another user was attempting to check it out.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 163619 - Fixed an issue in the way IP addresses in URL fields were indexed and how indexed searching was conducted. Searching by partial IP address now correctly matches against URL fields for any substring of the IP address, as long as the search term starts with a whole octet of the field.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 164192 - Fixed an issue when sharing a secret where a message incorrectly stated that the user would no longer be owner of the secret.
- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.
- 148840 - Secret folder tree expansion is no longer lost when editing a folder.
