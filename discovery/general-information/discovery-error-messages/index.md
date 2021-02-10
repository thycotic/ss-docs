[title]: # "Discovery Error Messages"
[tags]: # "Discovery,error messages"
[priority]: # "1000"

# Discovery Error Messages

The following are common error messages received when performing discovery and their possible causes:

**User credentials cannot be used for local connections**

This error typically occurs when attempting to run discovery on the server that Secret Server is running on, due to WMI restrictions.

**No AD Account Services**

No services run by Active Directory accounts have been found on the machine.

**Computer is inaccessible or does not exist**

Port 135 is blocked.

**The target computer could not be reached**

The machine is not connected to the network.

**Access Denied**

The account used to sync the domain with SS does not have domain admin or local admin privileges for the machine it is attempting to scan for accounts.

**Bad parameters - Script Error: Cannot bind argument to parameter 'Message' because it is null.**

There is a mismatch between parameters referenced by the script and the arguments passed in. Check the script arguments on the scanner or dependency changer against the script.