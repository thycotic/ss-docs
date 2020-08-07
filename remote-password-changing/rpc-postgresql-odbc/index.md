[title]: # (PostgreSQL and ODBC Remote Password Changing)
[tags]: # (Remote Password Changing, PostgreSQL, odbc)
[priority]: # (1000)

# PostgreSQL and ODBC Remote Password Changing

## Overview

You can create custom SQL password changers based on an ODBC driver. The Secret Server machine must have the corresponding ODBC driver installed. These can be downloaded from the corresponding database vendor sites.

ODBC connection strings vary depending on product. See [Example Connection Strings](#example-connection-strings) below for sample ODBC connection strings for Microsoft SQL server and PostgreSQL.

## Create an ODBC Password Changer

1. In Secret Server, go to **Admin \> Remote Password Changing**.

2. Click **Configure Password Changers**, and then scroll to the bottom of the page.

2. Click the **New** button.

3. Select **Generic ODBC (DataSource)** in the **Base Password Changer** dropdown list.

3. Type a name for your new custom password changer.

4. Under **Password Reset Commands**, type a command to reset a password (see below).

> **Note:**  Secret field variables can be used in a way similar to how they are used in a Linux or UNIX password changer, with the exception that they can be specified as ODBC parameters, assuming the command allows it. To parameterize a secret field variable, prefix it with the **@** symbol instead of a **$**.

## Example Reset Commands

Parameterized SQL server command:

`EXEC sp_password @CURRENTPASSWORD, @NEWPASSWORD`

> **Note:**  If the command does not support using parameters, the secret field values can be substituted into the command.

Substitution PostgreSQL command:

`ALTER ROLE "$USERNAME" WITH ENCRYPTED PASSWORD '$NEWPASSWORD'`


Substitution MySQL command:

`ALTER USER '$USERNAME' IDENTIFIED BY '$NEWPASSWORD';`

##  Adding Connection Strings

Each ODBC password changer requires a connection string. This can be specified within the password changer settings or in the secret itself.

### Adding Connection Strings to Password Changer Settings

Add a connection string to password changer settings:

1. In Secret Server, go to **Admin \> Remote Password Changing**.

1. Click **Configure Password Changers**.

2. Click the name of your password changer.

2. Click the **Edit** button.

3. Type your database ODBC connection string in the **Connection String** text box.

3. Click the **Save** button.

### Adding Connection Strings to Secrets

The Connection String can also be specified on the secret by adding a new field to the template and mapping it to the D**ata Source** property on the template's **Remote Password Changing** configuration. Otherwise, that mapping field can be left blank.

> **Note:** See [Creating or Editing Secret Templates](../../secret-templates/managing-secret-templates/creating-or-editing-secret-templates/index.md) for more information about adding fields to secret templates.

Example connection strings:

SQL 2012:

`Driver={SQL Server Native Client 11.0};Server=$SERVER;Database=master;Uid=$USERNAME;Pwd=$PASSWORD;`

PostgreSQL (x64):

`Driver={PostgreSQL ANSI(x64)};Server=$SERVER;Port=$PORT;Database=$DATABASE;Uid=$USERNAME;Pwd=$PASSWORD;`

## Troubleshooting

A common problem experienced with ODBC drivers is they require the IIS application pool to be set to either 32-bit or 64-bit mode to match the specified ODBC driver. When not set correctly, you will see an error in the system log when running heartbeat for a secret using that password changer.

PostgreSQL with 64-bit drivers will throw the following error if the IIS application pool is in 32-bit mode:

`ExpiredSecretMonitor - System.Data.Odbc.OdbcException (0x80131937): ERROR [IM002] [Microsoft][ODBC Driver Manager] Data source name not found and no default driver specified]`

## PostgreSQL with Distributed Engines

A machine with a distributed engine installed requires the corresponding ODBC driver. In some cases, additional configuration may be necessary. For example, PostgreSQL requires adding an additional host entry:

1. Install the latest PostgreSQL ODBC drivers on the agent computer.

2. Modify the `pg_hba.conf` (for example: `/PostreSql/9.3/pg_hba.conf`) file to have a host entry for the agent computer IP address. For example, where 192.168.60.147 is the IP address of the distributed engine:

   `host all all 192.168.60.147/32 md5`
