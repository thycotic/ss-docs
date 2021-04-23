[title]: # (REST API Python Script Examples)
[tags]: # (REST API,API,Scripting,Python,Python3 examples)
[priority]: # (1000)

# REST API Python Scripts

This code sample demonstrates how to use Python 3 to authenticate to Secret Server, retrieve a Secret, and update Secret fields and items.

This code leverages the "requests" module, which makes it simple to communicate via REST. The requests module can be installed by running: `pip install requests`

A token is returned from username/password authentication that is used for all subsequent API calls.

````python

import http.client
import urllib
import json
import requests

site = '[Your Secret Server Site]' #ex: http://domain.com/SecretServer
authApi = '/oauth2/token'
api = site + '/api/v1'
username = 'myUserName'
password = 'userpassword1'

#Authenticate to Secret Server
def getAuthToken(username, password):
    creds = {}
    creds['username'] = username
    creds['password'] = password
    creds['grant_type'] = 'password'

    uri = site + authApi
    headers = {'Accept':'application/json', 'content-type':'application/x-www-form-urlencoded'}
    resp = requests.post(uri, data=creds, headers=headers)

    if resp.status_code not in (200, 304):
        raise Exception("Problems getting a token from Secret Server for %s. %s %s" % (username, resp.status_code, resp))
    return resp.json()["access_token"]

#REST call to retrieve a secret by ID
def GetSecret(token, secretId):
    headers = {'Authorization':'Bearer ' + token, 'content-type':'application/json'}
    resp = requests.get(api + '/secrets/' + str(secretId), headers=headers)    
    
    if resp.status_code not in (200, 304):
        raise Exception("Error retrieving Secret. %s %s" % (resp.status_code, resp))    
    return resp.json()

#REST call method to update the secret on the server
def UpdateSecret(token, secret):        
    headers = {'Authorization':'Bearer ' + token, 'content-type':'application/json'}
    secretId = secret['id']
    resp = requests.put(api + '/secrets/' + str(secretId), json=secret, headers=headers)    
    
    if resp.status_code not in (200, 304):
        raise Exception("Error updating Secret. %s %s" % (resp.status_code, resp))    
    return resp.json()

#Retrieves the secret item by its "slug" value
def GetItemBySlug(secretItems, slug):
    for x in secret['items']:
        if x['slug'] == slug:
            return x
    raise Exception('Item not found for slug: %s' % slug)

#Updates the secret item on the secret with the updated secret item
def UpdateSecretItem(secret, updatedItem):
    secretItems = secret['items']
    for x in secretItems:
        if x['itemId'] == updatedItem['itemId']:
            x.update(updatedItem)
            return
    raise Exception('Secret item not found for item id: %s' % str(updatedItem['itemId']))


print("Attempting authentication for %s..." % username)
token = getAuthToken(username, password)
print("Authentication successful.")
print()

#Get secret with ID = 1
print("Retrieving Secret with id: 1...")
secret = GetSecret(token, 1)
print("Secret Name: " + secret['name'])
print("Secret ID: " + str(secret['id']))
print("Active: " + str(secret['active']))

#Get the "Notes" secret item
notesItem = GetItemBySlug(secret, 'notes')
print("Notes secret field value: %s" % notesItem['itemValue'])
print()

#Change value of "Notes" secret item
print("Updating secret...")
notesItem.update({'itemValue': 'New Notes Value'})
UpdateSecretItem(secret, notesItem)
print("Secret updated.")
print()

#Change secret values
updateValues = {'name':'Updated Secret Name' }
secret.update(updateValues)
updatedSecret = UpdateSecret(token, secret)
notesItem = GetItemBySlug(updatedSecret, 'notes')
print("Updated Secret Name: " + updatedSecret['name'])
print("Notes secret field value: %s" % notesItem['itemValue'])

````