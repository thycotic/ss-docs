[title]: # (Ticket Number Validation)
[tags]: # (Ticket System)
[priority]: # (20)

# Ticket Number Validation

SS can require users to enter a ticket number when viewing a secret. Admins can track access to secrets based on an external ticket system. On the **Ticket System** tab of the **Configuration** page, an administrator can enter the settings to match the ticket system.

After the ticket system is enabled in SS, a user can enter a ticket number on the Comment screen or the Request Access screen.

The secret needs to have Require Comment or Requires Approval for Access enabled to allow the user to enter a ticket number. When a ticket number is required, this secret setting is displayed as "Require Comment/Ticket Number" on the Security tab.

Configurable settings:

- **Auditing:** The ticket number appears in the audit log and can be queried in reports. If the **View Ticket URL** has been set, the log shows the ticket number as a hyperlink linking to the external ticket system. Information on setting the URL can be found in [View Ticket URL Template Format](https://updates.thycotic.net/links.ashx?ViewTicketUrlExplanation) (KB).

- **View Ticket URL Template:** The format of the URL to be used for viewing the ticket. This is placed in the audit log so you can easily view the corresponding ticket from SS. For details on this format, see [View Ticket URL Template Format](https://updates.thycotic.net/links.ashx?ViewTicketUrlExplanation) (KB).

- **Ticket Number and Reason Options:** This option allows fine-grained control of what the user must enter when Require Comment is enabled and ticket system integration is turned on.

- **Reason Only Required:** Ticket number is optional, reason is required.

- **Both Required:** Ticket number and reason are required.

- **Ticket Number or Reason Required**: Either ticket number or reason must be entered.

- **Ticket Number Only Required**: Ticket number is required, reason is optional.

- **Ticket Number Format Pattern (Regex):** A regular expression to use for validating the ticket number entered. This can help prevent typos in the number. For details on creating this expression, see the [Setting a Ticket Pattern Regex](https://updates.thycotic.net/links.ashx?TicketPatternExplanation) (KB).

- **Ticket Number Label:** The text that displays next to the Ticket Number box on the Comment or Request Access page.

- **Ticket Number Validation Error Message:** The error message to display to the user when their entered ticket number fails the validation pattern regex.
