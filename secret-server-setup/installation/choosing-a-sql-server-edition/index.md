[title]: # (Choosing a SQL Server Edition to Use with Secret Server)
[tags]: # (Microsoft,SQL,Edition,Selecting)
[priority]: # (1000)

# Choosing a SQL Server Edition to Use with Secret Server

Choose the Microsoft SQL Sever edition to work with Secret Server that best supports the functionality you wish to achieve.

The brief guide below should help you decide which licensing model best suits the needs of your organization.

## SQL Server Express Edition

SQL Server Express is a free version of SQL that is sufficient to run most of the functionality within the Secret Server application itself.

However, advanced functionality like mirroring and clustering is not available. SQL Server Express is not recommended for use in production environments due to the database size limitation.

## SQL Server Standard Edition

SQL Server Standard provides most of the functionality administrators typically want, including the most common type of mirroring, and clustering up to two cluster nodes.

## SQL Server Enterprise Edition

SQL Server Enterprise provides all of the functionality found in the Standard Edition, plus the ability to cluster up to eight nodes and to perform asynchronous mirroring.

For more information on the different editions of SQL Server, see the [Microsoft SQL Server 2016 Licensing Guide](https://download.microsoft.com/download/9/C/6/9C6EB70A-8D52-48F4-9F04-08970411B7A3/SQL_Server_2016_Licensing_Guide_EN_US.pdf).
