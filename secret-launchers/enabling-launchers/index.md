
[title]: # (Enabling Launchers)
[tags]: # (launchers, protocol handlers)
[priority]: # (1000)
[redirect]: # (LauncherFailedLoading)

# Enabling Launchers

## Introduction

By default, the launcher is enabled by the **Enable Launcher** setting under **Admin > Configuration**.

The launcher (protocol handler) can be deployed in two ways—with the ClickOnce (the default) or MSI-installable applications. This can also be set in the configuration settings. The latter method allows the launcher to be used in virtualized environments or any environment in which the user does not have access to a Windows Temp directory. The Protocol Handler can be downloaded by clicking the ![1557174423911](images/1557174423911.png) button on the Dashboard and selecting **Launcher Tools**:

> **Note:** A ClickOnce application is any Windows Presentation Foundation (.xbap), Windows Forms (.exe), console application (.exe), or Office solution (.dll) installed with ClickOnce technology in one of three ways: from a Web page, from a network file share, or from media. See [ClickOnce Security and Deployment](https://docs.microsoft.com/en-us/visualstudio/deployment/clickonce-security-and-deployment?view=vs-2019) for details.

![1557176888609](images/1557176888609.png)

## MSI Installer

 To use the MSI installer (protocol handler installer) following steps below:

1. Go to **Admin \> Configuration**.

1. Click the **General** tab.

1. Set the **Launcher Deployment Type** to "**Protocol Handler**.

1. Go to **Tools \> Launcher Tools** to download the launcher application.

1. Click the **Download Protocol Handler MSI** link for the operating system you want to install on.

1. Run the MSI file with admin privileges.

> **Note:** The session is kept in check for security reasons with the session process pinging back to SS to ensure it is still valid. This checks secret settings, such as checkout and secret access.  If that check fails or the callback times out, SS errs on the side of security and kills the sessions, ensuring access is not allowed.

## Installing by Group Policy

The Protocol Handler application runs without requiring any input from the user. The installation may be pushed to your network without any special configuration. For details, see [Installing Protocol Handler through Group Policy](http://support.thycotic.com/KB/a372/installing-protocol-handler-through-group-policy-server-2008.aspx) (KBA).
