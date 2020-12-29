[title]: # (Enabling Debug Mode in System Log Files)
[tags]: # (Events, Alerts, debug mode, system logs)
[priority]: # (1000)

# Enabling Debug Mode in System Log Files

This topic discusses enabling DEBUG mode for application system logs for troubleshooting.

## Overview

You can expand Secret Server (SS) logging capability to locate additional information regarding an error or to help with troubleshooting an issue.

> **Note:** To enable DEBUG logging for distributed engine log files, see [Enabling Debug Mode in Distributed Engine Log Files](../enabling-debug-mode-in-distributed-engine-logs/index.md).

## Procedure

How to enable DEBUG logging mode:

1. Log in as an administrator on the application server.

1. Locate the `web-log4net.config` file. This file can be found in the web application's root directory. If you cannot locate your web application directory, see [How to: Find the Web Application Root](https://msdn.microsoft.com/en-us/library/office/ms474356(v=office.14).aspx). SS is typically located in the `*C:\inetpub\wwwroot\` directory; however, this is configurable so the location may be different in your environment. 

1.  Open the file in a text editor.

1. Run a find (**\<Control\>+ \<F\>**) command.

1. Type in `log4net` and press **\<Enter\>** to locate that section, which is usually at the top.

1. Locate the commented out  `<level value="DEBUG" />` line.

1. Uncomment the line by removing the `<!--` and `-->`.

1. Locate the `<level value="INFO" />` line in the same section.

1. Comment out the entire line by adding a `<!--` and `-->` around it.

1. Restart IIS to apply the log configuration change.

   > **Note:** This restarts all websites hosted under IIS.

1. After DEBUG mode is enabled in the system log, you can reproduce the issue, investigate the error, or send the updated logs in with your support case.

## Verbose Mode

On occasion, you may be instructed to enable the VERBOSE mode to capture details for troubleshooting. Do this by using the same procedure and replacing "INFO" or "DEBUG" with "VERBOSE" instead.

> **Important:** Enabling VERBOSE mode will create very detailed log information with large numbers of log files that can accumulate and quickly consume available resources on the machine. Therefore, you should only enable it during the troubleshooting process and immediately turned off afterward in order to prevent performance issues.