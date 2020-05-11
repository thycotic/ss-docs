[title]: # (Requirements)
[tags]: # (PowrShell,Ticket System)
[priority]: # (1000)

# Requirements

- PowerShell, see [Creating and Using PowerShell Scripts](https://updates.thycotic.net/links.ashx?SecretServerPowerShellKB) (KBA).

- Access to your ticket system via some API that can be accessed in PowerShell. This could be a REST API, SOAP API, or native calls.

## Configurable Settings

- **Run as Credentials:** In SS a domain credential is required to execute the PowerShell script. This is a required text-entry field.

- **System Credentials:** The system credentials are specific to your ticketing system. Any secret using the username and password extended mapping can be used as your system credential. Additional arguments can be populated from this text-entry field on this secret and referenced in your script.

- **Ticket Number Format Pattern (Regex):** Before making a call to the PowerShell script you can have SS validate the number matches a pattern. For example, your incident numbers might all be prefixed with "INC" and you want to ensure they enter this prefix. See [Setting a Ticket Pattern Regex](https://updates.thycotic.net/links.ashx?TicketPatternExplanation) (KBA).

- **Ticket Number Validation Error Message:** The error message to display to the user when their entered ticket number fails the validation pattern regex.

- **Validating Ticket Status:** To validate tickets you must create a PowerShell script to retrieve and validate the ticket. The integration uses arguments to pass custom values to your script. By default, we map some text-entry fields to the first set of arguments.

- **View Ticket URL Template:** You can configure the view ticket URL if you have a Web-based ticketing system to allow easy access to link to your ticketing system from SS.
