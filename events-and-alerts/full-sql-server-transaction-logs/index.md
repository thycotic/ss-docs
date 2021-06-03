[title]: # (Managing Full SQL Server Transaction Logs)
[tags]: # (full,sql server,transaction log)
[priority]: # (1000)

# Managing Full SQL Server Transaction Logs

SQL Server maintains a history of all operations in a transaction log. If this transaction log becomes full, you may receive one or more of the following errors:

`System.ArgumentException: Cannot add two background tasks with the same name.`

`Thycotic.Data.DataAccessorException: The transaction log for database '{database}' is full. To find out why space in the log cannot be reused, see the log_reuse_wait_desc column in sys.databases`

By default, a transaction log can grow to an unrestricted size, but some may become full in the following circumstances:

* The drive where the transaction log file is kept is out of disk space.

* The transaction log file hits its growth limit.

## Potential Solutions

* Back up the log.

* Free up disk space so that the log can grow automatically.

* Move the log file to a disk drive with sufficient space.

* Increase the size of the log file.

* Add a log file on a different disk.

* Complete or kill a long-running transaction.

* Switch to simple recovery mode and truncate the log.

For more detailed information on transaction logs in SQL, see [Understanding and Managing Transaction Logs](http://technet.microsoft.com/en-us/library/ms345583%28v=sql.90%29.aspx).
