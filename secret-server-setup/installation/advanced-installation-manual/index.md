[title]: # (Advanced Installation)
[tags]: # (Install)
[priority]: #

# Advanced (Manual) Installation

## Procedure

### Step 1: Downloading the Secret Server Application Files

> **Important:** Ensure you have the IIS, .NET Framework, and SQL Server prerequisites installed before following the steps below.

Go to the [download page](https://thycotic.force.com/support/s/download-onprem) to get a .zip file that contains both Secret Server and Privilege Manager files in the manual installation section.  Use this .zip file for the instructions below.

### Step 2: Creating Folders and Extracting Contents
$1
$21. Extracting this file reveals a `nugetCache` folder, as well as another zipped folder named `ss\_update`. For a SS-only install, you will not need the contents of the `nugetCache` folder.
$1
$21. Extract the contents of the `ss\_update.zip` file (Right-click, **Extract All\...**) to `C:\\inetpub\\wwwroot\\SecretServer`.

### Step 3: Configuring IIS

Open Internet Information Services (IIS) Manager* and create a new application pool:

> **Note:** Our IIS installation sets the .NET trust level to “Full (internal), which may affect other applications on the server.
$1
$21. Type a name (for example, SecretServerAppPool). 
$1
$21. Ensure the Managed pipeline mode is set to **Integrated**.
$1
$2   
   > **Note:** The SS installer sets the application pool to default to the system Network Service account.  Follow [these instructions](https://thycotic.force.com/support/s/article/Best-Adv-Install-Using-a-Service-Account-to-Run-IIS-App-Pool-and-SQL-DB) if you selected Windows Authentication Mode during the SQL Installation process. To use Windows Authentication you must use an Active Directory service account to run the application pool in IIS. We recommend this as a security best practice.
   
$1
$21. Install SS as either a virtual directory (4a) or as a website (4b):

### Step 4a: Installing Secret Server as a Virtual Directory
$1
$2$1
$2$1
$21. Click the **OK** button.
$1
$2$1
$2

### Step 4b: Installing Secret Server as a Website
$1
$21. Type a site name.
$1
$21. Click the **OK** button.
$1
$21. Click the **OK** button.
$1
$2
### Step 5: Completing Secret Server Installation from the Website

Your SS advanced installation is now ready to complete:
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
    > **Note:** Secret Server attempts to download and install the latest version from the Internet. If you do not have an active Internet connection on your Web server, SS will continue to install the version from your downloaded application files.
$1
$2$1
$2$1
$2$1
$2
    > **Note:** If you skipped the wizard and would like to return, go to **HELP \> Getting Started** from the top menu.

SS is now installed. See our [Getting Started Tutorial](../../../getting-started-tutorial/index.md) or contact Thycotic Support about training.

## Troubleshooting Notes

-   If the database name you provide does not yet exist in the specified instance of SQL Server, SS attempts to create the database using the SQL or Windows account you have specified. For that account to create a database, it needs to have the dbcreator server role in SQL Server.

-   If using Windows authentication mode (recommended) you need to use a service account to run SS's application pools with appropriate permissions. See [this article](https://thycotic.force.com/support/s/article/Best-Adv-Install-Using-a-Service-Account-to-Run-IIS-App-Pool-and-SQL-DB) if you have not already done so.