[title]: # (Downloads for Secret Server Software Development Kit for DevOps)
[tags]: # (API,Scripting,DevOps,SDK,Download)
[priority]: # (1000)

# Downloads for Secret Server Software Development Kit for DevOps

## Overview

The Secret Server SDK replaces and improves upon the existing functionality of the Java API and .NET/Application API. Users can leverage this SDK to tokenize credentials in scripts and configuration files for .NET web applications. The SDK can also call for a REST Web services authentication token for added functionality. Finally, the SDK has a local encrypted cache for every location it is installed in to allow for quicker transit times and resiliency in case communication with SS is lost.

To download the SDK command line tool, choose a version and OS platform below.

See the [Secret Server Software Development Kit for DevOps](../sdk-cli/index.md) topic for how to use the SDK.

## SDK Client version 1.5.0

### Release Notes

- Cache improvements
- Stability improvements

### Downloads

- [Windows x64](https://downloads.ss.thycotic.com/secretserversdk/1.3.0/secretserver-sdk-1.5.0-win-x64.zip)
- [MacOS x64](https://downloads.ss.thycotic.com/secretserversdk/1.3.0/secretserver-sdk-1.5.0-osx-x64.zip)
- [Linux x64](https://downloads.ss.thycotic.com/secretserversdk/1.3.0/secretserver-sdk-1.5.0-linux-x64.zip) (including RHEL 7+)
- [Red Hat Enterprise Linux 6 x64](https://downloads.ss.thycotic.com/secretserversdk/1.5.0/secretserver-sdk-1.5.0-rhel.6-x64.zip)

### Download File Hashes

#### Windows x64

- File: `secretserver-sdk-1.5.0-win-x64.zip`
- SHA256: 4B3246470E4EA87190CE3B511151E93E04E7363EADBD145BA0EE8AA63BC1378B

#### MacOS x64

- File: `secretserver-sdk-1.5.0-osx-x64.zip`
- SHA256: 492D177CF86554EC22B947957328D833471E2DECFA7AE95FC0D2B3FFB1B24E37

#### Linux x64

- File: `secretserver-sdk-1.5.0-linux-x64.zip`
- SHA256: 94672CA26C438301A070C020FFAEE2932250F3358C91B30BC4F9B8F0E0A1210B

#### Red Hat Enterprise Linux 6 x64

- File: `secretserver-sdk-1.5.0-rhel.6-x64.zip`
- SHA256: BF0BA52C7BA0838E56C4C0C44FC29794223B04336458D342F14872FE3914E30B

## Legacy Releases

### SDK Client version 1.4.1

#### Release Notes

- New option to specify a configuration and cache directory other than the default
- SDK CLI (`tss`) now has a `--configure-directory` option.
- Nuget SDK packages now check for a `SecretServerSdkKeyDirectory AppSetting`.
- Updated the Nuget SDK packages to support customizing the key storage directory. They now check for a `SecretServerSdkKeyDirectory AppSetting`.
- Updated the Nuget SDK packages to have a `SecretServerClient` `GetAccessToken()` and     `GetAccessTokenAsync()` method, to get a REST or SOAP API token. This is equivalent to the existing SDK CLI command `token`.

#### Downloads

- [Windows x64](https://downloads.ss.thycotic.com/secretserversdk/1.4.1/secretserver-sdk-1.4.1-win-x64.zip)
- [MacOS x64](https://downloads.ss.thycotic.com/secretserversdk/1.4.1/secretserver-sdk-1.4.1-osx-x64.zip)
- [Linux x64](https://downloads.ss.thycotic.com/secretserversdk/1.4.1/secretserver-sdk-1.4.1-linux-x64.zip) (including RHEL 7+)
- [Red Hat Enterprise Linux 6 x64](https://downloads.ss.thycotic.com/secretserversdk/1.4.1/secretserver-sdk-1.4.1-rhel.6-x64.zip)

### SDK Client version 1.3.0

#### Release Notes

- Upgrade to .NET Core 2.1 runtime
- Encrypt configuration with DPAPI on Windows by default
- New commands to display connection status and version
- New option to specify a key storage directory other than the default
- Target multiple OS versions with a single build
- New build for Red Hat Enterprise Linux 6

#### Downloads

- [Windows x64](https://downloads.ss.thycotic.com/secretserversdk/1.3.0/secretserver-sdk-1.3.0-win-x64.zip)
- [MacOS x64](https://downloads.ss.thycotic.com/secretserversdk/1.3.0/secretserver-sdk-1.3.0-osx-x64.zip)
- [Linux x64](https://downloads.ss.thycotic.com/secretserversdk/1.3.0/secretserver-sdk-1.3.0-linux-x64.zip) (including RHEL 7+)
- [Red Hat Enterprise Linux 6 x64](https://downloads.ss.thycotic.com/secretserversdk/1.3.0/secretserver-sdk-1.3.0-rhel.6-x64.zip)

### SDK Client version 1.0.0

#### Release Notes

Initial release of the SDK command line tool

#### Downloads

- [Windows 10 x64](https://updates.thycotic.net/secretserver/secretserversdk/1.0.0-win10-x64.zip)
- [CentOS 7 x64](https://updates.thycotic.net/secretserver/secretserversdk/1.0.0-centos.7-x64.zip)
- [Red Hat Enterprise Linux 7 x64](https://updates.thycotic.net/secretserver/secretserversdk/1.0.0-rhel.7-x64.zip)
- [Ubuntu 16.10 x64](https://updates.thycotic.net/secretserver/secretserversdk/1.0.0-ubuntu.16.10-x64.zip)
- [MacOS 10.12 x64](https://updates.thycotic.net/secretserver/secretserversdk/1.0.0-osx.10.12-x64.zip)

## SDK NuGet Packages (Optional)

To get the SDK NuGet packages, check out the documentation on our [GitHub page](https://github.com/thycotic/sdk-documentation) This package is not required to use the SDK Client.

> **Note:** The SDK Client and SDK NuGet packages are two separate projects with separate versioning. We actively work to maintain feature parity between the two projects, but at times their features may differ.

