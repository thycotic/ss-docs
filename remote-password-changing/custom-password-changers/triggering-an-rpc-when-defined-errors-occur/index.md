[title]: # (Triggering an RPC When Defined Errors Occur)
[tags]: # (Defined Errors)
[priority]: # (1000)

# Triggering an RPC When Defined Errors Occur

When the “Attempt Password Change with new password when error contains (regex)” setting is enabled, SS generates a new password to use during the next RPC attempt when the defined error is returned. Using a regular expression, which you define, SS scans the error message for specific text strings. When there is a match, SS generates and sets a new next password for the secret that will be used in the next RPC attempt, which will occur based on the templates RPC interval. To keep this process from generating too many next passwords, it is restricted to five attempts while failing RPC. 

> **Note:** Only the password field is updated. Passcodes and SSH keys are left alone.

**Figure:** Attempt Password Change with new password when error contains (regex) setting

![image-20191105140733364](images/image-20191105140733364.png)

Logic:

(RPC Error) AND (one or more regex matches) AND (five or fewer attempts) \=\> New password generated

Examples:

`.*UnknownError.*`  (any unknown error)

`.*`  (any error)

`.*minimum.*`  (minimum password length requirement error)

`.*0x80072035.*`  (server rejects password error)

`.*0x80072035.*|.*minimum.*`  (server rejects password or password length error)

## Procedure

To configure RPC in response to specific unknown errors:

1. Go to **Admin > Remote Password Changing**. The Remote Password Changing Configuration page appears:

![image-20191203153013109](images/image-20191203153013109.png)

1. Click the **Configure Password Changers** button. The Password Changers Configuration page appears:

![image-20191105140347335](images/image-20191105140347335.png)

1. Click the link for the desired password type. Its Account page appears:

![image-20191105140733364](images/image-20191105140733364.png)

1. If necessary, click the **Advanced Settings** link.

1. Click the pencil icon next to **Attempt Password Change with new password when error contains (regex)**. The Value text box appears.

1. Determine the desired text string to search for.

1. Type the desired regex in the **Value** text box.

1. Click the **Save** icon next to the text box.
