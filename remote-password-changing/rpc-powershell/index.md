[title]: # (Remote Password Changing with PowerShell)
[tags]: # (Remote Password Changing, PowerShell)
[priority]: # (1000)

# Remote Password Changing with PowerShell

## Overview


As of version 8.8, Secret Server supports running PowerShell scripts for Remote Password Changing (RPC) and heartbeat. Below are the steps for creating an Active Directory (AD) password changer that uses PowerShell scripts.  The example is meant as a simple guide for how to wire-up the template to scripts as a proof of concept.  Your actual PowerShell password changer scripts may be more complex depending on your environment and needs.

> **Important:** Before  you begin, please ensure password changing and heartbeat are enabled in **Admin \> Remote Password Changing** and review the information on [Configuring CredSSP for use with WinRM/PowerShell](../../authentication/configuring-credssp-for-winrm-with-powershell/index.md), which will be necessary for most PowerShell password changing tasks.

## Procedure

The PowerShell scripts are created and accessed through the **Admin > Scripts** page. To create a PowerShell password changer, you need to create two scripts. The first script verifies the account's current password. The second script changes the account's password. These two scripts are linked to a new secret template.

### Task 1: Creating the Active Directory Verify Password Script

1. Navigate to **Admin > Scripts**.
1. Click the **+** **Create New** button on the **PowerShell** tab.
1. Type the following information in the dialog:
   - **Name**: Active Directory Verify
   - **Description**: Script used to verify an Active Directory account
   - **Category**: Heartbeat 
   - **Script**: 
```powershell
$domain = "LDAP://"+$Args[0];
$dn = New-Object System.DirectoryServices.DirectoryEntry($domain, $Args[1], $Args[2]);
if ($dn.name -eq $null){ throw "Authentication failed - please verify your username and password." };
```
4. Click the **OK** button to save the script.

### Task 2: Creating the Active Directory Change Script

1. On the **PowerShell** tab, click the **+ Create New** button.
1. Type the following information in the dialog: 
   
   - **Name**: Active Directory Change
   - **Description**: Script used to change the password of an Active Directory account
   - **Category**: Password Changing 
   - **Script**:
```powershell
$Domain = $args[0]
$UserToChange = $args[1]
$NewPassword = $args[2]
$P_User = $args[0] + "\" + $args[3]
$P_PWord = ConvertTo-SecureString –String $args[4] –AsPlainText -Force
$Creds = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $P_User, $P_PWord
$pwd = ConvertTo-SecureString $NewPassword -AsPlainText -Force;
Set-ADAccountPassword -Server $Domain -Identity $UserToChange -NewPassword $pwd -Reset -Credential $creds
```
3. Click the **OK** button to save the script.

### Task 3: Testing the Scripts

For the AD verification script:

1. Go to **Scripts \> PowerShell tab**.
1. Click the Run Script arrow icon on the AD verify script. The Test Script popup appears.
1. Type the arguments (separated by spaces) in the **Arguments** text box: domain name (for you), username (yours), password (yours). For example: `my.company.com ssadmin FD#@789Uik4$`
1. Type your domain name for the script-running account in the **Domain** text box.
1. Type the username in the **Username** text box for account that can run PowerShell scripts on the domain.
1. Type that user’s password in the **Password** text box.
1. Click the **OK** button to test your script the with provided parameters.

For the Active Directory change script:

1. Go to **Scripts \> PowerShell tab**.

1. Click the Run Script arrow icon on the AD change script. The Test Script popup appears.

1. Type the arguments (separated by spaces) in the **Arguments** text box: domain name (for you), username (yours), new password (yours), domain admin username, domain admin password. For example: `my.company.com ssuser 08sSKthsoidPW ssadmin FD#@789Uik4$`

1. Type your domain name for the script-running account in the **Domain** text box.

1. Type the username in the **Username** text box for account that can run PowerShell scripts on the domain.

1. Type that user’s password in the **Password** text box.

1. Click the **OK** button to test your script the with provided parameters.

   **Note:** If successful, this will change the password on the account that is used for testing.


