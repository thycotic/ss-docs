[title]: # (Creating a Custom Password Requirement)
[tags]: # (Template)
[priority]: # (10)

# Creating a Custom Password Requirement

To create a new password requirement:

1. Go to **Admin \> Secret Templates**. The Manage Secret Templates page appears:

   ![1567710946389](images/1567710946389.png)

1. Click the **Password Requirements** button. The Password Requirements page appears:

   ![1567712171025](images/1567712171025.png)

1. Click the **Create New** button.

   ![1567712261212](images/1567712261212.png)

1. Type the name and description.

1. If you want the requirement to become the new default, click to select the **Is Default** check box.

1. Set the general options for the requirement in the **Generate Password** section.

   > **Note:** You can also create a custom character set by clicking the Character Set link.

1. Add one or more password rules:

   1. Click to select the type of rule in the first dropdown list in the **Password Rules** section.
   1. Set that type’s parameter in the following text box.
   1. Click to select the character set from the “from” dropdown list.
   1. Click the **+** icon to save the rule.

1. Click the **Save** button.

> **Note:** To set a custom password requirement for a specific secret, use the “Customize Password Requirement” in the Security tab of a secret.

> **Note:** You can enable or disable the validation of manually entered passwords at the secret template level via the "Validate Password Requirements on Create" and "Validate Password Requirements on Edit" settings.

> **Note:** The "What Secrets Do Not Meet Password Requirements" report shows secrets containing a password that does not meet the password requirements set for its secret template.

> **Note:** Password requirements cannot include rules with overlapping character sets. For example, if an attempt is made to add both a "Minimum of 1 upper-case" rule and a "Minimum of 3 Default" rule to a new password requirement, an error displays.
