[title]: # (Backup Settings)
[tags]: # (Backup Settings)
[priority]: # (10)

# Backup Settings

The following configuration options are available on the **Tools | Backup** page of SS:

- **Backup Database File Path:** This folder must be accessible by the SQL server and stores the `database.bak` file.
- **Backup File Path:** This directory must exist on the Web server and stores the zip file of the application directory.
- **Database Backup SQL Timeout (Minutes):** Number of minutes that SS waits for the database backup to complete successfully before timing out.
- **Enable Scheduled Backup:** Enables automatic backups on a set schedule.
- **Keep Number of Backups:** Number of previous backups to keep.
- **Notify Administrators on Backup Failure:** Users with the Administer Backup role permission are notified if the backup fails.
- **Days to Keep Operational Logs**: Sets the period to keep backup-related logs that might contain PII. SS automatically deletes logs older than that (in days).
