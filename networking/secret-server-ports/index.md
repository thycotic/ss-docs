[title]: # (Ports Used by Secret Server)
[tags]: # (Ports, Networking)
[priority]: # ()

# Ports Used by Secret Server

## Overview

This article lists ports typically used in Secret Server. Please note the following:

- The RPC Dynamic Port ranges are a range of ports utilized by Microsoft’s Remote Procedure Call (RPC) functionality. This port range varies by operating system. For Windows Server 2008 or greater, this port range is 49152 to 65535 and this entire port range must be open for RPC technology to work. The RPC range is needed to perform Remote Password Changing since Secret Server will need to connect to the computer using DCOM protocol.

- The range can vary separately for Exchange servers. For more information about changing the RPC port range, see the related Microsoft’s Knowledge Base article on how to configure RPC dynamic port allocation to work with firewalls.

- To see your ipv4 dynamic range on a given machine, type `netsh int ipv4 show dynamicport tcp` in the command line.

- To specify a specific port on your environment that Secret Server will communicate to, see the related article on enabling WMI ports on Windows client machines

## Port Listing

**Table:** Secret Server Ports

| **Component** | **Type of Traffic** | **Port Number** |
| ------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Active Directory Sync** | LDAPS LDAP Kerberos SMB/Microsoft-DS | TCP/636, UDP/636 TCP/389, UDP/389 TCP/88, UDP/88 TCP445, UDP/445 |
| **Discovery** | RPC Dynamic Port Range* SMB/Microsoft-DS RPC Endpoint Mapper SSH | TCP/49152-65535, UDP/49152-65535 TCP/445, UDP/445 TCP/135 TCP/22 |
| **Remote Password Changing** | RPC Dynamic Port Range* SSH Telnet Microsoft SQL SMB/Microsoft-DS LDAP LDAPS Sybase Oracle Listener Kerberos Password Change Windows Privileged Account (WinNT ADSI Service Provider) | TCP/49152-65535, UDP/49152-65535 TCP/22 TCP/23 TCP/1433, UDP/1434 TCP/445, UDP/445 TCP/389, UDP/389 TCP/636, UDP/636 TCP/2638, TCP/5000 TCP/1521 TCP/464, UDP/464 TCP/139 |
| **Ports Incoming to Webserver** | HTTP HTTPS | TCP/80 TCP/443 |
| **Ports Incoming to Database Server** | SQL Connection | TCP/1433, UDP/1434 |
| **Email** | SMTP | TCP/25 |
| **RADIUS Server** | RADIUS Authentication | TCP/1812 |
| **Syslog** | Syslog | TCP/514, UDP/514 |
| **Secure Syslog** | Secure Syslog | TCP/6514 |
| **Internal Site Connector** | RabbitMQ MemoryMQ | TCP/5672 (non-SSL), TCP/5671 (SSL) TCP/8672 (non-SSL), TCP/8671 (SSL) |
| **RabbitMQ Clustering** | EPMD Inter-node Communication Inter-node Communication | TCP/4369 TCP/25672 TCP/44002 |

##  Related Articles and Resources

- [Enabling WMI port on Windows client machines](https://thycotic.force.com/support/s/article/Enabling-WMI-ports-on-Windows-client-machines) (KBA)
- [How to configure RPC dynamic port allocation to work with firewalls](https://support.microsoft.com/en-us/help/154596/how-to-configure-rpc-dynamic-port-allocation-to-work-with-firewalls) (KBA)