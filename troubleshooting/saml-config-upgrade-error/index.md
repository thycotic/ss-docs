[title]: # "Troubleshooting"
[tags]: # "troubleshooting, workaround, upgrade, saml error"
[priority]: # "1000"

# Troubleshooting SAML Configuration Errors After Upgrading

> **Note**: This topic is for upgrades of Secret Server from a version earlier than 10.2.

## Initial Troubleshooting

Changes to the `saml.config` were introduced in Secret Server 10.2. SS should automatically convert the existing `saml.config` to the latest format. If it does not:

1. Ensure that the application pool has write access to the `saml.config` file.     
1. Restart the applicationpool in IIS and try to log in again.
1. If SS is running in a clustered environment:
   1. Copy the `saml.config` from the Web node that was upgraded to the remaining web nodes.
   1. Restart their application pools in IIS.

If that does not resolve the issue or SS is not running in a clustered environment, there may be some other issue that prevented the `saml.config` from converting successfully during the upgrade. Please contact [Technical Support](../../support/index.md) for assistance.

> **Note:** See the [Configuring SAML in Secret Server](../../authentication/configuring-saml-sso/index.md) article for more information on configuring your saml.config in 10.2

> **Note:** If you are receiving an *Invalid algorithm specified* error, please refer to [SHA-2 Certificate Requirements for SAML (SSO)](https://thycotic.force.com/support/s/article/SHA-Certificate-Requirements-for-SAML-SSO) (KBA).

## Additional Troubleshooting

If the `saml.config` is not loading properly, there are a few possibilities:

- The `saml.config` file is invalid. Ensure that it contains valid XML. Element and attribute names are case sensitive. Ensure      that the elements and attributes names and value are valid for SAML configuration. 

  **Note:** See the `saml.config.template` file in SS's root folder for guidance on which elements and attributes  can be used.

- SS is running in a clustered environment and some nodes are not yet configured. Copy the `saml.config` from the functioning Web node to all of the remaining Web nodes and restart their Application Pools in IIS.

Restart the Application Pool in IIS any time changes are applied to the `saml.config` file. If issues remain after following these steps, please contact [Technical Support](../../support/index.md) for assistance.

 