[title]: # (Report Page)
[tags]: # (Report Page)
[priority]: # (1000)

# Report Page

## Reports General Tab

See [Built-In Reports](../built-in-reports/index.md) for the most up-to-date list of reports included.

The reports are listed under the report categories. To view a report, click on its name. This takes you to the **Report View** page.

You can view a record of all the actions performed on reports by clicking on the **View Audit** button. For more information on this, see [Administration Auditing](../../application-administration/administration-auditing/index.md).

For details on the **Edit** button, see [Creating and Editing Reports](../creating-and-editing-reports/index.md).

The **Create it** link is a shortcut for creating a new report.

You can adjust the look of the Reports View page. The report categories as well as the reports can be rearranged on the page. To do this, click **Edit** on the Reports page.

## Reports Security Hardening Tab

The Security Hardening Tab configures aspects of SS to ensure security best practices are being implemented. While SS runs with all the items failing, administrators should be aware of possible security issues within an installation. Below is an explanation of the different features:

### Configuration Section

- **Allow Approval for Access from Email:** This is a convenience option that allows users to approve or deny a secret access request by clicking a link in the request email sent by SS. Allow Approval From Email does not require a user to authenticate with SS when approving access to a secret. This can be a security concern if the approver's email account becomes compromised. Turn Allow Approval From Email off to get a pass result.

- **Browser AutoComplete:** Browser AutoComplete allows Web browsers to save the login credentials for the SS login screen. These credentials are often kept by the Web browser in an insecure manner on the user's workstation. Allowing AutoComplete also interferes with the security policy of your SS by not requiring the user to re-enter their login credentials on your desired schedule. To prevent the AutoComplete feature, disable the Allow AutoComplete option on the Configuration page.

- **File Attachment Restrictions:** File attachment restrictions allows administrators to configure what kind of file attachments can be uploaded to secrets. This helps protect users from being tricked into downloading a malicious secret attachment. The file extension and maximum file size can be specified, such as:

  ```
  *.7z, *.bmp, *.ca-bundle, *.cer, *.config, *.crt, *.csr, *.csv, *.dat, *.doc, *.docx, *.gif, *.gz, *.id-rsa, *.jpeg, *.jpg, *.json, *.key, *.lic, *.p7b, *.pcf, *.pdf, *.pem, *.pfx, *.pkey, *.png, *.ppk, *.pub, *.tar, *.tif, *.tiff, *.tpm, *.txt, *.vdx, *.vsd, *.vsdx, *.xls, *.xlsx, *.xml, *.zip
  ```

  This security check will fail if the file attachment restrictions is not enabled. This check will return warnings if a potentially dangerous file extension is allowed, maximum file size is not specified, or maximum file size is greater than 30 MB.

- **Force Password Masking:** Password masking prevents over-the-shoulder viewing of your passwords by a casual observer (when masked, passwords show as **_*_**). To activate this option, click to select the **Force Password Masking** option on the **Configuration** page.

- **Frame Blocking:** Frame blocking prevents the SS site from being placed in an iFrame. This is to prevent clickjacking attacks. There may be legitimate reasons for placing SS in a frame, such as embedding the UI in another site. To turn frame blocking on, enable the setting under the Security tab in Configuration.

- **Login Password Requirements:** Login passwords can be strengthened by requiring a minimum length and the use of various character sets. A minimum password length of 8 characters or longer is recommended. In addition, all character sets (lowercase, uppercase, numbers and symbols) are required to get a pass result. Turn on these login password settings on the Configuration page.

- **Maximum Login Failures:** The maximum number of login failures is the number of attempts that can be made to login to SS as a user before that user's account is locked. A user with user administration permissions is then required to unlock the user's account. The maximum failures allowed should be set to 5 or less to get a pass result. Change the "Maximum Login Failures" settings on the Configuration page.

- **Remember Me:** Remember Me is a convenience option that allows users to remain logged in for up to a specific period. This setting can be a security concern as it does not require re-entry of credentials to gain access to SS. Turn Remember Me off on the Configuration page to get a pass result. It must be set to be valid for 1 day or less to not get a fail result.

