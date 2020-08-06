[title]: # (Enabling SQL Server Encryption)
[tags]: # (SQL Server, Encryption, installation)
[priority]: #	(1000)

# Enabling SQL Server Encryption

Administrators can enable end-to-end encryption with the SQL database by using an  Encrypted connection. This is a feature that is built into Microsoft SQL Server and Secret Server supports. To enable encryption:
$1
$2   
$1
$2
   ![image-20200616151810093](images/image-20200616151810093.png)
   
$1
$2$1
$2
   ![image-20200616152210555](images/image-20200616152210555.png)
$1
$2$1
$2
> **Note:** SQL Server must be pre-configured to support encryption. This [Microsoft TechNet article](http://technet.microsoft.com/en-us/library/ms191192.aspx ) explains how to configure the SQL Server environment for encryption. The SSL encryption used for communicating with SQL Server is either 40 or 128 bit, depending on the Windows operating system used.   

> **Note:** Using this setting can adversely affect [performance](http://support.thycotic.com/KB/a293/microsoft-sql-server-2012-alwayson-support.aspx) (KBA).  See this [TechNet article](http://technet.microsoft.com/en-us/library/ms189067.aspx) for additional information.