[title]: # (PHP Example Code for SOAP)
[tags]: # (SOAP API,API,Scripting,PHP)
[priority]: # (1000)

# PHP Example Code for SOAP

## Overview

Secret Server webservices can be called using scripts. This example demonstrates how to authenticate and retrieve secrets programmatically in Perl using SOAP. There are also [Perl](../soap-perl-example-code/index.md) and [C#](../soap-C#-example-code/index.md) versions. 

This is a working example for Secret Server Online. A test user has been filled in and OrganizationCode passed in. The test user has  been restricted to only viewing secrets. If connecting to an installed instance, change the web reference URL to match your site and pass in an empty string for organizationCode. 

## php.ini

These modules need to be enabled in the `php.ini` file:

- `extension_dir = "ext"` (depends on path to extension directory)
- `extension=php_soap.dll`
- `extension=php_openssl.dll`

## Code

### Secret and Authentication Example

```php
<?php

$secretServerURL = "https://www.secretserveronline.com/webservices/SSWebService.asmx?WSDL"";

$username = "thycotictest";

$password = "password";
$organizationCode= "RT9R"; //only needed for Secret Server Online account
$secretId = 154178;

//Create the SOAP Client

print $secretServerURL."\n";
print "\n";
print "\n";

$soapClient = new SoapClient($secretServerURL);

//Get Version (simplest call)

$versionResult = $soapClient->__soapCall("VersionGet", array());
$version = $versionResult->VersionGetResult->Version;
print "Secret Server Version is ".$version;
print "\n";
print "\n";

//Authenticate

$params = array();
$params["username"] = $username;
$params["password"] = $password;
$params["organization"] = $organizationCode;

$authenticationResult = $soapClient->Authenticate($params);
$errors = (array) $authenticationResult->AuthenticateResult->Errors;
if(count($errors) > 0)
{
 print "Login Error for user(".$username.") : ".$errors["string"]."\n";
 return;
}

print "Login Successful \n\n";
$token = $authenticationResult->AuthenticateResult->Token;

//Load the Secret

$params = array();
$params["token"] = $token;
$params["secretId"] = $secretId;

$secretGetResult = $soapClient->GetSecret($params);
//var_dump($secretGetResult);
$errors = (array) $secretGetResult->GetSecretResult->Errors;
if(count($errors) > 0)
{
 print "Error getting Secret Id (".$secretId.") : ".$errors["string"]."\n";
 return;
}



$secret = $secretGetResult->GetSecretResult->Secret;
$secretTemplateId = $secret->SecretTypeId;
$secretName = $secret->Name;
$secretItems = (array)$secret->Items->SecretItem;

print "Secret Name: ".$secretName."\n\n";

foreach ($secretItems as $secretItem)
{
 $fieldName = $secretItem->FieldName;
 $fieldValue = $secretItem->Value;
 print $fieldName." : ".$fieldValue."\n";
}

print "\n\n";

//Update the Notes Field on the Secret

$updatedSecret = $secret;
//var_dump($secret);
$timestamp = @date("M-d-Y h:i:s",time());
$updatedValue = "This value was updated through webservices at ".$timestamp;
$indexOfNotes = 3;
print "Updating the Field (".$updatedSecret->Items->SecretItem[$indexOfNotes]->FieldName.") to : \n'".$updatedValue."'\n\n";
$updatedSecret->Items->SecretItem[$indexOfNotes]->Value = $updatedValue;

$params = array();
$params["token"] = $token;
$params["secret"] = $updatedSecret;

$secretUpdateResult = $soapClient->UpdateSecret($params);
$errors = (array) $secretUpdateResult->UpdateSecretResult->Errors;
if(count($errors) > 0)
{
 print "Error updating Secret Id (".$secretId.") : ".$errors["string"]."\n";
 return;
}

print "Update Successful\n\n";

 ?>
```

### Secret Folder Example

The following example finds a folder by name and return the information for each of the secrets within that folder.

```php
<?php

$secretServerURL = "https://www.secretserveronline.com/webservices/SSWebService.asmx?WSDL"";



//$secretServerURL = "http://localhost/webservices/SSWebService.asmx?WSDL"";



$username = "thycotictest";

$password = "passwordt";

$organizationCode= "RT9R"; //only needed for Secret Server Online account

$folderName = "MyFolderWithSecrets";



//Create the SOAP Client



print $secretServerURL."\n";

print "\n";

print "\n";



$soapClient = new SoapClient($secretServerURL);



//Get Version (simplest call)



$versionResult = $soapClient->__soapCall("VersionGet", array());

$version = $versionResult->VersionGetResult->Version;

print "Secret Server Version is ".$version;

print "\n";

print "\n";



//Authenticate



$params = array();

$params["username"] = $username;

$params["password"] = $password;

$params["organization"] = $organizationCode;



$authenticationResult = $soapClient->Authenticate($params);

$errors = (array) $authenticationResult->AuthenticateResult->Errors;

if(count($errors) > 0)

{

 print "Login Error for user(".$username.") : ".$errors["string"]."\n";

 return;

}



print "Login Successful \n\n";

$token = $authenticationResult->AuthenticateResult->Token;



//Get the Folder ID

$params = array();

$params["token"] = $token;

$params["folderName"] = $folderName;



$folderGetResult = $soapClient->SearchFolders($params);

// Returns SearchFoldersResult; array of folders matching, and errors.



$errors = (array) $folderGetResult->SearchFoldersResult->Errors;

if(count($errors) > 0)

{

 print "Error getting Folder Info : ".$errors["string"]."\n";

 return;

} 



$count = 0;

$folders = $folderGetResult->SearchFoldersResult->Folders;

foreach ($folders as $folder) {

++$count;

$folderName = $folder->Name;

$folderId = $folder->Id;

print "Folder Name: " .$folderName. "\nFolder Id: " .$folderId. "\n\n";

print "\n";



$secretListParams = array();

$secretListParams["token"] = $token;

$secretListParams["searchTerm"] = "";

$secretListParams["folderId"] = $folderId;

$secretListParams["includeSubFolders"] = false;

$secretListParams["includeDeleted"] = false;

$secretListParams["includeRestricted"] = false;



$secretsResult = $soapClient->SearchSecretsByFolder($secretListParams);

$isarray = is_array($secretsResult->SearchSecretsByFolderResult->SecretSummaries->SecretSummary);

if($isarray){

$secrets = $secretsResult->SearchSecretsByFolderResult->SecretSummaries->SecretSummary;

}else{

$secrets = $secretsResult->SearchSecretsByFolderResult->SecretSummaries;

}



foreach($secrets as $secret){

$secretId = $secret->SecretId;

print "SecretId: " .$secretId. "\n";

$secretParams = array();

$secretParams["token"] = $token;

$secretParams["secretId"] = $secretId;

$secretDetailsResult = $soapClient->GetSecretLegacy($secretParams);

  $secretDetail = $secretDetailsResult->GetSecretLegacyResult->Secret;

print "SecretName: " .$secretDetail->Name. "\n";

$secretItems = $secretDetail->Items->SecretItem;

print "\n";

foreach($secretItems as $secretItem){

print " FieldDisplayName: " .$secretItem->FieldDisplayName. "\n";

print " FieldName: " .$secretItem->FieldName. "\n";

print " Value: " .$secretItem->Value. "\n";

print "\n";

}

print "\n\n"; 

}

}

?>
```