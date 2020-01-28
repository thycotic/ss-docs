[title]: # (Heartbeat Status Codes)
[tags]: # (XXX)
[priority]: # (40)

# Heartbeat Status Codes

- **Success**: The credentials in the secret authenticated successfully with the target system.

- **Failed**: The credentials in the secret failed authentication with the target system.

- **UnableToConnect**: SS was unable to contact the target system. Ensure that the domain, IP address, or hostname is correct and resolvable from the server that SS is installed on.

- **IncompatibleHost**:  The most common reason for this code is an attempt to verify an account on the same server that SS is installed on. If this is not the case, ensure that the domain, IP address, or hostname is correct and resolvable from the server that SS is installed on.

- **UnknownError**: Check the Heartbeat log on the Remote Password Changing page for details, and contact [Support](https://thycotic.com/products/secret-server/support-2/) for assistance
