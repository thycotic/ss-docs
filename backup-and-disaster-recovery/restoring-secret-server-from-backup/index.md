[title]: # (Restoring Secret Server from a Backup)
[tags]: # (Backup,Restore)
[priority]: # (1000)

# Restoring Secret Server from a Backup

To restore your Secret Server from a backup:

## Restoring the Application 

$1
$21. If you have configured encryption of your `encryption.config` using EFS or DPAPI, you will need to replace the file from the backup with the unencrypted one.
$1
$2
## Restoring the SQL Server Database

Choose one of the following scenarios:

### Scenario One: Database and Secret Server Are in the Same Location

$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2   1. Right click on the SS database and go to **Properties**.
   1. At the very bottom, change the **Restrict Access** property to "SINGLE_USER". This closes all other connections to the SS database.
   1. Re-attempt the restore.
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
    > **Note:** If you are prompted for database credentials when accessing SS and are unable to re-connect, you may need to remap the user.
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
### Scenario Two: The Database and Secret Server Are in Different Locations

$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2   1. Right click on the SS database and go to **Properties**.
   1. At the very bottom, change the **Restrict Access** property to "SINGLE_USER". This closes all other connections to the SS database.
   1. Re-attempt the restore.
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
      > **Note:** If you are prompted for database credentials when accessing SS and are unable to re-connect, you may need to remap the user.
$1
$2   
$1
$2$1
$2$1
$2$1
$2$1
$2      There is no need to go any further with the install because the `database.config` has been recreated with the new information.
$1
$2
 