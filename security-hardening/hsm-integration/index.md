[title]: # (Hardware Security Modules)
[tags]: # (HSM,integration)
[priority]: # (1000)

# Hardware Security Modules

## Introduction

Secret Server (SS) integrates with hardware security modules (HSMs). When Secret Server is configured to use an HSM, the SS encryption key is protected by that HSM.

HSMs offer several security features that traditional servers cannot. Depending on the model and design of the HSM, most HSMs are designed to be physically tamper-proof. HSMs may also be independent hardware on a network, which allows physically placing the HSM is a more secure location that might otherwise be too inconvenient for a server.

To provide broad support for HSMs, SS supports any HSM that can be configured with Microsoft's Cryptography Next Generation (CNG) provider. CNG is a layer provided by Windows Server 2008 and later that HSM manufacturers can interface with. If your HSM properly supports CNG and supports the right algorithms, SS can use it.

>**Note:** Turning off HSM (deselecting the check box) in SS may cause a "Server connection unavailable" error. If this happens, a manual reset of the IIS server should take care of it.

> **Note:** CNG provider installation and configuration varies from HSM to HSM; however, documentation is available from each HSM vendor on how to correctly install CNG providers.

## HSM Requirements

Each HSM must provide support for these algorithms through CNG:

- **RSA 4096**: Support for RSA with 4096-bit keys is required. The HSM must also support RSA for encryption and decryption, in addition to signing.
- **PKCS#1 v1.5 Padding**: The HSM must support PKCS#1 v1.5 padding for RSA encryption.

Additionally, closely follow the requirements and recommendations of the HSM vendor for things such as minimum latency, redundancy, and operating environment.

> **Note:** Due to limitations of the account, the NETWORK SERVICE account is not supported as an account for the IIS Application Pool. We recommend configuring Secret Server's application pool as a service account. In the advanced settings for the application pool, set "Load User Profile" to true.

> **Note:** Some HSM CNG provider's products interfere with each other. We recommend no more than one HSM CNG provider is configured on a Windows installation at a time.

## Silent HSM Operation

Because SS is a Web application with no one physically present at the server at most times, SS interacts with the HSM in "silent" mode. This prevents the HSM from attempting to interact with any users logged onto the server.

Some HSM features require interaction. If the HSM is configured in a way that requires interaction, Secret Server cannot communicate with the HSM and fails during the configuration steps.

For example, Operator Card Sets (OCS) in Thales network HSMs are such a configuration. If the Thales CNG provider is configured to use an OCS for key protection instead of module protection, someone must be physically present at the HSM and the server to insert their operator card when the key is needed. If the OCS quorum is more than a single card, SS cannot interact with the HSM because it requires inserting and removing the OCS cards.

In that case, we recommend that Thales' CNG provider is configured to use module protection instead of an OCS. It is possible to use an OCS with SS if the quorum is exactly one card and the card is left in the HSM at all times.

Consult your HSM vendor and their documentation to ensure that the HSM and their CNG provider are able to operate in silent mode and are configured to do so.

## Configuring HSM Integration

To configure the HSM integration, go to the **Admin > Configuration** menu and click **Configuration**, then select the **HSM** tab. This starts the HSM wizard, which guides the process of selecting the HSM's CNG provider.

You can find the list of available CNG Providers by querying for the list of registered CNG providers. Each provider must correctly report that it is a "Hardware" provider, and that it is not a Smart Card reader. If an error occurs while querying the CNG provider for its properties, it will not appear in the list; however the error is reported to Secret Server's system log. If the desired CNG provider does not appear in the list of CNG providers, ensure that the provider is correctly registered and that IIS has been restarted after the CNG registration. Also check that an error is not occurring while querying the HSM by examining the system log.

Once the CNG providers are selected, SS simulates encryption and decryption operations and verifies the results to check that it is functioning properly. Finally, SS verifies the selected providers, and then enables HSM integration. Detailed steps are provided throughout the HSM configuration wizard.

## Rotating the HSM Key

If HSM is enabled, SS can now rotate the HSM key to ensure the secret keys are always protected by an HSM key. Rotating the HSM key only decrypts the secret keys and then re-encrypts them with the new HSM key. We recommend performing a secret key rotation after the HSM key has been rotated.

To rotate the HSM key:

1. Navigate to **Admin \> Configuration \> HSM**.

1. Click the **Rotate HSM Key** button.

1. Make sure to back up the `encryption.config` file before proceeding.

1. Click the **Next** button.

1. Select the **HSM Persistent Provider** and **Key Size**.

1. Click the **Next** button. This performs a test to ensure the HSM can be used.

1. Click the **Next** button.

1. Verify the new HSM configuration.

1. Click the **Save** button.

1. Click the **Finish** button.

1. Do an IISReset or application pool recycle. This starts the rotation.

## Securing HSM Integration

The wizard to enable, rotate, and disable HSM integration is protected by the "Administer HSM" role permission in SS. The permission should be carefully assigned—if at all. Additionally, you can create an event subscription that sends alerts when the role permission is assigned or unassigned from a role.

Configuring the HSM also has its own event subscriptions for when the HSM integration is enabled, rotated, or disabled.

Additionally, an you can add an application setting  to SS to prevent changes to HSM configuration. Enabling, rotating, and disabling this requires direct access to the file system where SS is installed.

To enable this, edit the `web-appSettings.config` file within SS to contain a key called **LockHsmConfiguration** with a value of **True** as follows:

```xml
<?xml version="1.0" encoding="utf-8" ?>
<appSettings>
  <add key="LockHsmConfiguration" value="True" />
</appSettings>
```

This prevents access to the HSM configuration pages, regardless of role permissions. The only way to gain access is to remove this setting, thus proving you, at a minimum, have access to the server where SS is installed.

## HSM Redundancy

HSM redundancy varies from HSM to HSM. Please refer to the vendor's documentation on how to back up the HSM. Backups are typically either made to common file location, another HSM, or onto a smart card with the HSM's built-in smart card reader.

As long as the CNG provider is installed on the server and a key exists on the HSM with the same identifier, SS attempts to use that key.

## Testing HSM CNG Configuration

Secret Server does its own testing and verification of the HSM and its CNG provider before the HSM integration can be enabled. To further diagnose any issues with the HSM, the **certutil** command line utility, which is part of Windows, can test the HSM with the **–csptest** option specified. An example output may contain something like this:

```
Provider Name: SafeNet Key Storage Provider

   Name: SafeNet Key Storage Provider

……

Asymmetric Encryption Algorithms:

  RSA

  	BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE -- 3

  	NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION -- 4

  	NCRYPT_SIGNATURE_OPERATION -- 10 (16)

	NCryptCreatePersistedKey(SafeNet Key Storage Provider, RSA)

		Name: cngtest-6166f8fe-8caf-4e30-8e5c-a-24575
……

Pass
```

Examine the output of the test by looking for your CNG provider's name for your HSM and verifying the result. We recommend running this test using the same account as the application pool SS is using. If the testing tool reports errors, consult your HSM's vendor or documentation for resolution.