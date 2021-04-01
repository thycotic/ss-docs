[title]: # (Common Backup Errors)
[tags]: # (Backup errors)
[priority]: # (1000)

# Common Backup Errors

**Cannot open backup device… Operating system error 3**

This is often due to an invalid path value for the "Backup Database File  Path" setting. For more information on the proper values for this  setting, see [File Path Settings](../backup-settings/index.md#file-path-settings).

**Timeout expired. The timeout period elapsed prior to completion of the operation or the server is not responding.**

This is often due to an overly-large database. The SS database  likely contains too many log entries. To clear these, within SS, select System Log from the Administration menu. Click the "Clear" button below the data grid that contains the log entries. If the  timeout occurs with the clear as well, an upgrade to the latest version  should resolve this. If the timeout issue persists with the backup,  additional SQL database clean-up may be necessary. Contact [Thycotic Support](http://thycotic.com/products/secret-server/support-2/) for instructions on shrinking the reserve database size.

**The process cannot access the file… because it is being used by another process**

The cause of this message is typically multiple backup threads running simultaneously with all attempting to write to the same file. To fix this, open IIS Manager and ensure the "Maximum Worker Processes" setting for SS's  application pool is set to 1. If it is not, set the value to 1 and then  either recycle the application pool or perform an `iisreset`.

**Unable to complete backup. The following exception occurred: System.Threading.ThreadAbortException: Thread was being aborted**

If  this error message appears in combination with the application backup files not completed or the size of the file is unusually small, the  backup process may have been interrupted by anti-virus software. Disabling scanning of the backup folder should resolve the issue.

Also see:
[Backing up Secret Server to a network share](http://support.thycotic.com/KB/a210/backing-up-secret-server-to-a-network-share.aspx) (KBA)

