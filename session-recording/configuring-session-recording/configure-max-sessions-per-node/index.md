[title]: # (Configuring Max Concurrent Recording Sessions Per Web Node)
[tags]: # (configure,session recording,maximum,sessions,web node)
[priority]: # (1000)

# Configuring the Maximum Concurrent Recording Sessions Per Web Node

To set the maximum number of concurrent recording sessions allowed per web node, follow the procedure below on your Secret Server web server node dedicated to session recording:

1. Navigate to the `web-appSettings_config` file (default location `C:\inetpub\wwwroot\SecretServer\web-appSettings.config`).

1. Right-click the file to open it with Notepad.

1. Before the final `appSettings` line, insert the following string:

   `<add key="PrefetchCount.ConvertVideoMessage" value="7"/>`

1. At the end of the string, set the value for the maximum number of concurrent sessions you want for this node. In the example above, the maximum number of sessions is set to `7`.

1. Save the notepad file.

1. Restart IIS on the server.
