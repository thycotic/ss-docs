
[title]: # (HTTP Error 404.17 - Not Found After Upgrading .NET Framework Version)
[tags]: # (troubleshooting, workaround, .NET, HTTP 404)
[priority]: # (1000)

# HTTP Error 404.17 - Not Found After Upgrading .NET Framework Version

## Error

After upgrading Secret Server (SS) and changing the CLR version, when attempting to load SS, you receive the following error in Internet Explorer:

`HTTP Error 404.17 - Not Found
The requested content appears to be script and will not be served by the static file handler`

## Resolution

This error can be caused by ASP.NET 4.5 not being correctly registered on the server. To correct this:

### Windows Server 2012 or 2012 R2

Use the Server Manager to install ASP.NET 4.5.

1. Open the Server Manager.
1. Select **Manage \> Add Roles and Features**. The Add Roles and Features wizard appears.
1. Click the **Next** button. The Select Installation Type page appears.
1. Click to select the **Role-based or feature-based installation for your server** selection button.
1. Click the **Next** button twice. The Select Server Roles page appears.
1. Click to select the **Web Server (IIS)** check box in the **Roles** list.
1. Click the **Next** button until you arrive at **Role Services** under **Web Server (IIS)**.
1. Drill down to **Web Server \> Application Development** in the **Role Services** list.
1. Click to select the **ASP.NET 4.5** check box.
1. Click the Next button until you arrive at the final page.
1. Click the **Install** button.
1. Once installed, follow the resolution instructions in [HTTP Error 404.2 - ISAPI and CGI Restrictions](http://support.thycotic.com/KB/a397/http-error-4042-isapi-and-cgi-restrictions.aspx) (KBA) to ensure ASP.NET 4.0 is allowed to execute in IIS.

