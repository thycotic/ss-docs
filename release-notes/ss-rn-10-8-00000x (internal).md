[title]: # (Secret Server Release Notes 10.8.00000x)
[tags]: # (Release Notes)
[priority]: # (1000)
[display]: # ()

# Secret Server: 10.8.00000x Release Notes

==INTERNAL. DO NOT DISPLAY==

March 24, 2020

## Upgrade Notes

- 163223 - RMQ Helper was updated to install the latest RMQ version (3.8.2). See https://docs.thycotic.com/rabbitmq-helper/.

- 153205 - Enabled the "port scan enable" configuration by default for discovery scanners. To disable this setting or for more information, see https://thycotic.force.com/support/s/article/SS-Port-Scan-Settings-Discovery.

## New Features and Enhancements

### Licensing
$1
$2
- Session recording and monitoring for up to 50 secrets

- SDK (unlimited application accounts)

- SIEM integration


See https://thycotic.com/products/secret-server/features/ for the updated licensing list for Secret Server.

### RDP Proxy
$1
$2
### Event Pipelines 

- 165209 - Pipelines provide event-driven process automation within SS. Users and administrators can save time by creating tailored workflows which are triggered automatically by events affecting secrets within SS.  Pipelines can be applied broadly across SS or restricted by folder, secret template, group, site, or a combination of these and other criteria. For example, a pipeline could be configured to automatically change the password on an Active Directory secret when heartbeat fails.

- 158515 - Infinite loops: By default, pipelines are configured to consider any event that executes five tasks within five minutes from the same trigger as an infinite loop. For example, "secret edit" is selected as a pipeline trigger, and "remote password change" is selected as the task. After the first edit is made on a secret, an RPC is triggered. Every time the RPC completes, a new edit is triggered, which, in turn, triggers another RPC. If this happens five times within five minutes, then an infinite loop is declared. If the RPC is slow, taking more than five minutes for five password changes to occur, then an infinite loop is **not** declared. In this case, use the "configuration advanced" page to change "event pipelines infinite loop time (minutes)" to a longer time.

### Session Recording 
$1
$2
### Web Password Filler 

> **Note:** This section covers the release notes for Web Password Filler (WPF) version 1.2.0, which is released with Secret Server 10.8.

This release includes updates for the following web browsers:

- Chrome

- Mozilla Firefox

- Chrome

- Opera

Enhancements:

- 117943 - Web session recording is now supported in the WPF (please see the below section on Web Session Recording).

- 163130 - Improved support for the refresh token. We improved the refresh token to better support SAML-configured SS environments, and the WPF is updated to use this improved token. This also makes better use of the timeout settings for the SAML token.

- 117943 - Web session recording is now supported in the WPF (please see the below section on Web Session Recording).

- 164490 - Added a new feature to match URLs by exact path. This option looks at the domain value in the URL and will only list secrets that have an exact match. During Web session recording, this option exactly matches the values between `//` and the first `/` in the URL. For example, in `http://Company.Sub.Primary.Domain.TopDomain/subsite` it matches `Company.Sub.Primary.Domain.TopDomain`. 

- 117943 - Web session recording is now supported in the WPF (please see the below section on Web Session Recording).

- 159832 – Added handling  when fetching secrets from SS for common second-level subdomains when filtering for applicable secrets on a website.

### Web Session Recording """"

- 117943 – Added web session recording to the WPF browser extension. If a Web secret is configured for recording, WPF will now record the web session and display a recording icon at the top of the tab. Any additional Web browser tabs that are opened from that session (provided they stay on URLs that require recording) will also be recorded. All recordings will be available in SS.

- 164887 - If Web session recording is configured to run for a site, but the site prevents the recording icon from being placed in the browser tab's title bar, the WPF instead displays a pop-up message that the session is being recorded.

### Connection Manager
$1
$2
- Allow local connections

- Allow Connection Manager to save SS user passwords

> **Note:** These configuration options require Connection Manager 1.2 or later.

### Integrations

