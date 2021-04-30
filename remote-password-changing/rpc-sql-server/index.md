[title]: # (Remote Password Changing on SQL Server Accounts)
[tags]: # (Remote Password Changing, SQL Server)
[priority]: # (1000)

# Remote Password Changing on SQL Server Accounts

## Overview

This address using a SS privileged account to change SQL Server accounts. This enables taking over those accounts without knowing their password.

## Creating the Account

1. Open SQL Server Management Studio.

1. Connect to your database server.

1. Expand the root-level security folder.

1. Right-click the **Logins** folder and select **New Login**.

1. Give the account a log on name.

1. Select SQL authentication.

1. Go to SS.

1. Create a secret using the **SQL Server Account** template.

1. Assign it the desired username .

1. Click the **Generate** button on the secret password field to create a password.

1. Copy that password to the account creation wizard in SQL Server Management Studio.

1. Click the **OK** button to save the secret.

## Assign Permissions

1. In SQL Server Management Studio, go to **Security \> Logins** in the object explorer.
1. Right click on the SQL login object and select **Properties**. The Login Properties dialog box appears.
1. Select **Securables** in the **Select a page** list.
1. Find the **Alter any login** permission on the **Explicit** tab at the bottom of the dialog box.
1. Click to select the **Grant** check box for that permission.
1. Click the **OK** button.
1. Similarly, enable the **Control Server** permission. This is for changing the target logins that are members of the **sysadmin** fixed server role or grantees of this permission.

## Using the Account

1. In SS, open the SQL Server secret that you created.

1. Click the **Remote Password Changing** tab.

1. Click the **Edit** link.

1. Click to select **Privileged Account Credentials** in the **Change Password Using** selection buttons. The Privileged Account section appears.

1. Click the **No Secret Selected** link.

1. Select the secret you created earlier. The secret appears in the Privileged Account section.

1. Click the **Save** button.

1. Click the **Change password remotely** button.

1. Provide or generate a new password.

1. Click the **Change** button. You have now successfully changed a SQL Server account password using a privileged account.

> **Note:** You can also assign the account for use by multiple secrets by creating a secret policy and applying that policy to a folder.