[title]: # (System Requirements for Secret Server)
[tags]: # (System Requirements)
[priority]: #

# System Requirements for Secret Server

> **Important:** Please read the notes at the bottom of this article.

## Minimum Requirements for Basic Deployments

| **Web Server**                            | **Database Server**                    |
| ----------------------------------------- | -------------------------------------- |
| 2 CPU Cores                               | 2 CPU Cores                            |
| 4 GB RAM                                  | 4 GB RAM                               |
| 25 GB Disk Space                          | 50 GB Disk Space                       |
| Windows Server 2012                       | Windows Server 2012                    |
| IIS 7 or newer (64-bit applications only) | SQL Server 2012-2019                   |
| .NET 4.5.1 or newer                       | Collation SQL_Latin1_General_CP1_CI_AS |

## Recommended Requirements for Basic Deployments

**Note:** Environments budgeting for over 10,000 secrets require a scoping call with a Thycotic engineer

| **Web Server**                            | **Database Server**                    |
| ----------------------------------------- | -------------------------------------- |
| 4 CPU Cores                               | 4 CPU Cores                            |
| 16 GB RAM                                 | 16 GB RAM                              |
| 25 GB Disk Space                          | 100+ GB Disk Space                     |
| Windows Server 2012-2019                  | Windows Server 2012-2019               |
| IIS 7 or newer (64-bit applications only) | SQL Server 2012-2019                   |
| .NET 4.6.1 or newer                       | Collation SQL_Latin1_General_CP1_CI_AS |

## Minimum Requirements for Advanced Deployments

Recommended for organizations deploying discovery, session recording,or increased numbers of distributed engines:

> **Note:** Also see feature-specific guides listed below.

| **Web Server**                            | **Database Server**                    |
| ----------------------------------------- | -------------------------------------- |
| 8 CPU Cores                               | 8 CPU Cores                            |
| 16 GB RAM                                 | 16 GB RAM                              |
| 25 GB Disk Space                          | 100+ GB Disk Space                     |
| Windows Server 2012-2019                  | Windows Server 2012-2019               |
| IIS 7 or newer (64-bit applications only) | SQL Server 2012-2019                   |
| .NET 4.6.1 or newer                       | Collation SQL_Latin1_General_CP1_CI_AS |

| **Distributed Engines** | **RabbitMQ Messaging Server** |
| ----------------------- | ----------------------------- |
| 4 CPU Cores             | 4 CPU Cores                   |
| 4 GB RAM                | 4 GB RAM                      |
| 25 GB Disk Space        | 40 GB Disk Space              |

> **Note:** Further adjustments to system requirements for both RabbitMQ and distributed engines are at the discretion of Thycotic Professional Services engineers.

## Recommended Requirements for Specific Features

[Session Recording Requirements: Basic and Advanced](../../session-recording/session-recording-requirements/index.md)

[Ports Used By Secret Server](../../networking/secret-server-ports/index.md)

## Notes

- Secret Server requires Microsoft SQL Server and its database be set to the collation SQL_Latin1_General_CP1_CI_AS. See [Microsoft SQL collation requirements](https://docs.microsoft.com/en-us/sql/relational-databases/collations/collation-and-unicode-support?view=sql-server-ver15) and check your server collation settings before  upgrading.

- System Requirements apply to both physical and virtual machines.

- Secret Server requires Microsoft SQL Server and its database be set to the collation SQL_Latin1_General_CP1_CI_AS. See [Microsoft SQL collation requirements](https://docs.microsoft.com/en-us/sql/relational-databases/collations/collation-and-unicode-support?view=sql-server-ver15) and check your server collation settings before  upgrading.

- If .NET or IIS features are not already installed on the web server, the Thycotic Installer will add and configure them automatically.

- Secret Server requires Microsoft SQL Server and its database be set to the collation SQL_Latin1_General_CP1_CI_AS. See [Microsoft SQL collation requirements](https://docs.microsoft.com/en-us/sql/relational-databases/collations/collation-and-unicode-support?view=sql-server-ver15) and check your server collation settings before  upgrading.

- A link to Microsoft documentation on the use and limitations of SQL Express can be found at: https://docs.microsoft.com/en-us/sql/sql-server/editions-and-components-of-sql-server-2017.

- Secret Server requires Microsoft SQL Server and its database be set to the collation SQL_Latin1_General_CP1_CI_AS. See [Microsoft SQL collation requirements](https://docs.microsoft.com/en-us/sql/relational-databases/collations/collation-and-unicode-support?view=sql-server-ver15) and check your server collation settings before  upgrading.

- **Unsupported Web Servers**: Small Business Server (SBS), The Essentials Edition, Any client OS, domain controllers, SharePoint servers.

- Secret Server requires Microsoft SQL Server and its database be set to the collation SQL_Latin1_General_CP1_CI_AS. See [Microsoft SQL collation requirements](https://docs.microsoft.com/en-us/sql/relational-databases/collations/collation-and-unicode-support?view=sql-server-ver15) and check your server collation settings before  upgrading.

- SQL launchers do not support SSMS 18.0 or higher.

- Secret Server requires Microsoft SQL Server and its database be set to the collation SQL_Latin1_General_CP1_CI_AS. See [Microsoft SQL collation requirements](https://docs.microsoft.com/en-us/sql/relational-databases/collations/collation-and-unicode-support?view=sql-server-ver15) and check your server collation settings before  upgrading.

- AWS RDS: Currently, we do not recommend using SS with AWS Relational Database Service when the Web host and the SQL instance are in different datacenters. Applications, such as SS, that use frequent, high-volume, ad hoc queries depend on fast network communication response time between the application and SQL database. Thus, network latency with many data access operations across datacenters can become an issue.

- Secret Server (SS) requires the application pool to have the “load user profile” setting enabled. Secret Server will report a critical alert to notify admins if this setting is not enabled. 

 