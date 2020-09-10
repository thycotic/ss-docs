[title]: # (HTTP 404.2 Error ISAPI/CGI Restrictions Stopping .NET Framework 4.5.1)
[tags]: # (troubleshooting, workaround, .NET, HTTP 404)
[priority]: # (1000)

# HTTP 404.2 Error ISAPI/CGI Restrictions Stopping .NET Framework 4.5.1

# Error

An HTTP 404.2 error code is received when ISAPI/CGI Restrictions are preventing the.NET Framework 4.5.1 from running.

## Resolution

1. Open Internet Information Services.

1. Select the Server in the left tree view.

1. In the **IIS** section, open ISAPI and CGI Restrictions.

1. For all items beginning with **ASP.NET v4.0**, right-click the item and select **Allow**.