- **Secure Session and Forms Auth Cookies:** Cookies contain potentially sensitive information that can allow users to log onto application. By default, cookies are not marked with the secure attribute. That is, **they are transmitted unencrypted when a user accesses SS through HTTP instead of HTTPS**.

  For more information about how to secure your cookies, see [Secure ASP Session and Forms Authentication Cookies](http://updates.thycotic.net/link.ashx?SecureCookieSessions) (KB).

- **Web Service HTTP Gets Allowed:** Web service HTTP get requests are allowed. Allowing HTTP GET requests allows REST-style calls to many SS Web service methods. This can be a security concern because simply clicking a link to the Web service, created by a malicious user, would cause it to be executed.

- **Zero Information Disclosure Error Message:** Replace all error messages with a custom “contact your admin” message. Error messages can be very helpful when diagnosing installation and configuration issues. However, having errors displayed to a potential attacker can provide him or her with the critical information they need to perform a successful attack.

### Database Section

- **SQL Account Using Least Permissions:** Use the fewest SS permissions as possible in the SQL Account used to access the database. We recommend using a least permission approach where the account only has dbOwner. See [Installing and Configuring SQL Server](https://updates.thycotic.net/link.ashx?SqlAccountPermissionsSecurityCheck).

- **SQL Server Authentication Password Strength:** SQL Server authentication requires a username and password. The password must be a strong password to get a pass result. Strong passwords are 8 characters or longer and contain lowercase and uppercase letters, numbers and symbols. The SQL Server authentication credentials in use can be changed by going to the installer (installer.aspx) and changing them on Step 3. A pass result is also given if Windows authentication is used to authenticate to SQL Server.

- **SQL Account Using Least Permissions:** Use the fewest SS permissions as possible in the SQL Account used to access the database. We recommend using a least permission approach where the account only has dbOwner. See [Installing and Configuring SQL Server](https://updates.thycotic.net/link.ashx?SqlAccountPermissionsSecurityCheck).

- **Windows Authentication to Database:** Windows authentication takes advantage of Windows security to provide secure authentication to SQL Server. The SQL Server authentication options can be changed by going to the installer (installer.aspx) and changing them on Step 3\. Please see the [Installation Guide](https://thycotic.force.com/support/s/article/Installation-Guides-Secret-Server) for instructions on configuring Windows authentication to SQL Server.

### Environment Section

- **Application Pool Identity:** The Application Pool identity `GAMMA\ss_iis_svc` appears to be a member of the administrators group on the system. This puts the system at risk by giving more access than necessary.

- **DPAPI or HSM Encryption of Encryption Key:** Encrypt your SS encryption key, and limit decryption to that same server. Data Protection API (DPAPI) is an encryption library that is built into Windows operating systems. It allows encryption of data and configuration files based on the machine key. Enabling DPAPI Encryption in SS protects the SS encryption key by using DPAPI, so even getting access to the SS encryption key is not enough to be useful—the machine key is required. If you enable this option, back up your encryption key first, as a DPAPI encrypted file can only be used by the machine it was encrypted on.

### SSL Section

> **Note:** SSL needs to be running with at least a 128-bit key size to get a pass result. A warning result indicates your key size is less than 128 bits. A fail result indicates you are not using SSL.

- **Require SMTP SSL:** SMTP SSL is required to ensure that all communication between SS and the email server is encrypted. Enable the "Use SSL" option in Secret Server to get a pass result.

- **Require SSL:** Secure Sockets Layer (SSL) is required to ensure that all communication between the Web browser and SS is encrypted and secure. Once the SSL certificate is installed, Force HTTPS/SSL in Configuration to get a pass result. Please see the [Installing a Self-Signed SSL/HTTPS Certificate](https://updates.thycotic.net/links.ashx?SSSelfSignedCertificate) Knowledge Base article for instructions.

- **Require SMTP SSL:** SMTP SSL is required to ensure that all communication between SS and the email server is encrypted. Enable the "Use SSL" option in Secret Server to get a pass result.

- **SSL/TLS Key:** Check the key size of the HTTPS certificate used. If it is RSA or DSA, the key must be at least 2048-bit to pass. If the signature algorithm of the certificate is ECDSA, the key size must be at least 256-bit to pass. If the algorithm of the certificate is unknown, the result shows “unknown. This check fails if SS cannot be loaded over HTTPS.

- **Require SMTP SSL:** SMTP SSL is required to ensure that all communication between SS and the email server is encrypted. Enable the "Use SSL" option in Secret Server to get a pass result.

- **Using HTTP Strict Transport Security:** HTTP Strict Transport Security (HSTS) is an additional security layer for SSL. HSTS allows SS, Password Reset Server, or Group Management Server to inform browsers that it should only be accessible over HTTPS. With this setting enabled, visitors are automatically are redirected by their browser to the HTTPS-enabled site.

## Reports User Audit Tab

User Audit Reports show all secrets accessed by a user during a specified period. For a more detailed explanation, see [User Audit Report](../../application-administration/administration-auditing/index.md).
