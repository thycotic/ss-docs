[title]: # (RPC for Service Accounts and SSH Keys)
[tags]: # (XXX)
[priority]: # (150)

# RPC for Service Accounts and SSH Keys

#### Service Accounts

RPC can be performed on service accounts where the dependent services is automatically updated and restarted as the service account password is changed. Administrators are notified if a dependency fails to restart. The supported dependency types are IIS application pools, IIS application pool recycle, scheduled tasks, windows services, passwords embedded in .ini, .config, and other text files. Custom dependencies can be created using SSH, PowerShell, or SQL scripts. The application pool recycle only recycles the specified application pool, it does not update the password of the service account running the application pool. SS attempts to unlock the service account should the account become locked during the dependency password change if there is a privileged account assigned to the secret.

#### SSH Keys

RPC can be performed on multiple public keys referencing the same private key in SS. The dependency types for this situation are SSH key rotation and SSH key rotation privileged.
