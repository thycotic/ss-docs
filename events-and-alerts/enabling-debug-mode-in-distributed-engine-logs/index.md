[title]: # "Enabling Debug Mode in Distributed Engine Log Files"
[tags]: # "Events, Alerts, debug mode, distributed engine, distributed engine logs"
[priority]: # "1000"

# Enabling Debug Mode in Distributed Engine Log Files

This topic discusses enabling DEBUG mode for distributed engine logs for troubleshooting.

## Overview

You can expand Secret Server (SS) logging capability to locate additional information regarding an error or to help with troubleshooting an issue.

## Procedure

How to enable DEBUG logging mode:

1. Log in as an administrator on the distributed engine server.

1. Locate the `Thycotic.DistributedEngine.Service.exe.config` in the `C:\Program Files\Thycotic Software Ltd\Distributed Engine` directory.

1.  Open the file in a text editor.

1. Run a find (**\<Control\>+ \<F\>**) command.

1. Type in `log4net` and press **\<Enter\>** to locate that section, which is usually at the top.

1. Locate the two lines that contain "INFO"

1. Replace each INFO with DEBUG.

1. Restart the Thycotic Distributed Engine service to apply the log configuration change.

1. After DEBUG mode is enabled in the system log, you can reproduce the issue, investigate the error, or send the updated logs in with your support case.

## Verbose Mode

On occasion, you may be instructed to enable the VERBOSE mode to capture details for troubleshooting. Do this by using the same procedure and replacing "INFO" or "DEBUG" with "VERBOSE" instead.

> **Important:** Enabling VERBOSE mode will create very detailed log information with large numbers of log files that can accumulate and quickly consume available resources on the machine. Therefore, you should only enable it during the troubleshooting process and immediately turned off afterward in order to prevent performance issues.