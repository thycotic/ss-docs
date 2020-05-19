[title]: # (PowerShell Integration)
[tags]: # (PowerShell)
[priority]: # (1000)

# PowerShell Integration

> **Note:** Please click the table of contents on the left to see any sub-pages to this one.

SS can integrate with your ticketing system via PowerShell. This integration includes validating ticket numbers, their status, and adding comments. In our example we are connecting to a ServiceNow instance.

> **Note:** See [Creating and Using PowerShell Scripts](https://updates.thycotic.net/links.ashx?SecretServerPowerShellKB) (KBA).

## Configurable Settings

### View Ticket URL Template

You can configure the view ticket URL if you have a web based ticketing system to allow easy access to link to your ticketing system from Secret Server.

### Ticket Number Validation Pattern (Regex)

Before making a call to the PowerShell script you can have Secret Server validate the number matches a pattern. For example, your incident numbers might all be prefixed with “INC” and you want to ensure they enter this prefix. See [Regex KB](http://support.thycotic.com/kb/a242/setting-a-ticket-pattern-regex.aspx).

### Ticket Number Validation Error Message

The error message to display to the user when their entered ticket number fails the validation pattern Regex.

### The PowerShell RunAs Credentials

In Secret Sever a domain credential is required to execute the PowerShell script. This is a required field.

### System Credentials

The system credentials are specific to your ticketing system. Any secret using the Username and Password extending mapping can be used as your system credential. Additional arguments can be populated from field on this secret and reference in your script.

## Validating Ticket Status

### Overview

To validate tickets you will need to create a PowerShell script to retrieve and validate the ticket. The integration will use arguments to pass custom values to your script. By default we will map certain fields to the first set of arguments. The ticket number will be collected by user input and assigned to the first parameter. When you have your ticketing system credentials mapped to a secret and assigned to the "System Credentials" field in the ticketing system setup, SS inserts UserName and Password as the second and third parameters. 

Therefore, for the sample script below, the Ticket Status Script Arguments text box should be only contain`$url` (which is also retrieved from the System Credentials secret), as `$ticket`, `$user` and `$password` are supplied automatically by the system.

### Sample Script

``` powershell
$ticket = $args[0]
$user = $args[1]
$password = $args[2]
$url = $args[3]
$validStatus = "2"
$fields = "state"
$p = $password | ConvertTo-SecureString -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PsCredential($user,$p)
$getStatusMethod = "$url/api/now/table/incident?sysparm_limit=10&sysparm_query=number=$ticket&sysparm_display_value=&sysparm_fields=$fields"
$response = Invoke-RestMethod $getStatusMethod -Method Get -ContentType 'application/json' -Credential $credentials
if($response.result.state -ne $validStatus)
{
  throw "Invalid State"
}
```

## Adding Comments to Tickets

To add a comment to tickets, create another script to do so. Example: 

```powershell
$ticket = $args[0]
$comment = $args[1]
$user = $args[2]
$password = $args[3]
$url = $args[4]
$p = $password | ConvertTo-SecureString -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PsCredential($user,$p)
$restEndpoint = "$url/api/now/table/incident?sysparm_limit=10&sysparm_query=number=$ticket&sysparm_display_value=&sysparm_fields=sys_id"
$response = Invoke-RestMethod $restEndpoint -Method Get -ContentType 'application/json' -Credential $credentials
$id = $response.result.sys_id
$updateObject = @{'work_notes'=$comment}
$body = $updateObject | ConvertTo-Json
$addComment = "$url/api/now/table/incident/$id"
$response = Invoke-RestMethod $addComment -Method Put -ContentType 'application/json' -Credential $credentials -Body $body
```

## Adding Comments to a General Audit Log

In addition to adding comments to specific tickets, you may want general audit entries made in your ticket system. The arguments are passed in the following order.

```powershell

$comment = $args[1]
$user = $args[2]
$password = $args[3]

## custom script here

```

 