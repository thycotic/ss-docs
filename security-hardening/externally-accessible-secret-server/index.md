[title]: # (Considerations for an Externally Accessible Secret Server)
[tags]: # (external,externally,accessible,secret server,distributed engine)
[priority]: # (1000)

# Considerations for an Externally Accessible Secret Server

Secret Server can be hosted externally, like any other IIS website. We recommend using all security measures for Secret Server that you would use for any server directly accessible to the internet.
We also recommend the measures described below.

## Limiting the Attack Surface

* The Secret Server application should reside on a dedicated server in a DMZ.
* Secret Server and its database should reside on separate servers. If a hole for SQL connections can be opened in the DMZ firewall, the database can reside on the other side of the DMZ firewall.

## Using Secure Connections

* Use HTTPS to access to the website.
* Use SSL to connect to the Secret Server database.
* Use LDAPS to connect the web server to Active Directory.

## Setting Up Remote Password Changing

By default, Secret Server changes passwords on devices and accounts directly from the web server where it is installed. But when Secret Server is installed in a DMZ zone, it does not have direct network connections to these devices and accounts.

However, you can enable Secret Server to change passwords throughout your network over a specified port using Distributed Engines. See [Distributed Engines](../../distributed-engines/index.md) for more information on setting up and using Secret Server Distributed Engines.
