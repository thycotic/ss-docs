[title]: # (System Requirements for Secret Server)
[tags]: # (System Requirements)
[priority]: #

# System Requirements for Secret Server

> **Important:** Please read the notes at the bottom of this article.

## Minimum Requirements for Basic Deployments

| **Web Server**                  | **Database Server**             |
| ------------------------------- | ------------------------------- |
| 2 CPU Cores                     | 2 CPU Cores                     |
| 4 GB RAM                        | 4 GB RAM                        |
| 25 GB Disk Space                | 50 GB Disk Space                |
| Windows Server 2008 R2 SP1-2019 | Windows Server 2008 R2 SP1-2019 |
| IIS 7 or newer                  | SQL Server 2012-2017            |
| .NET 4.5.1 or newer             |                                 |

## Recommended Requirements for Basic Deployments

**Note:** Environments budgeting for over 10,000 secrets require a scoping call with a Thycotic engineer

| **Web Server**           | **Database Server**      |
| ------------------------ | ------------------------ |
| 4 CPU Cores              | 4 CPU Cores              |
| 16 GB RAM                | 16 GB RAM                |
| 25 GB Disk Space         | 100+ GB Disk Space       |
| Windows Server 2012-2019 | Windows Server 2012-2019 |
| IIS 7 or newer           | SQL Server 2012-2017     |
| .NET 4.6.1 or newer      |                          |

## Minimum Requirements for Advanced Deployments

Recommended for organizations deploying discovery, session recording,or increased numbers of distributed engines:

> **Note:** Also see feature-specific guides listed below.

| **Web Server**           | **Database Server**      |
| ------------------------ | ------------------------ |
| 8 CPU Cores              | 8 CPU Cores              |
| 16 GB RAM                | 16 GB RAM                |
| 25 GB Disk Space         | 100+ GB Disk Space       |
| Windows Server 2012-2019 | Windows Server 2012-2019 |
| IIS 7 or newer           | SQL Server 2012-2017     |
| .NET 4.6.1 or newer      |                          |

| **Distributed Engines** | **RabbitMQ Messaging Server** |
| ------------------------ | ----------------------------- |
| 4 CPU Cores             | 4 CPU Cores                   |
| 4 GB RAM                | 4 GB RAM                      |
| 25 GB Disk Space        | 40 GB Disk Space              |

> **Note:** Further adjustments to system requirements for both RabbitMQ and distributed engines are at the discretion of Thycotic Professional Services engineers.

## Recommended Requirements for Specific Features

[Session Recording Requirements: Basic and Advanced](https://thycotic.force.com/support/s/article/SS-REF-EX-Session-Recording-Requirements)

[Ports Used By Secret Server](https://thycotic.force.com/support/s/article/Ports-used-by-Secret-Server)

## Notes

- System Requirements apply to both physical and virtual machines.

- For best performance, we recommend using dedicated (clean) servers for hosting Thycotic products.

- If .NET or IIS features are not already installed on the web server, the Thycotic Installer will add and configure them automatically.

- If SQL is not already installed on a database server, the Thycotic installer can setup SQL Express on the web server; however, SQL Express is intended for trials and sandbox environments **only**. Though Thycotic will support SQL Express, users will likely experience performance issues due to the memory and product limitations. If experiencing performance issues while using SQL Express, we highly recommend upgrading to SQL Server prior to contacting Thycotic Support.

- A link to Microsoft documentation on the use and limitations of SQL Express can be found at: https://docs.microsoft.com/en-us/sql/sql-server/editions-and-components-of-sql-server-2017.

- **Installing Secret Server with Azure SQL**: Currently, we do not recommend using SS with Azure SQL when the Web host and the Azure SQL instance are in different datacenters. According to Microsoft, applications, such as SS, that use frequent, high-volume, ad hoc queries use substantial response time on network communication between the application and Azure SQL database tiers. Thus, network latency with many data access operations across datacenters can become an issue.

- **Unsupported Web Servers**: Small Business Server (SBS), The Essentials Edition, Any client OS, domain controllers, SharePoint servers.

- Secret Server Cloud requires an on-premise machine to use a distributed engine.

- SQL launchers do not support SSMS 18.0 or higher.

- Discovery scanning for Windows Server 2016 scheduled tasks requires that either the SS node or the distributed engine that is executing the scan must run on Windows Server 2016 or later. This is due to changes in Windows Server 2016 API used for scheduled task dependency scans.

 