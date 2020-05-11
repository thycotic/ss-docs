[title]: # (Administration Tabs)
[tags]: # (Administration Tabs)
[priority]: # (1000)

# Administration Tabs

## General Tab

The following configuration settings are available in the General tab:

- **Allow Approval for Access from Email:** Adds links in request for approval emails allowing approvers to approve or deny access to a secret without logging into SS. See Requires Approval for Access for details.

- **Allow Automatic Checks for Software Updates:** Enable this option to be notified of a new SS release. If a new update is available, displayed at the top of each SS page is a link to the latest update. This feature is only available to those with support licenses.

- **Allow SS to Retrieve Website Content:** Enables the Web launcher to retrieve the Web site content in order to parse the form and find the login controls.

- **Allow Users to Select Themes:** Allows users to customize the theme for SS. This selected theme would only apply to their login.

- **Allow Web Launcher Mappings to be Downloaded:** Enables a Web launcher configuration to download pre-approved website launcher settings from Thycotic.com.

- **Allow Web Launcher Mappings to be Uploaded Off-site:** Enables the user to upload successful Web launcher configurations to Thycotic.com where they are approved and shared with other customers.

- **Default Theme:** Select the default SS theme users see.

- **Enable CredSSP Authentication for WinRM:** Allow credential delegation for PowerShell scripts that may need to access resources outside of the SS machine.

- **Enable Launcher:** Enables Remote Desktop Launcher capabilities for SS. See the Launcher section for further details.

- **Enable Syslog/CEF Logging:** Allow SS to export logs to a SIEM tool server.

- **Enable Webservices:** Enable other applications to interact with SS (still requires them to login as a SS user).

- **Force Inactivity Timeout: Used** to time out a user's login after inactivity for the specified time interval. See [Configuring Users](../../users/Configuring-Users/index.md).

- **Force Password Masking:** For more information, see [Setting Up Password Masking](../../secret-management/procedures/Setting-Up-Password-Masking/index.md).

- **Launcher Deployment Type:** Select either Protocol Handler (default) or ClickOnce.

- **Maximum Time for Offline Access on Mobile Devices:** Amount of time that a mobile device can be disconnected from the server before it removes cached SS data from the device.

- **Prevent Application from Sleeping When Idle:** Prevents the application pool that SS is running under from going to sleep.

- **Prevent Application from Sleeping When Idle:** Prevents the application pool that SS is running under from going to sleep.

- **Require Folder for Secrets:** Enable this setting to force users to select a folder to place a secret in when creating or moving a secret. See Folders for more details.

- **Secret View Interval Minutes:** The number of minutes after which users must enter another comment when Require Comment is enabled.

- **Session Timeout for Webservices:** Set a session time limit on use of the Web services API. Once the Web services session token expires, the user must login again with their username and password.

- **WinRM Endpoint URL:** URL for WinRM, which is used for PowerShell hooks.

> **Note:** No secret data is uploaded to Thycotic.com—only the website URL and control names are sent.

- **Default Secret Permissions:** See [Secret Folders](../../secret-folders/index.md) for more information.
- **Time Zone:** Time zone that all dates are displayed in.
- **Default Date, Time Format:** Default date and time format used for all users. This setting can be overridden by each user. See [User Preferences](­../../../../users/user-preferences/index.md) for details.
- **Secret Password History:** Enforces whether a recent password can be set on a secret's password text-entry field based on the history. Defaults to 1, which means the same password cannot be immediately re-used on a secret.
- **Change Administration Mode:** This button takes you to a page where you can enable or disable Unlimited Administration mode.

## HSM Tab

