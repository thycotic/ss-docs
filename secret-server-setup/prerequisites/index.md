[title]: # (Prerequisites)
[tags]: # (Prerequisites)
[priority]: #

# Prerequisites

## System Requirements

Please review the detailed [System and Memory Requirements for Secret Server](../system-requirements/index.md). The *Minimum Requirements* are for trial, sandbox, and POC environments. The *Recommended Requirements* are for production deployments.

## Hardware Requirements

SS can be installed on a physical server or virtual machine.

If you would like to set up front-end (application) clustering, you need to have two or more servers available.

For testing of high availability for the SQL Server, you can use either existing Microsoft AlwaysOn infrastructure or database mirroring. If you choose to test this, this is something your database team needs to prepare in advance.

## Software Requirements

### Checklist

- Windows Server 2012 or newer (recommended) (one server, minimum)

- SQL Server (one instance, minimum)

- Windows Server 2012 or newer (recommended) (one server, minimum)

- SSL certificate

### SQL Server

You can create the SQL database in an existing SQL instance, or a new installation of SQL Server. For high availability, this needs to be a paid edition of SQL Server (not SQL Express). If you are using a new installation of SQL Server, please have this installed beforehand.

Detailed instructions for installation and configuration of SQL Server are included in one of the installation guides below (choose the guide matching the OS that SQL server will be installed on).

### Application Server

We recommend installing SS on Windows Server 2012 or greater. Include IIS, ASP.NET and .NET Framework. Refer to the System Requirements KB above to view prerequisite details.
