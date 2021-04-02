[title]: # (Administration Tabs)
[tags]: # (Administration Tabs)
[priority]: # (1000)

# Administration Configuration Tabs

> **Note:** The [Security Hardening Guide](../../security-hardening/index.md) offers suggestion for many of the settings in this section.

## Email Tab

The Email tab contains the following configuration options:

- **Custom Port:** Optional custom port for the email server.
- **Domain:** The domain of the credentials to use (optional).
- **Email Server:** Specify the domain name or IP address of your SMTP server. For example: smtp.yourcompany.com.
- **Domain:** The domain of the credentials to use (optional).
- **Password:** Password for the email account
- **Domain:** The domain of the credentials to use (optional).
- **Use Custom Port:** Whether to use a custom port when sending emails. Requires a custom port to be specified when enabled.
- **Domain:** The domain of the credentials to use (optional).
- **Use Custom Port:** Whether or not to use a custom port on the email server.
- **Use SSL:** Whether to use SSL when sending emails.

## Folders Tab

The Folders tab contains the following configuration options:

- **Enable Personal Folders:** Each user has a personal folder created and assigned to them.
- **Personal Folder Name:** The name of the root personal folder. Each user's personal folder is named based on the user.
- **Require View Permission on Specific Folder for Visibility:** Users only see folders they have view permissions on.
- **Personal Folder Name:** The name of the root personal folder. Each user's personal folder is named based on the user.
- **Warning Message Text:** Warning message to display to the users, instructing them to store only work-related data in SS.

## General Tab

The following configuration settings are available in the General tab:

- **Allow Approval for Access from Email:** Adds links in request for approval emails allowing approvers to approve or deny access to a secret without logging into SS. See Requires Approval for Access for details.
- **Allow Automatic Checks for Software Updates:** Enable this option to be notified of a new SS release. If a new update is available, displayed at the top of each SS page is a link to the latest update. This feature is only available to those with support licenses.
- **Allow Duplicate Secret Names:** Allow users to create or rename secrets with the same name as existing secrets.
- **Allow Users to Select Classic Theme:** Enable access to the classic user interface.
- **Allow View User To Retrieve Auto-Change Next Password:** Allow view-only users to get the next automatically changed password.
- **Allow Web Launcher Mappings to be Uploaded Off-site:** Enables the user to upload successful Web launcher configurations to Thycotic.com where they are approved and shared with other customers.
- **Change Administration Mode:** Enables or disable a button that takes you to a page where you can enable or disable Unlimited Administration mode.
- **Click to Toggle Password Masking:** Enable or disable being able to remove password masking.
- **Custom Logo (Collapsed):** Select an image to use as your collapsed logo.
- **Default Date Format:** Default time format used for all users. This setting can be overridden by each user. See [User Preferences](­../../../../users/user-preferences/index.md) for details.
- **Default Theme:** Select the default SS theme users see.
- **Default Secret Permissions:** Set to determine how permissions are propagated from folders to new secrets. See [Secret Folders](../../secret-folders/index.md) for more information.
- **Enable Launcher:** Enables Remote Desktop Launcher capabilities for SS. See the Launcher section for details.
- **Enable New User Interface as Default for New Users:** Force new users to use the new, as opposed to the classic, user interface. Does not stop users from manually changing to the classic interface.
- **Enable Refresh Tokens for Webservices:** Whether or not to accept refresh tokens.
- **Enable Webservices:** Enable other applications to interact with SS (still requires them to login as a SS user).
- **Force Require Approval for Owners on Approval Secrets:** Do not let approvals to be disabled for owners for secrets requiring approvals.
- **Force Password Masking:** For more information, see [Setting Up Password Masking](../../secret-management/procedures/Setting-Up-Password-Masking/index.md).
- **Maximum Time for Offline Access on Mobile Devices:** Amount of time that a mobile device can be disconnected from the server before it removes cached SS data from the device.
- **Prevent Application from Sleeping When Idle:** Prevents the application pool that SS is running under from going to sleep.
- **Secret Password History:** Enforces whether a recent password can be set on a secret's password text-entry field based on the history. Defaults to 1, which means the same password cannot be immediately re-used on a secret.
- **Secret Server Custom URL:** A URL to use for SS, other than the default one.
- **Session Timeout for Webservices:** Set a session time limit on use of the Web services API. Once the Web services session token expires, the user must login again with their username and password.
- **Time Zone:** Time zone that all dates are displayed in.
- **UI Inactivity Timeout:** Time in minutes before SS times out from user inactivity.
- **WinRM Endpoint URL:** URL for WinRM, which is used for PowerShell hooks.

> **Note:** No secret data is uploaded to Thycotic.com—only the website URL and control names are sent.

## HSM Tab

From the Hardware Security Module (HSM) tab, you can enable or disable HSM for encryption. For more details about HSM configuration, see [Hardware Security Modules](../../security-hardening/hsm-integration/index.md).

