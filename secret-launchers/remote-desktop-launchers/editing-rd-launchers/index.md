[title]: # (Editing RD Launchers)
[tags]: # (Launcher)
[priority]: # (1000)

# Editing RD Launchers

Click **Edit** to modify the settings for a launcher that has already been added to the template. For a launcher to work properly, SS requires credentials to be taken from secret text-entry fields. Fields must be assigned their corresponding credentials from the list. In addition to the secret fields, the domain can be mapped to `<blank>`, which passes an empty string to be used with local accounts, and the machine or host can be mapped to `<user input>`, which prompts the user for a specific machine to be used with domain accounts.

In cases where there are multiple endpoints to connect to, such as with a domain account, the machines can be restricted to a set list. Under the **Advanced** section of the secret template launcher configuration, enable **Restrict User Input**. When that option is on, the launcher shows a drop down of machines to connect to, based on a comma-separated list in the specified secret field.