- Added support for Devolutions Remote Desktop Manager integration, which allows users to retrieve passwords from SS directly within Remote Desktop Manager. See https://updates.thycotic.net/secretserver/documents/SS-INTG-Devolutions.pdf.

- Added support for WitFoo Precinct to integrate with SS, which allows users to view incident or event logs. See https://updates.thycotic.net/secretserver/documents/SS-INTG-Witfoo.pdf.

### Smartcard Authentication

 143555 -  Added support for CAC/PIV smartcards pass-through authentication for RDP launchers. 

### Compliance and User Data
$1
$2
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

- 143628 - Fixed an issue where a local user could log in to the SS SSH terminal despite an expired password.

- 163916 - Fixed a cross-site scripting (XSS) issue.

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

- 150770 - Updated the layout for configuration pages to include more details about  page sections.

- 155841 - Added actions that allow a user to cancel an existing request in the request log grid.

- 150770 - Updated the layout for configuration pages to include more details about  page sections.

- 159758 - Application requests made from the API can now be approved or denied on  the inbox page.

- 150770 - Updated the layout for configuration pages to include more details about  page sections.

- 163036 - On secrets that require both check out and comment, users are no longer required to submit two comments. We combined the check out and comment prompts.

- 150770 - Updated the layout for configuration pages to include more details about  page sections.

- 144344 - Converted active templates to new UI.

## Bug Fixes

- 51027 - Fix an issue to Web Password Filler to have the URL encoding match what is configured in the secret. Issue related to handling of ampersands contained in the launcher URL.


- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 139322 - Fix to address accuracy of login time stamps when using SAML Active Directory Federated Services.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 141587 - Fixed an issue where some secrets did not display when picking associated secrets for a secret policy or event subscription. Associated secrets on secret policy edit will now default to not filtering by password type configured on the template. The "show all" button will also no longer filter by this setting. 

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 149450 - Added a new advanced configuration advanced setting, OffloadRunNowToDifferentNode. If true, offloads the "run now" commands to nodes with background worker enabled. This only applies if SS nodes have different RabbitMQ site connectors. 

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 150385 - Fixed an issue where users with edit permission on a folder were unable to perform the "convert template" bulk operation on secrets they owned within that folder.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 151896 - Fixed an issue where RADIUS two-factor authentication access challenge prompts did not work with Integrated Windows Authentication.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 153413 - Fixed an issue in the new UI where the dependencies tab was not displayed correctly.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 154400 - Fix made for RPC password changes getting stuck in the processing state, after disabling RPC.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 154507 - Fixed an issue where the audit log showed duplicate view instances for secrets

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 155547 - Enhanced search logic so that an exact match for folder or secret name will appear first in the search results list.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 155779 - Fixed an issue where the "inherit permission from folder" setting was disabled when sharing a newly created secret in the old UI.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 156576 - Fixed an issue where different time zones were shown when editing the RPC settings of a secret.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 158318 - Fixed the "value cannot be null" error message after clearing a report filter.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 159977 - Fixed an issue where the web password filler could not login local users through SAML authentication.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 160797 - Fixed an issue where AD sync processed a disabled domain.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 161174 - Fixed an issue where duplicate secrets could be linked to a discovery scanner.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 161370 - Fixed an issue where the "automatic user management" setting did not re-enable Integrated Windows Authentication (IWA) users properly.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 161895 - Fixed an issue with the REST API `POST /secret-templates/` endpoint, which did not work.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 162041 - Fixed an issue where converting a secret template failed after modifying the secret template without first saving the template.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 162968 - Fixed a new UI issue where copying a secret template failed when using the Internet Explorer browser.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 163350 - Fixed inaccuracies displayed in "last accessed" and "created" column data in secret grids. 

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 163901 - Fixed a display issue for drop-down grid menus in the new UI.

- 127410 - Fixed an issue where request access emails did not send to some approvers.

- 166057 - Fixed an issue where duplicate groups populated when selecting from the "add Group/user" dropdown on the Admin > Groups page.

- 148840 - Secret folder tree expansion is no longer lost when editing a folder.
