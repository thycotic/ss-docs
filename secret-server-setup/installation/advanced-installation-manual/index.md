[title]: # (Advanced Installation)
[tags]: # (Install)
[priority]: #

# Advanced (Manual) Installation

## Procedure

### Step 1: Downloading the Secret Server Application Files

> **Important:** Ensure you have the IIS, .NET Framework, and SQL Server prerequisites installed before following the steps below.

Go to the [download page](https://thycotic.force.com/support/s/download-onprem) to get a .zip file that contains both Secret Server and Privilege Manager files in the manual installation section.  Use this .zip file for the instructions below.

### Step 2: Creating Folders and Extracting Contents

1. Extract the contents of the .zip file downloaded above (Right-click, **Extract All\...**). The original file is named with the latest version number for SS.
1. Extracting this file reveals a `nugetCache` folder, as well as another zipped folder named `ss\_update`. For a SS-only install, you will not need the contents of the `nugetCache` folder.
1. Create a folder called `SecretServer` in the location `C:\inetpub\wwwroot\`.
1. Extract the contents of the `ss\_update.zip` file (Right-click, **Extract All\...**) to `C:\\inetpub\\wwwroot\\SecretServer`.

### Step 3: Configuring IIS

Open Internet Information Services (IIS) Manager* and create a new application pool:

1. Right-click **Application Pools** and select **Add Application Pool\...**
1. Type a name (for example, SecretServerAppPool). 
1. Ensure that the highest .NET CLR version is selected.
1. Ensure the Managed pipeline mode is set to **Integrated**.
1. Click the **OK** button.
   
   > **Note:** The SS installer sets the application pool to default to the system Network Service account.  Follow [these instructions](https://thycotic.force.com/support/s/article/Best-Adv-Install-Using-a-Service-Account-to-Run-IIS-App-Pool-and-SQL-DB) if you selected Windows Authentication Mode during the SQL Installation process. To use Windows Authentication you must use an Active Directory service account to run the application pool in IIS. We recommend this as a security best practice.
   
1. Follow [these instructions](https://thycotic.force.com/support/s/article/Changing-IIS-to-not-stop-worker-process-in-IIS-7-and-8) to set the Idle Timeout and Regular Timeout settings to 0 for the application pool in IIS.
1. Install SS as either a virtual directory (4a) or as a website (4b):

### Step 4a: Installing Secret Server as a Virtual Directory

1. Right-click **Default Web Site** and select **Add Virtual Directory...**

1. Select an alias for your Secret Server. The alias is appended to the website, and it is best to name it the name of your earlier unzipped folder. For example, SecretServer becomes `https://myserver/SecretServer`.

1. Select the physical directory for where you unzipped SS, for example, `C:\inetpub\wwwroot\SecretServer`.
1. Click the **OK** button.
1. In the tree, right-click the new virtual directory and select **Convert to Application**.

1. Set the **Application Pool** to the same one you created in the Manual Installation section, for instance, SecretServerAppPool. Secret Server is now ready for installation. Skip to Step 5.


### Step 4b: Installing Secret Server as a Website

1. In IIS, right-click **Sites** and select **Add Website...**
1. Type a site name.
1. Click **Select...** and choose the application pool you created in the Manual Installation section. 
1. Click the **OK** button.
1. Click the **...** button beside the **Physical path** field and select the directory containing the unzipped SS files, for example `C:\\inetpub\\wwwroot\\SecretServer`. 
1. Click the **OK** button.
1. Click the **OK** button at the bottom of the **Add Website** window to save your settings. Secret Server is now ready for installation. 

### Step 5: Completing Secret Server Installation from the Website

Your SS advanced installation is now ready to complete:

1. Open a browser and navigate to where your Secret Server is located, such as `http://localhost/secretserver`. You should arrive at a page that says "Secret Server (Not Installed or Unable to Access the Database)."

1. Click the **Install** **Secret Server** button.

1. On the **SQL Server Location** page, specify the server name of your SQL Database Server, `DatabaseMachineName)\InstanceName` and then the database name that you created in SQL for SS.

1. If you are using Windows authentication mode to access SQL (recommended), ensure the correct service account is listed.

1. If you selected mixed mode during the SQL install, select **SQL Server Authentication** and enter the SQL username and password you created for the SQL account. For information about adding a SQL Server user, see the [Adding a SQL Server User](https://thycotic.force.com/support/s/article/Adv-Install-SQL-2016) (KB). 

1. Click the **Install Secret Server** button. Secret Server verifies it is able to successfully create the SS database. If an error occurs no database changes will be made.

    > **Note:** Secret Server attempts to download and install the latest version from the Internet. If you do not have an active Internet connection on your Web server, SS will continue to install the version from your downloaded application files.

1. The install may take a few minutes to complete. Once successful, click the **Return to Home** button.

1. Create a username and password for the administrator account for SS and store these credentials in a safe location.

1. Click the **Create User** button and log on after entering the username and password.

1. Once logged on SS, you are prompted with the Getting Started wizard. The wizard guides you through adding your Licenses, setting up an email server, and creating your first group.

    > **Note:** If you skipped the wizard and would like to return, go to **HELP \> Getting Started** from the top menu.

SS is now installed. See our [Getting Started Tutorial](../../../getting-started-tutorial/index.md) or contact Thycotic Support about training.

## Troubleshooting Notes

-   If the database name you provide does not yet exist in the specified instance of SQL Server, SS attempts to create the database using the SQL or Windows account you have specified. For that account to create a database, it needs to have the dbcreator server role in SQL Server.

-   If using Windows authentication mode (recommended) you need to use a service account to run SS's application pools with appropriate permissions. See [this article](https://thycotic.force.com/support/s/article/Best-Adv-Install-Using-a-Service-Account-to-Run-IIS-App-Pool-and-SQL-DB) if you have not already done so.