## Local User Passwords Tab

This tab contains the following configuration options:

- **Allow Users to Reset Forgotten Passwords:** Allows users to reset their passwords in case they forget them.
- **Enable Local User Password Expiration:** Local user's passwords expire after a specified interval.
- **Enable Local User Password History:** Local users cannot change their password if it has been recently used.
- **Local User Password is valid for:** Specifies the maximum time a local user can keep a password.
- **Minimum Password Length:** Require a minimum length on all local users' login passwords.
- **Symbols Required for Passwords:** Force all local users to include special characters within their login passwords (%#@).
- **User Lockout Time:** Sets the time in minutes that users are locked out for too many failed log on attempts.

## Login Tab

The Login tab contains the following options:

- **Allow AutoComplete:** AutoComplete is a feature provided by most Web browsers to automatically remember and prefill forms for you. This can be a great security concern since they typically do not save the data in a secure manner. You can enable or disable Web browser prefill on the Login page by using this option.
- **Allow Remember Me:** This option enables the Remember Me checkbox on the login page. When a user chooses to use "remember me," an encrypted cookie is set in their browser. This enables users to revisit SS without the need to login. This cookie is no longer be valid when the "remember me" period has expired, and users have to log in again.
- **Allow Two-Factor Remember Me:** Allow users to elect to remember them on SS with two-factor authentication enabled. See "Allow Remember Me."
- **Attempt User Password:** SS normally passes the domain, username, and password to the RADIUS server.  This setting ensures the user is asked for their password instead.
- **Default Login Domain:** Allows for the selection of a default domain for user login.
- **Enable Domain Selector:** All users to select a domain at login.
- **Enable Login Failure CAPTCHA:** Enforces a CAPTCHA image if the user fails one or more logins to prevent brute force attacks of user credentials or brute force lockouts.
- **Enable RADIUS Integration:** Enabling RADIUS integration enables another form of two factor authentication for users.
- **Enable SAML Integration:** Enabling SAML integration allows users to log-in to SS using your SAML identity provider.
- **Maximum Concurrent Logins per User:** The number of times a user can be logged in at the same time.
- **RADIUS Client Port Range:** Allowed computer ports for RADIUS.
- **RADIUS Default Username:** The default username that appears at RADIUS login.
- **Require Two Factor for these Login Types:** When enabled on a specific user logging into SS, you can choose from a list to enable it for website, Web service, or both.
- **Use RADIUS Username for Duo:** Pass the RADIUS username to Duo.
- **Visual Encrypted Keyboard Required:** Require the visual keyboard for logins.

## Security Tab

The Security tab contains the following configuration options:

- **Additional Certificate Chain Policy Options:** Valid values for certificate chain policy options are any of the values in the Microsoft enumerations [listed here](../../authentication/x509-certificate/index.md).
- **Allow HTTP Get:** Allows the HTTP Get verb for Web services. This allows REST-style calls to many Web service methods but reduces security.
- **Apply TLS Certificate Chain Policy and Error Auditing:** Add audits for TLS certificate validation. Auditing will apply to all Active Directory domains using LDAPS and Syslog using TLS. The default policy is very strict.
- **Enable FIPS Compliance:** See [FIPS Compliance](#FIPS-Compliance).
- **Enable File Restrictions:** Allow administrators to configure what kind of file attachments can be uploaded to secrets. This helps protect users from being tricked into downloading a malicious secret attachment. The file extension can be specified, such as:
  *.7z, *.bmp, *.ca-bundle, *.cer, *.config, *.crt, *.csr, *.csv, *.dat, *.doc, *.docx, *.gif, *.gz, *.id-rsa, *.jpeg, *.jpg, *.json, *.key, *.lic, *.p7b, *.pcf, *.pdf
- **Enable Frame Blocking:** Allow SS to be opened in an \<iframe\>  HTML tag on another, potentially malicious, site.
- **Enable HSTS:** Enable HTTP Strict Transport Security. Not available if Force HTTPS/SSL is turned off.
- **Enable TLS Debugging and Connection Tracking:**  When enabled, SS sends information logs to your audit server about when TLS connections are opened or closed.
- **Enable HSTS:** Enable HTTP Strict Transport Security. Not available if Force HTTPS/SSL is turned off.
- **Force HTTPS/SSL:** Require HTTPS; users cannot access SS using HTTP.
- **Hide Secret Server Version Numbers:** Hide SS version numbers from users.
- **Last Secret Key Rotation:** When the last rotation occurred.
- **Rotate Secret Keys (button):** Key rotation is the process by which the encryption key, used for securing Secret  data, is changed and Secret data is re-encrypted.

## SAML Tab

See [Configuring SAML Single Sign-on](../../authentication/configuring-saml-sso/index.md).

## Session Recording Tab

See [Session Recording](../../session-recording/index.md).

## Ticket System Tab

See [Ticketing System Integration](../../ticketing-system-integration/index.md).
