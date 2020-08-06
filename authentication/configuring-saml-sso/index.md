[title]: # (Configuring SAML Single Sign-on)
[tags]: # (authentication,SAML,SSO)
[priority]: # (1000)

# Configuring SAML Single Sign-on

> **Important:** This topic is for Secret Server v10.5 and later and assumes you have a running Identity Service Provider (IDP) with a signed certificate.

> **Note:** Secret Server does not support using SAML when Integrated Windows Authentication (IWA) is enabled.

> **Note:** This topic applies to Secret Server 10.5 and later. For earlier versions, please see [Configuring SAML in Secret Server](https://thycotic.force.com/support/s/article/Configuring-SAML-in-Secret-Server) (KBA).

## SAML Overview

Secret Server allows the use of SAML Identity Provider (IDP) authentication instead of the normal authentication process for single sign-on (SSO). To do this, SS acts as a SAML Service Provider (SP) that can communicate with any configured SAML IDP.

In the diagram below, SS acts as the service provider. Any configured SAML IDP can be used for this process and there are several well tested providers, including OKTA, OneLogin, Azure ADFS, and Microsoft ADFS.

**Figure:** Secret Server as a SAML Identity Provider

![image-20200610164654958](images/image-20200610164654958.png)

##  Prerequisites

### Licensing and Version

Secret Server Professional Edition or higher, upgraded to version 10.5 or later. To install a new SAML license, go to **Admin \> Licenses \> Install New License**.

### .NET Framework 4.6.2+

To use SAML 2.0, you must install .NET Framework 4.6.2 or higher on your Web server. This allows SS to use Microsoft’s “next generation” CryptoNG API for signing SAML requests, instead of being limited to the much older CryptoAPI. This is often necessary to use modern SSL certificates and is strongly recommended as a security best practice. 

To download and install the latest version of .NET Framework: See [Microsoft .NET Framework 4.8 offline Installer for Windows](https://support.microsoft.com/en-us/help/4503548/microsoft-net-framework-4-8-offline-installer-for-windows) for the latest version as of when this topic was written. If you have already installed SS on the same Web server, you have already done this. 

****

### Administer Configuration SAML Role Permission

The “Administer Configuration SAML” role permission is required to use SAML to access SS. To grant a user this permission from an administrator account:
$1
$2$1
$2
   ![image-20200610145830073](images/image-20200610145830073.png)
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
   ![image-20200610150702026](images/image-20200610150702026.png)
$1
$2
   ![image-20200610150844712](images/image-20200610150844712.png)
$1
$2
   ![image-20200610151025938](images/image-20200610151025938.png)
$1
$2$1
$2
## Setting up Secret Server
$1
$2$1
$2
   ![image-20200610151801952](images/image-20200610151801952.png)
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2   
   ![image-20200610152423326](images/image-20200610152423326.png)
   
$1
$2$1
$2$1
$2$1
$2$1
$2
   > **Note:** If you have an outdated version .NET Framework (earlier than 4.6.2), you may see an error recommending you upgrade to fix the error. Reload the certificate after you do so.
$1
$2$1
$2$1
$2$1
$2$1
$2
## Setting up IDPs

IDP setup varies by provider. Click one of the following links for instructions for your provider:

> **Note:** You must be logged in to access these links.

- [How To Set Up Okta For SAML Integration](https://thycotic.force.com/support/s/article/SS-Setting-up-OKTA-for-SAML) (KBA)

- [How To Set Up OneLogin For SAML Integration](https://thycotic.force.com/support/s/article/SS-Setting-up-OneLogin-for-SAML) (KBA)

- [How To Set Up Okta For SAML Integration](https://thycotic.force.com/support/s/article/SS-Setting-up-OKTA-for-SAML) (KBA)

- [How To Set Up ADFS For SAML Integration](https://thycotic.force.com/support/s/article/SS-Setting-up-ADFS-for-SAML) (KBA)

> **Note:** The username returned from the IDP to SS within the SAML Response/Assertion's subject statement must match the desired format. The format of the username passed depends upon how the user was created within SS.

> **Note:** If AD Sync was used to create SS users, the username returned from the IDP must match this format: `SecretServerUsername@ADsyncDomain` or`ADsyncDomain\SecretServerUsername`. If using SLO, ensure that the NameID is set correctly in the IDP as an outgoing claim for the Secret Server Service Provider. If a user has different sAMAccountName and userPrincipalName in Active Directory, custom rules in the IDP can be created.

## Lockout Workaround

Locked Out? Here’s how you get around SSO. If during the configuration process for SAML you lock yourself (as an administrator or a user) out of SS, you can log on SS without using the SSO workflow by using this URL string:

`[YourSecretServerInstanceName]/login.aspx?preventautologin=true`

The role permission needed for this is “Bypass SAML Login,” which admins have by default.

 