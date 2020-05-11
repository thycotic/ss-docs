[title]: # (Custom Launchers)
[tags]: # (Launcher)
[priority]: # (1000)

# Custom Launchers

SS can configure a program to run when clicking the launcher on a secret. You can customize process launchers to work with any application that can be started by command-line and passes values to the command-line from the secret text fields. For process launchers to work, the client machine needs to have the program installed and typically needs the program folder in the PATH environment variable.

There are three types of custom launchers to choose from:

- **Process:** Launch a process on the client machine that connects directly to the target system from the client.

- **Proxied SSH Process:** Launch a process on the client machine that proxies its connection to the target system through SS.

> **Note:** See [Configuring SSH Proxies for Launchers](../launcher-configuration-and-support/configuring-ssh-proxies-for-launchers/index.md).

- **Batch File:** Launch a batch file from the client machine.

