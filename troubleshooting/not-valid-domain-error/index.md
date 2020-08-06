[title]: # (Troubleshooting Invalid Domain Errors)
[tags]: # (troubleshooting, workaround, domain errors)
[priority]: # (1000)

# Troubleshooting Invalid Domain Errors

This topic discusses resolving the "The specified domain is not a valid domain" error.

## Troubleshooting Procedure
$1
$2$1
$2$1
$2
   1. Open the command console as an administrator (**Start \> Run \> cmd**).
 
   1. Type `ipconfig /all`.

   1. Press **\<Enter\>**.

   1. Find your primary ethernet adapter and look in the **DNS Servers** section. Verify that the DNS server is correct.
$1
$2
   1. Open up your control panel (**Start \> Control Panel**).

   1. Click on **Network and Sharing Center**.

   1. Click **Manage Network Connections** on the left.

   1. Right click on your primary network adapter and select **Properties**.

   1. Click **Internet Protocol Version 4 (TCP/IPv4)**.

   1. Click **Properties**.

   1. Click to select the **Use the following DNS server addresses selection** button.

   1. Type your primary DNS server in the first row.

   1. If you have a secondary DNS server, put it in the second row. 

      > **Important:** Both DNS servers must contain the SRV record for your domain controller.
$1
$2
   1. Open up your control panel (**Start \> Control Panel**).

   1. Type `nslookup`.

   1. Press **\<Enter\>**.

   1. Type `set q=srv`

   1. Press **\<Enter\>**.

   1. Type `_ldap._tcp.dc._msdcs.<Fully_Qualified_Active_Directory_Domain_Name>`.

   1. Press **\<Enter\>**.

   1. If you get a result that looks like:

      `_ldap._tcp.dc._msdcs.<Fully_Qualified_Active_Directory_Domain_Name> SRV service location:
        priority = 0
        weight = 100
        port = 389
        svr hostname  = *Domain_Controller_Host_Name*`

      Then you are retrieving the DNS record correctly. Otherwise, your DNS records are not correctly configured.

## Configuring the DNS Record on Your Server

$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2$1
$2
## Resolving Other DNS Issues

Secret Server requires that the DNS is correctly configured to add a domain. For additional tips on tracking down DNS Issues, see this [Troubleshooting Active Directory Installation Wizard Problems](http://technet.microsoft.com/en-us/library/bb727058.aspx).

Also ensure the domain controller is using the appropriate DNS. The `ipconfig /registerdns` command (as per the link above) is frequently helpful for entering the correct DNS entries in for a given domain.

 