[title]: # (Active Directory Local Account Discovery Methods)
[tags]: # (discovery,active directory,local accounts)
[priority]: # (1000)

# Active Directory Local Account Discovery Methods

### Remote Procedure Calls (RPC)

This is the method that is used for local account discovery for all versions of Secret Server prior to release 8.6.000000 and is the default for all upgrades and fresh installations.  It uses the same technology as the Windows remote password changing in Secret Server and is the most dependable and proven of the options.  It can, however, be slower in some environments when scanning computers over a WAN.

### Windows Management Instrumentation (WMI)

This method uses the WMI technology to query the Windows computer.  In some environments, this method can be faster than the Remote Procedure Call.  It does, however, require having the proper permissions and network configuration setup correctly for WMI to run.

### Attempt WMI First, and Failover to RPC if Needed

This option attempts to use the WMI method first, and if that fails to work correctly, it attempts the RPC method for local account discovery.  This option is potentially slower because it has the possibility of performing two separate scans for each computer.