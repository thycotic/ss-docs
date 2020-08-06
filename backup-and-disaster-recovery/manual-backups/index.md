[title]: # (Manual Backups)
[tags]: # (Manual Backups)
[priority]: # (1000)

# Manually Backing up Secret Server

To back up your SS installation:

> **Note:** Your SS instance may be running during this procedure. 
$1
$22.  Copy the  folder (holding the application) to your back up location. 
$1
$24.  Right click the database your SS is running on, and select **Tasks \> Backup**. 
$1
$26.  Make sure SQL Server has permissions for this location. 
$1
$2
> **Note:** You can also automate steps 2-4 using the command: `osql -S myserver\SQLEXPRESS -E - Q "BACKUP DATABASE SECRETSERVER TO DISK = 'c:\backup\ss.bak' `.

