[title]: # (Accessing MS SQL Server with IWA)
[tags]: # (Integrated Windows Authentication, IWA, Authentication, Credentials. SQL)
[priority]: #

# Accessing MS SQL Server with IWA

> **Note:** Please see the closely related article [Using a Service Account to Run the IIS App Pool & Access the Thycotic SQL Database – Best Practices (Advanced)](https://thycotic.force.com/support/s/article/Best-Adv-Install-Using-a-Service-Account-to-Run-IIS-App-Pool-and-SQL-DB) for additional information.

## Introduction

Integrated Windows Authentication (IWA) requires:

- Installing a SQL Server instance

- Creating a new domain service account

- Installing a SQL Server instance

- Registering  a service account to run IIS and ASP.NET

- Assigning an account as an application pool identity

> **Note:** For instructions on Creating the SQL account or Installing SQL Server see [Installing and Configuring SQL Server](http://updates.thycotic.net/link.ashx?SSSqlServerHelp) (KBA).

## Creating a Domain Service Account

The account needs access to the application server and database server. Ensure password expiration is not enabled or the account could lock you out of Secret Server.

## Granting Access to SQL Server database
$1
$21. Right click on the Security node (ensure this is the top most security node under the instance and not under the database name itself) and select **New \> Login**.
$1
$21. Ensure **Windows Authentication** radio button is selected.
$1
$21. Click the **Ok** button.

<!-- Registering Service Account to Run IIS and ASP.NET](http://ASP.NET)

 Follow the instructions in [Running Secret Server Application Pool as a Service Account](http://support.thycotic.com/KB/a94/running-secret-server-iis-application-pool-with-service.aspx) article. -->

## Assigning Account as Identity of Application Pool 
$1
$21. Click the Application Pool node.
$1
$21. On the Right panel, Click .
$1
$21. In the popup, select **Custom Account \> Set**.
$1
$21. Type the password.
$1
$21. Recycle the application pool by clicking the **Recycle..** button under the **Application Pool** tasks.