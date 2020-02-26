[title]: # (Secret Audit Log)
[tags]: # (Secret Audit Log)
[priority]: # (20)

# Secret Audit Log

The audit log for a secret can be accessed by clicking the **View Audit** button on the **Secret View** page or navigating from the User Audit report. The log shows the date, the username, the action, and any other details about the event. Secret auditing provides a detailed view of each change or view on a secret.

> **Note:** Audit logs are visible to anyone with the “list” permission. Thus, anybody with that permission can view permission changes, users whose permissions were changed, secret dependency information, and the machine.

Secret audits are taken for the following user actions:

- Adding, updating and removing secret dependencies

- Check out

- Editing permissions

- Forced expiration

- Hide launcher password changes

- Set for check-in

- Update

- View

For certain audit items, action notes are added providing additional details. For example, if permissions are edited, an audit record is generated detailing which users or groups gained or lost permissions. Detailed audit records add accountability to sensitive secrets where auditors or administrators need to know exactly what was modified.

Below the audit records is a checkbox for Display Password Change Log. Clicking to select this check box displays logs for Heartbeat and Remote Password Changing amongst the audit items
