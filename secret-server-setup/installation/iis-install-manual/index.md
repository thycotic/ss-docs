[title]: # (IIS Manual Installation)
[tags]: # (Installation, IIS)
[priority]: # (1000)

# Manual IIS Installation

IIS is an internal part of the Windows operating system, and only needs to be enabled. If IIS is not found, the Thycotic Installer will install it for you. If you would prefer to install IIS manually, please refer to the instructions listed below for example steps in the Windows Server 2016 Operating System. For the most up-to-date setup instructions, see [Microsoft's Technical Documentation](https://docs.microsoft.com/en-us/). Navigate to **Docs \> Internet Information Services \> Install**.

## Roles and Features

Thycotic products recommend the following roles and features to be installed on the SS IIS Server for maximum security and functionality options:

### Roles

- Web Server (IIS)

- Web Server (IIS)\Web Server

- Web Server (IIS)\Web Server\Common HTTP Features

  - Default Document

  - Directory Browsing

  - HTTP Errors

  - Static Content

  - HTTP Redirection

- Web Server (IIS)\Web Server\Health and Diagnostics

  - HTTP Logging

- Web Server (IIS)\Web Server\Performance

  - Static Content Compression

  - Dynamic Content Compression

- Web Server (IIS)\Web Server\Security

  - Request Filtering

  - Windows Authentication

- Web Server (IIS)\Web Server\Application Development

  - .NET Extensibility 4.6

  - ASP.NET 4.6

  - ISAPI Extensions

  - ISAPI Filters

- Web Server (IIS)\Web Server\Management Tools

  - IIS Management Console

### Features

- .NET Framework 4.x Features

  - .Net Framework 4.x

  - ASP.NET 4.x

- WCF Services

  - HTTP Activation

  - TCP Activation

  - TCP Port Sharing

- PowerShell

  - Windows PowerShell 5.1

## Step One: Windows Server 2012–2019 IIS Installation

To install Internet Information Services (IIS) Manager on Windows Server 2016, you will need to give your server the Web Server (IIS) role using the following procedure:

> **Note:** If this is *not* the first time you have run the wizard (that is, when first installing IIS), the Web Server Role (IIS) and Role Services windows will not appear, and the wizard order changes a bit. Instead, role services are selectable in the Server Roles window.

1. Click the **Server Manager** button on your server. The Server Manager Dashboard appears.

1. Click the **Add Roles and Features** button. The Add Roles and Features Wizard on the Before You Begin window appears.

1. Click the **Next** button. The Select Installation Type window appears.

1. Click to select **Role-based or feature-based installation** selection button.

1. Click the **Next** button. The Select Destination Server  window appears.

1. Ensure the **Select a Server from the Server Pool** selection button is selected.

1. In the **Server Pool** section, click to select your server.

1. Click the **Next** button. The Select Server Roles window appears.

1. Click to select the **Web Server (IIS)** check box.

1. Click the **Next** button. The Select Features window appears.

1. In the **Features** list, Click to select the following checkboxes (If necessary, click the **Add Features** button when prompted):

   - .NET Framework 4.x Features \> WCF Services \> **HTTP Activation**

   - .NET Framework 4.x Features \> WCF Services \> **TCP Activation**

1. Click the **Next** button. The Web Server Role (IIS)  window appears.

1. Click the **Next** button. The Select Role Services Window appears.

1. In the **Roles** list, click to select the following check boxes:

   >**Note:** Leave all the auto-selected check boxes as is.

   - Web Server (IIS) \> Web Server \> Common HTTP Features \> **HTTP Redirection**

   - Web Server (IIS) \> Web Server \> Performance \> **Dynamic Content Compression**

   - Web Server (IIS) \> Web Server \> Security \> **Windows Authentication**

1. Click the **Next** button. The Confirmation window appears

1. Confirm your installation details.

1. Click the **Install** button. Wait for the installation to complete. The Results window appears.

1. Click the **Close** button. An IIS tile should now appear on your server.

> **Note:** We recommend you run [Windows Update](http://update.microsoft.com/) to install the latest security patches for IIS once you have IIS installed.

## Step Two: Configure the IIS Website

 Follow these steps to configure a website in IIS for SS:

1. Extract the SS files into `C:\inetpub\wwwroot\SecretServer` or your location of choice.

1. Open Internet Information Server (IIS) Manager: On the taskbar, click **Server Manager \> Tools \> Internet Information Services (IIS) Manager**.

1. In the Connections pane, expand the server name.

1. Click on the **Application Pools** node. The Application Pools window appears.

1. Click the **Add Application Pool** link. The Add Application Pool dialog box appears.

1. Type `SecretServer` in the **Name** text box.

1. Click to select **4.x** in the **.NET Framework Version** dropdown list.

1. Click to select **Integrated** in the **Managed Pipeline Mode** dropdown list.

1. Click the **OK** button to save the new application pool. The dialog box closes.

1. (optional) Customize the Windows account SS runs as:
    
    1. Right click the new application pool and select **Advance Settings…**
    
    1. Click the **Identity** setting in the **Process Model** section to select the desired account. Using this, you can, for example, set SS to use IWA to connect to SQL.

1. Expand the **Sites** node on the **Connections** tree.

1. Click on the Default Web Site node.

1. In the **Actions** pane, click **Bindings** to set your desired website. The Edit Bindings dialog box appears.

1. Edit or add bindings as desired. We recommend using HTTPS with a real SSL certificate.

1. Click the **Close** button.

1. In the **Connections** tree, expand the **Default Website** node.

1. **Either**, If you see the default folder, **SecretServer**, which you created earlier:
   
   1. Right click the **SecretServer** folder and select **Convert to Application**. The Add Application dialog box appears.

   1. Click the **Select…** button to choose the pool you created earlier for SS.
   
   **Or**, If you used a custom location instead:
   
   1. right click the Default Website. The Add Application dialog box appears.

   1. Type `SecretServer` in the **Alias** text box.

   1. Click **Select…** and pick the app pool created for SS.

   1. Type the path where you extracted the SS files in the **Physical Path** text box.

1. Click the **OK** button.

## Step Three: Ensure IIS Does Not Stop the Worker Process

When using IIS version 7.0 and above, by default, the worker process terminates after an inactive period. If SS is in its own application pool, that application pool will stop after a period of no requests. To ensure this does not happen, perform the following procedure. Additionally, by default, IIS launches a worker process when the first request for the Web application is received, so if the SS application takes a long time to start, issues can result. Thus, we recommend launching the SS application pool worker process as soon as IIS starts by setting the start mode to "AlwaysRunning." 

Procedure: 

1. Open **Internet Information Server (IIS) Manager**:

   - If you are using Windows Server 2012 or Windows Server 2012 R2: On the taskbar, click **Server Manager \> Tools \> Internet Information Services (IIS) Manager**.

   - If you are using Windows Server 2008 or Windows Server 2008 R2: On the taskbar, click **Start \> Administrative Tools \> Internet Information Services (IIS) Manager**.

1. In the **Connections** pane, expand the server name.

1. Click **Application Pools**.

1. Determine which application pool SS is running as:

   1. Expand **Sites** at the left.
   
   1. Find the website SS is running on.
   
   1. Click on the SS website or virtual directory (if it is running on one).
   
   1. Click **Basic Settings** on the right panel. This indicates SS's application pool.

1. Right-click the application pool and select **Advanced Settings…** The Advance Settings dialog appears.

1. In the **General** section, set **Start Mode** to **AlwaysRunning**.

1. In the **Process Model** section, set **Idle Time-out (minutes)** to **0**.

1. In the **Recycling** section, set **Regular Time Interval (minutes)** to **0**.

1. In the **Recycling** section, click the **\>** next to **Specific Times** to ensure there are no times set. If there are, click the **…** to clear them.

1. Leave IIS Manager open—we will return to it below.

## Step Four: Ensure the User Profile Always Loads

As of version 10.2, SS requires its application pool "Load User Profile" setting enabled. Otherwise, SS reports a critical alert to system admins. 

> **Note:** Even without the setting enabled, SS loads to give access to secrets but many internal operations may malfunction, so we recommend resolving this issue as soon as possible. 

Procedure:

1. Right-click the SS application pool in IIS Manager and select **Advanced Settings…** The Advance Settings dialog appears.

1. Go to the **Process Model** section in the **Advanced Settings** dialog.

1. Set **Load User Profile** to **True**.

1. Preform an `iisreset` on the server (in an administrator command prompt).
