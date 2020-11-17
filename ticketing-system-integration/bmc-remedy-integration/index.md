[title]: # (BMC Remedy Integration)
[tags]: # (BMC Remedy)
[priority]: # (1000)

# BMC Remedy Integration

> **Note:** Please click the table of contents on the left to see any sub-pages to this one. Click the table of contents on the right to see headings on this page.

## Overview

SS can integrate with BMC Remedy's Incident and Change Management. This integration includes validating ticket numbers, their status, and adding work detail items to the request.

The integration with BMC Remedy leverages the out-of-the-box,  SOAP-based Web services that are installed with the ITSM product installation. These services must be installed on your mid-tier BMC Remedy server to allow for this integration if they are not already installed and configured.

## Requirements

- BMC Remedy SOAP Web Services enabled

- A username and password that has access to execute the Web services. This can be set up in the developer studio by accessing the application in the navigator and viewing Permissions for the `CHG_ChangeInterface_WS` or `HPD_IncidentInterface_WS`. This user should also have access to query requests and add work items to requests for the appropriate module.

- SS environment needs to be able to connect to the BMC Remedy Web services via port 80 or 443\. SSL is highly recommended because the SOAP messages contain a username and password.

## Configurable Settings

### Validating Ticket Status

When a BMC Remedy request number is entered into SS, the status of that request is retrieved to ensure that it is an open state. For example, if an incident number is entered that is in the "Closed" state, the user is informed that the ticket is closed.

Incident Management: Service Incident request cannot be closed or canceled. Change Management: Change management requests cannot be complete, closed, or canceled.

### View Ticket URL Template

The format of the URL to be used for viewing the ticket. This is placed in the audit log so you can easily view the corresponding ticket from SS. Depending on your version of BMC Remedy, the URL to link directly to a request may be slightly different.

Incident management:

`https://<midtier_server>//arsys/forms/<servername>/SHR%3ALandingConsole/Default+AdmSearchTicketWithQual&F304255610='Incident Number'%3D%22$TICKETID%22`

Change management:

`https://<midtier_server>//arsys/forms/<servername>/SHR%3ALandingConsole/Default+AdmSearchTicketWithQual&F304255610='Change Number'%3D%22$TICKETID%22`

### Ticket Number Format Pattern (Regex)

Before even making a call to the BMC Remedy Web service, you can have SS validate that the number matches a pattern. For example, your incident numbers might all be prefixed with "INC" and you want to ensure users enter the prefix. Some sample expressions to validate the ticket number are listed below:

Incident management: `^INC_CAL_[\d]{7}$`

Change management: `^CRQ_CAL_[\d]{7}$`

### Ticket Number Validation Error Message

The error message to display to the user when their entered ticket number fails the validation pattern regex.

### Service Endpoint URL

This is the URL for the SOAP-based Web services. Below are some samples for what is expected. You can find the actual endpoint using BMC Remedy Developer Studio and accessing the correct application from the AR System Navigator and viewing the Web services section of the application.

Incident management: `HPD_IncidentInterface_WS`

Change management: `CHG_ChangeInterface_WS`

### System Credentials

Select or create a secret that contains the username and password for a user that has access to execute the SOAP Web services. The username and password are added to the authentication header for the SOAP request.

### Authentication

If your installation of BMC Remedy uses an authentication server, enter it in this text-entry field. Most installations allow this text-entry field to be blank.

### Add Comments to Ticket

Check this box if you want the comment that a user enters to be added to the request in BMC Remedy. This adds information such as the secret for which access is requested, who requested access, and the requester's comments.

### Comment Work Type

When a comment is added to a request as a work item, the Work Item type is required. "General Information" is selected by default, but all default Work Type options are supported.

## Testing Your Integration Setup

After configuring the ticket system (see configurable settings below), use the **Test Validation** button to verify that SS can successfully access BMC Remedy. This button opens a dialog in which you can enter a ticket number from BMC Remedy. This validation process returns success or an error code. BMC Remedy may not return much detail in the error message so you need to look at the BMC Remedy API log to see a detailed error message, see the next section.

## BMC Remedy Error Messages

When Secret Server calls the BMC Remedy SOAP-based web services, there are times that BMC will only return a 500 error without any details of the exception. You can see the details of this exception from the BMC Remedy server logs as described below:

1. Log on BMC Remedy as a user with access to the administrative console.

1. Navigate to **AR System Administration** from the main menu.

1. Navigate to **System \> General \> Service Information**.

1. Click the **Log Files** tab.

1. Click to enable the **API Log** check box.

1. Click the **Apply** button.

1. Once enabled, you can click **View** from this window to see the log or navigate to the mid-tier server’s file system at the location specified. Details of the SOAP web service exception are written to the log file including a stack trace.