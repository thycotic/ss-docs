[title]: # (Creating a Custom AS/400 Password Changer in Secret Server 10.5)
[tags]: # (create,custom,password changer,ibm,as/400)
[priority]: # (1000)

# Creating a Custom Password Changer for IBM AS/400

>**Note**: Password changing on the IBM AS/400 can be performed through SSH, which is installed by default. If you are using an earlier version, you will need to install SSH.

To create a custom password changer for IBM AS/400 on newer systems such as i7, use the procedure for [Creating a Custom Password Changer](../creating-a-custom-password-changer/index.md) but be sure to use the following SSH command:

* Command: system `CHGUSRPRF $USERNAME PASSWORD($NEWPASSWORD)`

* Comment: Set Password on account

* Pause(ms): 2000

For additional information, see [Securing Communications
with OpenSSH on IBM i5/OS](https://www.redbooks.ibm.com/redpapers/pdfs/redp4163.pdf).

## Creating a Custom Password Changer for IBM AS/400 in Secret Server 10.5.

The procedure for creating password changers in Secret Server 10.5 for the IBM AS/400 terminal includes using the 5250 terminal connection and scripting to perform the password change and heartbeat.

To create this IBM AS/400 password changer, start with an existing z/OS Mainframe password changer as a baseline, then modify the changer commands. You also need to create an AS/400 secret template using the z/OS secret template as a baseline, then modify the template to use the new password changer.

>**Note**: Support for this feature, including script customization for advanced requirements, is available only through professional services.

### Configuration

Follow the procedure below, in the sequence presented.

#### Create an AS/400 password changer from an existing z/OS Mainframe password changer:

1. Browse to **Admin \> Remote Password Changing \> Configure Password Changers**.

1. Scroll to the bottom and select **New**.

1. For the **Base Password Changer**, select the **z/OS Mainframe**.

1. In the **Name** field, enter `AS/400 IBM iSystem`

    ![image-new-pw-changer](images\new-pw-changer.png)

1. Click **Save**.

#### Modify the AS/400 IBM iSystem password changer commands:

To add custom password changer commands to the AS/400, you must replace the existing standard z/OS mainframe command set.

1. Browse to **Admin \> Remote Password Changing \> Configure Password Changers**.

1. Click the **AS/400 IBM iSystem** password changer you just created.

1. On the **AS/400 IBM iSystem** page, scroll to the bottom and click the **Edit Commands** button. The commands that appear initially on the **Verify Password Changed Commands** page represent the standard z/OS Mainframe command set. You can use these commands as a baseline but you must customize them to suit your environment.

    ![image-edit-pw-changer-commands](images\edit-pw-changer-commands.png)

1. Click the **Back** button when you have finished customizing your password changer commands, to return to the **AS/400 IBM iSystem** password changer page.

#### Modify the AS/400 password changer for 5250 emulation and commands:

1. On the **AS/400 IBM iSystem** page, scroll to the bottom and click the **Edit** button.

1. On the **Edit Password Changer** page, check the box next to **Use SSL** (recommended).

1. Set the **Custom Port** to `992`.

     ![image-edit-pw-changer](images\edit-pw-changer.png)

For extra troubleshooting assistance, you can add TRACE to the connection string to have a trace file written to the Secret Server website or engine.

#### Create an AS/400 template from the z/OS Secret Template:

1. Browse to **Admin \> Secret Templates**.

1. On the **Manage Secret Templates** page, select **z/OS Mainframe** from the drop-down menu and click **Edit**.

1. On the **Secret Template Designer** page, scroll to the bottom and click **Copy Secret Template**.

1. On the **Name New Secret Template** page, enter `AS/400 IBM iSystem` in the **Name** field.

   ![image-name-new-secret-template](images\name-new-secret-template.png)

1. Click **OK**.

1. On the confirmation screen, click **Continue**.

   ![image-secret-template-copied](images\secret-template-copied.png)

#### Modify the AS/400 Secret Template to use the AS/400 Password Changer:

1. Browse to **Admin \> Secret Templates**.
1. On the **Manage Secret Templates** page, click the drop-down menu and select the new **AS/400 IBM iSystem** secret template you just created.

   ![image-drop-down-as400](images\drop-down-as400.png)

1. Click **Edit**.

1. On the **Secret Template Designer** page, scroll to the bottom and click **Configure Password Changing**.

1. On the **Secret Template Edit Password Changing** page, click **Edit**.

    ![image-secret-template-edit-pw-changing](images\secret-template-edit-pw-changing.png)

1. On the second **Secret Template Edit Password Changing** page, select **AS/400 IBM iSystem** from the **Password Type to Use** drop-down menu.

     ![image-pw-type-as400](images\pw-type-as400.png)

1. Click **Save**.

Your can now create secrets using your new template and password changer in Secret Server 10.5.

If you would like to test your template and password changer but you do not have access to an AS/400 IBM iSystem, you can use the website [PUB400.com](https://PUB400.com).
