[title]: # (Upgrading Secret Server Without Outbound Access)
[tags]: # (Setup, Upgrading)
[priority]: #

# Upgrading Secret Server Without Outbound Access

> **Important:** Upgrading to Secret Server version 8.9.000000 and above will require **Windows Server 2008 R2 or greater.**

> **Important:** Upgrading to Secret Server version 8.5.000000 and above, there are changes in the .NET Framework version you will need to be aware of along with some additional steps in the upgrade process. For more information, see [Secret Server Moving to .NET Framework 4.5.1](https://thycotic.force.com/support/s/article/Secret-Server-Moving-to-NET-Framework-4-5-1).

> **Important:** Upgrading to Secret Server version 10.0.000000 and above will require configuring integrated pipeline mode on the Secret Server Application Pool. Please see [this KB](http://updates.thycotic.net/link.ashx?IisPiplineIntegratedKnowledgeBase) for details on configuring integrated pipeline mode in IIS. If using Integrated Windows Authentication you will also need to update IIS authentication settings as detailed in [this KB](http://updates.thycotic.net/link.ashx?SS_10_IntegratedWindowsAuthentication). If you are at version 9.1.000000 and below, you will need to first upgrade to 9.1.000001 before you can upgrade to 10.0.000000 and above.

## How Upgrades Work

Secret Server periodically polls our update server to detect updates. If your Secret Server is on an internal network that has no outbound access or goes through a proxy, Secret Server will not be able to perform updates automatically, therefore, outbound access to the below connections on your firewall is needed if you want to perform updates automatically:

- `d36zgw9sidnotm.cloudfront.net:443`

- `updates.thycotic.net:443`

- `updates.thycotic.net:80`

The steps below can be used to perform an upgrade for versions 7.1.000015 and higher. If you have an older version of Secret Server, please contact Thycotic technical support for assistance.

## Procedure

### Step 1: Open the Upgrade Secret Server Wizard
$1
$2
   ![User-added image](images/clip_image002.png)
$1
$2$1
$2$1
$2
   ![User-added image](images/clip_image004.png)

### Step 2: Get and Upload the Latest .zip File
$1
$2   
   > **Note:** You also can find the downloadable update files in our[ Secret Server Offline Update File KB here](https://thycotic.force.com/support/s/article/Secret-Server-Offline-Update-File) (KBA).
   
$1
$2
   > **Note:** You can [verify the file hashes for the latest version using the posted hash values](https://thycotic.force.com/support/s/article/Secret-Server-Download-Hashes) (KBA).
   
   > **Note:** You should **not** use the fresh install SecretServer.zip or setup.exe that is first downloaded from [thycotic.com](http://thycotic.com). Only use the Get Latest Version link—there is a difference between the upgrade file and fresh install zip.
   
$1
$2
   ![User-added image](images/clip_image006.png)
$1
$2
###  Step 3: Upgrade Secret Server
$1
$21. Click **Return to Home** to return to the dashboard.

 