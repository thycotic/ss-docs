[title]: # (VMware ESX/ESXi Account Discovery)
[tags]: # (Account Discovery, VM)
[priority]: # (1000)

# VMware ESX/ESXi Account Discovery

Please see the [Discovery Guide](https://updates.thycotic.net/link.ashx?SecretServerDiscoveryGuide) for a comprehensive guide to configuring and using discovery.

## ESXi Certificate Settings

> **Note:** VMware recommends not including a CRL/CDP in certificate templates. To that end, we recommend adding the `X509RevocationMode.NoCheck` option to the `ESXi.CertificateChainPolicyOptions` setting.

Thycotic added a configuration option for SS to allow ESXi TLS connections to ignore self-signed certificates, allow certificates from specific issuers (even if issuer is not in trusted certificate lists), or completely skip certificate validation when using ESXi password changer, heartbeat, or discovery.

> **Important:** For security reasons, we do **not** encourage customers to use self-signed certificates. Therefore, the new configuration settings listed below are not accessible through the UI. If you need to alter the default ESXi certificate validation settings, **submit a case through Thycotic's Support Portal** for assistance.

New advanced configuration settings include:

-   ESXi.IgnoreSelfSignedCerts: If true, ignores any self-signed certs (subject = issuer) from ESXi hosts during heartbeat, RPC, and discovery.

-   ESXi.CertIssuersToIgnore: Semi-colon delimited list of issuer names (in format shown on certificate---such as "O=Issuer Name"). Ignores partial chain errors due to certificate being issued by any issuer in this list when that issuer is not in the trusted root or intermediate CAs lists on the server.

-   ESXi.IgnoreAllCertErrors: If true, certificate validation will not be performed. All certificate errors will be ignored.

-   ESXi.CertificateChainPolicyOptions: Identical to TLS Audit option, but specifically for ESXi. Allows setting X509 options to be applied to certificate validation. This is a comma-delimited list of options. See TLS Auditing or [Updated Versions of ESX/ESXi Password Changing and Discovery for Secret Server 10.6](https://thycotic.force.com/support/s/article/SS-NTC-EXT-VMware-ESX-ESXi-Password-Changing-10-6) (KBA) for more information.

-   ESXi.ClientCertificateIds: identical to TLS Audit option, but specifically for ESXi. If ESXi host requires the client to present a valid certificate, this is a semi-colon delimited list of client certificates on the server to try to present.

-   ESXi.AuditTlsErrorsDebug: Identical to TLS Audit option, but specifically for ESXi. If set to true and SS (or DE) auditing is set to DEBUG, detailed debug messages about the certificate chain will be written to the log file.

-   ESXi.IgnoreDefaultHostCert: Sets all the TLS configuration options necessary to not fail due to a default ESXi host certificate and its issuer not being in the trusted certificates lists. This is a combination of setting the issuer to ignore and not performing a revocation check. Setting this to true should be the first change to make when attempting to resolve heartbeat, RPC, or discovery issues to ESXi hosts when using PowerCLI versions later than 5.5.

> **Note:** Issues with self-signed certificates previously implemented by customers were caused by a security update to the VMware vSphere PowerCLI in versions after 5.5 that no longer permits the use of self-signed certificates.