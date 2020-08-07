[title]: # (Security Compliance Standards)
[tags]: # (Compliance)
[priority]: # (1000)

# Security Compliance Standards

## FIPS Compliance

The Federal Information Processing Standard 140-1 (FIPS 140-1) and its successor (FIPS 140-2) are United States Government standards that provide a benchmark for implementing cryptographic software. SS has been tested within environments that are FIPS compliant. For instructions to enabling FIPS in SS, see the [Enabling FIPS Compliance in Secret Server](https://updates.thycotic.net/link.ashx?SSUserGuide_SecretServerFipsCompliance) KB article.

## PCI Datacenter Compliance

SS can make it easier to comply with PCI-DSS requirements:

- **Requirement 8:** Assign a unique ID to each person with computer access: SS helps you comply with Requirement 8 by providing a secure repository for you to maintain an automated password changing schedule, forcing each user to have a unique, secured password. SS's Web-based access makes it easy to access these passwords.

- **Requirement 10:** Track and monitor all access to network resources and cardholder data: SS can monitor all access to network resources. By employing remote password changing to force password changes, administrators can monitor and update network resources on a customized scheduled. You can create a password changing schedule that best suits your environment.

- **Requirement 11:** Regularly test security systems and processes.

- **Requirement 12:** Maintain a policy that addresses information security: You can optimize SS's software's global configuration and template-driven data structure to fit the requirements of your current information security policy or assist in creating a policy based on SS. Configuration options include:

   - Applying two-factor authentication

   - Enabling launchers

   - Enabling Web services

   - Enforcing local-user password requirements

   - Forcing HTTPS/SSL

   - Requiring folders for secrets (for uniform permissions)
