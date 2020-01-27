[title]: # (System Log)
[tags]: # (XXX)
[priority]: # (40)

# System Log

The System Log is used to communicate the different events that are occurring while SS is executing. It can be helpful in troubleshooting unexpected behavior. The system log can be enabled by clicking **Edit** and checking the **Enable System Log** check box on the **Administration > System Log** page.

System log parameters include:

- **Maximum Log Length:** This is the maximum number of rows to keep in the system log table in the SQL database. When it reaches that amount, it is reduced by 25%.

- **Notify Administrators when System Log is Shrunk:** This setting is used to send an email to all system log administrators when the system log has been truncated. A system log administrator is any user in a role with the Administer System Log permission included.

To clear the system log of all its records, click **Clear**.
