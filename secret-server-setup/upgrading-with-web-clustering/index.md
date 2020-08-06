[title]: # (Upgrading Secret Server with Web Clustering)
[tags]: # (Setup, Upgrade, Web cluster)
[priority]: # (1000)

# Upgrading Secret Server with Web Clustering

## Introduction

Secret Server (SS) has a built-in Web installer. The Web installer is a series of pages inside SS that allow you to download and run updates. SS is accessible by users for most of the upgrade process. You can bring down outside access to the site if you want to prevent users from making changes during the upgrade. Preventing user access makes restoring the database and site backups simpler if you decide to roll back the upgrade immediately afterward.

> **Note:** You do not need to download the installer or `setup.exe`.

> **Important:** Never overwrite or delete your `encryption.config` file. 

> **Important:** Back up your SS folder and database before performing the upgrade. 

> **Important:** Upgrading to SS version 10.7.000000 and above, requires SQL Server 2012 or later as the database for SS. For more information, see the [Release Notes](../../release-notes/index.md).

> **Important:** Upgrading to SS version 10.0.000000 and requires configuring integrated pipeline mode on the SS Application Pool. Please see [Configuring IIS for installing or upgrading to Secret Server 10](http://updates.thycotic.net/link.ashx?IisPiplineIntegratedKnowledgeBase) (KBA) for details on configuring integrated pipeline mode in IIS. If using Integrated Windows Authentication, you will also need to update IIS authentication settings as detailed in  [Integrated Windows Authentication](https://thycotic.force.com/support/s/article/Setting-Up-Integrated-Windows-Authentication-in-Secret-Server-10-0) (KBA). If you are at version 9.1.000000 and below, you need to first upgrade to 9.1.000001 before you can upgrade to 10.0.000000 and above.

> **Important:** Upgrading to SS version 8.9.000000 and above requires Windows Server 2008 R2 or later.

> **Important:** Upgrading to SS version 8.5.000000 and above, there are changes in the .NET Framework version you will need to be aware of along with some additional steps in the upgrade process. For more information, see [Secret Server Moving to .NET Framework 4.5.1](http://support.thycotic.com/KB/a388/secret-server-moving-to-net-framework-451.aspx). 

## Before Beginning
$1
$21. Have a recent backup of the application files and database available.
$1
$2
## Upgrading a Clustered Environment
$1
$2$1
$2$1
$2$1
$2
## EFS and DPAPI Encryption

When upgrading, after the initial cluster configuration, you do not need to copy the `database.config` or `encryption.config` files to the other servers. If you need to copy those files because the database configuration changed and are using DPAPI, disable DPAPI encryption in SS by going to **Admin \> Configuration** and click **Decrypt Key to not use DPAPI** on the **Security** tab before copying those files to secondary servers.

> **Note:** EFS encryption is tied to the user account running the SS application pool, so it is not machine specific. Copying EFS encrypted files between SS instances will not result in errors, but is not needed.

## Upgrading Database Mirroring
$1
$21. Stop all but the Primary web server.
$1
$21. Once upgraded and working, copy the Web application folder to all secondary servers.
$1
$21. Ensure all instances are properly activated.
$1
$21. If the secondary Web server was pointing originally to the secondary database, adjust it to point back to the secondary database.

## Upgrading Remote DR Instances
$1
$21. Backup the primary instance.
$1
$21. Restore the database.
$1
$21. Restart IIS or recycle the application pool running SS on the remote DR instance.
$1
$2
## Error Conditions

 Two errors that may arise:

- Encryption configs don't match: See [Encryption key doesn't match error](https://thycotic.force.com/support/s/article/Encryption-key-doesnt-match-error?r=3&ui-force-components-controllers-recordGlobalValueProvider.RecordGvp.getRecord=1) (KBA).

- Version does not match: If a secondary node is not properly updated from the primary node after an upgrade, that node will not run because the application version does not match the database. The solution is to copy the application folder (minus the `database.config` or `encryption.config` files) to replace the files on the secondary server.

 