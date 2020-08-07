[title]: # (Configuration and Sizing)
[tags]: # (Distributed Engine Configuration and Sizing)
[priority]: # (1000)

# Configuration and Sizing

## Requirements

### Windows Server 2012

Starting in Secret Server version 8.9.000000, DEs require that one of following two server features be installed when the SS website is running on a Windows Server 2012. This depends on which protocol is selected in the engine’s callback settings. If HTTPS is selected,  the HTTP activation is required. If TCP is selected, then TCP  activation is required.  This accomplished by going to one of the following in Windows Server 2012:

- **.NET Framework 4.5 Features \> WCF Services \> HTTP Activation**

- **.NET Framework 4.5 Features \> WCF Services \> TCP Activation**

If the feature is not installed, there will be an error message in the DE logs:
`(405) Method Not Allowed. ---> System.Net.WebException: The remote server returned an error: (405) Method Not Allowed.`