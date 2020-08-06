[title]: # (Backup Settings)
[tags]: # (Backup Settings)
[priority]: # (1000)

# Backup Settings

## Overview

The following configuration options are available on the **Tools \> Backup** page of SS:

- **Backup Database File Path:** This folder must be accessible by the SQL server and stores the `database.bak` file. See [File Path Settings](#file-path-settings).

- **Backup File Path:** This directory must exist on the Web server and stores the zip file of the application directory. See [File Path Settings](#file-path-settings).

- **Backup Database File Path:** This folder must be accessible by the SQL server and stores the `database.bak` file. See [File Path Settings](#file-path-settings).

- **Enable Scheduled Backup:** Enables automatic backups on a set schedule.

- **Backup Database File Path:** This folder must be accessible by the SQL server and stores the `database.bak` file. See [File Path Settings](#file-path-settings).

- **Notify Administrators on Backup Failure:** Users with the Administer Backup role permission are notified if the backup fails.

- **Days to Keep Operational Logs**: Sets the period to keep backup-related logs that might contain PII. SS automatically deletes logs older than that (in days).

## File Path Settings

There are two file path settings on the **Admin > Backup** page  (`ConfigurationBackup.aspx`). The "Backup File Path" setting corresponds  to the application backup. The "Backup Database Path" setting  corresponds to the SQL server backup.   

Generally, the "Backup File Path"  setting can be set to a path local to the application server for backing up of application files. If SS is running under an account  that does not have permission to write to a local path, then a network  share can be used. If the SQL server is located on the same server as the Web application server, the "Backup Database File Path" setting can be set to a local path. 

If the SQL server is not  located on the same server as the Web application server then a network  share should be used. The account under which SQL server service is  running either must have modify rights to that path or must be a member  of a group with modify rights to that path. You must use UNC (Universal  Naming Convention) notation to write to a network path. For example:  `\\TESTVM0\c$\backupDirectory`. 

If you get an error  stating "Cannot open backup device… Operating  system error 3," this is often due to an invalid path value. 

> **Note:** For SS to delete old database backups, the backup database path must also be accessible by the SS Application Pool account. 
