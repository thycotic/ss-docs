[title]: # (Creating a Custom Password Changer)
[tags]: # (custom,remote,password changer)
[priority]: # (1000)

# Creating a Custom Password Changer

To create a custom password changer, follow the procedure below.

>**Note:** Before creating the password changer and attempting to change a password through Secret Server, we recommend that you test the command set you are using directly.

1. From the **Admin** menu, select **Remote Password Changing**.

1. Click **Configure Password Changers**, then scroll to the bottom of the page and click **+New**.

   ![image-configure-password-changers](images\configure-password-changers.png)

1. Choose a **Base Password Changer** with a command set that most closely matches the type of password changer you are creating, as this determines which customizable parameters and test actions are available to you. To create a custom SSH password changer, choose a base password changer with a name that ends in `(SSH)`.

   ![image-base-password-changer](images\base-password-changer.png)

1. Give your new password changer a **Name** and click **Save**.

1. Edit the **Password Change Commands** to contain the command set you need.

   * Use the Delete button to remove a row.
![image-delete](images\delete.png)
   * Use the Edit button to modify a row.
![image-edit](images\edit.png)
   * Use the up and down arrows to move a row.
![image-move](images\move.png)
   * Use the Plus button to save a row.
![image-save](images\save.png)

   ![image-edit-commands](images\edit-commands.png)

1. Edit the **Verify Password Changed Commands** to create the command set for checking that the password is valid. These commands are used by Heartbeat and after a password change to verify that the change was successful.

1. When you are finished editing the commands, scroll to the bottom and click **Back** to return to the overview screen and access test actions for your new password changer. To edit advanced commands and settings, see the instructions below.

## Advanced Post Change Commands

To modify advanced post change commands, do the following:

1. Scroll to the bottom of the page and click **Advanced Post Change Commands**.

   ![image-advanced-links](images\advanced-links.png)

1. Change the commands as desired in the under **Post Successful Change Commands** and **Post Failure Change Commands**.

   ![image-advanced-post-change-commands](images\advanced-post-change-commands.png)

## Advanced Settings

To modify advanced settings, do the following:

1. Scroll to the bottom of the page and click **Advanced Settings**.

1. Change the settings as desired in the under **Post Successful Change Commands** and **Post Failure Change Commands**.

   ![image-advanced-settings](images\advanced-settings.png)

>**Note**: Before attempting to change a password through Secret Server using your new custom password changer, we recommend that you test the command set you are using.

## A Note About Commands

Any term in these commands preceded by `$` will reference a Secret template field. Any term preceded by `$[1]$` refers to the Secret template field of a linked Secret. If you need to reference a Secret template field, make sure you are using the exact Secret template field name.

To use your new password changer, you will need to assign it to a Secret template. See [Assigning a Password Changer to a Secret Template](../../assign-a-pw-changer-to-a-secret-template/index.md).
