[title]: # (Syncing with OpenLDAP Directory Service)
[tags]: # (LDAP, directory service)
[priority]: # (1000)
[display]: # (all)

# Syncing with OpenLDAP Directory Service

## Introduction

OpenLDAP is a free, open source version of the Lightweight Directory Access Protocol (LDAP) developed by the OpenLDAP Project. This topic describes syncing OpenLDAP to Secret Server (SS).

> **Note:** This feature is only supported by the new interface. The classic interface does not support OpenLDAP Directory Services.

## Unsupported Use Cases

### Anonymous User Authentication

We do not support anonymous user authentication:

When creating an OpenLDAP directory service, “Anonymous” is a supported authentication method.  When this is chosen, SS connects anonymously to the OpenLDAP directory service as configured during the synchronization process and creates any users found on the directory service.  

When anonymous is selected, a secondary authentication option, "User Authentication," appears, which is the method used when the synchronized users attempt to authenticate to SS. In short, user authentication cannot be anonymous because SS does not allow anonymous access.

The valid options for user authentication when anonymous is selected for the synchronization process are “Basic,” “Kerberos,” or “No Authentication.” “No Authentication” supports using an OpenLDAP directory service as a user directory while enabling alternative methods of authentication, such as SAML.

### Duplicate User Attributes

We do not support configurations where using different attributes yield users with the same username, GUID, or user principal name (email address format—not necessarily an actual email address). These must all be unique to each user. If a duplicate exists, it may result in odd, unpredictable behavior from the application.

## Procedure
$1
$2
   - Domain. Example: `ldap.omega.thycotic.com`
   - Username. Example: `cn=ldap,dc=omegaldap,dc=local`
   - Password
$1
$2
   ![image-20200722150331104](images/image-20200722150331104.png)
$1
$2
   ![image-20200722150621144](images/image-20200722150621144.png) 
$1
$2$1
$2$1
$2$1
$2$1
$2
   - Basic  authentication requires that valid credentials are assigned as the sync secret. Those credentials are used to authenticate to the OpenLDAP system on each sync. 
   - Anonymous authentication does not require valid credentials and removes the Synchronization Secret section. Instead, it exposes a User Authentication field.

   > **Note:** The Kerberos authentication method probably works but has not been test by Thycotic.
$1
$2
   1. Click the **No Secret Selected** link in the Synchronization Secret section. The Select Secret popup appears.
   1. Navigate to and select the secret you created earlier. The moment you click it, the popup disappears and the secret name appears in the Synchronization Secret section.
$1
$2
   - Basic authentication requires valid OpenLDAP account credentials.
   - No authentication is for when customers want users synced from OpenLDAP but use authentication through another service, such as SAML. We do *not* support anonymous authentication for security reasons.
$1
$2$1
$2$1
$2$1
$2