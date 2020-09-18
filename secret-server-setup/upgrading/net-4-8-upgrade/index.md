[title]: # (SS and SSC .NET Framework 4.8 Upgrade)
[tags]: # (Upgrade, .net, secret server cloud)
[priority]: # (1000)

# SS and SSC .NET Framework 4.8 Upgrade

## Introduction

This topic explains the steps to prepare your environment for the December 2020 upgrade to Secret Server (SS) and Secret Server Cloud (SSC).

The Microsoft .NET Framework is a core component of the SS architecture. SS versions up to and including 10.9.0 require version 4.5.1 or higher of the .NET Framework.

The December 2020 releases of SS and SSC will change this requirement. From December 2020 onwards, version 4.8 or higher of the .NET Framework will be required.

This change improves the security of communication between SS and distributed engines. It also allows Thycotic to maintain compatibility with other third party libraries required by SS and SSC.

## Preparing Secret Server for the December Release

To accommodate this change in software requirements, SS and SSC customers may need to install .NET Framework 4.8 on the computer systems hosting components of SS in their environment. The required actions, workarounds where available, and impact of not taking action are listed here for each component of SS infrastructure:

### Secret Server Web Nodes

**Products**

Secret Server

**Required Action**

Installing .NET Framework 4.8 on servers running web nodes.

**Impact of Inaction**

Upgrade to the December 2020 release will not proceed until .NET Framework 4.8 has been installed.

**Notes**

The web node components of SSC are managed directly by Thycotic.

### Distributed Engines

**Products**

- Secret Server

- Secret Server Cloud

**Required Action**

Installing .NET Framework 4.8 on servers running web nodes.

**Impact of Inaction**

- SS upgrade will request confirmation before upgrading if any connected distributed engines do not have .NET Framework 4.8 installed. Any distributed engines which do not have .NET framework 4.8 installed will fail to upgrade.

- SSC will be upgraded whether or not distributed engines have .NET Framework 4.8 installed. Any distributed engines which do not have .NET framework 4.8 installed will fail to upgrade.

**Notes**

Installing .NET Framework 4.8 after the upgrade will allow a distributed engine to start and reconnect to SS.

### Protocol Handler

**Products**

- Secret Server

- Secret Server Cloud

**Required Action**

- New installations of the protocol handler on Windows systems after the December release will require .NET Framework 4.8 installed.

- Fully patched Windows 10 systems should already have the framework in place.

- Customers with existing deployments of protocol handler have two options:

  - Ensure that .NET Framework 4.8 is installed on all endpoints using protocol handler before the SS or SSC update.

  - Disable automatic updating of protocol handler:

    1. Go to **Admin \> Configuration**.

    1. Set **Enable Protocol Handler Auto-Update** to **No**.

- SS is compatible with older versions of protocol handler. Older versions will continue to function when used with the SS December release.

**Impact of Inaction**

Any updated installs of protocol handler will fail on systems that do not have .NET Framework 4.8 installed.

**Notes**

None.

### Advanced Session Recording Agent (ASRA)

**Products**

- Secret Server

- Secret Server Cloud

**Required Action**

Existing installations of ASRA will continue to operate. New installations of ASRA after the December release will require .NET Framework 4.8 installed on the servers where ASRA is deployed.

**Impact of Inaction**

Existing installations of ASRA will continue to operate.

**Notes**

None.

### Session Connector

**Products**

- Secret Server

- Secret Server Cloud

**Required Action**

 None. This release will not require .NET Framework 4.8 for session connector.

**Impact of Inaction**

 None. Session connector will continue to function.

**Notes**

Although the December release will not require .NET Framework 4.8, future updates to session connector will require it. Therefore, we recommend installing .NET Framework 4.8 on any Microsoft Remote Desktop Services (RDS) servers used as part of the session connector infrastructure.

## Effects on Connection Manager

None: Connection Manager will be updated to require .NET Framework 4.8 at a later date.

## Unaffected Secret Server Components

The following components of SS and SSC are not affected by this change:

- Web password filler

- SS Desktop Application

- SS Mobile


## Determining Your .NET Framework Version

- Microsoft provides several methods to determine the installed versions of .NET Framework. Please see [How to: Determine which .NET Framework versions are installed](https://docs.microsoft.com/en-us/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed).

- See [.NET Framework versions and dependencies](https://docs.microsoft.com/en-us/dotnet/framework/migration-guide/versions-and-dependencies) for additional Microsoft .NET Framework version information.

- You can run the following command at a Windows PowerShell prompt to view currently installed .NET Framework version number:
  `(Get-ItemProperty "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").version`

## Installing .NET Framework 4.8

- Microsoft .NET Framework 4.8 is available as a recommended update for customers using Windows Update, Windows Server Update Services (WSUS), and Microsoft Update (MU) Catalog. Please see [.NET Framework 4.8 is available on Windows Update, WSUS and MU Catalog](https://devblogs.microsoft.com/dotnet/net-framework-4-8-is-available-on-windows-update-wsus-and-mu-catalog/).

- Microsoft provides a Web installer for .NET Framework 4.8. Please see [Download .NET Framework 4.8](https://dotnet.microsoft.com/download/dotnet-framework/net48).

- Microsoft also provides an offline installer package for .NET Framework 4.8. Please see [Microsoft .NET Framework 4.8 offline installer for Windows](https://support.microsoft.com/en-us/help/4503548/microsoft-net-framework-4-8-offline-installer-for-windows).
