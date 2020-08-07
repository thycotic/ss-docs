[title]: # (Discovery)
[tags]: # (Discovery)
[priority]: # (1000)

# Discovery

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

## Overview

Discovery is the process where SS scans an environment to find accounts and associated resources called *dependencies*. Once accounts are found, they can be used to create new secrets in SS. Users with the “administer discovery” role permission can either manually import accounts or can create an automated process, called a *discovery rule*, to do so. Using discovery does not stop users from manually creating their own secrets.

Some typical accounts that discovery can find include Windows local admin, Windows domain, and Unix non-daemon. Some typical dependencies discovery can scan for include scheduled tasks running as a domain user, application pools running as a domain user, and services running as a domain user.

> **Note:** Account and dependency types not supported out-of-the-box in SS can still be discovered by writing PowerShell scripts that can be run as custom scanners. See [Extensible Discovery](#extensible-discovery).

## How Discovery Works

### Automated Discovery

The following is a high-level overview of how the most common type of automated discovery works without customization. Discovery is organized into an ordered set of discovery scans that pass information based on input and output templates. This is all configured by default. You cannot alter the out-of-the-box discovery scanners, but you can copy them and then modify the copy.

#### Automated Discovery Terms

First, discovery has several terms that need defining:

##### Discovery Source

A named collective, ordered system that conducts discovery. There are four broad types: Active Directory, Amazon Web Services, Unix, and VMware ESX\ESXi.

Configuring discovery is defining the parameters of the discovery source, once the general type is chosen.

##### Discovery Scanner

A discovery component that collects information during a discovery. There are four general types, called *scan templates* (in their sequential running order): Find host ranges, Find machine, Find local accounts, and Find dependencies.

A discovery source consists of a ordered sequence of discovery scanners. Each scanner has a defined input and output. A discovery source can have more than one scanner of a given type.

##### Discovery Input Template

The defined input type for a discovery scanner. An instance of the template contains the data needed to conduct the scan. The input template is often, but not always, an output template of the preceding scanner in the sequence. Some examples include Active Directory Domain, AWS Discovery Source, Organizational Unit, and Windows Computer.

##### Discovery Output Template

The defined output type for a discovery scanner. An instance of the template contains the data produced by the scan. The output template is often, but not always, an input template of the next scanner in the chain. Other times, the output may be used by another non-adjacent scanner in the discovery source. Some examples include: Active Directory Account, AWS Access Key, ESXi Local Account, Host Range, Organizational Unit, and Windows Local Account.

#### Example Automated Discovery Process

A typical automated discovery process for Active Directory domains, running on an interval, looks like this:

> **Note:** The majority of current discovery processes are for AD discovery source type. The others types differ by input and output but follow a similar process.

> **Note:** Even though automatic discoveries run on a set interval, you cannot schedule when those occur. The interval is from whenever the discovery last ran.

1. Discovery matching runs. The discovery matcher creates a link between existing active secrets and any existing secrets in SS based on their machine names, accounts and dependencies. The matcher is automatic. When matches are found, the corresponding existing discovery results appear as “managed” in the discovery network view with a link to the existing secret or dependency.

1. Discovery rules run and attempt to match any unmanaged discovery results to the rule’s parameters. If a rule matches the results, discovery automatically imports the results using the settings in the discovery rule. Once finished, discovery begins:

1. The Find Host Ranges scanner (using the Windows Discovery base scanner) runs with an Active Directory Domain input template. The scanner determines which OUs are to be scanned and populates its Organizational Unit output template with a list of those OUs. The output template will be used by the following Find Machine scanner and also by the Find Local Accounts scanner, which does not require machine information.

1. The Find Machine scanner (using the Windows Discovery base scanner) examines OUs from its Organizational Unit input template via LDAP and creates a list of machines with which it populates its Windows Computer output template. This is the list of computers to run a dependency scan on. The Find Dependencies scanner uses this instance of the output template as its input template.

1. The Find Local Accounts scanner (using the File Load Discovery base scanner) examines OUs from its Organizational Unit input template via LDAP and creates a list of all AD admin accounts with which it populates its Active Directory Account output template. This is the list of discovered admin accounts.

1. The Find Dependencies scanner (using the Windows Discovery base scanner) examines a list of machines from its Windows Computer input template using various technologies. For example, applications pools use Microsoft Web Administration (WMA) or, failing that, Windows Management Instrumentation (WMI). Services use WMI, and scheduled tasks use Windows’ task scheduler interfaces. The Find Dependencies scanner can return any number of output templates as desired. These include: Com+ Application, Computer Dependency (Basic), PS Dependency, Remote File, SQL Dependency (Basic), SSH Dependency (Basic), SSH Key Rotation Dependency, Windows Application Pool, Windows Scheduled Task, and Windows Service.

The discovered dependencies for local accounts are displayed at Admin \> Discovery \> Discovery Network View \> Local Accounts Tab. Returned accounts for AD users are displayed at  Admin \> Discovery \> Discovery Network View \> Domain \> Cloud Accounts.

> **Note:** Any dependencies that were discovered in prior discovery runs that are no longer present are removed from the discovery results, and their secret dependencies are deactivated.

### Manual Discovery

You can also run discovery manually by going to Admin \> Discovery and clicking “Run Now” button on the Discovery and Computer Scan tabs on that page. We recommend that you wait for any automatic discovery to idle before starting another discovery run. When you click the “Run Now” button on the Discovery tab, the first four of the automated steps above are run. When you click the “Run Now” button on the Scan Computers tab, the last two are run. These steps are the most time intensive steps because many machines may be scanned.

## Discovery and Sites—Where Does Secret Server Run Discovery Scans?

Like many operations in SS, you can configure discovery to run locally on IIS machines running SS using website processing or by running through a distributed engine. Distributed engines are agents that you can deploy to remotely process work. They are useful for scenarios where performance is an issue or the work must take place in a remote network where the ports required by discovery are not available. You can configure discovery to use a single site location per discovery source or on a per-OU basis for AD. For more information about distributed engines and other related SS architecture, please refer to the [Distributed Engine Guide](https://updates.thycotic.net/secretserver/documents/SS_DistEngine.pdf).

## Discovery Performance

Please see our [Discovery Best Practices Guide](./discovery-best-practices/index.md) to learn about optimizing discovery performance.

## Extensible Discovery

You can customize discovery by changing parts of it to use PowerShell. The information a discovery scanner outputs is defined by its scanner template. For standard templates, the input and output information types are fixed. Extensible discovery allows you to customize or replace the unmanaged account, IP address and OU, account, and dependency discovery steps above. Extensible discovery does still have limitations on what information is passed between discovery scanners. For more information, see the [Extensible Discovery Overview](https://thycotic.force.com/support/s/article/Scriptable-Discovery-Overview) (KBA).