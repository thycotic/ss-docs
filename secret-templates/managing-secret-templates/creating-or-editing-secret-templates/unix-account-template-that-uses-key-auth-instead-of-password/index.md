[title]: # (Creating a Unix Account Secret Template that Uses Key Authentication Instead of a Password)
[tags]: # (Unix Account,Key Authentication,Password)
[priority]: # (1000)

# Creating a Unix Account Secret Template that Uses Key Authentication Instead of a Password

To create a Unix account secret template that uses key authentication only instead of a password, begin by using an existing **Unix Account (SSH)** template as a baseline.

## Create the New Template

1. Go to **Admin \> Secret Templates**.

1. Select the built-in **Unix Account (SSH)** template from the drop-down menu and click **Edit**.

   ![image-select-unix-account-ssh](images\select-unix-account-ssh.png)

1. On the **Secret Template Designer** page, scroll to the bottom and click **Copy Secret Template**.

1. Give the new template an appropriate name, such as *Unix Account Without Password (SSH)* or *Unix Account Key Authentication Only (SSH)*.

   ![image-name-template](images\name-template.png)

1. Click **OK**.

1. On the **Secret Template Copied** confirmation page, click **Continue**. 

   ![image-secret-template-copied](images\secret-template-copied.png)

1. On the **Secret Template Designer** page, scroll down to the **Fields** section and under **Field Name**, find the **Password** row.

    ![image-fields-field-name-password](images\fields-field-name-password.png)

1. At the right end of the **Password** row, click the **Edit this field** icon    ![image-edit-this-field](images\edit-this-field.png)

1. In the **Password** row under **IS REQUIRED**, uncheck the box. Optionally, you can also select **Not Editable** from the **Edit Requires** drop-down list.

    ![image-is-required](images\is-required.png)

1. At the right end of the **Password** field, click the **Save this field** icon ![image-dave-this-field](images\save-this-field.png)

You now have a Unix account (SSH) Secret template that displays key authentication fields instead of a password field. 

## Disable **Remote Password Changing** and **Heartbeat**

Your new template has inherited characteristics from the **Unix Account (SSH)** template you based it on, including having **Remote Password Changing** and **Heartbeat** enabled by default. But because your new template has no password, it cannot be remotely changed and heartbeat cannot validate on an empty password. Therefore, you must disable these features by editing your new template using the procedure below:

1. In the **Secret Template Designer** window, scroll to the bottom and click **Configure Password Changing**.

1. In the **Secret Template Edit Password Changing** window, click **Edit**.

   ![image-edit-password-changing](images\edit-password-changing.png)

1. In the next **Secret Template Edit Password Changing** window:

   1. Uncheck **Enable Remote Password Changing**.

   1. Uncheck **Enable Heartbeat**.

   ![image-disable-rpc-heartbeat](images\disable-rpc-heartbeat.png)

1. Click **Save**.

>**Note** Some Secrets based on the **Unix Account (SSH)** might display the **Password** field as well as the **Private Key** and **Private Key Passphrase** (key authentication) fields. If a user signs in using this template with correct credentials in the key authentication fields but a blank or incorrect password in the Password field, the default PuTTY launcher will use key authentication to connect.
