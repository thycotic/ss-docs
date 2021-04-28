[title]: # (Creating and Using SQL Scripts)
[tags]: # (API,Scripting,SQL,examples)
[priority]: # (1000)

# Creating and Using SQL Scripts

SQL scripts can be used in Secret Server to automate specific tasks.  A SQL script can be configured as a dependency of a Secret and run after the password is successfully changed on the Secret.

## Creating a SQL Script

From the Administration Menu, click Scripts. Click the SQL tab on the Scripts page, then click the Create New button.  Enter the "Name", "Description", and "Script" in the dialog then click OK.  Using SQL scripts as dependencies requires that Remote Password Changing is turned on, so ensure that this is enabled on the Remote Password Changing page.

## Using Parameters

An input box for specifying arguments will exist in places where the SQL scripts are used.  It is often beneficial to assign variables to other more meaningful variables.

### Examples

#### SQL

````sql

UPDATE TABLE cmsuser
SET password = PWDENCRYPT(@Password) WHERE username = @Username;

````

#### MySQL

````sql

UPDATE TABLE cmsuser
SET password = PASSWORD(?) WHERE username = ?;

````

#### PostgreSQL

````sql

UPDATE TABLE cmsuser
SET passwd = CRYPT(?, GEN_SALT('sha256')) WHERE username = ?;

````

#### ODBC

````sql

UPDATE TABLE cmsuser
SET passwd = $Password WHERE username = $Username;

````

#### Basic Oracle PL/SQL

````sql

INSERT INTO cmuser values (:username, :password);

````

#### Advanced Oracle PL/SQL

````sql

EXECUTE IMMEDIATE 'alter user '|| :username ||' identified by "' || :password || '"';

````

## Returning Errors

In situations where the script should fail given a specific set of conditions, an exception should be explicitly thrown.  When an exception is thrown, the script will stop running and the failure will be logged in the System Log.  The script is considered to have successfully run if no errors or exceptions occur while processing.

### Examples

#### SQL

````sql

RAISERROR(N'ERROR: %s', 14, 1, N'Failure');

````

#### MySQL

````sql

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'ERROR: Failure';

````

#### PostgreSQL

````sql

DO language plpgsql $$
BEGIN
RAISE EXCEPTION 'ERROR (14)';
END
$$;

````

#### ODBC


````sql

RAISERROR(N'ERROR: %s', 14, 1, N'Failure');

````

## SQL Example

One issue in SQL Server database environments is if a linked database is set up with a specific credential, and that credential's password changes. Set up a SQL Script to run as a dependency after the password change occurs to drop and recreate the link. Note that the options may need to be edited depending on desired linked server configuration.

### Example

#### SQL

````sql

EXEC master.dbo.sp_dropserver @server=@MACHINE, @droplogins='droplogins'
EXEC master.dbo.sp_addlinkedserver @server = @MACHINE, @srvproduct=N'SQL Server'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=@MACHINE,@useself=N'True',@locallogin=NULL,@rmtuser=NULL,@rmtpassword=NULL
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=@MACHINE,@useself=N'False',@locallogin=@LOCALUSERNAME,@rmtuser=@REMOTEUSERNAME,@rmtpassword=@PASSWORD

````

#### Parameters

@MACHINE - The machine\instance of the server where the linked database exists. i.e. SERVER\SQL2014.
@LOCALUSERNAME - The local login on the server where the linked database is configured.
@REMOTEUSERNAME - The username set in the linked database security info for connecting to the linked database. This should be the username of the Secret that the dependency is on.
@PASSWORD - This will be the new password after the SQL account's password is changed.
