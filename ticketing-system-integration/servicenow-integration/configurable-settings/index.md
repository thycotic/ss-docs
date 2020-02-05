[title]: # (Configurable Settings)
[tags]: # (ServiceNow)
[priority]: # (30)

# Configurable Settings

## View Ticket URL Template

The format of the URL to be used for viewing the ticket. This appears in the audit log so you can easily view the corresponding ticket from SS. For details on this format, see [View Ticket URL Template Format](https://updates.thycotic.net/links.ashx?ViewTicketUrlExplanation) (KB).

Incident management: `https://<instance name>.service-now.com/nav_to.do?uri=incident.do?sysparm_query=number=$TICKETID`

Change management: `https://<instance name>.service-now.com/nav_to.do?uri=change_request.do?sysparm_query=number=$TICKETID`

## Ticket Number Format Pattern (Regex)

Before even making a call to the ServiceNow Web service you can have SS validate the number matches a pattern. For example, your incident numbers might all be prefixed with "INC" and you want to ensure they enter this prefix. Some sample expressions to validate the ticket number are listed below:

Incident management: `^INC[\d]{7}$`

Change management: `^CHG[\d]{7}$`

## Ticket Number Validation Error Message

The error message to display to the user when their entered ticket number fails the validation pattern regex.

## Instance Name

This is the name of your instance in the format `https://<instance name>.service-now.com`. 

## System Credentials

Select or create a secret that contains the username and password for a user that has access to execute the REST Web services. SS uses these credentials to authenticate to ServiceNow.

## Add Comments to Ticket

Check this box if you want the comment that a user enters to be added to the request in ServiceNow. This adds information such as the Secret to which access is requested, who requested access, and their comments. The comment is added as a work note in the activity section of the request.
