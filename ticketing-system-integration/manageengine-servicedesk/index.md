[title]: # (ManageEngine ServiceDesk Plus Integration)
[tags]: # (manageengine,servicedesk plus,integration,powershell)
[priority]: # (1000)

# ManageEngine ServiceDesk Plus Integration (PowerShell)

Secret Server can integrate with ManageEngine ServiceDesk Plus via PowerShell. This integration includes validating ticket numbers and  their status, and adding comments (referred to as notes in ServiceDesk Plus).

For more information about integrating ticket systems with PowerShell, see [PowerShell Ticketing Integration](../powershell-integration/index.md).

## Requirements

* PowerShell, see [Creating and Using PowerShell Scripts](../../api-scripting/creating-using-powershell-scripts/index.md).

* Access to the REST API for your ManageEngine ServiceDesk Plus instance.

* [Configure CredSSP for use with WinRM/PowerShell](../../authentication/configuring-credssp-for-winrm-with-powershell/index.md).

## Ticket Number Validation Pattern (Regex)

Before making a call to the ticket validation script, you can have Secret Server validate that the number matches a pattern. For more information, see **Setting a Ticket Pattern Regex** on the [Ticketing System Integration](../index.md) page.

## Validating Ticket Status

You need to create a PowerShell script to retrieve and validate tickets. This integration assumes that the administrator will set the technician key for accessing ServiceDesk Plus in the script. This could easily be extended to pass in the key as an argument so that it can be managed from the ticket system interface.

```powershell
$ticket = $args[0]
$user = $args[1]
$password = $args[2]
$url = $args[3]
$validStatus = "Open"
$fields = "status"
$technicianKey = "<YOUR API GUID>"

$p = $password | ConvertTo-SecureString -AsPlainText -Force

$credentials = New-Object System.Management.Automation.PsCredential($user,$p)
$getStatusMethod = "$url/sdpapi/request/$ticket"

try
{
    $postParams = @{OPERATION_NAME='GET_REQUEST';TECHNICIAN_KEY=$technicianKey}
    [xml]$response = Invoke-WebRequest -Uri $getStatusMethod -Method POST -Body $postParams -Credential $credentials

    if ($response.API.response.operation.result.status -ne "Success")
    {
     throw "Response not successful." + $response.API.response.operation.result.message
    }

    $statusNode = $response.API.response.operation.Details.ChildNodes | Where-Object { ($_.name -eq "status") } 
    if($statusNode.value -ne $validStatus)
    {
        throw "Manage Engine Service Desk Plus ticket ($ticket) is not in Open status."
    }
}
catch
{
    if ($response.operation.result.message -eq "Invalid requestID in given URL")
    {
        throw "Manage Engine Service Desk Plus ticket ($ticket) does not exist."
    }
    throw "Manage Engine Service Desk Plus encounderted an error: " + $response.operation.result.message
}

```

## Adding Comments (Notes) to Tickets

To add comments (notes) to tickets you will need to create the script below. Other considerations are to pass in whether or not the note should be public.

```powershell

$ticket = $args[0]
$comment = $args[1]
$user = $args[2]
$password = $args[3]
$url = $args[4]
$technicianKey = "<YOUR API GUID>"
$isPublic = 'true'

$p = $password | ConvertTo-SecureString -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PsCredential($user,$p)

#Clean comment input for use in XML
$comment = $comment.replace('&', '&amp;').replace("'", '&apos;').replace('"', '&quot;').replace('<', '&lt;').replace('>', '&gt;')

$inputData = @"
<Operation>
    <Details>
        <Notes>
            <Note>
                <isPublic>$isPublic</isPublic>
                <notesText>$comment</notesText>
            </Note>
        </Notes>
    </Details>
</Operation>
"@

$URI = "$url/sdpapi/request/$ticket/notes"
$postParams = @{OPERATION_NAME='ADD_NOTE';TECHNICIAN_KEY=$technicianKey;INPUT_DATA=$inputData}
$response = Invoke-WebRequest -Uri $URI -Method POST -Body $postParams
[xml]$responseContent = $response.Content

if ($responseContent.API.response.operation.result.status -ne "Success")
{
    $message = $responseContent.API.response.operation.result.message;
    throw "Unable to add comment to ticket ($ticket). Message: " + $message
}
```