From the Hardware Security Module (HSM) tab, you can enable or disable HSM for encryption. For more details about HSM configuration, see our [HSM Integration Guide](https://updates.thycotic.net/links.ashx?hsmintegrationguide) (PDF).

## Email Tab

The Email tab contains the following configuration options:

- **Domain:** The domain of the credentials to use (optional).

- **Email Server:** Specify the domain name or IP address of your SMTP server. For example: smtp.yourcompany.com.

- **From Email Address:** The return email address for SS emails.

- **Use Credentials:** Whether to use credentials when sending emails. Requires username and password to be entered when enabled.

- **Use Custom Port:** Whether to use a custom port when sending emails. Requires a custom port to be specified when enabled.

- **Use SSL:** Whether to use SSL when sending emails.

## Folders Tab

The Folders tab contains the following configuration options:

- **Enable Personal Folders:** Each user has a personal folder created and assigned to them.

- **Personal Folder Name:** The name of the root personal folder. Each user's personal folder is named based on the user.

- Require View Permission on Specific Folder for Visibility: Users only see folders they have view permissions on.

- **Show user warning message:** Enable warning message for users when creating secrets.

- **Warning Message Text:** Warning message to display to the users, instructing them to store only work-related data in SS.

## Login Tab

The Login tab contains the following options:

- **Allow AutoComplete:** AutoComplete is a feature provided by most Web browsers to automatically remember and prefill forms for you. This can be a great security concern since they typically do not save the data in a secure manner. You can enable or disable Web browser prefill on the Login page by using this option.

- **Allow Remember Me:** This option enables the Remember Me checkbox on the login page. When a user chooses to use "remember me," an encrypted cookie is set in their browser. This enables users to revisit SS without the need to login. This cookie is no longer be valid when the "remember me" period has expired, and users have to log in again.

- **Default Login Domain:** Allows for the selection of a default domain for user login.

- **Enable Duo Security Integration:** Enabling Duo integration allows users to use Duo two-factor authentication.

- **Enable Login Failure CAPTCHA:** Enforces a CAPTCHA image if the user fails one or more logins to prevent brute force attacks of user credentials or brute force lockouts.

- **Enable RADIUS Integration:** Enabling RADIUS integration enables another form of two factor authentication for users.

- **Enable SAML Integration:** Enabling SAML integration allows users to log-in to SS using your SAML identity provider.

- **Maximum Login Failures:** Set the number of login attempts allowed before a user is locked out of their account. Once locked out, they need a SS administrator to reset their password and enable their account.

- **Require Two Factor for these Login Types:** When enabled on a specific user logging into SS, you can choose from a list to enable it for website, Web service, or both.

- **Visual Encrypted Keyboard Enabled:** Enables or disables the Visual Encrypted Keyboard for logins.

- **Visual Encrypted Keyboard Required:** Require the visual keyboard for logins.

## Local User Passwords Tab

This tab contains the following configuration options:

- **Allow Users to Reset Forgotten Passwords:** Allows users to reset their passwords in case they forget them.

- **Enable Local User Password Expiration:** Local user's passwords expire after a specified interval.

- **Enable Local User Password History:** Local users cannot change their password if it has been recently used.

- **Enable Minimum Local User Password Age:** Local users cannot change their passwords until the password meets a minimum age.

- **Local User Password is valid for:** Specifies the maximum time a local user can keep a password.

- **Lowercase Letters Required for Passwords:** Force all local users to include lowercase letters within their login passwords.

- **Minimum Password Length:** Require a minimum length on all local users' login passwords.

- **Numbers Required for Passwords:** Force all local users to include numbers within their login passwords.

- **Symbols Required for Passwords:** Force all local users to include special characters within their login passwords (%#@).

- **Uppercase Letters Required for Passwords:** Force all local users to include uppercase letters within their login passwords.

## Security Tab

The Security tab contains the following configuration options:

- **Allow HTTP Get:** Allows the HTTP Get verb for Web services. This allows REST-style calls to many Web service methods but reduces security.

- **Enable FIPS Compliance:** See [FIPS Compliance](#FIPS-Compliance).

- **Enable HSTS:** Enable HTTP Strict Transport Security. Not available if Force HTTPS/SSL is turned off.

- **Encrypt Key using DPAPI:** This encrypts the SS AES 256 key using the machine key. It provides protection from admins copying SS from the server to their own machine. Note that a backup of the encryption key should be made before using this option. Otherwise, disaster recovery is impossible if the server dies. After encrypting the key, an administrator of SS can decrypt it.

- **Force HTTPS/SSL:** Require HTTPS; users cannot access SS using HTTP.

- **Frame Blocking:** Prevents users from accessing the SS site if it is embedded in an iFrame.

## Session Recording Tab

See [Session Recording](../../session-recording/index.md).

## Ticket System Tab

See [Ticketing System Integration](../../ticketing-system-integration/index.md).
