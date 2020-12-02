[title]: # "Syncing with DevOps Secret Vault"
[tags]: # "dsv, DevOps Secret Vault"
[priority]: # "1000"
[display]: # "all"

# Syncing with DevOps Secret Vault

## Overview

Secret Server (SS) can push its secrets to DevOps Secret Vault by creating a secret based on the "DevOps Secret Vault Client Credentials" template, which holds the client credentials for a DevOps Secret Vault tenant. Using the REST API, you can then register a DevOps Secret Vault tenant in SS. That tenant references that secret to push secrets to DevOps Secret Vault at a set sync interval.

## Behavior

You can manually push secrets to the DSV tenant, in addition to SS checking for secrets to push to tenants on a timer. SS will check for if a tenant needs updating every 30 minutes on the cloud or 10 minutes for an on-premises installation. Users are prevented from setting a tenant’s sync interval to less than SS’s timed iteration because there would be no benefit to doing so. When SS checks for secrets to be pushed to DSV, it only pushes secrets that have been changed since the last time they were updated in DSV. When a secret is pushed to DSV, its sync time is updated.

## Setup in Secret Server

To configure pushing secrets to DSV:

1. Create a client in DSV. Save the client ID and secret that are generated when you created it. A DSV client is a container for a password.

   > **Note:** Please see the DSV documentation for details.

1. Create a secret to connect to DSV:

   1. [Create a new secret](../../secret-management/procedures/creating-secrets/index.md) based on the DevOps Secrets Vault Client Credentials template:

      ![image-20200910124739622](images/image-20200910124739622.png)

   1. Type the name for the new secret in the **Secret Name** text box.

   1. Type the DSV client ID in the **Client ID** text box.

   1. Type the DSV password for authentication in the **Client Secret** text box. If you do not have one, you can create a new here by clicking the **Generate** button. Then, create or configure a client in DSV using the password.

   1. Type the DSV tenant to connect to in the **Tenant** text box. A DSV tenant is your DSV cloud account and the rights to access it. Use the format: `https://<tenantname>.secretsvaultcloud.<region>` with the region being one of the following:

      - U.S. region: `com`

      - E.U. region: `eu`

      - APAC region: `au` 

   1. Click the **Site** dropdown list to select your SS site.

   1. Click the **Create Secret** button.

1. Go to **Admin \> See All**. The Admin Menu page appears.

1. Click the **DevOps Secrets Vault** link. The DevOps Secrets Vault Tenants page appears:

   ![image-20200910123846837](images/image-20200910123846837.png)

1. Click the **Add New Tenant** button. The Add New Tenant popup appears:

   ![image-20200910124022186](images/image-20200910124022186.png)

1. Type a descriptive name for the tenant in the **Tenant Name** text box. This can be anything you wish.

1. Click the **Client Secret** link to select the secret you created earlier in this instruction.

1. Click the **Sync Interval** list box to select how often you want SS to push secrets to DSV for this tenant.

1. Click the **Save** button.

## API Examples

### Creating a DevOps Secret Vault Tenant

Use a POST to `/api/v1/devops-secrets-vault/tenant` using the body below to create a tenant in SS.


```json
{
  "Data": {
    "secretId": { "value": 79, "dirty": true },
    "tenantName": { "value": "LJDevTenant", "dirty": true },
    "syncInterval": { "value": 60, "dirty": true },
    "active": { "value": true, "dirty": true }
  }
}
```

The secret ID is the client ID for the secret based on the DSV Client Credentials template. The Sync Interval is how often SS checks if secrets needs to be pushed to DSV. Only secrets associated with active tenants are pushed to DSV. You are returned the tenant ID if the POST is successful.

### Creating a Sync Map

Use a POST to `/api/v1/devops-secrets-vault/add-sync` using this body to map a secret to a DSV tenant:

```json
{
"data": {
  "secretId": {
    "dirty": true,
    "value": 60
  },

  "dsvTenantId": {
    "dirty": true,
    "value": 1
  },

  "active": {
    "dirty": true,
    "value": true
  },

  "fieldNamesPath":{
    "dirty": true,
    "value": [
      "Demo","\$domain","qagreentest"
      ]
    }
  }
}
```

When the secret is mapped to a tenant, an initial sync immediately occurs. Following the initial sync, the secret is checked to determine if updates have been made when the sync Interval expires (making it "dirty") for the mapped tenant. If no changes have been made to the secret, then the secret is not pushed to DSV. You can reference fields from the secret to create the path in DSV. Secret Server will look for a `$`, then search for the following string as the [field slug names](../../secret-templates/secret-template-settings/field-slug-names/index.md) for the secret’s template. The path in DSV follows this format: `/secrets/<DSV_secret_name>`.

### Manually Syncing a Secret

Use a POST to `/api/v1/devops-secrets-vault/sync` to manually trigger a push to DSV for existing sync maps. The list of integers contains the SyncMapIds of the secret to tenant mapping, so you can control which secret is pushed to which tenant.

```json
{
"data": [
  3, 4, 5
  ]
}
```

### Listing DevOps Secret Vault Tenants

List DSV tenants registered to SS by running a GET to `/api/v1/devops-secrets-vault/tenant`. Query parameters accepted:

- `filter.nameSearch=`

- `filter.includeInactive=`

### Getting a DevOps Secret Vault Tenant’s Details

View the details of a single tenant by specifying a tenant ID in a GET to `/api/v1/devops-secrets-vault/tenant/{tenantId}`.

### Getting the Status of a Secret’s Synchronization

