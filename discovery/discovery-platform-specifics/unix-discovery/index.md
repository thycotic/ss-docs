[title]: # "Unix Account Discovery"
[tags]: # "unix, discovery"
[priority]: # "1000"

# Unix Account Discovery

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

During configuration, SS is given a list of IP address ranges and ports on the network to scan for. Within that range, discovery searches for computers listening on the specified ports (default is 22). SS then attempts to use DNS to resolve the found IPs to discover the associated computer name. SS saves all the collected information to its database. SS then attempts to connect to each computer using the provided credentials and query for a list of user accounts on the target system.