[title]: # "Custom Launcher Errors"
[tags]: # "error, custom launcher"
[priority]: # "1000"

# Custom Launcher Errors

Common errors when creating custom launchers:

**The process (process name) was not found** 

The application has not been installed on the machine. If the application was installed, the program folder will need to be added to the path.

**The stub received bad data (1783)** 

The process is set to launch as the credentials of the secret but the username or domain is not correct on the secret or the client machine cannot find the user or domain credentials specified.

**Error(740): The requested operation requires elevation** 

When using "Run process as Secret credentials," even though the credentials have admin privileges, the process cannot be run with elevated privileges from the command prompt using runas. Instead, configure the process launcher as follows (substituting your .exe for program.exe): 

- Process Name: cmd.exe
- Process Arguments: `/C start /B program.exe /wait`

 