View a secret’s sync status by running a GET to `/api/v1/devops-secrets-vault/sync/status/{syncMapdId}`.

### Getting a List of Secret Synchronization Statuses

View a list of secret sync statuses by running a GET to
`/api/v1/devops-secrets-vault/sync/status`. Query parameters accepted:

- `filter.secretId=`

- `filter.includeInactive=`

- `filter.tenantId=`

## Secret Server SSH Key Pairs (for Terminal)

Created by 

[Lee John](https://thycotic.atlassian.net/wiki/people/5ba915cf19532b584beb1f78?ref=confluence&src=profilecard)

Last updated [Oct 20, 2020](https://thycotic.atlassian.net/wiki/pages/diffpagesbyversion.action?pageId=1610318165&selectedPageVersions=3&selectedPageVersions=4) by 

[Stephanie Stubler](https://thycotic.atlassian.net/wiki/people/557058:89bc9b38-72db-40df-a7bd-48aa773738fb?ref=confluence&src=profilecard)

4 min read[![Analytics](images/clip_image001.png)](https://thycotic.atlassian.net/plugins/servlet/ac/com.addonengine.analytics/com.addonengine.analytics__analytics-content-byline-item?page.id=1610318165&space.key=PDT&content.id=1610318165&content.version=4&page.type=page&page.title=Secret Server SSH Key Pairs (for Terminal)&space.id=3014657&content.type=page&page.version=4)Analytics

- [Overview](https://thycotic.atlassian.net/wiki/spaces/PDT/pages/1610318165/Secret+Server+SSH+Key+Pairs+for+Terminal#Overview)
- [Limitations](https://thycotic.atlassian.net/wiki/spaces/PDT/pages/1610318165/Secret+Server+SSH+Key+Pairs+for+Terminal#Limitations)
- [Enabling      Users to use SSH Key Pairs to Authenticate](https://thycotic.atlassian.net/wiki/spaces/PDT/pages/1610318165/Secret+Server+SSH+Key+Pairs+for+Terminal#Enabling-Users-to-use-SSH-Key-Pairs-to-Authenticate)
- [Creating      SSH Key Pairs](https://thycotic.atlassian.net/wiki/spaces/PDT/pages/1610318165/Secret+Server+SSH+Key+Pairs+for+Terminal#Creating-SSH-Key-Pairs)
- [Administering      Public SSH Keys](https://thycotic.atlassian.net/wiki/spaces/PDT/pages/1610318165/Secret+Server+SSH+Key+Pairs+for+Terminal#Administering-Public-SSH-Keys)
- [Using      SSH Keys for Authentication (PuTTY Example)](https://thycotic.atlassian.net/wiki/spaces/PDT/pages/1610318165/Secret+Server+SSH+Key+Pairs+for+Terminal#Using-SSH-Keys-for-Authentication-(PuTTY-Example))

**Overview**

SSH key pairs allow users to authenticate to Secret Server Terminal without using a password. The user generates a key pair in Secret Server, at which time the private key can be downloaded by the user locally in the format they require. The key pair generation process is the only time the private key will be provided to the user. If this private key is lost, then the user must log back into Secret Server and generate a new Public/Private key pair.

**Limitations**

Currently users can only authenticate to Secret Server using SSH Keys by using Secret Server’s SSH Terminal.

The types of Keys permitted to be generated are: Putty, and OpenSSH

**Enabling Users to use SSH Key Pairs to Authenticate**

There are three requirements for enabling Public SSH Keys:

1. SSH     Proxy is enabled in Secret Server

1. SSH     Terminal is enabled in Secret Server

1. SSH     Key Integration is enabled in Secret Server’s Configuration → Login     settings.

1. 1. **Unix      Authentication Method**: choose **Public Key only**, **Password or      Public Key**, or **Password and Public Key** to enable SSH key pair      authentication.
   1. From      here, the admin can also set an optional expiration time frame for the      Public SSH Keys, which applies to all users.

 

Once these 3 steps have been completed, users can now use the main navigation to create SSH Key Pairs.

**Creating SSH Key Pairs**

An SSH key pair consists of a **private key** and a **public key**. Only the public key is stored in the user’s settings – the private key downloaded during generation is **not** saved inside Secret Server, and should only be available to the user, to remain secure. 

During Terminal login, if the user provides his/her private key for authentication, Secret Server will validate the provided private key against the user’s available (and enabled) saved public keys. If a key pair match is found, the authentication will succeed (or the next required authentication step, for example a password prompt, will be shown). 

For security reasons, only users can create their own SSH key pairs. However, Secret Server Administrators can deactivate any user’s Public SSH Keys.

1. Navigate     to the Public SSH Keys page using the main navigation at the top right of     the screen: 

 

1. Click     the Create SSH Key above the grid, then fill out the form in the modal.

 

1. Click     the Create SSH Key in the modal, and then after a moment you will be able     to save the private key.

 

 

**Administering Public SSH Keys**

1. Navigate     to the User by going to Admin → Users → then finding the user in the drop     down
1. Select     the user, then in the General Tab click the “Administer Public SSH Keys”     button.

 

1. You     can now deactivate the user’s Public SSH Keys.

**Using SSH Keys for Authentication (PuTTY Example)**

1. In     PuTTY, fill the Session view to match your SSH Proxy connection settings     in Secret Server

 

1. In the     SSH → Auth section of PuTTY add the private key file that was saved when     generating the key in Secret Server

 

1. You     will be prompted to enter your passphrase for the key if one was set.

 

\4. You will be prompted to enter your password if Unix Authentication Method also requires a password.

 