[title]: # (Integrate Secret Server with Azure Active Directory)
[tags]: # (Azure, directory service, active directory)
[priority]: # (1000)

[display]: # (all)

Integrate Secret Server with Azure Active Directory
====================

Use these steps to integrate Secret Server with Azure Active Directory:

## Task 1: Configure Azure

1. Open a browser.

1. Navigate to the Microsoft Azure dashboard.

1. Click the **Azure Active Directory** menu item on the left and select **App registrations**. The App Registrations panel appears.

1. Click the **New registration** button. The "Register an application" page appears.

1. Type `Thycotic Secret Server` in the **Name** text box.

1. Click to select **Accounts in this organizational directory only – (Single tenant)** in the **Supported account types** selection button.

1. Click the **Register** button. An application registration is created.

1. Go the the Thycotic Secret Server App Registration page (**Home \> Default Directory - App registrations \> Thycotic Secret Server**).

1. Copy and save both the **Application (client) ID** and **Directory (tenant) ID** for later.

1. Click the **Add a Redirect URI** link on the same page. The Redirect URIs page appears.

1. Set a redirect URI for `https://{Secret Server URL}/signin-oidc` and set it to a **Web** type.

1. Click to enable the **Implicit Grants** check boxes for both **Access tokens** and **ID tokens**.

1. Click the **Certificates & secrets** menu item on the left.

1. Click the **+ New Client Secret** button to add a new client secret.

1. Copy the client secret value, and save it for later.

1. Click the **API Permissions** menu item. The API Permissions page appears.

1. Click the **Add a Permission** button. The "Request API permissions" page appears.

1. Click the **Microsoft Graph** button. Another Request API permissions page appears.

1. Add the following permissions:
   * Group.Read.All
   * GroupMember.Read.All
   * Member.Read.Hidden
   * User.Read.All

1. If necessary, add the User.Read delegate permission.

1. Click the **Grant admin consent** link in the **Grant consent** section.

## Task 2: Configure Secret Server and Sync

1. Go to **Admin \> Directory Services**. The Directory Services page appears.

1. Click the **Add Domain** button and select **Azure Active Directory Domain**. The Azure Active Directory popup appears.

1. Using the values you copied earlier during the app registration, paste or type in:

   - Friendly domain name

   - Tenant ID

   - Client ID

   - Client secret

1. Ensure the **Active** check box remain selected.

1. (Optional) Click the **Multifactor Authentication** dropdown list to select your desired MFA.

1. Click the **Validate & Save** button. The popup disappears, and the domain appears in the table.

1. Click the name link of the new domain in the table. The domain's page appears.

1. Click the **Groups** tab.

1. Click the **Edit** link next to **Synchronized Groups**. The Select Groups table appears.

1. Scroll to or search for each each desired group, which contains users you want to sync, in the **Select Groups** table.

1. Ensure each group's check box is selected.

1. Click the **Save** button to save your changes. The Select Groups table disappears, and your newly selected groups appear in the Synchronized Groups table.

1. Click the **Directory Services** breadcrumb link at the top of the page. The Directory Services page appears.

1. Click the **Sync Now** button to sync the directory.
