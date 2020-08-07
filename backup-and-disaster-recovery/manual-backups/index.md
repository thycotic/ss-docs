[title]: # (Manual Backups)
[tags]: # (Manual Backups)
[priority]: # (1000)

# Manually Backing up Secret Server

To back up your SS installation:

> **Note:** Your SS instance may be running during this procedure.

1. Navigate to the directory where SS is installed.

2. Copy the  folder (holding the application) to your back up location.

3. Open your SQL Server Management Studio.

4. Right click the database your SS is running on, and select **Tasks \> Backup**.

5. Click the **Add** button. You will be prompted to enter a file path.

6. Make sure SQL Server has permissions for this location.

7. Copy the resulting database backup file to your backup location.

> **Note:** You can also automate steps 2-4 using the command: `osql -S myserver\SQLEXPRESS -E - Q "BACKUP DATABASE SECRETSERVER TO DISK = 'c:\backup\ss.bak' `.
