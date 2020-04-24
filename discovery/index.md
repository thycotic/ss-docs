[title]: # (Discovery)
[tags]: # (Discovery)
[priority]: # (1000)

# Discovery

> **Note:** Please click the table of contents on the left to see any sub-pages to this one.

## Overview

Discovery is the process where SS scans an environment to find accounts and associated resources called *dependencies*. Once accounts are found, they can be used to create new secrets in SS. Users with the “administer discovery” role permission can either manually import accounts or can create an automated process, called a discovery rule, to do so. Using discovery does not stop users from manually creating their own secrets.

> **Note:** Please see our [Discovery Guide](https://updates.thycotic.net/secretserver/documents/SS_DiscoveryGuide.pdf) for details.

Some typical accounts that discovery can find include:

- Windows local admin
- Windows domain
- Unix non-daemon

Some typical dependencies discovery can scan for include:

- Scheduled tasks running as a domain user
- Application pools running as a domain user
- Services running as a domain user

> **Note:** Account and dependency types not supported out-of-the-box in SS can still be discovered by writing PowerShell scripts that can be run as custom scanners. See [Extensible Discovery](#extensible-discovery).

## How Discovery Works

### Automated Discovery

The following is a high-level overview of how automated discovery works without customization. Discovery is organized into discovery scans that pass information based on defined input and output templates. This is all configured by default. You cannot alter the out-of-the-box discovery scanners, but you can copy them and then modify the copy. 

A typical automated discovery process, running on an interval, looks like this:

1. Managed account discovery: Discovery matching runs. The discovery matcher creates a link between existing active secrets and any existing secrets in SS based on their machine names, accounts and dependencies. The matcher is automatic. When matches are found, the corresponding existing discovery results appear as “managed” in the discovery network view with a link to the existing secret or dependency.
1. Unmanaged account discovery: Discovery rules run and attempt to match any unmanaged discovery results to their parameters. If a rule matches the results, discovery automatically imports the results using the settings in the discovery rule.
1. IP address and Organizational Unit (OU) discovery: A "find host range” scanner determines which IP addresses or OUs should be scanned in the following “find machines” scan. For the AD OU scanner, which is used for Windows discovery, AD is queried to get a list of OUs. The IP addresses or OUs to be scanned are passed to the find machines discovery scanner. This OU information is also used by the "AD user accounts” scanner because it does not require machine information.
1. Machine discovery: A “find machines” scanner examines the found IP addresses or OUs (via LDAP) to create a list of machines. 
1. Account discovery: The “find accounts” scanning templates run. For AD accounts, the scans run with Windows Management Instrumentation (WMI) or Remote Procedure Calls (RPC). The “AD user accounts” scanner examines the earlier provided OUs. All local admin accounts are returned.
   
   > **Note:** You can view the returned accounts for Windows local accounts by going to Admin \> Discovery \> Discovery Network View \> Local Accounts Tab. You can view the returned accounts for AD users by going to  Admin \> Discovery \> Discovery Network View \> Domain \> Cloud Accounts. 
   
1. Dependency discovery: The “find dependencies” scanning templates run on the earlier list of machines using various technologies. For example, application pools use Microsoft Web Administration (MWA) and fallback to WMI if this fails to resolve any application pools. Services use WMI and scheduled tasks use Windows task scheduler interfaces. The resulting dependencies are put into Admin \> Discovery \> Discovery Network View \> Service Accounts Tab as a discovery result. If dependencies are returned for a scanner type but dependencies from a previous run are not found, the missing dependencies are removed from the discovery results, and their secret dependencies are deactivated.

### Manual Discovery

You can also run discovery manually by going to Admin \> Discovery and clicking “Run Now” button on the Discovery and Computer Scan tabs on that page. We recommend that you wait for any automatic discovery to idle before starting another discovery run. When you click the “Run Now” button on the Discovery tab, the first four of the automated steps above are run. When you click the “Run Now” button on the Scan Computers tab, the last two are run. These steps are the most time intensive steps because many machines may be scanned.

## Discovery and Sites—Where Does Secret Server Run Discovery Scans?

Like many operations in SS, you can configure discovery to run locally on IIS machines running SS using website processing or by running through a distributed engine. Distributed engines are agents that you can deploy to remotely process work. They are useful for scenarios where performance is an issue or the work must take place in a remote network where the ports required by discovery are not available. You can configure discovery to use a single site location per discovery source or on a per-OU basis for AD. For more information about distributed engines and other related SS architecture, please refer to the [Distributed Engine Guide](https://updates.thycotic.net/secretserver/documents/SS_DistEngine.pdf).

## Discovery Performance

Please see our [Discovery Best Practices Guide](https://thycotic.force.com/support/s/article/Secret-Server-Discovery-Best-Practices) to learn about optimizing discovery performance.

## Extensible Discovery

You can customize discovery by changing parts of it to use PowerShell. The information a discovery scanner outputs is defined by its scanner template. For standard templates, the input and output information types are fixed. Extensible discovery allows you to customize or replace the unmanaged account, IP address and OU, account, and dependency discovery steps above. Extensible discovery does still have limitations on what information is passed between discovery scanners. For more information, see the [Extensible Discovery Overview](https://thycotic.force.com/support/s/article/Scriptable-Discovery-Overview).