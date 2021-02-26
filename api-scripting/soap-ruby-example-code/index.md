[title]: # (Python Example Code for SOAP)
[tags]: # (SOAP API,API,Scripting,Python)
[priority]: # (1000)

# Python Example Code for SOAP

## Overview

Secret Server webservices can be called using scripts. This example demonstrates how to authenticate and retrieve secrets programmatically in Python using SOAP. There are also [Perl](../soap-perl-example-code/index.md) and [C#](../soap-C#-example-code/index.md) versions.

This code uses the [SUDS module](https://fedorahosted.org/suds/) to import and create the WSDL.

## Code

### Searching Secrets

```python
import sys

import suds

client = suds.client.Client("http://localhost/SecretServer/webservices/SSWebservice.asmx?wsdl"")
#Org code is not necessary for installed edition and can be represented by ""
token = client.service.Authenticate("Username", "Password", "ORG Code", "Domain")

searchSecret=client.service.SearchSecrets(token.Token, "SearchString")
```

### Updating Secrets

```python
import sys

import suds

client = suds.client.Client("http://localhost/SecretServer/webservices/SSWebservice.asmx?wsdl"")
#Org code is not necessary for installed edition and can be represented by ""
token = client.service.Authenticate("Username", "Password", "ORG Code", "Domain")

secret = client.service.GetSecret(token.Token, "SecretID")

updateSecret = client.factory.create("UpdateSecret")

updateSecret.token = token.Token #Passes the authentication token to the updateSecret factory

updateSecret.secret = secret.Secret #Gives the updateSecret the Secret ID of the Secret that we are updating

updateSecret.secret.Items.SecretItem[0].Value = "NewValue1"

updateSecret.secret.Items.SecretItem[1].Value = "NewValue2"

updateSecret.secret.Items.SecretItem[2].Value = "NewValue3"

updateSecret.secret.Items.SecretItem[3].Value = "NewValue4"

updateResult = client.service.UpdateSecret(updateSecret)
```

### Adding Secrets

```python
import sys

import suds

client = suds.client.Client("http://localhost/SecretServer/webservices/SSWebservice.asmx?wsdl"")
#Org code is not necessary for installed edition and can be represented by ""
token = client.service.Authenticate("Username", "Password", "Org Code", "Domain")

newSecret = client.factory.create("AddSecret")

newSecret.token = token.Token

newSecret.secretTypeId = 6001 #Secret types can be found using the GetSecretTemplates webservice

newSecret.secretName = "NewSecret"

newSecret.folderId = 23 #Folder ID can be found using the SearchFolders webservice

newSecret.secretFieldIds = client.factory.create("ArrayOfInt") #secretFieldIds are found using the GetSecretTemplateFields webservice
#Must use all FieldIds and they must be in correct order
newSecret.secretFieldIds.int = [87, 90, 89, 88]

newSecret.secretItemValues = client.factory.create("ArrayOfString")

newSecret.secretItemValues.string = ["Vaule1", "Vaule2","Vaule3","Vaule4"]

resultAdd = client.service.AddSecret(newSecret)
```

