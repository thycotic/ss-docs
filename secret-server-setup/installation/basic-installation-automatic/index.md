[title]: # "Basic Installation"
[tags]: # "Install"
[priority]: # "10"

# Basic (Automatic) Installation

## Introduction

This is the installation guide for Windows Server 2016 and Windows 10. For other operating system installation guides, [contact Thycotic Support](https://updates.thycotic.net/links.ashx?Support).

### Secret Server Is an ASP.NET Website

Secret Server is installed as an ASP.NET website. The setup.exe file sets up the website with the correct permissions and creates the settings in IIS. 

### SQL Server Is Usually Required

Secret Server requires an instance of SQL Server for the database backend and is installed by the setup.exe file, if missing. The SQL Server database will require a SQL account with *db_owner* permission to complete the installation.

### Administrative Access

Throughout the installation, you will be required to be an administrator to perform most of these actions. Please ensure that you are logged onto your system with a Windows account that has administrative rights.

### Review the Prerequisites 

> **Important:** Except for the operating system, the following prerequisites are installed automatically by our installer. If you already have some of them installed or wish to install them yourself, the installer will skip over them. 

If this is the first time you are installing Secret Server, please take the time to review the [full list of system requirements and recommendations](https://updates.thycotic.net/links.ashx?SSSystemRequirements).

### System Requirements Overview

- Windows Server 2016 operating system
- Microsoft SQL Server 2008 or greater (any edition)
- Microsoft Internet Information Services (IIS)
- Microsoft .NET Framework 4.6

> **Note:**  Windows Server 2016 and Windows 10 come with the .NET Framework 4.6 already installed.

### Additional Recommendations

We suggest you:

- Use an SSL certificate for Secret Server. 
- Run [Microsoft Update](http://update.microsoft.com/) on your server to make sure all components are up to date.

## Procedure  

### Step 1: Downloading the Latest Version of Secret Server

The latest version of SS is available for [download](http://thycotic.com/products/secret-server/resources/download-secret-server/). A setup.exe file is downloaded to your machine. We recommend running setup.exe as an administrator.

### Step 2: Running the Installer

#### Welcome Page

The first installer page you are presented is the Welcome Page. The installer should detect whether the machine has SS or Privilege Manager for Windows and will declare which of those products it will install.         

#### Database Page

The Database page allows you to choose to install SQL Express or connect to an existing SQL Server. If you select SQL Express, the installer requires Internet access to download the installation for SQL Server Express. 

If Internet access is not available, a link to download SQL Server Express is presented. You are expected to install SQL Server Express and then restart the installer. 

If Internet access is available, SQL Server Express is installed.

#### Pre-Requisites Page

The Pre-Requisites page ensures everything that is required to install SS is setup correctly. Everything on this page *can* be installed outside of the installer. If not, the installer installs and configures them for you. This page is primarily for third party server configuration. If there are issues, please refer to support for the specific non-Thycotic vendors.

#### Database Connection Page

The Database Connection page contains the connection information that Secret Server (and Privilege Manager) uses. You must click the **Test Connection** button and have a successful result before installation can continue.

#### Create User Page

The Create User page is where you enter the information for the initial SS user.

#### Email Server Page

Enter connection information for the email server on this page. This is also optional and you can skip it and set it up later in SS. This page will configures email for both Secret Server and Privilege Manager for Windows.

#### Review Page

Review the, mostly default, settings on the Review page, and change them is needed. Some of the settings are validated before the install can begin.

#### Install Page

The Install page shows the status from log files as both Secret Server and Privilege Manager are installed.

### Step 3: Reviewing the Log Files (Optional)

After the applications are installed, the installer opens a Web browser to the Secret Server log on page. At this point, everything is installed to start using both Secret and Privilege Manager. If the installation failed or you wish you view the logs from the installation, click the **View Log Files** button.

### Step 4: Opening Secret Server

If the setup.exe did not automatically open a browser, navigate to where SS is located, for example: `http://localhost/secretserver`.

### Step 5: Learning Secret Server

See our [Getting Started Tutorial](../../../getting-started-tutorial/index.md) or contact Thycotic Support about training.