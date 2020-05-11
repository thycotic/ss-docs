[title]: # (1. Trial Installation Prerequisites)
[tags]: # (Install,Prerequisites)
[priority]: # (1000)

# Step 1: Trial Installation Prerequisites

Below are our suggested guidelines for preparing to run a trial or proof-of-concept (POC) of SS.

## System Requirements

Please review the detailed [System Requirements for Secret Server](../../secret-server-setup/system-requirements/index.md). The *Minimum Requirements* are for trial, sandbox, and POC environments. The *Recommended Requirements* are for production deployments.

## Hardware Requirements

SS can be installed on a physical server or virtual machine.

If you would like to set up front-end (application) clustering, you need to have two or more servers available.

For testing of high availability for the SQL Server, you can use either existing Microsoft AlwaysOn infrastructure or database mirroring. If you choose to test this, this is something your database team needs to prepare in advance.

## Software Requirements

### Checklist

- Windows Server 2012 or newer (recommended) (one server, minimum)
- SQL Server (one instance, minimum)
- Application server prerequisites
- SSL certificate

### SQL Server

You can create the SQL database in an existing SQL instance, or a new installation of SQL Server. For high availability, this needs to be a paid edition of SQL Server (not SQL Express). If you are using a new installation of SQL Server, please have this installed beforehand.

Detailed instructions for installation and configuration of SQL Server are included in one of the installation guides below (choose the guide matching the OS that SQL server will be installed on).

### Application Server

We recommend installing SS on Windows Server 2012 or greater. Include IIS, ASP.NET and .NET Framework. Refer to the System Requirements KB above to view prerequisite details.

## Application Configuration

### Service Account

Set up a service account:

1. Log on as a batch job (on the server that SS runs on)
1. Modify permissions to the SS application directory (typically `C:\inetpub\wwwroot`) and `C:\Windows\temp`.
1. Provide access to your SQL Server instance by adding the db_owner permission to the SS database.

For detailed instructions on how to configure the permissions for the service account, see [Running Secret Server IIS Application Pool with a Service Account ](https://thycotic.force.com/support/s/article/Best-Adv-Install-Using-a-Service-Account-to-Run-IIS-App-Pool-and-SQL-DB)(KB). The installation guides iinclude instructions for assigning db_owner permission to the service account in SQL Server.

If you would like to test features that rely on Active Directory, such as AD group sync or discovery, you should also have accounts available with the appropriate permissions (described below). One option is to use the same account for both features.

### Active Directory Group Sync

Active Directory group synchronization means that SS can automatically add users and enable or disable them to log into SS based off of their Active Directory group membership. You can choose which groups to sync. When configuring AD group sync in SS, you are required to specify an account that can read the properties of users and groups. See [AD Synchronization Rights for Synchronization Account](https://thycotic.force.com/support/s/article/Active-Directory-Rights-for-Synchronization-Account) (KB) for a detailed list of required permissions.

### Discovery

To test discovery, please have some machines available for SS to connect to for discovering accounts. An account is required to sync with AD and also scan the machines found for Windows local account and service account discovery. [Account Permissions for Discovery](https://thycotic.force.com/support/s/article/Account-Permissions-for-Discovery) (KB) describes the permissions required for an AD account to be used for discovery.

### Test Accounts

We recommend having a few test accounts available to represent the types of accounts you want to manage using SS. These could be local Windows accounts, service accounts running scheduled tasks or services, SQL server accounts, and others.

### Email Notifications

To test email notifications, which can be used for event subscription notifications or requests for approval to passwords, you need configuration information for the company SMTP server:

- Service account to run the application and connect to SQL
- Domain (test or production)
- Domain account to be used for AD sync and discovery
- Test machines (if testing discovery)
- Test accounts
- SMTP server settings

### SSL Certificate

We recommend setting up SSL (or https) for access to SS. To do so, you will need an SSL certificate. You may use an existing wildcard certificate, create your own domain certificate, or purchase a third-party SSL certificate for the SS.

### Firewalls and Ports

SS must connect directly to a target system to change its password. For devices that are firewalled off from SS, remote agent can provide connectivity to them, but they also require connectivity from them to the target systems for password changing.

Please see [Ports Used by Secret Server](https://thycotic.force.com/support/s/article/Ports-used-by-Secret-Server) (KB) for a list of ports needed by SS for password changing, discovery, and other features.
