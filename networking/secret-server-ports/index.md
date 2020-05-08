[title]: # (Ports Used by Secret Server)
[tags]: # (Ports, Networking)
[priority]: #

# Ports Used by Secret Server

## Overview

This article lists ports typically used in Secret Server. Please note the following:

- The RPC Dynamic Port ranges are a range of ports utilized by Microsoft’s Remote Procedure Call (RPC) functionality. This port range varies by operating system. For Windows Server 2008 or greater, this port range is 49152 to 65535 and this entire port range must be open for RPC technology to work. The RPC range is needed to perform Remote Password Changing since Secret Server will need to connect to the computer using DCOM protocol.

- The range can vary separately for Exchange servers. For more information about changing the RPC port range, see the related Microsoft’s Knowledge Base article on how to configure RPC dynamic port allocation to work with firewalls.

- To see your ipv4 dynamic range on a given machine, type `netsh int ipv4 show dynamicport tcp` in the command line.

- To specify a specific port on your environment that Secret Server will communicate to, see the related article on enabling WMI ports on Windows client machines

## Port Listing

**Table:** Active Directory Sync Ports

| Type of Traffic  | Port Number      |
| ---------------- | ---------------- |
| LDAPS            | TCP/636, UDP/636 |
| LDAP             | TCP/389, UDP/389 |
| Kerberos         | TCP/88, UDP/88   |
| SMB/Microsoft-DS | TCP445, UDP/445  |
 
**Table:** Discovery Ports

| Type of Traffic        | Port Number                      |
| ---------------------- | -------------------------------- |
| RPC Dynamic Port Range | TCP/49152-65535, UDP/49152-65535 |
| SMB/Microsoft-DS       | TCP/445, UDP/445                 |
| RPC Endpoint Mapper    | TCP/135                          |
| SSH                    | TCP/22                           |
 
**Table:** Remote Password Changing Ports

| Type of Traffic                                          | Port Number                      |
| -------------------------------------------------------- | -------------------------------- |
| RPC Dynamic Port Range                                   | TCP/49152-65535, UDP/49152-65535 |
| SSH                                                      | TCP/22                           |
| Telnet                                                   | TCP/23                           |
| Microsoft SQL                                            | TCP/1433, UDP/1434               |
| SMB/Microsoft-DS                                         | TCP/445, UDP/445                 |
| LDAP                                                     | TCP/389, UDP/389                 |
| LDAPS                                                    | TCP/636, UDP/636                 |
| Sybase                                                   | TCP/2638, TCP/5000               |
| Oracle Listener                                          | TCP/1521                         |
| Kerberos Password Change                                 | TCP/464, UDP/464                 |
| Windows Privileged Account (WinNT ADSI Service Provider) | TCP/139                          |
 
**Table:** Web Server Incoming Ports

| Type of Traffic | Port Number |
| --------------- | ----------- |
| HTTP            | TCP/80      |
| HTTPS           | TCP/443     |
 
**Table:** Database Server Incoming Ports

| Type of Traffic | Port Number        |
| --------------- | ------------------ |
| SQL Connection  | TCP/1433, UDP/1434 |
 
**Table:** Email Ports

| Type of Traffic | Port Number |
| --------------- | ----------- |
| SMTP            | TCP/25      |
|                 |             |
 
**Table:** RADIUS Server Ports

| Type of Traffic       | Port Number |
| --------------------- | ----------- |
| RADIUS Authentication | TCP/1812    |
 
**Table:** Syslog Ports

| Type of Traffic | Port Number      |
| --------------- | ---------------- |
| Syslog          | TCP/514, UDP/514 |
 
**Table:** Internal Site Connector Ports

| Type of Traffic | Port Number                        |
| --------------- | ---------------------------------- |
| RabbitMQ        | TCP/5672 (non-SSL), TCP/5671 (SSL) |
| MemoryMQ        | TCP/8672 (non-SSL), TCP/8671 (SSL) |
 
**Table:** RabbitMQ Clustering Ports

| Type of Traffic                                          | Port Number                    |
| -------------------------------------------------------- | ------------------------------ |
| EPMD                                                     | TCP/4369                       |
| Inter-node Communication                                 | TCP/25672                      |
| Inter-node Communication                                 | TCP/44002                      |

## Related Articles and Resources

- [Enabling WMI port on Windows client machines](https://thycotic.force.com/support/s/article/Enabling-WMI-ports-on-Windows-client-machines) (KBA)
- [How to configure RPC dynamic port allocation to work with firewalls](https://support.microsoft.com/en-us/help/154596/how-to-configure-rpc-dynamic-port-allocation-to-work-with-firewalls) (KBA)