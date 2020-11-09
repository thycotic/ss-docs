[title]: # (Configuration Parameters)
[tags]: # (Azure, directory service, Azure Active Directory)
[priority]: # (1000)

# Configuration Parameters

Azure Active Directory (_Azure AD_) configuration can be enabled by a user with the Administer Active Directory role. To change these settings, select **Directory Services** from the **Administration** menu, click the **Domain Name** associated with your Azure AD directory, and then click **Edit**.

The required configuration screen settings:

- **Domain Name:** A friendly display name for the Azure Directory.

- **Active:** Enable or disable the Azure Active Directory domain integration.

- **Tenant ID:** Globally unique identifier (GUID) value assigned to the Azure AD directory.

- **Client ID:** Globally unique identifier (GUID) value assigned to the Client Secret upon creation. Also referred to as the _Application ID_.

- **Client Secret:** Unique, generated string for the Client Secret. _This value can only be retrieved upon creation._

Optionally you can also configure the following:

- **Multifactor Authentication:** Drop-down selection for the desired MFA.