[title]: # (How Discovery Works)
[tags]: # (Discovery)
[priority]: # (1010)

# How Discovery Works

## Automated Discovery

The following is a high-level overview of how the most common type of automated discovery works without customization. Discovery is organized into an ordered set of discovery scans that pass information based on input and output templates. This is all configured by default. You cannot alter the out-of-the-box discovery scanners, but you can copy them and then modify the copy.

## Automated Discovery Terms

First, discovery has several terms that need defining:

### Discovery Source

A named collective, ordered system that conducts discovery. There are five broad types: Active Directory, Amazon Web Services, Unix, VMware ESX\ESXi, and Google Cloud Platform.

Configuring discovery is defining the parameters of the discovery source, once the general type is chosen.

### Discovery Scanner

A discovery component that collects information during a discovery. There are four general types, called *scan templates* (in their sequential running order): Find host ranges, Find machine, Find local accounts, and Find dependencies.

A discovery source consists of an ordered sequence of discovery scanners. Each scanner has a defined input and output. A discovery source can have more than one scanner of a given type.

### Discovery Input Template

The defined input type for a discovery scanner. An instance of the template contains the data needed to conduct the scan. The input template is often, but not always, an output template of the preceding scanner in the sequence. Some examples include Active Directory domain, AWS discovery source, organizational unit, and Windows computer.

### Discovery Output Template

The defined output type for a discovery scanner. An instance of the template contains the data produced by the scan. The output template is often, but not always, an input template of the next scanner in the chain. Other times, the output may be used by another non-adjacent scanner in the discovery source. Some examples include: Active Directory account, AWS access key, ESXi local account, host range, organizational unit, and Windows local account.

### Discovery Rule

Discovery rules automatically create credential secrets or send emails when local accounts matching the rule criteria are discovered. Discovery rules are set in the discovery network view page because they are specific to portions of the discovered network and can be as granular as desired. Credential secrets can also be manually created as desired.

## Example Automated Discovery Process

A typical automated discovery process for Active Directory domains, running on an interval, looks like this:

> **Note:** The majority of current discovery processes are for AD discovery source type. The others types differ by input and output but follow a similar process.

> **Note:** Even though automatic discoveries run on a set interval, you cannot schedule when those occur. The interval is from whenever the discovery last ran.

1. Discovery matching runs. The discovery matcher creates a link between existing active secrets and any existing secrets in SS based on their machine names, accounts and dependencies. The matcher is automatic. When matches are found, the corresponding existing discovery results appear as “managed” in the discovery network view with a link to the existing secret or dependency.

1. Discovery rules run and attempt to match any unmanaged discovery results to the rule’s parameters. If a rule matches the results, discovery automatically imports the results using the settings in the discovery rule. Once finished, discovery begins.

1. The Find Host Ranges scanner (using the Windows Discovery base scanner) runs with an Active Directory Domain input template. The scanner determines which OUs are to be scanned and populates its Organizational Unit output template with a list of those OUs. The output template will be used by the following Find Machine scanner and also by the Find Local Accounts scanner, which does not require machine information.

1. The Find Machine scanner (using the Windows Discovery base scanner) examines OUs from its Organizational Unit input template via LDAP and creates a list of machines with which it populates its Windows Computer output template. This is the list of computers to run a dependency scan on. The Find Dependencies scanner uses this instance of the output template as its input template.

1. The Find Local Accounts scanner (using the File Load Discovery base scanner) examines OUs from its Organizational Unit input template via LDAP and creates a list of all AD admin accounts with which it populates its Active Directory Account output template. This is the list of discovered admin accounts.

1. The Find Dependencies scanner (using the Windows Discovery base scanner) examines a list of machines from its Windows computer input template using various technologies. For example, applications pools use Microsoft Web Administration (WMA) or, failing that, Windows Management Instrumentation (WMI). Services use WMI, and scheduled tasks use Windows’ task scheduler interfaces. The Find Dependencies scanner can return any number of output templates as desired. These include: Com+ Application, Computer Dependency (Basic), PS Dependency, Remote File, SQL Dependency (Basic), SSH Dependency (Basic), SSH Key Rotation Dependency, Windows Application Pool, Windows Scheduled Task, and Windows Service.

The discovered dependencies for local accounts are displayed at **Admin \> Discovery \> Discovery Network View \> Local Accounts**. Returned accounts for AD users are displayed at  **Admin \> Discovery \> Discovery Network View \> Domain \> Cloud Accounts**.

> **Note:** Any dependencies that were discovered in prior discovery runs that are no longer present are removed from the discovery results, and their secret dependencies are deactivated.

### Manual Discovery

You can also run discovery manually by going to **Admin \> Discovery** and clicking the **Run Now** button and selecting **Discovery Scan**. We recommend waiting for any automatic discovery to idle before starting a manual discovery run. A discovery scan runs the first four of the automated steps above. When you click the “Run Now” button on the Scan Computers tab, the last two are run. These steps are the most time intensive steps because many machines may be scanned.