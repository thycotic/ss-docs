[title]: # (Configure Azure Active Directory)
[tags]: # (Azure, Directory Service, Azure Active Directory)
[priority]: # (1003)

# Configure Azure Active Directory Domain

The steps below are used for adding an Azure Active Directory configuration to Directory Services.

## Add Azure Active Directory Domain

1. Navigate to **Admin | Directory Services**.

1. Click the **Add Domain** button.

1. Click the **Azure Active Directory Domain**.

1. Using the values saved from [Creating Azure App Registration](../create-azure-app-registration), paste or type in:

   - Friendly domain name
   - Tenant ID
   - Client ID
   - Client Secret

1. Ensure the **Active** check box remains checked.

1. (Optional) Click the **Multifactor Authentication** dropdown list to select your desired MFA.

1. Click the **Validate & Save** button. Once validation completes, you will see the Friendly domain name listed.

1. Click the name of the new domain to open the configuration page.

1. Click the **Groups** tab.

1. Click the **Edit** link next to **Synchronized Groups**.

1. Scroll to or search for each desired group containing users you want to sync in the **Select Groups** table.

1. Ensure each group's check box is **checked**.

1. Click the **Save** button to save your changes. You will now see the selected groups in the Synchronized Groups table.

1. Click the **Directory Services** breadcrumb link at the top of the page to navigate back to the Directory Services page.

1. Click the **Sync Now** button to sync the directory groups.
