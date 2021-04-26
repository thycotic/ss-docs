[title]: # (Active Directory Discovery)
[tags]: # (discovery,active directory)
[priority]: # (1000)

# Active Directory Discovery

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

Secret Server queries AD domains to obtain a list of Organizational Units (OUs) and Windows computers on the domain. These OUs and computers are recorded in the SS database. SS then attempts to connect to each computer and query for the following:

- **Domain Accounts:** AD user accounts
- **IIS Application Pools:** IIS application pools run by AD accounts
- **Local Accounts:** Local Windows accounts
- **Windows Services:**  Windows services run by AD accounts
- **Scheduled Tasks:** Windows scheduled tasks run by AD accounts
