[title]: # (Giving Application Pools Event Log Access)
[tags]: # (event log, application pool)
[priority]: # (1000)
[redirect]: # (SetEventLogPermissions)

# Giving Application Pools Event Log Access

## Overview

When the database becomes inaccessible, Secret Server will try to log errors to the Windows event log. By default, network service and standard service accounts will not have permissions to the event log. Permissions must be added to specific event log registry keys.

## Required Registry Permissions

The follow permissions are required for the identity configured on the SS application pool in IIS:

**HKEY_LOCAL_MACHINE \> SYSTEM \> CurrentControlSet \> Services \> EventLog**

Applies to key and subkeys

- Read permissions:

  - Query Value
  - Enumerate Subkeys
  - Notify
  - Read Control

- Set Value permission
- Create Subkey permission

**HKEY_LOCAL_MACHINE \> SYSTEM \> CurrentControlSet \> Services \> EventLog \> Security**

Applies to key and subkeys

Read permissions:

- Query Value
- Enumerate Subkeys
- Notify
- Read Control

**HKEY_LOCAL_MACHINE \> SYSTEM \> CurrentControlSet \> Services \> EventLog \> State**

Applies to key and subkeys. Only applies to Windows Server 2019.

Read permissions:

- Query Value
- Enumerate Subkeys
- Notify
- Read Control

## Applying Windows Event Log Permissions

1. Determine the account that is running SS:

   1. Log on SS.

   1. Go to **Admin \> Diagnostics**.

   1. Look for any of the **Thread Identity** labels. These contain the identity of SS (often `NT AUTHORITY\NETWORK SERVICE` or `IIS APPPOOL\SecretServer` or the service account set up for IWA. See [Running the IIS Application Pool As a Service Account](../../../secret-server-setup/installation/running-ss-iis-app-pool-service-account/index.md).

      > **Note:** You can also determine the identity by logging in and navigating to `http://yoursecretserverurl/Installer.aspx`. The first step of this page will tells you the application pool identity.

1. Open the Windows registry editor on the machine running SS (regedit at the command prompt or Window search text box).

1. On the left, navigate to **HKEY_LOCAL_MACHINE \> SYSTEM \> CurrentControlSet \> Services \> EventLog**.

1. Right click the **EventLog** folder in your registry editor and select **Permissions**. A permissions dialog box appears.

1. Click the **Advanced** button.

1. On the **Permissions** tab, Click the **Add** button. A Permission Entry dialog appears.

1. Click the **Select a principal** link. The Select User, Computer… dialog box appears.

1. Find the account running SS, such as Thycotic_Service (svc_thycotic@test.com).

1. Click the **OK** button. The dialog box closes.

1. In the **Basic Permissions** section of the **Permission Entry** dialog, click to select the **Read** check box.

1. Click the **Show advanced permissions** link. The pane switches.

1. Click to select the **Set Value** and **Create Subkey** check boxes in the **Advanced Permissions** section.

1. Click **OK** buttons on the remaining dialogs to apply the permissions.  You are returned to the main registry editor window.

1. Navigate to **HKEY_LOCAL_MACHINE \> SYSTEM \> CurrentControlSet \> Services \> EventLog \> Security,** right-click and select "**Permissions...**"

1. Right click **Security** folder and select **Permissions**. A permissions dialog box appears.

1. Click the **Add** button.

1. Find the account running SS.

1. Click the **OK** button.

1. Click to select the **Read** check box in the Allow column.

1. Click the **OK** button to apply the permission.

1. If you are running Windows Server 2019, use the same procedure to add Read permission to **HKEY_LOCAL_MACHINE \> SYSTEM \> CurrentControlSet \> Services \> EventLog \> State**.
