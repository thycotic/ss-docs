[title]: # (Requirements)
[tags]: # (ServiceNow)
[priority]: # (1000)

# Requirements

- ServiceNow instance running the Eureka version or later with REST services enabled.

- A username and password that has access to execute the REST services, specifically GET and MODIFY on the following tables: Change Request and Incident.

- The SS environment needs to be able to connect to the ServiceNow Web services via port 80 or 443. SSL is highly recommended because the REST messages authenticate with a username and password.
