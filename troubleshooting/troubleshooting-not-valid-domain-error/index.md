[title]: # (Troubleshooting Invalid Domain Errors)
[tags]: # (troubleshooting, workaround, domain errors)
[priority]: # (1000)
[redirect]: # (SSDomainNotValidError)

# Troubleshooting Invalid Domain Errors

This topic discusses resolving the "The specified domain is not a valid domain" error.

## Troubleshooting Procedure

1. Verify that you are entering the fully qualified domain name in the domain field and that the domain username and password fields are correct.

1. Ensure that the ports used for LDAP (389) or LDAPS (389 and 636) are open. For more information about the ports used by Secret Server, see [Ports Used by Secret Server](../../networking/secret-server-ports/index.md).

1. Ensure that your server is connecting to the correct DNS server:

   1. Open the command console as an administrator (**Start \> Run \> cmd**).

   1. Type `ipconfig /all`.

   1. Press **\<Enter\>**.

   1. Find your primary ethernet adapter and look in the **DNS Servers** section. Verify that the DNS server is correct.

1. If the DNS server is incorrect, then follow these steps to configure the DNS server:

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

4. Check that your server is retrieving domain controller DC records correctly:

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


1. If you are **not** using a Windows DNS server, contact your vendor to ask how to add SRV records. You will need to add a SRV record pointing `_ldap._tcp.dc._msdcs.<Fully_Qualified_Active_Directory_Domain_Name>` to your primary DNS server.

1. Connect to your Windows DNS server.

1. Open the DNS control panel (**Start \>Administrative Tools \> DNS**).

1. Expand the node corresponding to your server.

1. Expand the **Forward Lookup Zones** node.

1. Expand the node corresponding to your domain.

1. Delete the **\_msdcs** node if it exists.

1. Right click on the domain node and select **New Domain...**

1. Type`_msdcs` as the name.

1. Right click on the new **\_msdcs** node, and select **New Domain...**

1. Type `dc` as the name.

1. Right click on the new **dc** node and select **Other New Records...**

1. Select **Service Location (SRV)** as the record type.

1. Click the **Create Record** button.

1. Select **\_ldap** as the service.

1. Select **\_tcp** as the protocol.

1. Type `389` as the port.

1. Type the fully qualified host name of your DC or the IP address in the **Host offering this service:** text box.

1. Click the **OK** button.

1. Click the **Done** button.

1. Open up the services console (**Start \> Run \> services.msc**)

1. Right click on the **DNS Server** service and select **Restart**. Your domain DNS record should now be set up.

## Resolving Other DNS Issues

Secret Server requires that the DNS is correctly configured to add a domain. For additional tips on tracking down DNS Issues, see this [Troubleshooting Active Directory Installation Wizard Problems](http://technet.microsoft.com/en-us/library/bb727058.aspx).

Also ensure the domain controller is using the appropriate DNS. The `ipconfig /registerdns` command (as per the link above) is frequently helpful for entering the correct DNS entries in for a given domain.

