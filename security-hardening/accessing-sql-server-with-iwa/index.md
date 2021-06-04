[title]: # (Accessing MS SQL Server with IWA)
[tags]: # (Integrated Windows Authentication, IWA, Authentication, Credentials. SQL)
[priority]: # (1000)
[redirect]: # (SSWindowsAuthentication)

# Accessing MS SQL Server with IWA

> **Note:** Please see the closely related article [Using a Service Account to Run the IIS App Pool & Access the Thycotic SQL Database – Best Practices (Advanced)](https://thycotic.force.com/support/s/article/Best-Adv-Install-Using-a-Service-Account-to-Run-IIS-App-Pool-and-SQL-DB) for additional information.

## Introduction

Integrated Windows Authentication (IWA) requires:

- Installing a SQL Server instance
- Creating a new domain service account
- Granting  access to SQL Server database
- Registering  a service account to run IIS and ASP.NET
- Assigning an account as an application pool identity

> **Note:** For instructions on Creating the SQL account or Installing SQL Server see [Installing and Configuring SQL Server](http://updates.thycotic.net/link.ashx?SSSqlServerHelp) (KBA).

## Creating a Domain Service Account

The account needs access to the application server and database server. Ensure password expiration is not enabled or the account could lock you out of Secret Server.

## Granting Access to SQL Server database

1. Connect to the Database instance using SQL Management Studio.

1. Right click on the Security node (ensure this is the top most security node under the instance and not under the database name itself) and select **New \> Login**.

1. Enter the Login name as `Domain\Username`.

1. Ensure **Windows Authentication** radio button is selected.

1. If you have already created the database, then under **User Mappings** select the database and grant dbOwner permission. Otherwise, if you plan to have the Database created for you, under **Server Roles** select dbCreator.

1. Click the **Ok** button.

<!-- Registering Service Account to Run IIS and ASP.NET](http://ASP.NET)

 Follow the instructions in [Running Secret Server Application Pool as a Service Account](http://support.thycotic.com/KB/a94/running-secret-server-iis-application-pool-with-service.aspx) article. -->

## Assigning Account as Identity of Application Pool

1. Open IIS (Run command inetmgr).

1. Click the Application Pool node.

1. Select Secret Server's Application Pool (default is SecretServerAppPool).

1. On the Right panel, Click .

1. Scroll down to the **Identity** row under **Process Model**.

1. In the popup, select **Custom Account \> Set**.

1. Type the user as domain\username.

1. Type the password.

1. Click the **Ok** button.

1. Recycle the application pool by clicking the **Recycle..** button under the **Application Pool** tasks.