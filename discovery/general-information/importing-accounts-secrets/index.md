### Import

The **Import** dialog wizard will guide you through importing an account as a Secret.

§ **Secret**  Select the Secret Type, Folder, and Secret Naming format for the Secret that will be created.

§ **Password**  If you know the current password for the selected accounts, leave that option selected, if you want SS to change the password on the account as it creates the Secret, select the other option. This will allow you to choose a password for all new Secrets, or to have SS randomly generate a new password for each new Secret created.

§ **Import Password**  If applicable, enter the new password for the Secrets to be created. Select the privileged Secret or Secrets that will be used to perform the initial password change on the account. 

For Unix accounts, select the Password Type command set that will be used to take over the account. You can hold your cursor over the ‘eye’ icon to see the commands that will be used to change the password.

§ **Password Changing**  For Windows accounts choose whether this account will change its own password after the initial change, or if it will use a privileged account. For Unix rules, if prompted, decide which associated Secrets will be used as a part of the password change.

​                                   

Figure 31  Import Accounts Wizard