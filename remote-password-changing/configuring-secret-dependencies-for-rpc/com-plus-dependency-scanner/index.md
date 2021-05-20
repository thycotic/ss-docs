[title]: # (COM+ Dependency Scanner)
[tags]: # (COM+,dependency,scanner,active directory)
[priority]: # (1000)

# COM+ Dependency Scanner

The COM+ Dependency Scanner allows for an Active Directory domain discovery source to locate COM+ Applications running on machines on the domain that are being run by Domain Accounts.

Firewall concerns may be addressed by ensuring that Port 135 is open between the target machine being scanned and the machine that engine is installed on.

## Requirements for Discovery

### Windows Services

For all supported versions of Windows and Windows Server, ensure that **Remote Procedure Call (RPC)** and **Remote Procedure Call (RPC) Locator** services are running. To help prevent any errors that would stop the services, set the **Startup Type** to **Automatic**.

### Component Services

For all supported versions of Windows and Windows Server, ensure that **NETWORK** has Remote access permissions to the machine.

1. Open **Component Services** (dcomcnfg.exe). 
1. Under **Console Root**, expand **Component Services** and the **Computers** folder.
1. Right-click **My Computer**
1. Select **Properties**.
1. Under the **Default Properties** tab, ensure that the **Default Authentication Level** is set to **Connect** and that **Default Impersonation Level** is set to **Identify**.
1. On the **COM Security** tab, for both the **Access Permissions** and **Launch and Activation Permissions** sections, click **Edit Limits** and then add **NETWORK**.
1. Check **Allow** for all Remote permissions.

   > **Note:** If the **Edit Limits** button is disabled, open the **Local Security Policy**. Under **Security Settings** expand **Local Policies** and select **Security Options**. There will be two **DCOM: Machine Access/Launch Restrictions**. Edit the one that corresponds to the disabled **Edit Limits** buttons, adding **NETWORK** and giving Remote permissions there.

   > **Important:** Editing or altering the existing permissions on the machine or editing the **Default Permissions** listed can have a negative impact on the machine.

### COM+ Network Access

For all supported versions of Windows Server, ensure that COM+ Network Access is enabled by installing the Application Server Role. During the installation process, check the box next to **COM+ Network Access** under **Features**.

## Versions Supported

* Windows 7

* Windows 8

* Windows 10

* Windows Server 2008

* Windows Server 2008 R2

* Windows Server 2012

* Windows Server 2012 R2

## Versions Not Supported

* Windows Vista and earlier versions of Windows

* Versions of Windows Server pre-2008

* Windows Server 2016

## Configuring COM+ Discovery for a New Domain

1. Navigate to **Admin \> Discovery**

1. Click **Edit Discovery Sources**.

1. Click **Create New**.

1. Select **Active Directory Discovery Source** and click **OK**.

1. In the wizard, click **Next**.

1. Select a **Site** that is set up with **Distributed Engine**

1. Click **Next**.

   > **Note:** The COM+ Dependency Scanner will only run when a Distributed Engine Site is applied to the Discovery Source. The Engine will need to be installed either on the Domain to be scanned, a Child Domain relative to the Domain being scanned, a Parent Domain relative to the Domain being scanned, or another Trusted Domain relative to the Domain being scanned.

1. Check the box next to **COM+ Application**.

1. Click **Next**.

1. Enter your **Fully Qualified Domain Name**.

1. Select or create a Secret for an Active Directory account that will scan for your COM+ dependencies.

1. Click **Next**.

Your new domain is now configured in Secret Server and Discovery will search for COM+ dependencies in it.

## Configuring COM+ Discovery for an Existing Domain

1. Navigate to **Admin \> Discovery**.

1. Click **Edit Discovery Sources**.

1. Click on the domain where you wish to search for COM+ dependencies.

1. Click the **Scanner Settings** tab.

1. Scroll down to the **Find Dependencies** section and click **Add New Dependency Scanner**.

1. Click the plus symbol to the left of **COM+ Application**.

   You will be unable to make additional changes.

1. Click **OK** to proceed. Discovery will now search for COM+ dependencies.
