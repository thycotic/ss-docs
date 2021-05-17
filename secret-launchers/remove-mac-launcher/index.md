[title]: # (Removing the Mac Launcher)
[tags]: # (remove,uninstall,launcher,mac)
[priority]: # (1000)

# Removing the Mac Launcher

To upgrade or apply a fix to the Secret Server Mac Launcher, you must remove the version that is already installed. But first you must prevent the launcher from restarting, and terminate all processes related to the Thycotic Launcher.

1. Open **Terminal** and type `launchctl remove com.thycotic.thycoticD`

   This step should remove the ThycoticDaemon and prevent the launcher from restarting, but you might need to perform the step more than once.
1. Open **Activity Monitor**.
1. Force Quit the **ThycoticLauncher** process and all related processes. See [Quit an app or process in Activity Monitor on Mac](https://support.apple.com/en-in/guide/activity-monitor/actmntr1002/mac).
1. Open **Finder**.
1. Navigate to **Application \> Thycotic**.
1. Right-click **ThycoticLauncher** and select **Move to Trash**.
1. Empty your trash.
