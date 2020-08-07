[title]: # (Setting up Secret Templates for Secret Expiration)
[tags]: # (Expiration,Secret Templates)
[priority]: # (1000)

# Setting up Secret Templates for Secret Expiration

To set up expiration on a secret, you must first enable expiration on the template from which the secret is created.

To enable secret expiration for a secret template:

1. Navigate to **Admin \> Secret Templates**.

1. On the **Manage Secret Templates** page, select the template from the dropdown list.

1. Click the **Edit** button.

1. On the **Secret Template Designer** page, click on the **Change** link.

1. On this subsequent page, click to select the **Expiration Enabled?** check box.

1. Enter the expiration interval (every x number of days), as well as the text field on the secret you wish to expire and require to be changed.

> **Note:** You can override the interval setting for individual secrets.

> **Note:** Enabling expiration for a template enables expiration for all the secrets that were created using that template.
