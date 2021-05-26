[title]: # (Running the IIS Application Pool As a Service Account)
[tags]: # (service account, IIS, application pool)
[priority]: # (1000)
[redirect]: # "AdvInstallServiceAccount"

# Running the IIS Application Pool As a Service Account

## Overview

We recommend setting up a domain service account that can both access the Thycotic product’s SQL database and run the IIS Application Pool(s) dedicated to your Thycotic product.

> **Note:** The service account created in this KB should **not** be the same account that is created during the installation of SQL and used to manage SQL as a whole.

 To set up this service account correctly you will need to:

1. Create a service account in Active Directory that will be dedicated to your Thycotic product (domain).

1. Granting the service account access to the SQL Server database.

1. Assign the service account as the identity of the application pool or pools in IIS.

1. Grant folder permissions for the service account on two folders.

1. Configure User Rights Assignment to the service account.

## Procedure

> **Note:** You must have IIS installed on your Web server before completing these steps.

### Task 1: Creating a Domain Service Account

1. Create a local or domain user account (or identify one to use).

1. Open IIS  (**Search > inetmgr**) on your Web server.

1. Open the **Active Directory Users and Computers** link from **Administrative Tools**.

1. Click to open the directory where you want to assign this account, such as testlab.com.

1. Select **Service Accounts**.

1. Right click and and select **New > User**. The “New Object - User” wizard dialog box appears.

1. Type a name and logon name for the service account.

1. Click the **Next** button. The wizard advances to the next dialog box (same name).

1. Type a password in the Password and Confirm Password text boxes.

1. If necessary, click to deselect the **User must change password at next login** check box.

1. Click to select the **Password never expires** check box. Failing to do this could lock the account out of SS.

1. ” Check **Password never expires** or the account could lock you out of SS.

1. Click **Next** button.

1. Click the **Finish** button. You can now give the account access to the database server and the application server.

### Task 2: Granting Access to the SQL Database

> **Note:** You must have SQL installed on your database server before completing these steps.

Grant access:

1. Open the SQL Management Studio on your database server.

1. Connect to your Thycotic product’s SQL database using an administrator account.

1. Click to select the Security folder in the Object Explorer.

1. Right-click the same folder and select **New \> Login…**. A log on dialog box appears.

1. Ensure the **Windows Authentication** radio button is selected.

1. Click the **Search…** button. The “Select User, Service Account, or Group” dialog box appears.

1. Ensure that your domain or AD server appears in the **From this location** text box. If not, click the **Locations…** button and select it.

1. Type the login name you created for your Thycotic service account, such as svc_thycotic, in the **Enter the object name to select** text box.

1. Click the **Check Names** button.

1. Click to select the correct account.

1. Click the **OK** button. The dialog box closes, returning you to the Login - New dialog box.

1. **Either**, if you have already created the database for your Thycotic product:
   1. Click **User Mapping** in the **Select a page** list box.
   1. Click to select the check box for the database in the **Users mapped to this Login** list.
   1. Click to select the **db_owner** check box in the **Database role membership…** list.
1. **Or**, if you have not yet created the database:
   1. Click **Server Roles** in the **Select a page** list box.
   1. Click to select the **db_creator** check box.
1. Click the **OK** button.

### Task 3: Assigning the Identity of Application Pools

1. Click the **Applications** node under the server name in the **Connections** tree.

1. Right-click the node and select **Advanced Settings...** The Advance Settings dialog box appears.

1. Click the **…** button for the **Identity** entry in the **Process Model** section. The Application Pool Identity dialog box appears.

1. Click to select the **Custom Account** selection button.

1. Click the **Set…** button. The Set Credentials dialog box appears.

1. Type your service account’s name, such as test and password.

1. Click the **OK** button. The dialog box closes.

1. Open the command console as an Admin.

1. Change the directory to your .NET framework installation directory using the “cd" command, for example, `C:\Windows\Microsoft.NET\Framework\v4.0.30319`.

1. Type `.\aspnet_regiis -ga <domain name>\<username>`, replacing `<domain name>` and `<username>` with your information. For local accounts omit the domain name parameter.

### Task 4: Granting Folder Permissions

> **Note:** You must have the Thycotic product application files installed (on your Web server) before completing this section.

 Following the steps below, you give the service account "Modify" access to **two** folders:

- `C:\Windows\TEMP`
- The folder where your Thycotic product’s application files are located, such as  `C:\inetpub\wwwroot\SecretServer`

Procedure (for each folder):

1. In a file manager, navigate to the SS application folder.

1. Right-click the folder and select **Properties**. The Properties dialog box appears.

1. Click the **Security** tab.

1. Click the **Advanced** button.

1. Click the **Add** button. A permissions panel appears.

1. Click the **Select a Principal** link. The “Select User, Computer, Service Account, or Group” dialog box appears.

1. Ensure that your domain or AD server appears in the **From this location** text box. If not, click the **Locations…** button and select it.

1. Type the login name you created for your Thycotic service account, such as svc_thycotic, in the **Enter the object name to select** text box.

1. Click the **Check Names** button.

1. Click to select the correct account.

1. Click the **OK** button. The dialog box closes, returning you to the permissions panel.

1. Click to select the **Modify** check box in the **Basic Permissions** section. Your service account should have the **Modify**, **Read & Execute**, **List folder contents**, **Read**, and **Write** permissions selected for this folder

1.  Click the **OK** button.

1. Click the **Apply** button.

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

1. Open the Group Policy Management Console.

1. Right-click the desired GPO folder (under the domain node) in the **Group Policy Management** Tree, and select **New**. The New GPO dialog box appears.

1. Type the name, such as “Thycotic User Rights Assignment,” in the **Name** text box.

1. Click the **OK** button. The dialog box closes.

1. Right-click the GPO you just created and select **Edit**. The Group Policy Object Editor appears.

1. On the **Computer Configuration** node, click to expand **Policies \> Windows Settings > Security Settings \> Local Policies**.

1. Click to select the **User Rights Assignment **folder.

1. Repeat the following procedure for the “Log on as a batch job” and “Impersonate a client after authentication” permissions (for this instruction we show the former):

   1. In the list on the right, right-click **Log on as a batch job** and select **Properties**. The “Log on as a batch job Properties” dialog box appears.

   1. Ensure that the **Define these policy settings** check box is checked.

   1. Click the **Add User or Group** button.  A dialog box appears.

   1. Add your Thycotic service account.

   1. Click the **OK** button. The dialog box closes. The new policy appears in the list.

   1. Click the **Apply** button.

1. Link your new GPO to the OU where your Thycotic product machine accounts exist, that is, the Web and database servers.

#### Option 2: Setting User Rights Assignment Locally

1. On the Web server hosting IIS and your Thycotic Application files, open the “Local Security Policy Console” as an administrator (Run as administrator).

1. On the Local Policies node, click to expand **Local Policies \> User Rights Assignment**.

1. Click to select the **User Rights Assignment** folder.

1. Repeat the following procedure for the “Log on as a batch job” and “Impersonate a client after authentication” permissions (for this instruction we show the former):
   1. Right-click on **Log on as a batch job** in the list on the right and select  **Properties > Add User or Group**.
   1. Click to select your Thycotic service account.
   1. Click the **OK** button.

> **Note**: If you get a "Service Unavailable" error after applying "Log on as a batch job" permissions, try updating your group policy settings: Open the **Command Console**, type in `gpupdate /force`**, and restart the **Windows Process Activation Service**.
