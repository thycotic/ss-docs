[title]: # (12. Secret Access and Workflow)
[tags]: # (Workflow)
[priority]: # (120)

# 12. Secret Access and Workflow

Sometimes, depending on your scenario, you want to add extra protections to highly sensitive secrets. SS has a access request and workflow features:

- [Secret Check-Outs](#Secret-Check-Outs): Grant access to a single user
- [Basic Secret-Access Requests](#Basic-Secret-Access-Requests): Require approval prior to accessing a secret for a defined time period
- [Advanced Secret-Access Requests with Workflow Templates](#Advanced-Secret-Access-Requests-with-Workflow-Templates): Require multi-level and multi-user approval prior to accessing a secret for a defined time period
- [Secret DoubleLocks](#Secret-DoubleLocks): Add another security layer by encrypting secret data with a supplemental custom encryption key that is only accessible with an additional password, regardless of regular permissions.
