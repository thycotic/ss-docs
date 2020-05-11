[title]: # (Requirements)
[tags]: # (BMC Remedy)
[priority]: # (1000)

# Requirements

- BMC Remedy SOAP Web Services enabled

- A username and password that has access to execute the Web services. This can be set up in the developer studio by accessing the application in the navigator and viewing Permissions for the `CHG_ChangeInterface_WS` or `HPD_IncidentInterface_WS`. This user should also have access to query requests and add work items to requests for the appropriate module.

- SS environment needs to be able to connect to the BMC Remedy Web services via port 80 or 443\. SSL is highly recommended because the SOAP messages contain a username and password.
