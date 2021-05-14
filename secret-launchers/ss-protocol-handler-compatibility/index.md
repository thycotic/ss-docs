[title]: # (Managing Multiple Secret Server Instances with Protocol Handlers and Launchers)
[tags]: # (Launcher,protocol handler,auto-update,backward,forward)
[priority]: # (1000)
[display]: # (all)

# Managing Multiple Secret Server Instances with Protocol Handlers and Launchers

In an organization running multiple instances of Secret Server, some users might find themselves having to repeatedly uninstall and reinstall different versions of the protocol handler to match the different instances of Secret Server.

To enable Secret Server to simultaneously support multiple versions of the protocol handler, you just need to disable the protocol handler auto-update function using the procedure below.

>**Note**: Disabling auto-update for forward and backward compatibility is supported on the protocol handler only. The ClickOnce launcher and the Mac protocol handler do not support disabling auto-update.

## Prerequisites

* Secret Server Cloud 10.5.000010+

* Secret Server On-Premises 10.6+

* Protocol Handler 6.0.0.0 or higher on your PC

## Setup Steps and Configuration

1. In Secret Server, click **Admin \> Configuration**, then click the **General** tab.

1. Scroll to the bottom of the page and click  **Edit**.

1. In the **Launcher Settings** section, uncheck the box next to  **Enable Protocol Handler Auto-Update**.

   ![image-auto-update-disable](images\ss-protocol-handler-auto-update-disable.png "Disable Auto-Update")

1. Click **Save**.

1. Ensure that the **Enable Protocol Handler Auto-Update** function is now labeled, **No**.

   ![image-auto-update-enable](images\ss-protocol-handler-auto-update-no.png "Auto-Update Disabled")

You can re-enable protocol handler auto-update at any time by following the steps above and re-checking the box next to **Enable Protocol Handler Auto-Update**. When you re-enable auto-update, users will be required to install the latest instance.

>**Note**: While protocol handler auto-update is disabled, each user must manually update their installed protocol handler as necessary on a machine-by-machine basis. The MSI can be installed directly or through Group Policy. A reboot may be necessary on certain operating systems.

## Manually Updating Protocol Handler

1. In Secret Server, click **Admin \> See All**.
   A page opens with **What are you looking for?** at the top.

1. Click **Tools & Integrations**, then **Launcher Tools**

   ![image-launcher-tools](images\launcher-tools.png "Launcher Tools")

1. On the **Launcher Tools** page, click **Download Protocol Handler (64-bit)** to download the file.

   ![image-download-protocol-handler](images\download-protocol-handler.png "Download Protocol Handler")

1. Follow the steps in the installation wizard.
