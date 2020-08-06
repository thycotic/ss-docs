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
$2
   - .NET Framework 4.x Features \> WCF Services \> **HTTP Activation**

   - .NET Framework 4.x Features \> WCF Services \> **TCP Activation**
$1
$2$1
$2$1
$2
   >**Note:** Leave all the auto-selected check boxes as is.

   - Web Server (IIS) \> Web Server \> Common HTTP Features \> **HTTP Redirection**

   - Web Server (IIS) \> Web Server \> Performance \> **Dynamic Content Compression**

   - Web Server (IIS) \> Web Server \> Security \> **Windows Authentication**
$1
$2$1
$2$1
$2$1
$2
> **Note:** We recommend you run [Windows Update](http://update.microsoft.com/) to install the latest security patches for IIS once you have IIS installed.

## Step Two: Configure the IIS Website

 Follow these steps to configure a website in IIS for SS:
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
$2    
    1. Right click the new application pool and select **Advance Settings…**
    
    1. Click the **Identity** setting in the **Process Model** section to select the desired account. Using this, you can, for example, set SS to use IWA to connect to SQL.
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2   
   1. Right click the **SecretServer** folder and select **Convert to Application**. The Add Application dialog box appears.

   1. Click the **Select…** button to choose the pool you created earlier for SS.
   
   **Or**, If you used a custom location instead:
   
   1. right click the Default Website. The Add Application dialog box appears.

   1. Type `SecretServer` in the **Alias** text box.

   1. Click **Select…** and pick the app pool created for SS.

   1. Type the path where you extracted the SS files in the **Physical Path** text box.
$1
$2
## Step Three: Ensure IIS Does Not Stop the Worker Process

When using IIS version 7.0 and above, by default, the worker process terminates after an inactive period. If SS is in its own application pool, that application pool will stop after a period of no requests. To ensure this does not happen, perform the following procedure. Additionally, by default, IIS launches a worker process when the first request for the Web application is received, so if the SS application takes a long time to start, issues can result. Thus, we recommend launching the SS application pool worker process as soon as IIS starts by setting the start mode to "AlwaysRunning." 

Procedure: 
$1
$2
   - If you are using Windows Server 2012 or Windows Server 2012 R2: On the taskbar, click **Server Manager \> Tools \> Internet Information Services (IIS) Manager**.

   - If you are using Windows Server 2008 or Windows Server 2008 R2: On the taskbar, click **Start \> Administrative Tools \> Internet Information Services (IIS) Manager**.
$1
$2$1
$2$1
$2
   1. Expand **Sites** at the left.
   
   1. Find the website SS is running on.
   
   1. Click on the SS website or virtual directory (if it is running on one).
   
   1. Click **Basic Settings** on the right panel. This indicates SS's application pool.
$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
## Step Four: Ensure the User Profile Always Loads

As of version 10.2, SS requires its application pool "Load User Profile" setting enabled. Otherwise, SS reports a critical alert to system admins. 

> **Note:** Even without the setting enabled, SS loads to give access to secrets but many internal operations may malfunction, so we recommend resolving this issue as soon as possible. 

Procedure:
$1
$2$1
$2$1
$2$1
$2