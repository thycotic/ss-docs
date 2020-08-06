[title]: # (Running the IIS Application Pool As a Service Account)
[tags]: # (service account, IIS, application pool)
[priority]: # (1000)

# Running the IIS Application Pool As a Service Account

## Overview

We recommend setting up a domain service account that can both access the Thycotic product’s SQL database and run the IIS Application Pool(s) dedicated to your Thycotic product.

> **Note:** The service account created in this KB should **not** be the same account that is created during the installation of SQL and used to manage SQL as a whole.

 To set up this service account correctly you will need to:
$1
$21. Granting the service account access to the SQL Server database.
$1
$21. Grant folder permissions for the service account on two folders.
$1
$2
## Procedure

> **Note:** You must have IIS installed on your Web server before completing these steps.

### Task 1: Creating a Domain Service Account
$1
$21. Open IIS  (**Search > inetmgr**) on your Web server.
$1
$21. Click to open the directory where you want to assign this account, such as testlab.com.
$1
$21. Right click and and select **New > User**. The “New Object - User” wizard dialog box appears.
$1
$21. Click the **Next** button. The wizard advances to the next dialog box (same name).
$1
$21. If necessary, click to deselect the **User must change password at next login** check box.
$1
$21. ” Check **Password never expires** or the account could lock you out of SS. 
$1
$21. Click the **Finish** button. You can now give the account access to the database server and the application server. 

### Task 2: Granting Access to the SQL Database 

> **Note:** You must have SQL installed on your database server before completing these steps. 

Grant access:
$1
$21. Connect to your Thycotic product’s SQL database using an administrator account.
$1
$21. Right-click the same folder and select **New \> Login…**. A log on dialog box appears.
$1
$21. Click the **Search…** button. The “Select User, Service Account, or Group” dialog box appears.
$1
$21. Type the login name you created for your Thycotic service account, such as svc_thycotic, in the **Enter the object name to select** text box.
$1
$21. Click to select the correct account.
$1
$21. **Either**, if you have already created the database for your Thycotic product:
   1. Click **User Mapping** in the **Select a page** list box.
   1. Click to select the check box for the database in the **Users mapped to this Login** list.
   1. Click to select the **db_owner** check box in the **Database role membership…** list.
$1
$2   1. Click **Server Roles** in the **Select a page** list box.
   1. Click to select the **db_creator** check box.
$1
$2
### Task 3: Assigning the Identity of Application Pools 
$1
$21. Right-click the node and select **Advanced Settings...** The Advance Settings dialog box appears.
$1
$21. Click to select the **Custom Account** selection button.
$1
$21. Type your service account’s name, such as test and password.
$1
$21. Open the command console as an Admin.
$1
$21. Type `.\aspnet_regiis -ga <domain name>\<username>`, replacing `<domain name>` and `<username>` with your information. For local accounts omit the domain name parameter.

### Task 4: Granting Folder Permissions 

> **Note:** You must have the Thycotic product application files installed (on your Web server) before completing this section.

 Following the steps below, you give the service account "Modify" access to **two** folders:

- `C:\Windows\TEMP`

- The folder where your Thycotic product’s application files are located, such as  `C:\inetpub\wwwroot\SecretServer`

Procedure (for each folder):
$1
$21. Right-click the folder and select **Properties**. The Properties dialog box appears.
$1
$21. Click the **Advanced** button. 
$1
$21. Click the **Select a Principal** link. The “Select User, Computer, Service Account, or Group” dialog box appears.
$1
$21. Type the login name you created for your Thycotic service account, such as svc_thycotic, in the **Enter the object name to select** text box.
$1
$21. Click to select the correct account.
$1
$21. Click to select the **Modify** check box in the **Basic Permissions** section. Your service account should have the **Modify**, **Read & Execute**, **List folder contents**, **Read**, and **Write** permissions selected for this folder
$1
$21. Click the **Apply** button.

> **Note**: If a Windows Security pop-up appears, click the **Yes** button. The service account will now be able to access this folder.

> **Note**: The application folder only needs “Write” and “Modify” permissions during the installation or during an upgrade. You can remove these once the installation process is complete.

### Task 5: Configuring User Rights

The following settings are required for Thycotic Secret Server to function: 

- “Log on as a batch job”

- “Impersonate a client after authentication”

You can adjust these settings either at the **Domain** level using group policy or locally on your IIS Web server using the Local Security Policy Console. See [User Rights Assignment](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/user-rights-assignment) to learn more.

#### Option 1: Setting User Rights Assignment on the Domain

> **Note:** This is an example of how to create a Group Policy Object (GPO), we recommend consulting with your organizational group policy administrator to create this policy.

> **Note:** This overwrites any configuration in the local security policy. The local security policy is a safer option if you are not sure about usage across your domain. 
$1
$21. Right-click the desired GPO folder (under the domain node) in the **Group Policy Management** Tree, and select **New**. The New GPO dialog box appears.
$1
$21. Click the **OK** button. The dialog box closes.
$1
$21. On the **Computer Configuration** node, click to expand **Policies \> Windows Settings > Security Settings \> Local Policies**.
$1
$21. Repeat the following procedure for the “Log on as a batch job” and “Impersonate a client after authentication” permissions (for this instruction we show the former):
   1.  In the list on the right, right-click **Log on as a batch job** and select **Properties**. The “Log on as a batch job Properties” dialog box appears.
   1. Ensure that the **Define these policy settings** check box is checked.
   1. Click the **Add User or Group** button.  A dialog box appears.
   1. Add your Thycotic service account. 
   1. Click the **OK** button. The dialog box closes. The new policy appears in the list.
   1. Click the **Apply** button.
$1
$2
#### Option 2: Setting User Rights Assignment Locally
$1
$21. On the Local Policies node, click to expand **Local Policies \> User Rights Assignment**.
$1
$21. Repeat the following procedure for the “Log on as a batch job” and “Impersonate a client after authentication” permissions (for this instruction we show the former):
   1. Right-click on **Log on as a batch job** in the list on the right and select  **Properties > Add User or Group**.
   1. Click to select your Thycotic service account.
   1. Click the **OK** button. 

> **Note**: If you get a "Service Unavailable" error after applying "Log on as a batch job" permissions, try updating your group policy settings: Open the **Command Console**, type in `gpupdate /force`**, and restart the **Windows Process Activation Service**.


