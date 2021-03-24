[title]: # (4. Security Best Practices)
[tags]: # (Security)
[priority]: # (1004)

# Step 4: Security Best Practices

As you start using SS, we strongly recommend configuring the following security settings. While these are optional, setting them is a a best practice.

## Local Admin Account Best Practices

Even if you plan to [integrate with Active Directory](../../directory-services/active-directory/index.md) to log into Secret Server, chances are you will need to use this account again. This is the first account you created during the installation process. Keep this account secure and avoid being locked out of SS by following these suggestions:

- Store the credentials in a secure location that you can access if you lose all access to SS.
- Enable the **Allow Users to Reset Forgotten Passwords** setting to provide a way of resetting the password if account is locked out or if the password is forgotten:

   1. Select **Admin \> Configuration**. The Configuration page appears.

   1. Click the **Local User Passwords** tab to locate the setting.

   1. Click the **Edit** button to edit the setting.

   1. Click the **Save** button when finished.

> **Note:** This requires having an [SMTP server configured](https://updates.thycotic.net/links.ashx?VerifySMTPConnection) (KB).

- Configure the other **Local User Passwords** settings to enforce your password requirements, expiration, password history, and other password policies.

## SSL (HTTPS) Best Practice

We recommend requiring SSL access to SS. This requires setting up an SSL certificate for the website, preferably with a domain certificate. However, if you don’t have a certificate, see [Installing a Self-Signed Certificate](https://updates.thycotic.net/links.ashx?SSSelfSignedCertificate) (KB). Once you have your certificate:

1. Configure the HTTPS binding for your SS website using the certificate you choose.

1. Ensure your certificate is trusted on the SS users' machines. See [Trusting an SSL Certificate on a Client Machine](https://updates.thycotic.net/links.ashx?TrustingSSLCert) (KB) for instructions.

1. Enable **Force HTTPS/SSL** on the **Security** tab of the Secret Server **Configuration** settings.
