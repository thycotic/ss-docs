[title]: # (Secret Server Release Notes 10.3.x)
[tags]: # (Release Notes)
[priority]: #
[display]: # (search,content,print)

# Secret Server Release Notes 10.3.x

## **Release Notes 10.3.000015**

*Release Date: 9/25/2017* 

### Enhancements

- Secret Server now supports SafeNet Luna Network HSM 7.

### Bug Fixes

- Fixed issue where Active Directory Synchronization may become slow or unresponsive when synchronizing a significant number of Active Directory groups.
- Fixed issue where users may be removed from a group in Secret Server if that group contains users from multiple Active Directory domains and one of the domains cannot be reached during a synchronization.
- Fixed issue where Secret Server Free customers could not manually add Active Directory users.
- Fixed issue where selecting specific Organizational Units for an existing Active Directory discovery source may not work properly after a manual host range is added to it.
- Fixed issue where Unix machines discovered using PowerShell may reflect an incorrect Organizational Unit.
- Fixed issue where users were no longer forced to change their password upon first login if the Enable Local User Password Expiration configuration setting was enabled.
- Fixed issue where using Discovery for dependencies over Distributed Engine may return incorrect results.
- Fixed issue where multiple Discovery host range scans could cause redundant machine loads.
- Fixed issue where using search in Secret Server while on the Notifications page may cause an application error.
- Fixed issue where users who have an externally facing IP address that could not be resolved from the web server hosting Secret Server may experience performance issues throughout Secret Server.

### Security Fixes

- Fixed XSS issue on the Secret Template Permissions page.

- RabbitMQ Helper has been updated to install RabbitMQ 3.6.12 which now supports Erlang 20. This patches Erlang 18's vulnerability CVE-2016-10253. We do not believe that Erlang 18's vulnerability has a direct impact on Secret Server's use of RabbitMQ, but we recommend updating current Erlang and RabbitMQ deployments to these versions to keep systems patched. 

- More information on upgrading and where to get the new RabbitMQ Helper can be found [here](https://thycotic.force.com/support/s/article/ka0370000009UqIAAU/How-to-Upgrade-RabbitMQ).

- Fixed potential security issue with Secret Server's scripting functionality. See [this advisory](https://thycotic.com/products/secret-server/resources/advisories/thy-ss-010/) for additional details.

## **Release Notes 10.3.000014**

*Release Date: 8/29/2017* 

### **Enhancements**

**Secret Template Edit Launcher Configuration Enhancements for PuTTY Launchers** 

 - Added an option in the Advanced Settings where the launcher can reference any public key dependencies that have been added to a SSH Key Secret.

  - Added an option in the Advanced Settings where SSH sessions launched over the SSH proxy in Secret Server can use custom commands instead of only the su command. 

  - - For more information, please see the following article: [Connect As Commands](https://updates.thycotic.net/link.ashx?SshProxyWithConnectAs)

- Added a report in Secret Server to display what Secret Template permissions a user or group has.

- Added an option in Secret Server to backup Privilege Manager.

- Secret Access Requests can now be found under the Tools menu.

- "Share Secret" Role permission has been renamed to "Own Secret".

- Upgraded the module responsible for Office 365 and Azure Active Directory password changes to ensure continued support.

### **Bug Fixes**

- Fixed an issue where pages involving groups could not be saved if there were 5,000 groups or greater in Secret Server.
- Fixed an issue where Active Directory users in child domains may not be properly disabled in Secret Server when they are disabled or removed from Active Directory.
- Fixed an issue where ambiguous errors were logged when the username or password is correct on any password changers, dependencies, or scripts using SSH.
- Fixed an issue where the Share button would disappear on Secrets on the dashboard when a user does not have the Share Secret Role permission. Users should still be allowed to view the permissions on a Secret even if they cannot decide who that Secret is shared with.

### **Security Fixes**

- Fixed potential security issue where a formulae injection could occur on exports from Secret Server.

## **Release Notes 10.3.000000**

*Release Date: 7/12/2017* 

### **Enhancements**

**SSH Key Management Enhancement** 

- SSH Keys as Dependencies (May require an additional license): Multiple Public keys that reference a single Private key can now be stored as dependencies on the Private key Secret. For more information, please see the Remote Password Changing section of the [Secret Server User Guide](https://updates.thycotic.net/secretserver/documents/SS_UserGuide.pdf).

**EMEA Cloud** 

- Secret Server Cloud is now hosted out of Germany as well as the US.

**Secret Template Granular Enhancements** 

- Added ability to restrict Secret creation for users by Secret Template.
- Added ability to set the allowed Secret Templates for a folder.
- For more information, please see the Folders and Secret Templates sections of the [Secret Server User Guide](https://updates.thycotic.net/secretserver/documents/SS_UserGuide.pdf).

**SAML** 

- SAML Single Logout is now supported.
- For more information, please see the following article: [SAML Configuration.](https://thycotic.force.com/support/s/article/ka037000000HtilAAC/Configuring-SAML-in-Secret-Server)

**UI Updates** 

- The Dashboard load time performance has been optimized.
- Add auditing for configuration changes.
- Added a button to export all logs under Admin | Diagnostics.
- Refined user experience around creating dependencies on Secrets.
- Added bulk operations for Dependencies.

**REST** 

- Added endpoint for IP Address Restrictions.
- Added endpoint for generating a password.
- For more information on these REST endpoints, please see the [10.3 REST API Guide](https://updates.thycotic.net/secretserver/restapiguide/10.3/index.html).

>**WARNING:** Customers who are upgrading from 10.2.000018 and use Windows Integration Authentication to the database may see an error message titled "Login failed for user" during the validation step of the upgrade process. To bypass this error, please use the legacy installer by navigating to `[Your Secret Server URL]/installer.aspx?patch=true&useLegacyInstaller=true`

### **Bug Fixes**

- Fixed issue where Local Account Discovery used unnecessary calls.
- Fixed issue where Secret Server removed dependencies that were not found by Discovery and would not re-add them if found again.
- Fixed issue where the Thycotic RDP Launcher would not allow fullscreen mode.
- Fixed issue where Discovery did not properly detected Scheduled Tasks on Windows 10 machines.
- Fixed issue where testing a SSH script in Secret Server would only display an exit status when it failed.

### **Security Fixes**

- Fixed potential security issue with multi-line files and Secret fields.