The remaining steps depend on the version of SS you are using. In Secret Server 10.0.000006 we introduced the ability to create multiple PowerShell password changers, each with their own set of password change and verify scripts. These password changers can be assigned to different scan templates to automatically assign different PowerShell password changer scripts to different types of local accounts when creating local account import rules in discovery. For more information about how scan templates and password changers are used in discovery and local account import rules, see our [Discovery Guide](https://thycotic.force.com/support/s/article/Account-Discovery). Prior to 10.0.000006, there was only one PowerShell password changer and the scripts were assigned on the secret template.

### Task 4: Configuring a Password Changer for Secret Server Version 10.0.000006 and Later

In Secret Server versions 10.0.000006 and later, after the scripts are tested and working correctly, the next step is to create a PowerShell password changer. 

1. Go to **Admin > Remote Password Changing**.
1. Click the **Configure Password Changers** button.
1. Click the **New** button.
1. In the **Base Password Changer** dropdown list, select **PowerShell Script**.
1. Type the name of the new password changer.
1. Click the **Save** button. On the next page you will select the scripts to use for password changing and verification (heartbeat). 
1. Under **Password Change Commands**:
   1. Select the script that you created to do password changes.
   1. Type the following in the **Script Args** text box: `$DOMAIN $USERNAME $NEWPASSWORD $[1]$USERNAME $[1]$PASSWORD`.
   1. Click the **Save** button next to the **Script Args** text box.

1. Under **Verify Password Changed Commands**: 
   1. Select the script that you created to do heartbeats and verification.
   1. Type the following in the **Script Args** field: `$DOMAIN $USERNAME $PASSWORD`.
   1. Click the **Save** button next to the **Script Args** text box.

> **Note:** When SS runs the script, it replaces the fields with the matching secret field values.  $NEWPASSWORD is a special case for the new password that is generated by SS or specified by the user when performing a password change. For more information see [Using Secret Fields in Scripts](../../api-scripting/using-secret-fields-scripts/index.md).

> **Important:** You must specify scripts for both sections and you must click the Save button next to each one for both to save.

### Task 5: Creating a Secret Template

The next step is to create the secret template:

1. Go to **Admin > Secret Templates**.

1. Click the **Create New** button.

1. Name the template `PowerShell Active Directory`.

1. Create the following new fields:

   - Domain Field Type: Text

   - Username Field Type: Text
   - Password Field Type: Password
   - Notes Field Type: Notes

1. Click the **Configure Password Changing** button.

1. Click the **Edit** button.

1. Click to select the **Enable Remote Password Changing** and **Enable Heartbeat** checkboxes.

### Task 6a: Finishing the Secret Template Configuration for Secret Server 10.0.000006 and later

> **Note:** Complete either 6a or 6b, not both.

1. Select the password changer created in the previous section from the **Password Type to use** dropdown list.
1. Click to select **Domain** next to the **Domain** field.
1. Click to select **Username** next to the **User Name** field.
1. Click to select **Password** next to the **Password** field.
1. Click the **Save** button to save the mapping.

### Task 6b: Finishing the Secret Template Configuration for Secret Server 8.8.000000 to 10.0.000000

> **Note:** Complete either 6a or 6b, not both.

1. Select **PowerShell Script** from the **Password Type to use** dropdown.
1. Click to select **Domain** next to the Domain field.
1. Click to select **Username** next to the User Name field.
1. Click to select **Password** next to the Password field.
1. Click to select **Active Directory Change** next to the **Remote Password Change Script** field.
1. Enter the following to the **Remote Password Change Args** field: `$DOMAIN $USERNAME $NEWPASSWORD $[1]$USERNAME $[1]$PASSWORD`.
1. Click to select **Active Directory Verify** next to the **Heartbeat Script** field.
1. Type the following next to the **Heartbeat Args** field: `$DOMAIN $USERNAME $PASSWORD`.

   > **Note:** When SS runs the script, it replaces the fields with the matching secret field values.  $NEWPASSWORD is a special case for the new password that is generated by SS or specified by the user when performing a password change.
1. Click the **Save** button to save the mapping.

### Task 7: Creating Secrets Using PowerShell Remote Password Changing

Create the AD account secret PowerShell account:

1. Create three secrets (The first two **must** be different secrets):
   - One that is an Active Directory Account that has the necessary rights to run PowerShell on your domain
   - One that is an Active Directory Account that has the necessary rights to run a password change on your domain
   - One that is based on the new PowerShell Active Directory Template.
   
1.  Create the Active Directory account secret PowerShell account.
1. On the dashboard, use the dropdown on the **Create Secret** widget and select **Active Directory Account**. Use the following parameters:
   - **Secret Name:** PowerShell Admin
   - **Domain:** Domain that the account exists on
   - **Username:** Account name that can run PowerShell scripts in the domain
   - **Password:** Password for the account
1. Click the **Save** button to save your secret and verify that it passes heartbeat.
1. Click the **Home** button to return to the dashboard. 

Create the AD account secret for password changing:

1. On the dashboard, use the dropdown on the **Create Secret** widget and select **Active Directory Account**. Use the following parameters:
   - **Secret Name:** Password changing Admin
   - **Domain:** Domain that the account exists on
   - **Username:** Account name that can change passwords in the domain
   - **Password:** Password for the account
1. Click the **Save** button to save your secret and verify that it passes heartbeat.
1. Click the **Home** button to return to the dashboard. 

Create the PowerShell Active Directory secret:

1. On the dashboard, use the dropdown on the **Create Secret** widget and select **PowerShell Active Directory Account**. Use the following parameters:
   - **Secret Name:** PowerShell AD user
   - **Domain:** Domain that the account exists on
   - **Username:** samAccountName of the account to be managed
   - **Password:** Password for the account
1. Click the **Save** button to save your secret and verify that it passes heartbeat.
1. Click the **Remote Password Changing** tab for the secret.
1. Click the Edit button.
1. Click to select **Privileged Account Credentials** in **Execute PowerShell**. The Privileged Account selector appears.
1. Click the **No Selected** Secret link.
1. Locate click on the **PowerShell Admin** secret.
1. Click the **Home** button to return to the dashboard. 
1. In the **The following Secrets are available to be used in Custom Password Changing Commands and Scripts** section:
   1. Click the **No Selected Secret** link.
   1. Select your AD account secret for password changing.
   1. Click on the **Save** button.

Everything should now be configured for heartbeat and RPC on the Secret. Run **Heartbeat** (from the **General** tab in the Secret) to confirm that it works and run an RPC ** (from the **Remote Password Changing** tab of the secret) to confirm that it also works. 

## Errors

If you receive the “The term 'Set-ADAccountPassword' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again." error, install the AD-Domain-Services in Powershell. To do this start PowerShell as an administrator then run the following command: 

`Install-windowsfeature -name AD-Domain-Services –IncludeManagementTools`  


Additionally you may need to install the Remote Server Administration Tools for your version of Windows and then in PowerShell run: 

`Import-Module Servermanager`

 