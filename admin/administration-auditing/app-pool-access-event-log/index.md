[title]: # (Giving Application Pools Event Log Access)
[tags]: # (event log, application pool)
[priority]: # (1000)

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

- Query Value

- Read Control

## Applying Windows Event Log Permissions
$1
$2
   1. Log on SS.

   1. Go to **Admin \> Diagnostics**. 

   1. Look for any of the **Thread Identity** labels. These contain the identity of SS (often `NT AUTHORITY\NETWORK SERVICE` or `IIS APPPOOL\SecretServer` or the service account set up for IWA. See [Running the IIS Application Pool As a Service Account](../../../secret-server-setup/installation/running-ss-iis-app-pool-service-account/index.md).

      > **Note:** You can also determine the identity by logging in and navigating to `http://yoursecretserverurl/Installer.aspx`. The first step of this page will tells you the application pool identity.
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
 