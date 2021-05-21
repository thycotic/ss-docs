[title]: # (Creating a Custom SSH Password Changer)
[tags]: # (custom,remote,ssh,password changer)
[priority]: # (1000)

# Creating a Custom SSH Password Changer

To create a custom SSH password changer for a device that supports changing passwords via SSH, follow the procedure below.

>**Note:** Before creating the password changer and attempting to change a password through Secret Server, we recommend that you test the command set you are using over SSH directly.

1. From the **Admin** menu, select **Remote Password Changing**.

1. Click **Configure Password Changers**, then scroll to the bottom of the page and click **+New**.

   ![image-configure-password-changers](images\configure-password-changers.png)

1. Choose a **Base Password Changer** that ends with **(SSH)** with a command set similar to the one you are adding.

   ![image-base-password-changer](images\base-password-changer.png)

1. Give your new password changer a **Name** and then click **Save**.

1. Edit the **Password Change Commands** to contain the command set you need.

   Use the **Delete** button to remove a row, the **Edit** button to modify a row, or the arrow buttons to move a row.

   ![image-edit-commands](images\edit-commands.png)

1. Edit the **Verify Password Changed Commands** to contain the command to check that the password is valid.

   These commands are used by Heartbeat and after a password change to verify that the change was successful.

1. When you are done editing the commands, scroll to the bottom and click **Back**.

## A Note About Commands

Any term in these commands preceded by `$` will reference a Secret template field.
Any term preceded by `$[1]$` refers to the Secret template field of a linked Secret.
If you need to reference a Secret template field, make sure you are using the exact Secret template field name.

To use the password changer, you will need to assign it to a Secret template. See *Assigning a Password Changer to a Secret Template.
