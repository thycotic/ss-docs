[title]: # (Configurable Settings)
[tags]: # (BMC Remedy)
[priority]: # (30)

# Configurable Settings

## Validating Ticket Status

When a BMC Remedy request number is entered into SS, the status of that request is retrieved to ensure that it is an open state. For example, if an incident number is entered that is in the "Closed" state, the user is informed that the ticket is closed.

Incident Management: Service Incident request cannot be closed or canceled. Change Management: Change management requests cannot be complete, closed, or canceled.

## View Ticket URL Template

The format of the URL to be used for viewing the ticket. This is placed in the audit log so you can easily view the corresponding ticket from SS. For details on this format, see [View Ticket URL Template Format](https://updates.thycotic.net/links.ashx?ViewTicketUrlExplanation) (KB). Depending on your version of BMC Remedy, the URL to link directly to a request may be slightly different.

Incident management:

`https://<midtier_server>//arsys/forms/<servername>/SHR%3ALandingConsole/Default+AdmSearchTicketWithQual&F304255610='Incident Number'%3D%22$TICKETID%22`

Change management:

`https://<midtier_server>//arsys/forms/<servername>/SHR%3ALandingConsole/Default+AdmSearchTicketWithQual&F304255610='Change Number'%3D%22$TICKETID%22`

## Ticket Number Format Pattern (Regex)

Before even making a call to the BMC Remedy Web service, you can have SS validate that the number matches a pattern. For example, your incident numbers might all be prefixed with "INC" and you want to ensure users enter the prefix. Some sample expressions to validate the ticket number are listed below:

Incident management: `^INC_CAL_[\d]{7}$`

Change management: `^CRQ_CAL_[\d]{7}$`

## Ticket Number Validation Error Message

The error message to display to the user when their entered ticket number fails the validation pattern regex.

## Service Endpoint URL

This is the URL for the SOAP-based Web services. Below are some samples for what is expected. You can find the actual endpoint using BMC Remedy Developer Studio and accessing the correct application from the AR System Navigator and viewing the Web services section of the application.

Incident management: `HPD_IncidentInterface_WS`

Change management: `CHG_ChangeInterface_WS`

## System Credentials

Select or create a secret that contains the username and password for a user that has access to execute the SOAP Web services. The username and password are added to the authentication header for the SOAP request.

## Authentication

If your installation of BMC Remedy uses an authentication server, enter it in this text-entry field. Most installations allow this text-entry field to be blank.

## Add Comments to Ticket

Check this box if you want the comment that a user enters to be added to the request in BMC Remedy. This adds information such as the secret for which access is requested, who requested access, and the requester's comments.

## Comment Work Type

When a comment is added to a request as a work item, the Work Item type is required. "General Information" is selected by default, but all default Work Type options are supported.
