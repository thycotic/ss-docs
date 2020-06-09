[title]: # (Installing and Configuring SQL Server)
[tags]: # (Installation, SQL Server)
[priority]: #

# Installing and Configuring SQL Server

For step-by-step instructions on how to install SQL 2016, see our example [SQL 2016 Installation guide here](../installing-sql-server-2016/index.md).

Secret Server requires Microsoft SQL Server as the back-end database. All editions including the Express version of 2012–2017 are supported.

Setting up SQL Server requires: 
- Installing SQL Server
- Creating a SQL Account
- Configuring database access in Secret Server 
- Installing SQL Server

> **Note:** If you are using SQL Express make sure to get the edition with tools that  will include SQL Management Studio. Follow the link in the KB article [Download SQL Express with Tools](http://updates.thycotic.net/link.ashx?SQLServerExpressDownload).

## Creating a SQL Account

### SQL Authentication

The fastest method to get started with Secret Server is to create a  SQL Authentication account. Follow the instructions in the Database section of the [Installation Guide](http://updates.thycotic.net/link.ashx?Windows6InstallerGuide). 

For troubleshooting and configuring SQL installation on a different server that the application server see [SQL Authentication Configuration](http://updates.thycotic.net/link.ashx?SSSQLAuthenticationSetup) article.

### Windows Authentication

A more advanced way to have Secret Server access the SQL server would be  through a service account and using Windows Authentication. Because of  the requirement of a service account and added IIS settings, we only  recommend this for non-evaluation setups. See instructions in [Accessing MS SQL Server with IWA](../../../authentication/accessing-sql-server-with-iwa/index.md).

## Configuring Database Access in Secret Server

Once the account has been created and SQL server installed with the MSI. The third step of the web installer will ask for Database access  information.

### SQL Location

- **Server Name or IP**: If it is a local machine  the server name will be (local) or localhost for the default instance,  or if a named instance such as SQL Express it would be `localhost\SQLExpress`. If you are unsure, copy the value from the "Server name" text box when connecting through SQL Management Studio. 
- **Database Name**: If you have created a database, enter the name. If you have given the SQL account dbCreator permission, enter a database name for Secret Server to create. 

### SQL Authentication

- **SQL Server Authentication**: Implies a SQL  account has been created that exists only with SQL Server. The account  will need to be dbOwner on the database or need dbOwner permission to  create the database. This is recommended for quickest setup. For more  detailed information and troubleshooting see [SQL Authentication Configuration](http://updates.thycotic.net/link.ashx?SSSQLAuthenticationSetup) article. 

- **Windows Authentication**: The identity of the  application pool will access the database. This requires a domain  Service account that has been granted access to run ASP.Net and the database. This is an advanced setting that is not recommended  for evaluations. Follow the instructions on using a service account in [Accessing MS SQL Server with IWA](../../../authentication/accessing-sql-server-with-iwa/index.md). 