[title]: # (SQL Server 2012 Express Edition Installation)
[tags]: # (Installation, SQL Server Express 2012)
[priority]: #

# SQL Server 2014 Express Edition Installation

## Overview

> **Important:** Thycotic recommends using SQL Express in sandbox or trial environments **only** due to size and performance limitations.

SQL Express is a free edition of SQL and is available for use with Thycotic products. The following steps walk you through setup and configuration for SQL Server 2014 Express Edition as an example. For the most up to date resources on installing SQL see [Microsoft SQL Technical Documentation](https://docs.microsoft.com/en-us/sql/?view=sql-server-ver15) for more information.

At the completion of this article you will have:

- Installed a basic stand-alone instance of SQL Server 2014 Express with the minimum features necessary for SQL Server. This includes SQL Server Management Studio and other tools.
- Created a database in SQL for your Thycotic product
- Created a new SQL Server user login for your SQL database

> **Note:** This document uses Thycotic's Secret Server product as example in the instructions, but the same steps apply for Privilege Manager advanced installs.

## Procedures

### Downloading SQL Server Express with Tools

If you plan to use SQL Server Express, we strongly recommend downloading the package that includes **Tools**. This also installs SQL Server Management Studio that allows you to connect to the database directly and gives access to server settings.

Procedure:

1. Go to the [SQL Server 2014 Express download page](https://www.microsoft.com/en-US/download/details.aspx?id=42299).

1. Click the **Select Language** list box and select **English**.

1. Click the **Download** button. A popup page appears:

   ![image-20200610104805275](images/image-20200610104805275.png)

1. Click to select the following check boxes (you may need to scroll down):

   - **ExpressAndTools 64BIT\SQLEXPRWT_x64_ENU.exe**
   - **MgmtStudio 64BIT\SQLManagementStudio_x64_ENU.exe**

1. Click the **Next** button. `SQLEXPRWT_x64_ENU.exe` and `SQLManagementStudio_x64_ENU.exe*` download to your computer.

### Installing SQL Server Express 2014

1. If necessary, download and install the latest version of .NET Framework. See [Microsoft .NET Framework 4.8 offline Installer for Windows](https://support.microsoft.com/en-us/help/4503548/microsoft-net-framework-4-8-offline-installer-for-windows) for the latest version as of when this topic was written. If you have already installed Secret Server, you have already done this.

1. Double click the `SQLEXPRWT_x64_ENU.exe` you downloaded to run it. The User Account Control appears.

1. Click the **Yes** button. The Choose Directory… dialog box appears:

   ![image-20200610110451768](images/image-20200610110451768.png)

1. Click the **OK** button. The files are extracted to that location, and the SQL Server Installation Center appears:

   ![image-20200610110805091](images/image-20200610110805091.png)

1. Click the **New SQL Server stand-alone…** link. The License Terms wizard page appears:

   ![image-20200610111039488](images/image-20200610111039488.png)

1. Click to select the **I accept the license terms** check box.

1. Click the **Next \>** button. The installation processes four pages with no input from you and stops on the Feature Selection page:

   ![image-20200610111417819](images/image-20200610111417819.png)

1. Ensure that the **Database Engine Services** and **Management Tools – Basic** check boxes are selected. Leave the others as is.

   > **Note:** A SQL Server instance is isolated from other SQL Server instances. SQL Server instances can operate side-by-side on the same computer.

   > **Note:** Management tools include Management Studio support for the database engine and SQL Server Express, SQL Server CLI (SQLCMD), SQL Server PowerShell provider, and the distributed replay administration tool.

1. Click the **Next \>** button. The installation processes one page with no input from you and stops on the Instance Configuration page:

   ![image-20200610111945158](images/image-20200610111945158.png)

1. **Ether** click to select the **Default instance** selection button, which uses an already present instance called SQLEXPRESS.

1. **Or** type your desired name in the **Named instance** text box.

1. Type your instance ID in the **Instance ID** text box. We chose `MySQLInstance`. The instance ID will become part of the installation path.

1. Click the **Next \>** button. The Server Configuration page appears:

   ![image-20200610114503210](images/image-20200610114503210.png)

1. Leave the page as is, and click the **Next \>** button. The Database Engine Configuration page appears:

   ![image-20200610114749551](images/image-20200610114749551.png)

1. You have the choice to select either **Windows Authentication Mode** or **Mixed Mode**. Click to select the option that works best for your environment:

   - **Mixed Mode (for easiest configuration)**: This mode is required if you intend on using a SQL Server account to authenticate Secret Server to your SQL Server instance. **We recommend using mixed mode if you are setting up a test or demo environment**. Selecting this option will also require you to set a password for the SQL Server system administrator (sa) account. See [Adding a SQL Server User ](https://thycotic.force.com/support/s/article/Adv-Install-SQL-2016#user)(section below) for instructions on adding more users.
   - **Windows Mode (recommended for best security)**: This mode prevents SQL Server account authentication. We recommend using Windows mode for production environments. Whatever user or group assigned will have administrative access to your SQL instance. According to best security practices, limit this number to as few users as possible. Only choose this if you have experience and require this for a specific issue—we do **not** recommend SQL Server Express for production accounts.

   > **Note:** If choosing **Windows Mode** you will also need to  [run the IIS application pool as a service account](../running-ss-iis-app-pool-service-account/index.md) later in the installation process.

1. If you selected mixed mode, which you almost certainly did, type your SQL Server system administrator (sa) account password in the **Enter password** and **Confirm password** text boxes. The password must meet Microsoft's definition of a strong password. Click the **Help** button and search for "Database Engine Configuration - Account Provisioning" if you what to find out what that is. A 16 character mixture of lower and uppercase letters and numerals works fine.

1. Your user account should already be shown in the **Specify SQL Server administrators** text box. If not, click the **Add Current User** button.

1. Click the **Next \>** button. The Installation Progress page appears and SQL Server Express is installed. This can take awhile. Eventually, the Complete page appears:

   ![image-20200610131342678](images/image-20200610131342678.png)

1. Click the **Close** button.

### Creating the SQL Server Database

To install SS, the Thycotic installer creates the SQL database for you if it does not exist and if the user account has permission to create a new database, which requires the dbcreator server role.

If not using the Thycotic Installer, use the following steps to create a database manually through SQL Server Management Studio:

1. Open SQL Server Management Studio.

1. Connect to your SQL Server instance.

1. Right click the **Databases** folder and select **New Database…** The New Database page appears.

1. Type a name for your database in the **Database Name** text box.

1. Click the **OK** button.

### Adding a SQL Server User

According to security best practices, limit the number of users with access to your SQL database as much as possible. Use the following instructions to add a SQL Server account for SS to use to access the SQL database:

1. Open SQL Server Management Studio.

1. Connect to your SQL Server Database.

1. Expand the **Security** folder.

1. Right-click the **Logins** folder and select **New Login…**

1. Select a method of authentication:

   - **SQL Server Authentication**:  Use this option to create a new SQL Server account (this requires mixed mode to be enabled). To create the account, enter a new username and password and then deselect the **Enforce Password Policy** check box to prevent the account from expiring.
   - **Windows Authentication**:  Use this option to add access to SQL Server for an existing Windows account. To add the account, enter the login name or click **Search** to find the account. It is recommended to use a domain account rather than a local Windows account.

1. Click **User Mapping** in the left menu.

1. Click to select the check box next to your SS database.

1. In the **Database Role Membership** window, click to select the **db_owner** check box.

1. Click the **OK** button.
