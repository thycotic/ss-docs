[title]: # (Setting Up Azure AD for SAML)
[tags]: # (directory services,active directory,sso,single sign-on)
[priority]: # (1000)
[display]: # (all)

# Setting Up Azure AD for SAML

## Configuration Steps

1. Log into your portal.azure.com account.

1. Navigate to **Azure Active Directory**.

1. Navigate to **Enterprise Applications**.

1. Select **New Application**.

1. Select **Non-gallery application**.

1. Give your new IdP application a name and click **Add**.

1. Click **Single sign-on**.

1. In the dropdown, select **SAML-based Sign-on**.

1. If you haven't done so already, download the Secret Server metadata file named `SecretServerSAMLMetadata.xml` file from `[YourSecretServerInstance.Name]/samlmetadata`.

1. Click **Upload metadata file** and upload the Secret Server Metadata file you previously.

1. Click **Save**.

1. Scroll down and click **Metadata XML** to download the metadata for this application.

1. Go back to **Azure Active Directory** and click on **App registrations**.

1. Select your Azure Identity Provider (IdP) application.

   If you don't see the application immediately, you might need to click **View all Applications**.

1. Click **Settings \> Properties**, then enter the Logout URL field for your instance. The form for this URL will be: `https://[YourSecretServerInstanceName]/saml/SLOService.aspx`.

1. Click **Save**.

1. Navigate to your Secret Server instance and to the **Admin \> Configuration \> SAML** tab.

1. Click **Create New Identity Provider**.

   ![image-azure-ad-saml1](images\azure-ad-saml1.png)

1. Click **Import IdP from XML Metadata**.

   ![image-](images\azure-ad-saml2.png)

1. Select the Azure AD metadata you saved/downloaded previously to import it.

   If you don't see the file immediately, make sure the file type specified for your search is .xml.

## Adding Users to Single Sign-On in Azure AD

For users to be authenticated by the SSO workflow you are setting up, Secret Server usernames must match Azure AD usernames. If you manually add usernames to Secret Server or Azure AD, you must inspect them carefully to ensure that they match. You can also use Secret Server Discovery to sync Secret Server usernames in bulk with Azure AD usernames.

1. Log into your portal.azure.com account.

   Navigate to **Azure Active Directory > Enterprise Applications** and select your IdP from the list

1. Select **Users and groups** and **Add User**.

1. Click **Users and groups/None Selected**.

1. Search for the user you want to add to your SAML workflow. (Note that any users added must also exist in your Secret Server instance. Usernames must match between the systems).

1. Click **Select** at the bottom, then **Assign**.

This user should now be able to use the Single Sign-On workflow. To test this, log into Azure AD as the user, then browse to your Secret Server instance. The user should be logged into Secret Server automatically without being prompted again for login credentials.

## Advanced Settings

The following Secret Server Identity Provider Advanced Settings can be configured in Azure AD.

1. Log in to portal.azure.com.

1. Navigate to **Azure Active Directory > Enterprise Applications**.

1. Select your IdP, then click **Single sign-on**.

1. Scroll down and check the box for **Show advanced certificate signing settings**. checkbox.

1. Click the drop-down arrows to reveal options.

   These advanced options correspond with advanced options in *Secret Server **Admin > Configuration > SAML** tab.

1. Click **Advanced Settings** next to your identity provider.

Require Signed SAML Response/

Require Signed Assertion/

Require Signed Assertion Or Signed SAML Response
