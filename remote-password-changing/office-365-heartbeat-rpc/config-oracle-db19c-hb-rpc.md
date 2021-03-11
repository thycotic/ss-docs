[title]: # (Oracle DB19c for Heartbeat and RPC)
[tags]: # (Oracle DB Heartbeat RPC )
[priority]: # (1001)

# Secret Server: Configuring and Troubleshooting Oracle Database 19c for Heartbeat and RPC
This document explains how to configure Oracle Database 19c for heartbeat and remote password changing (RPC) with Secret Server (SS). It consists of installing the Oracle Database Access Components (ODAC), configuring SS, and configuring one or more distributed engines.

## TITLE
Provide a short description of the article. The title appears in the article and in search results.
Secret Server: Configuring and Troubleshooting Oracle Database 19c for Heartbeat and RPC

## URL NAME
SS-HOW-EXT-RPC-Heartbeat-Oracle

## SUMMARY
Briefly describe the article. The summary is used in search results to help users find relevant articles. You can improve the accuracy of search results by including phrases that your customers use to describe this issue or topic.
This document explains how to configure Oracle Database 19c for heartbeat and remote password changing (RPC) with Secret Server (SS). It consists of installing the Oracle Database Access Components (ODAC), configuring SS, and configuring one or more distributed engines.

## ARTICLE
Internal Only: Please do not make this visible to customers without first contacting Thycotic Technical Publications.

 
*October 23, 2019*

Note: This document is not updated with every release—many releases do not affect the guide's contents and thus do not warrant a document update.

## Relevance
This Thycotic **technical configuration** knowledge base article is relevant to and has been tested on:

* Secret Server 10.7 on Windows Server 2016 Standard (64-bit)
* Distributed engine 10.7 on Windows Server 2016 Standard (64-bit)
* Oracle Database 19c on Windows Server 2019 Standard (64-bit)
 
## Introduction
This document explains how to configure Oracle Database 19c for heartbeat and remote password changing (RPC) with Secret Server (SS). The process consists of installing the Oracle Database Access Components (ODAC), configuring SS, and configuring one or more distributed engines.

Note: This guide supersedes the support article Configuring Oracle Client to Work with Secret Server.

## Procedure
### Task One: Installing the Oracle Database Access Components
Navigate to ODAC Runtime Downloads in your browser.

Download the latest version of the ODAC OUI file with the same major number as your database version.

Note: As of October 22, 2019, the latest ODAC version is 19.3.

Unzip the file.

Right click and run setup.exe as a Windows administrator. The setup wizard appears.

Click to select Use Windows Built-in Account.

Click the Next button.

Type the desired installation path, such as c:\oracle.

Click the Next button.

Confirm the default product components are selected. If not, click to select Reset Defaults.

Click the Next button.

Leave the DB Connection Configuration fields as they are (empty).

Click the Next button. The setup runs some pre-installation configuration tests.

When the tests are completed, click the Install button.

Reboot your machine.

### Task Two: Configuring Secret Server
Navigate to the ODAC directory, such as c:\oracle.

Copy the C:\oracle\product\19.x.x\client_1\odp.net\bin\4\Oracle.DataAccess.dll file to the bin directory of your SS directory, for instance, c:\inetpub\wwwroot\SecretServer\bin.

Navigate to the C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config directory.

Open the machine.config file.

Copy and paste the line below into the <DbProviderFactories> section:

<add name="Oracle.DataAccess" invariant="Oracle.DataAccess.Client" description="Oracle Data Provider for .NET, Unmanaged Driver" type="Oracle.DataAccess.Client.OracleClientFactory, Oracle.DataAccess, Version=4.122.19.1, Culture=neutral, PublicKeyToken=89b483f429c47342"/>
The section should look like this:

<system.data>
	<DbProviderFactories>
      <add name="Oracle.DataAccess" invariant="Oracle.DataAccess.Client" description="Oracle Data Provider for .NET, Unmanaged Driver" type="Oracle.DataAccess.Client.OracleClientFactory, Oracle.DataAccess, Version=4.122.19.1, Culture=neutral, PublicKeyToken=89b483f429c47342"/>
    </DbProviderFactories>
</system.data>
Note: There may be additional <Add> sections, such as for Microsoft SQL Server. Leave them as is.

### Task Three: Configuring a Secret Server Distributed Engine
Navigate to the ODAC directory on the distributed engine machine, such as c:\oracle.

Copy the C:\<ODAC_Directory>\odp.net\bin\4\Oracle.DataAccess.dll file to the Distributed Engine directory, for instance, C:\Program Files\Thycotic Software Ltd\Distributed Engine.

Navigate to the C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config directory.

Open the machine.config file.

If necessary, create a <DbProviderFactories> section within the <system.data> section.

Copy and paste the line below into the <DbProviderFactories> section:

<add name="Oracle.DataAccess" invariant="Oracle.DataAccess.Client" description="Oracle Data Provider for .NET, Unmanaged Driver" type="Oracle.DataAccess.Client.OracleClientFactory, Oracle.DataAccess, Version=4.122.19.1, Culture=neutral, PublicKeyToken=89b483f429c47342"/>
The section should look like this:

<system.data>
	<DbProviderFactories>
      <add name="Oracle.DataAccess" invariant="Oracle.DataAccess.Client" description="Oracle Data Provider for .NET, Unmanaged Driver" type="Oracle.DataAccess.Client.OracleClientFactory, Oracle.DataAccess, Version=4.122.19.1, Culture=neutral, PublicKeyToken=89b483f429c47342"/>
    </DbProviderFactories>
</system.data>
## Troubleshooting
### Log Files
The errors below may appear in these files:

SS-BWSR.log (SS)
SSDE.log (distributed engine)
These files are located within the log subdirectory of the application's directory. Typically, these are:

Secret Server: c:\inetpub\wwwroot\secretserver\log\SS-BWSR.log
Distributed engines: c:\program files\thycotic software ltd\distributed engine\log\SSDE.log
### Errors
Oracle.DataAccess.Client.OracleException: The provider is not compatible with the version of Oracle client
This error occurs when the Oracle ODAC driver does not match the Oracle database version.

Uninstall the ODAC, and then re-install the correct version. You can uninstall ODAC using the universal installer that is included with the ODAC installation that resides in the ODAC directory.

Oracle.DataAccess.Client.OracleException (0x80004005): ORA-12514: TNS:listener does not currently know of service requested in connect descriptor
This error occurs when the secret's database field does not match the Oracle SERVICE_NAME database.

Note: The default “Oracle Account” secret template's database field is looking for the Oracle SERVICE_NAME database. You can find that database’s location by reading the tnsnames.ora configuration file on your Oracle database server.

System.ArgumentException: Unable to find the requested .Net Framework Data Provider. It may not be installed.
This error occurs when Oracle parameters are missing from the <dbProviderFactories> section in the machine.config file.

System.Configuration.ConfigurationErrorsException: Unrecognized element
This error occurs when the <dbProviderFactories> section, located in the machine.config file, is not properly formatted.