# SQL Authentication Configuration



SQL Authentication requires:

- Creating a new SQL account
- Enabling mixed mode 
- Enabling named pipes and SQL Browser a non-local SQL Server

For instructions on Creating the SQL account or Installing SQL Server see [Installing and Configuring SQL Server](http://updates.thycotic.net/link.ashx?SSSqlServerHelp) article.
 
 Instructions for enabling Mixed Mode

1. Connect to the SQL Server in SQL Management Studio
1. Right click on the instance node and select Properties
1. Navigate to the *Security* Tab
1. Under *Server Authentication* select "*SQL Server and Windows Authentication Mode*".
1. Click Ok
1. Restart the SQL Server, by right clicking on the instance node and selecting *Restart*

***Note:\*** If your SQL server is running on a separate machine, you will need to turn on Named Pipes and SQL Browser to ensure the SQL server can be accessed from an external machine.

 

Instructions for Enabling Named Pipes and SQL Browser
 
 In Programs, open SQL Server Configuration Manager

1. Click on the SQL Server Network Configuration node

1. Then select Protocols for MSSQLSERVER

1. Enable Protocols:

1. - Shared  Memory
   - Named  Pipes
   - TCP/IP

1. Then to enable the SQL Browser

1. Select the SQL Server Services node

1. Right click SQL Server Browser and select Start

 