[title]: # (SQL Server 2016 Standard Edition Installation)
[tags]: # (Installation, SQL Server 2016)
[priority]: #

# SQL Server 2016 Standard Edition Installation

## Overview

The following steps walk you through setup and configuration for SQL Server 2016 Standard Edition as an example. For the most up to date resources on installing SQL see [Microsoft SQL Technical Documentation](https://docs.microsoft.com/en-us/sql/?view=sql-server-ver15) for more information.

At the completion of this article you will have: 

- Installed a basic stand-alone instance of SQL Server 2016 Standard with the minimum features necessary for SQL Server.

- Installed SQL Server Management Studio for managing the local database.

- Installed a basic stand-alone instance of SQL Server 2016 Standard with the minimum features necessary for SQL Server.

- Created a new SQL Server user login for your SQL database

> **Note:** This document uses Thycotic's Secret Server product as example in the instructions, but the same steps apply for Privilege Manager advanced installs.

## Procedures

### Installing SQL Server 2016
$1
$2
   ![User-added image](images/clip_image001.png)
$1
$2$1
$2
   ![image-20200608155119996](images/image-20200608155119996.png)
$1
$2$1
$2
   ![image-20200608155316611](images/image-20200608155316611.png)
$1
$2
   ![User-added image](images/clip_image006.png)
$1
$2$1
$2$1
$2
   ![User-added image](images/clip_image008.png)
$1
$2$1
$2$1
$2
   ![User-added image](images/clip_image010.png)
$1
$2$1
$2$1
$2$1
$2$1
$2
   ![User-added image](images/clip_image014.png)

   
$1
$2$1
$2
   ![User-added image](images/clip_image016.png)
$1
$2$1
$2$1
$2
   ![User-added image](images/clip_image020.png)
$1
$2
    - **Mixed Mode (for easiest configuration)**: This mode is required if you intend on using a SQL Server account to authenticate Secret Server to your SQL Server instance. We recommend using mixed mode if you are setting up a test or demo environment. Selecting this option will also require you to set a password for the SQL Server system administrator (sa) account. See [Adding a SQL Server User ](https://thycotic.force.com/support/s/article/Adv-Install-SQL-2016#user)(section below) for instructions on adding more users.

    - **Windows Mode (recommended for best security)**: This mode prevents SQL Server account authentication. We recommend using Windows mode for production environments. Whatever user or group assigned will have administrative access to your SQL instance. According to best security practices, limit this number to as few users as possible.

    > **Note:** If choosing **Windows Mode** you will also need to  [run the IIS application pool as a service account](../running-ss-iis-app-pool-service-account/index.md) later in the installation process. 
$1
$2$1
$2
   ![User-added image](images/clip_image022.png)
$1
$2$1
$2$1
$2
****

### Installing SQL Server Management Studio
$1
$2
   ![User-added image](images/clip_image024.png)
$1
$2$1
$2$1
$2
   ![User-added image](images/clip_image026.png)
$1
$2$1
$2
   ![User-added image](images/clip_image028.png)
$1
$2$1
$2
### Creating the SQL Server Database

To install SS, the Thycotic installer creates the SQL database for you if it does not exist and if the user account has permission to create a new database, which requires the dbcreator server role.

If not using the Thycotic Installer, use the following steps to create a database manually through SQL Server Management Studio:
$1
$21. Connect to your SQL Server instance.
$1
$21. Type a name for your database in the **Database Name** text box.
$1
$2
### Adding a SQL Server User

According to security best practices, limit the number of users with access to your SQL database as much as possible. Use the following instructions to add a SQL Server account for SS to use to access the SQL database:
$1
$2$1
$2$1
$2$1
$2$1
$2
   - **SQL Server Authentication**:  Use this option to create a new SQL Server account (this requires mixed mode to be enabled). To create the account, enter a new username and password and then deselect the **Enforce Password Policy** check box to prevent the account from expiring.

   - **Windows Authentication**:  Use this option to add access to SQL Server for an existing Windows account. To add the account, enter the login name or click **Search** to find the account. It is recommended to use a domain account rather than a local Windows account.
$1
$2$1
$2$1
$2$1
$2
 