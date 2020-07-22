[title]: # (Synching with OpenLDAP Directory Service)
[tags]: # (LDAP, directory service)
[priority]: # (1000)

# Synching with OpenLDAP Directory Service

OpenLDAP is a free, open source version of the Lightweight Directory Access Protocol (LDAP) developed by the OpenLDAP Project. This topic describes synching OpenLDAP to Secret Server (SS).

> **Note:** This feature is only supported by the new interface. The classic interface does not support OpenLDAP Directory Services.

1. Create a secret in SS of type **Active Directory Account**. This sync secret is used to synchronize users and groups. It requires permission to search and view the attributes of the users and groups. If you plan on using SS discovery, the account will also need permissions to scan computers on the network for accounts. Complete these parameters:

   - Domain. Example: `ldap.omega.thycotic.com`
   - Username. Example: `cn=ldap,dc=omegaldap,dc=local`
   - Password

1. Go to **Admin \> Directory Services**. The Directory Services page appears:

   ![image-20200722150331104](images/image-20200722150331104.png)

1. Click the **Add Domain** dropdown list and select **OpenLDAP Domain**. The OpenLDAP popup appears:

   ![image-20200722150621144](images/image-20200722150621144.png) 

1. Type the domain's FQDN in the **Fully Qualified Domain Name** text box. For example: `ldap.omega.thycotic.com`.
1. Type any name you desire in the **Friendly Name** text box.
1. Ensure the **Active** check box is selected.
1. Type the distinguished name (node path) in the **Distinguished Name** text box. For example: `dc=omegaldap,dc=local`
1. Click the **Authentication** dropdown list to select the **SOMETHING** authentication method.
1. Click the **No Secret Selected** link. The Select Secret popup appears.
1. Navigate to and select the secret you created earlier. The moment you click it, the popup disappears and the secret name appears in the Synchronization Secret section.
1. Click the **Site** dropdown list to select your site.
1. Click the **Multifactor Authentication** dropdown list to select the desired authentication method.
1. Click the **Validate & Save** button.

**How to check if you were successful? Can they use LDAPS? What authentication method should they use? Should they really create an AD account secret type, or is there going to be a dedicated LDAP type?**