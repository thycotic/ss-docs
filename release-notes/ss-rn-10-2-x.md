[title]: # (Secret Server Release Notes 10.2.x)
[tags]: # (Release Notes)
[priority]: #
[display]: # (search,content,print)

# Secret Server Release Notes 10.2.x

 ## Release Notes 10.2.000019

*Release Date: 6/19/2017*

 ### Enhancements

- Privileged accounts assigned on a Secret Template now take precedence over privileged accounts assigned on Secret Policy.
- Secret settings are now able to be modified via the SOAP web services API when a Secret is checked out.

 ### Bug Fixes

- Fixed issue where Secrets with privileged accounts assigned for password changing could not be moved to a folder with a Secret Policy that contained a privileged account.
- Fixed issue where Secret Server could delete recordings stored on a disk.
- Fixed issue where users without the View Deleted Secrets role permission received errors when expanding the advanced search bar on dashboard.
- Fixed issue where Secret Server could delete recordings stored on a disk.
- Fixed issue where upgrade may fail when the database connection is configured to use Windows Authentication.
- Fixed issue where "Show Proxy Credentials" on a Secret will fail when generating credentials for connecting to the SSH Proxy.

 ### Security Fixes

- Fixed XSS issue on Secret Share.

 ## Release Notes 10.2.000018

*Release Date: 5/17/2017*

 ### Enhancements

- Added additional RDP Launcher type to facilitate future customization.
-  The connection bar text will show the target machine's address in a tunneled RDP session.
- Added the ability to search for a Secret Template by name using REST.
-  The connection bar text will show the target machine's address in a tunneled RDP session.
- Added the ability to delete Folders using REST.
-  The connection bar text will show the target machine's address in a tunneled RDP session.
- Added a new Secret Template and password changer for Watchguard Firewalls.
-  The connection bar text will show the target machine's address in a tunneled RDP session.
- Added option to specify whether a domain in Secret Server will be used for logging into Secret Server.

 ### Bug Fixes

- Fixed issue where the SSH Machine scanner would not use multiple Secrets or Filters for scanning.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where PowerShell dependency information was cleared when editing the dependency after initial creation.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where scheduled Report emails did not include the full URL to view the Report in Secret Server.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where creating a new PowerShell Ticket System would throw an error.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where the Site list shown when creating a new Discovery source contains an invalid entry.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where clicking the Back button on the View Audit page of a Secret and clicking the Back button again on the Secret view page would cause a redirect loop.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where resetting the database connection could throw an error.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where session launchers would occasionally fail in a Secret Server environment where a Load Balancer was present.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where Discovery rules occasionally created duplicate Secrets.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where Engines did not display that they were offline after failing connection verification checks.
- Fixed issue where Discovery machine scanners set to authenticate did not throw errors when authentication failed.
- Fixed issue where Secret Server could not be upgraded using Internet Explorer.
- Added support for application account impersonation via SOAP web services.

 ### Security Fixes

- Fixed XSS issue on Discovery Network View.
- Fixed XSS issue on Dashboard.
- Fixed Frame Blocking issue on Dashboard.
- Fixed potential security issue with the Chrome Login Assist Extension. See [this advisory](http://thycotic.com/products/secret-server/resources/advisories/thy-ss-008-2/) for additional details.

 ## Release Notes 10.2.000001

*Release Date: 4/25/2017*

 ### Security Enhancements

- Fixed an issue in 10.2.000000 where a highly privileged Secret Server administrator could, in certain select circumstances, be inadvertently granted read access to Secret data that is protected by Secret Workflow. This issue was found during routine internal testing and review. See [this advisory](https://thycotic.com/products/secret-server/resources/advisories/thy-ss-007-2/) for additional details.
- Enhanced security around various ajax calls.

 ## Release Notes 10.2.000000

*Release Date: 4/12/2017*

 ### Enhancements

#### Session Monitoring

**Remote Desktop Metadata** (May require an additional license)

  - New session monitoring agent records additional data from the RDP sessions including process activity, keystrokes, and more.
  - The Monitoring agent adds support for recording remote sessions on servers that were not launched directly from Secret Server.
   - Updated the session search UI to support cross session searching for data within the session and additional filtering options
  - The Monitoring agent adds support for recording remote sessions on servers that were not launched directly from Secret Server.
   - Performance enhancements to session processing speed

>**NOTE:** For more information, please see [Configuring Session Recording](https://thycotic.force.com/support/s/article/ka0370000005RPOAA2/Configuring-Session-Recording)

#### Discovery

- Added out of box discovery to find Active Directory accounts on the domain
- Added option to discovery import rules to limit the number of Secrets to import to prevent unexpected takeover of accounts

#### Upgrades

- Added a Setup console to manage upgrades and core product configuration across different Thycotic installations
- New Secret Server upgrade manager that gives more detailed messages and support upgrading multiple products from a single interface.

#### UI Updates

- The Secret Server header has been modified for more logical grouping of menus
- Moved user specific menu items under a new user icon header
- Added a new Alert Notification Center header icon with a badge to show pending alerts.
- Moved user specific menu items under a new user icon header
- Added new in app help messages to page headers

#### REST

- Added endpoint for Launcher lookups
- Added Session Monitoring endpoints

#### SAML

- Added support for SHA256 for SAML request signing
- Added support for ForceAuth to support forcing credentials when first navigating to Secret Server even if logged into the identity provider.
- Added support for signing SAML requests in a CNG Key Storage Provider
>**NOTE:** The upgrade to 10.2 will migrate the saml.config to a new format to support added features, please see [SAML Configuration](https://thycotic.force.com/support/s/article/ka0370000005ROuAAM/Troubleshooting-SAML-Configuration-Errors) for more information on the upgrade.

- Running a script test from the UI now has an option to select the Site to run it on
- Added an option to select a Secret to run a test script as
- Added internal site connector for background message processing.
- Added an option to select a Secret to run a test script as
- Added timeout setting for RADIUS authentication
- Added an option to select a Secret to run a test script as
- Added a $$CHECKNOTCONTAINS check to the SSH password changers
- Added an option to select a Secret to run a test script as
- Added default mainframe password requirement
>**WARNING:** SQL Server 2005 is no longer supported.
- A new desktop client is available. For instructions and download links please see the [Desktop and Mobile App Guide](https://thycotic.force.com/support/s/article/ka0370000005QDqAAM/Thycotic-PAM-Mobile-App)

 ### Bug Fixes

- Fixed issue where scheduled backup wasn't working for Free edition
- Fixed HSM session leaking for Safenet Luna PCI cards
- Fixed upgrade issue that could cause database errors in some cases where discovered Dependencies were not able to properly map to a Scan Template.
- Fixed HSM session leaking for Safenet Luna PCI cards
- Fixed unnecessary logging in Discovery
- Fixed HSM session leaking for Safenet Luna PCI cards
- Fixed locking errors that could occur on the file system when debug logging was enabled.
- Fixed issue with scanning specific OU's with a custom PowerShell Discovery script.