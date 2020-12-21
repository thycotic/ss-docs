[title]: # (SSH Command Menus)
[tags]: # (SSH Proxy,Networking,command menu)
[priority]: # (1000)

# SSH Command Menus

Secret Server (SS) supports privilege management and command restrictions for UNIX and other platforms with SSH interfaces. Privilege management is an additional layer of access control that can be applied to secrets with SSH Launchers over SSH Proxy. Privilege management gives the ability to grant users access to a machine with specific command restrictions to define the available commands that a user may run as root or another privileged account.

> **Note:** To use command restrictions, SS must have SSH Proxy enabled.

With command menus, you can configure predefined commands that users or groups will be able to access when connecting as a privileged account. A command menu is a list of command names mapped to system commands. The format for specifying a command is to separate a name and command with an equals symbol. For example:

`restart_apache = /usr/sbin/service apache restart`

You may also use parameters in commands so users can execute more complex commands. For example:

`move_file = /bin/mv $src $dst`

You can specify environmental variables by escaping dollar signs in commands. For example:

`go_home = cd $$HOME`

Command restrictions currently do not support complex commands, such as multiple commands on one line, piping, or output redirection. To support these functions, you may add a script to the system that has these capabilities and point map the command to that script. We highly recommend that generated scripts have proper user permissions and that the absolute path is used. The absolute path ensures that the correct script is being executed.

Commands may not be named as numbers or one of the following predefined commands:

`..`

`up`

`-help`

`?`

`-more`

`logout`

`exit`

To enable privilege management for an account, navigate to a PuTTY Secret's launcher tab and specify the "Connect As" secret that you wish to connect as. When launching this secret, the launcher uses it as credentials to log into the SSH service and then log into the credentials specified on the secret.

To enable command restrictions, navigate to a PuTTY secret's security tab and specify "Enable Proxy" and "Enable SSH Command Restrictions." This gives you the ability to map users and groups to command menus. When the unrestricted command menu is specified for a user, the user is launched into a normal shell environment without command restrictions. Likewise, if the "Allow Owners Unrestricted SSH Commands" option is enabled, the owners of the secret are also launched into a normal shell environment without command restrictions.

When specifying command menus on a secret, at least one command menu must be selected unless "Allow Owners Unrestricted SSH Commands" is enabled.

You can apply command restrictions to a secret policy for ease of management.