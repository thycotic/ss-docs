[title]: # (ServiceNow Integration)
[tags]: # (ServiceNow)
[priority]: # (1000)
[redirect]: # "ServiceNowFailure"

# ServiceNow Integration

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

## Introduction

SS can integrate with ServiceNow's Incident and Change Management service. This integration includes validating ticket numbers, their status, and adding Work Detail items to the request. The integration with ServiceNow leverages the out-of-the-box REST-based Web services.

## Requirements

- ServiceNow instance running the Eureka version or later with REST services enabled.
- A username and password that has access to execute the REST services, specifically GET and MODIFY on the following tables: Change Request and Incident.
- The SS environment needs to be able to connect to the ServiceNow Web services via port 80 or 443. SSL is highly recommended because the REST messages authenticate with a username and password.

## Configurable Settings

### View Ticket URL Template

The format of the URL to be used for viewing the ticket. This appears in the audit log so you can easily view the corresponding ticket from SS.

Incident management: `https://<instance name>.service-now.com/nav_to.do?uri=incident.do?sysparm_query=number=$TICKETID`

Change management: `https://<instance name>.service-now.com/nav_to.do?uri=change_request.do?sysparm_query=number=$TICKETID`

This field specifies the URL that will be used when displaying a link to a ticket in the audit log. In this field, the `$TICKETID` parameter will be replaced by the ticket number that is entered by the user.

For example, if you specify the **View Ticket URL Template** as `http://myticketingsystem/ticket.aspx?ticketid=$TICKETID`, and Bob enters `5125-242` as the ticket number, a link will appear in the audit log to `http://myticketingsystem/ticket.aspx?ticketid=5125-242`.

### Ticket Number Format Pattern (Regex)

Before even making a call to the ServiceNow Web service you can have SS validate the number matches a pattern. For example, your incident numbers might all be prefixed with "INC" and you want to ensure they enter this prefix. Some sample expressions to validate the ticket number are listed below:

Incident management: `^INC[\d]{7}$`

Change management: `^CHG[\d]{7}$`

### Ticket Number Validation Error Message

The error message to display to the user when their entered ticket number fails the validation pattern regex.

### Instance Name

This is the name of your instance in the format `https://<instance name>.service-now.com`.

### System Credentials

Select or create a secret that contains the username and password for a user that has access to execute the REST Web services. SS uses these credentials to authenticate to ServiceNow.

### Add Comments to Ticket

Check this box if you want the comment that a user enters to be added to the request in ServiceNow. This adds information such as the Secret to which access is requested, who requested access, and their comments. The comment is added as a work note in the activity section of the request.

## Testing your Integration Setup

After configuring the ticket system, use the **Test Validation** button to verify SS can successfully access ServiceNow. This button opens a dialog in which you can enter a ticket number from ServiceNow. This validation process either succeeds or shows an error code.