[title]: # (Creating and Using a SQL Server Privileged Account)
[tags]: # (Setup,Install,sql server)
[priority]: # (1000)
[display]: # (All)

# Creating and Using a SQL Server Privileged Account  

## Overview

This document enables a user to password change SQL accounts using a privileged account. Enabling the takeover of those accounts without knowing their password.

## Procedure

### Task 1: Creating an Account

1. Open SQL Server Management Studio and connect to your database server.

1. Expand the root level security folder.

1. Right click on the **Logins** folder and select **New Login**.

1. Type the account's login name in the **Login Name** text box.

1. Click to select the **SQL Authentication** selection button.

1. Go to Secret Server.

1. Create a secret using the **SQL Server Account** template.

1. Give it the same username as the login name you just created. 

1. For best security, click the **Generate** button on the secret password field and copy that password to the account creation wizard in SQL Server Management Studio.

1. Click **OK** button to save your secret. 

### Task 2: Assigning Permissions

1. Return to SQL Server Management Studio and connect to your database server.

1. Right click the SQL login and click **Properties**. 

1. Select **Securables** in the left column.

1. In the **Permissions** table on the **Explicit** tab, click to select the **Grant** check box for the **Alter any login** row.

1. Click the **OK** button.

### Step 3: Using the Account  

1. In Secret Server, select the SQL account secret for your new privileged account. 

1. Select the **Remote Password Changing** tab.

1. Click the **Edit** button.

1. Click to select **Privileged Account Credentials** on the **Change Password Using** selection button.

1. Click the **No Selected Secret** link. The Select a Secret popup appears.

1. Locate and select the secret you created earlier in the folder tree.

1. Click the **Save** button. The popup disappears.

1. Click the **Change Password Remotely** button.
 
1. Provide or generate a new password.
 
1. Click the **Change** button. You have now successfully changed a SQL account password using a privileged account.

>**Note:** You can also assign an account for multiple secrets by creating a secret policy and applying that policy to a folder.
