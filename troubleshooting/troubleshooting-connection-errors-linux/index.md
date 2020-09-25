[title]: # (Troubleshooting Heartbeat and RPC Connection Errors for Linux Secrets)
[tags]: # (troubleshooting, workaround, rpc, heartbeat, linux)
[priority]: # (1000)
[display]: # (content)

# Troubleshooting Heartbeat and RPC Connection Errors for Linux Secrets

 When creating custom SSH secret templates in Secret Server (SS), you may run into connection errors such as this:

`Connection Failed - Connection lost (error code is 10058)` 

Please follow these steps to address that. You start with heartbeat and then address Remote Password Changing (RPC). 

> **Note:** See [Troubleshooting SSH Issues](../ssh-issues/index.md) for other SSH issues.

## Step 1: Testing Ports and Connectivity Outside of Secret Server

To determine if the heartbeat issue is outside of SS: 

1. Go to the errant secret in SS.

2. Scroll down to the **Advanced Information** section. You may have to click the **Advanced** link.

3. Note the **Site** parameter.

4. Go to **Admin \> Distributed Engine**.

5. Click the **Manage Sites** button. The Manage Sites page appears:

   ![image-20200924110057729](images/image-20200924110057729.png)

6. Click the **Site Name** link for the site. The Site View page appears.

7. Note the **Processing Location** parameter for the site. 

8. If the processing location is **Website**, do your testing on the SS application server. If it is **Distributed Engine**, do your testing on the distributed engine machine.

9. In PowerShell run the following command for the machine you are trying to connect to from the secret:

   `Test-NetConnection -ComputerName <computer_name> -Port 22`

   > **Note:** If you chose a custom port, that port will need to be changed on the RPC too.

10. If the test was successful, you now know the connection works outside of SS—proceed to the next step. If it was not successful, contact your networking team to open the port and test the connectivity. They can refer to [Ports Used by Secret Server](../../networking/secret-server-ports/index.md). 

## Step 2: Testing Heartbeat and RPC in Secret Server

Now that you know the issue is within SS, do the following:

1. Return to the secret on SS.

3. Click the **Remote Password Changing** tab of the secret (not shown). 

4. Check the **Associated Secret** section to see if there is an associated account set on the secret for use with RPC:

   ![img](images/clip_image003.jpg)

1. Return to the **General** tab for the secret.

1. Note the **Secret Template** type.

1. Determine the password type for the template:

   1. Go to **Admin > Secret Templates**. 

   1. Click to select the desired template in the dropdown list.

   1. Click the **Edit** button. The Secret Template Designer page appears (not shown).

   1. Click the **Configure Password Changing** button at the bottom of the page. The Secret Template Edit Password Changing page appears:

      ![image-20200903110110639](images/image-20200903110110639.png)

   1. Note the password types used, the applicable secret field, and the equivalent script variable. These indicate reserved variables that reference fields in the secret, in this case, $USERNAME, $MACHINE and $PASSWORD. You will need to test your script using known-good values for these.

1. Go to **Admin > Remote Password Changing**. The Remote Password Changing Configuration page appears (not shown).

1. Click the **Configure Password Changers** button. The Password Changes Configuration page appears:

   ![image-20200903110538587](images/image-20200903110538587.png)

1. Click the name link for the same password changer. The password changer page for that changer appears:

   ![image-20200924134208538](images/image-20200924134208538.png)

1. The **Verify Password Changed Commands** section defines the secret fields and commands to use to confirm that a password has rotated (changed) successfully on the target machine. The **Password Change Commands** section defines the secret fields and commands to use to change the password on the target machine.

1. Determine the port used by the password changer: WHERE IS THIS PORT NUMBER USED? IF YOU COPY A PASSWORD CHANGER, ISN'T THE PORT PASSED ON?

    1. Click the **Edit** button at the bottom of the page. The Edit Password Changer page appears: 

       ![image-20200924114219847](images/image-20200924114219847.png)

    2. If a port for the RPC is listed in the **Custom Port** text box, note it for future use.

         > **Note:** this port must match the port you intend to use for heartbeat and RPC to function. 

      3. Click the **Cancel** button to return to the previous page.

