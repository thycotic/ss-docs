[title]: # "Unix Account Discovery"
[tags]: # "unix, discovery"
[priority]: # "1000"

# Unix Account Discovery

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

Unix account discovery follows these steps:

1. During configuration, SS is given a list of IP address ranges and ports on the network to scan for.  See [Creating a Unix Discovery Source](./creating-unix-discovery-source/index.md)
1. Within that range, discovery searches for computers listening on the specified ports (default is 22). The ports and other parameters are configurable via the scanners belonging to the discover source. See [Discovery Sources, Scanners, and Templates](../../general-information/discovery-sources-scanners-templates/index.md)
1. SS then attempts to use DNS to resolve the found IPs to discover the associated computer name. 
1. SS saves all the collected information to its database. 
1. SS then attempts to connect to each computer using the provided credentials and query for a list of user accounts on the target system.