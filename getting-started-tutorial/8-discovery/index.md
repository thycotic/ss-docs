[title]: # (8. Discovery)
[tags]: # (Discovery)
[priority]: # (1008)

# Step 8: Discovery

SS has a discovery feature that can automatically find local Windows accounts, Active Directory service, Unix, VMware ESX/ESXi, and Active Directory domain accounts. Account and dependency types not supported out-of-the-box in SS can still be discovered by writing PowerShell scripts that can be run as custom scanners. This allows administrators to quickly import accounts found by SS on specified domains or IP addresses.

> **Note:** Please see the [Discovery Guide](https://updates.thycotic.net/link.ashx?SecretServerDiscoveryGuide) for a comprehensive guide to configuring and using discovery.

To run discovery on a domain, IP address range, or a custom source, you need to first enable the discovery feature for SS. Second, you must enable discovery for each discovery source you would like to be scanned.

See the followings to set up Active Directory discovery:

- [Enabling Discovery for Secret Server](../../secret-server-discovery/enabling-secret-server-discovery/index.md)

- [Enabling Discovery for an Active Directory Domain](../../secret-server-discovery/enabling-active-directory-domain-discovery/index.md)

- [Enabling Discovery for Specific OUs of a Domain](../../secret-server-discovery/enabling-specific-ou-domain-discovery/index.md)