1. The **Verify Password Changed Commands Test Action** button tests the defined password-changed verification listed under it. When clicked, it uses the "Authenticate As" parameters to connect to the account and run the commands to test for a heartbeat and check that the account and password is valid.

   > **Note:** This authenticates with a non-privileged associated secret and then uses that account to connect to the Linux machine. This is needed because root accounts are often unable to directly authenticate. Thus, several commands are run to test if the active account can be set to root. If that fails, heartbeat fails.

1. In the example command set for the section, when the heartbeat runs, the associated  account ($[1]$USERNAME) is authenticated, logs into the remote SSH device, and runs:

      1. `su $USERNAME` (sets the active account to that in the secret)

      1. `$CURRENTPASSWORD` (provides the current password for that account)

      1. `whoami` (returns the name of the active user, which indicates the su command and the provided parameters worked)

      1. A test that checks that the returned username is the same as the username field in the secret. If it is not, the heartbeat fails.

   > **Note:** Some of the command sets run by the "Verify Passwords Changed Test Action" button are empty. In that case, the test authenticates with the provided username and password, and if that is successful, so is the heartbeat. That is, the heartbeat uses the secret's own account ($USERNAME) and value to connect, rather than those of an associated secret.

   > **Note:** If the RPC is set up to use an associated secret but the secret does not have one, the secret fails to rotate and throws an error.

   > **Note:** For more on how SS interprets what values to supply your custom script from the secrets involved, see [Editing Custom Commands](../../remote-password-changing/custom-password-changers/editing-custom-commands/index.md) and the [Remote Password Changing Guide](https://thycotic.force.com/support/s/article/SS-Remote-Password-Changing-Guide) (KBA).

14.  When you click the **Verify Password Changed Commands Test Action** button, the commands cannot read the fields from a secret or associated secret because when setting up the password changer no specific secrets are calling it. Instead, for the test only, you must manually provide the input parameters from your secrets. When you click the button a popup appears for you to do just that:

       ![image-20200925105255827](images/image-20200925105255827.png)

15.  Type or select your parameters and click the **OK** button. The password-changed command set is tested with a simulated heartbeat, using what you entered. If any errors occur, record them for troubleshooting later. Your console output should look something like this:

     ![image-20200925111048690](images/image-20200925111048690.png)

16.  The **Password Change Commands** section defines the secret fields and commands to use to rotate (change) a password on the target machine. 

17.  Click the Password Change Commands Test Action button to rotate the password on the target machine. Similar to the **Verify Password Changed Commands Test Action** button, you must manually provide the input parameters:

       ![](images/image-20200904102546044.png)

       A password rotation occurs. If any errors occur, record them for troubleshooting later.

       > **Important:** Doing this really changes the password on the target machine, so record what you change it to, and update the secret with the new password (assuming the RPC is successful).

18.  If either of the test action buttons, resulted in failure, go to the next step:

## Step 3: Troubleshooting Heartbeat and RPC Outside of Secret Server

1.  Use the procedure from Step 1 to determine which machine or DE to perform this step on.

2.  If you did not already, [Download PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html) on the application or any of the DE servers. 

3. Open a browser tab containing the secret which is failing to Heartbeat or RPC.

4. Do the same for each associated secret for the parent secret.

5.  Go to **Admin > Remote Password Changing**. The Remote Password Changing Configuration page appears (not shown).

6. Click the **Configure Password Changers** button. The Password Changes Configuration page appears:

      ![image-20200903110538587](images/image-20200903110538587.png)

7. Click the name link for the subject password changer. The password changer page for that changer appears:

      ![image-20200924134208538](images/image-20200924134208538.png)

8. The **Verify Password Change Commands** section applies to heartbeat, and the **Password Change Commands** section applies to RPC.

9. Return the SS or DE server you are testing.

10. Launch PuTTY.

11. Type the host name or IP address of the subject Linux machine (the Machine field in the secret).

12. Log on as root, or if you have an associate secret on the SSH secret, use it to log on.

13. Look at the **Authenticate As** sections in the RPC page. If the $USERNAME and $PASSWORD (or $CURRENTPASSWORD) variables are present, you are dealing with the parent secret. If $[1]USERNAME and $[1]PASSWORD variables are present, you are dealing with an associated secret.

14. Back the the PuTTY command prompt, log on using the secret or associated secret log on parameters.

       > **Note:** If you are successful with connecting with PuTTY but not SS, launch PuTTY in in debug mode and collect a log file. Determine what cipher was used to connect. If you have a machine that works with SS, compare the ciphers. Also check if the endpoint handles interactive logins differently. SS’s logins for RPC are non-interactive. See [Troubleshooting SSH Issues](../ssh-issues/index.md)  for more information about troubleshooting connection issues in Putty.

15. Replicate and run the heartbeat or RPC commands from the RPC Authenticate As sections in PuTTY. For example:

       ![image-20200925114340798](images/image-20200925114340798.png)

    In this example, we assumed the secret contained a value of "root" for the Username field, and the associated account in the first position was "testuser." This example was successful because the $$CHECKFOR $USERNAME found "root" on the previous line.

    If the `su root` command were to fail above and reports the message "Username is not in the sudo userers file. This incident will be reported." then the $$CHECKFOR would fail and the heartbeat would fail to verify. This type of issue needs to be remediated on the endpoint.

16. If you suspect the problem is an endpoint issue, remediate it and repeat the commands in PuTTY.

17. Once the commands work properly in PuTTY, if the RPC or heartbeat command set needs adjustment to match the working PuTTY equivalent, return to SS and make the changes to the command set (see the next step). 

   > **Important:** Before you change the RPC commands, ensure that the device that you are working on belongs to the secret template you are using. Secret templates dynamically update all the secrets based on them, so **all secrets with this template are affected by your changes**. We strongly recommend that if this device is unique or you are storing an independent root account in the associated secret template, you should:
   >
   > 1. Copy the template you are using, giving the copy a descriptive name.
   > 1. Create a new password changer based on the current one that you are using. 
   > 1. Assign it the the secret template you just created.
   >
   > This ensures that you do not change how ALL devices related to a secret template when you only intend to change a single devices. Accounts that are the same type on the same device should share the same template. 

## Step 4: Update the Command Sets in Secret Server

1. If you are not already on the subject password changer's page:

   1. Go to **Admin > Remote Password Changing**. The Remote Password Changing Configuration page appears (not shown).

   1. Click the **Configure Password Changers** button. The Password Changes Configuration page appears:

      ![image-20200903110538587](images/image-20200903110538587.png)

   1. Click the name link for the same password changer. The password changer page for that changer appears:

      ![image-20200903110755640](images/image-20200903110755640.png)

   1. Scroll down to the **Password Change Commands** or **Verify Password Changed Commands** sections.

1. Click the **Edit Commands** button at the bottom of the subject password changer page. The commands for RPC and heartbeat appear:

   ![image-20200925141910284](images/image-20200925141910284.png)

1. Click the blue edit icon to the right of any commands you want to change. The command becomes editable.

1. Edit the command to make it match your known-good revision.

1. Click the blue save icon next to the amended command.

1. Click the **Back** button to return to the password changer page:

   ![image-20200903110755640](images/image-20200903110755640.png)

1. Click the applicable Test Action button to test your new command set. Remember, the **Password Change Commands Test Action** button changes the password on the subject server. One of the Test Action popups appears.

1. Type the known-good values from the secret in the text boxes.

1. Click the **OK** button. The result should look something like this:

   ![image-20200925111048690](images/image-20200925111048690.png)

      