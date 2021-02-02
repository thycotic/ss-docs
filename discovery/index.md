[title]: # "Discovery"
[tags]: # "Discovery"
[priority]: # "1000"

# Discovery

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

Discovery is the process where SS scans an environment to find accounts and associated resources called *dependencies*. Once accounts are found, they can be used to create new secrets in SS. Users with the “administer discovery” role permission can either manually import accounts or can create an automated process, called a *discovery rule*, to do so. Using discovery does not stop users from manually creating their own secrets.

Some typical accounts that discovery can find include Windows local admin, Windows domain, and Unix non-daemon. Some typical dependencies discovery can scan for include scheduled tasks running as a domain user, application pools running as a domain user, and services running as a domain user.

> **Note:** Account and dependency types not supported out-of-the-box in SS can still be discovered by writing PowerShell scripts that can be run as custom scanners. See [Extensible Discovery](#extensible-discovery).

## Discovery Benefits

### Quick Initial and Ongoing Importation of Network Credentials

By using discovery, you SS offsets the burden of keeping track of computers and accounts on your network. This can be especially beneficial when getting started for discovering and importing accounts in bulk, as well as having SS find accounts and create secrets whenever a new machine or account is provisioned.

### Protection Against Backdoor Accounts

When SS is configured to discover new accounts, it provides added protection by regularly running discovery on your network to identify those accounts. SS adds the new accounts to its records and resets the accounts password to values that meet your security policy. Consequentially, if someone is setting up backdoor admin accounts on the network, they cannot use those accounts very long before they are imported into SS and their passwords are changed with Remote Password Changing (RPC).

## Discovery Types

### AD discovery

SS AD discovery scans for AD machines, AD user accounts, local Windows accounts, and dependencies on an AD domain. First, SS discovers machines from your domain. Next, SS scans each machine for local Windows accounts and dependencies. By default, SS scans for local accounts, domain accounts, scheduled tasks, Windows services, and IIS application pools. You can discover additional accounts and dependencies by creating PowerShell scanners. PowerShell scanners are an advanced topic described in the **Extensible Discovery** section.

### ESX/ESXi Discovery

SS provides a wizard to help configure ESX/ESXi discovery. You name the discovery Source, define the host ranges of the desired IP addresses, and choose a secret to use as credentials when scanning. 

**Note:** SS provides a "Generic Discovery—Only Credentials" secret type that stores a simple username and password pair for Unix or ESX/ESXi discovery. It is intended only for discovery and is incapable of RPC.

### AWS Discovery

Already in Homer.

### Google Cloud Platform Discovery

Already in Homer.

### Unix Discovery

SS provides a wizard to help configure Unix discovery. You name the discovery Source, define the host ranges of the desired IP addresses, and choose a secret to use as credentials when scanning. The default command sets that SS ships with discovers machines and accounts in most Unix environments.

By default, the "Find Non-Daemon Users (Basic Unix)**"** command set is used first. If a built-in account is discovered, you must modify the discovery source to use the "Find All Users (Basic Unix)" command set. You can create new command sets by clicking the Configure tab on the Discovery Sources page.

## Discovery Performance

Please see our [Discovery Best Practices Guide](./discovery-best-practices/index.md) to learn about optimizing discovery performance.

## Local Account Discovery Method for Active Directory

### Remote Procedure Call (RPC)

This is the method that is used for local account discovery for all versions of Secret Server prior to release 8.6.000000 and is the default for all upgrades and fresh installations.  It uses the same technology as the Windows remote password changing in Secret Server and is the most dependable and proven of the options.  It can, however, be slower in some environments when scanning computers over a WAN.

### Windows Management Instrumentation (WMI)

This method uses the WMI technology to query the Windows computer.  In some environments, this method can be faster than the Remote Procedure Call.  It does, however, require having the proper permissions and network configuration setup correctly for WMI to run.

### Attempt WMI First, and Failover to RPC if Needed

This option attempts to use the WMI method first, and if that fails to work correctly, it attempts the RPC method for local account discovery.  This option is potentially slower because it has the possibility of performing two separate scans for each computer.

## Extensible Discovery

You can customize discovery by changing parts of it to use PowerShell. The information a discovery scanner outputs is defined by its scanner template. For standard templates, the input and output information types are fixed. Extensible discovery allows you to customize or replace the unmanaged account, IP address and OU, account, and dependency discovery steps above. Extensible discovery does still have limitations on what information is passed between discovery scanners. For more information, see the [Extensible Discovery Overview](https://thycotic.force.com/support/s/article/Scriptable-Discovery-Overview) (KBA).