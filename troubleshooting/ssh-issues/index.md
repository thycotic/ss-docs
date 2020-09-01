[title]: # (Troubleshooting SSH Issues)
[tags]: # (troubleshooting, workaround, SSH)
[priority]: # (1000)

# Troubleshooting SSH Issues

When troubleshooting performance or connectivity issues with SSH with or without proxy it is useful to enable SSH debug logging on your remote host. There are several things that could go wrong during the connection process and the SSH debug log tells you how far the connection gets before failing. To enable debug logging on a host the SSH service should be started with the debug flag.

> **Important:** A UNIX administrator should be tasked with these operations because if the box is a remote host with no local access then an incorrect action could leave you locked out of the machine if SSH is the only remote connection possible.

## Local Servers with Direct Access

 The following example works best with a local connection. You can start the SSH service in verbose debug mode where the debug output is sent to a file on the local system and the service terminates after the remote connection ends with the following:

 `/usr/sbin/sshd -ddd 2> sshd-debug.log`

## Remote Servers

Another way to configure SSH to log debugging information is to have syslog set up. You will need to add a syslog entry for the SSH service in `/etc/syslog.conf`:

` *.* /var/log/sshd/sshd.log`

And then configure the SSH service to have a log level of DEBUG3, which can be modified in `/etc/ssh/sshd_conf`:

`LogLevel DEBUG3`

Then restart the SSH service:

`service sshd restart`

> **Note:** On some systems, the log may already be configured to output to `/var/log/auth.log`.

## Logging from the Client Perspective

You can also do logging from the perspective of the client connection to the remote host. This sort of logging helps you to understand what a normal successful connection should look like. To obtain logging from the client connection, you can run SSH in verbose mode.

`ssh -vvv user@host`

The debug information will be sent to the console. Or if you are using PuTTY, then you can right click the PuTTY window title after connecting to the remote host and selecting "Event Log".

## Understanding SSH Logging

### Example

The following is an example of standard debug output from PuTTY looks like the following:

1. The client begins by lookup up the hostname and see if the host is valid:

   `2016-01-07 12:23:57    Looking up host "192.168.1.60"`

2. The client proceeds to make a TCP connection to the host: 

   `2016-01-07 12:23:57    Connecting to 192.168.1.60 port 22`

3. The client sends a message to the server saying what version of SSH we are using. In this example we are using SSH 2 over PuTTY v0.65:

   `2016-01-07 12:23:57    We claim version: SSH-2.0-PuTTY_Release_0.65`

4. The server sends back a message saying what version of SSH they are using. In this example we are connecting to an Ubuntu Server running an SSH 2 over OpenSSH v6.6.1p1:

   `2016-01-07 12:23:57    Server version: SSH-2.0-OpenSSH_6.6.1p1 Ubuntu-2ubuntu2`

   `2016-01-07 12:23:57    We believe remote version has SSH-2 channel request bug`

5. The client confirms the type of connection that can be used with the server. In this example the communications will be done using SSH 2:

   `2016-01-07 12:23:57    Using SSH protocol version 2`

6. The client begins the key exchange process and agrees on using Diffie-Hellman Group Exchange 256:

   `2016-01-07 12:23:57    Doing Diffie-Hellman group exchange`

   `2016-01-07 12:23:57    Doing Diffie-Hellman key exchange with hash SHA-256`

7. The server replies with their host key fingerprint information to identify its identity and aide in the prevention of Man in the Middle attacks. In this example the server is presenting an RSA 2048-bit key:

   `2016-01-07 12:23:57    Host key fingerprint is:`

   `2016-01-07 12:26:53    ssh-rsa 2048 e0:d4:94:36:e9:20:fd:e3:58:ad:8d:4c:4a:1f:27:e8`

8. The client initializes the transport layer encryption using AES-256 with SDCTR enabled and uses SHA-256 for message authentication:

   `2016-01-07 12:26:53    Initialized AES-256 SDCTR client->server encryption`

   `2016-01-07 12:26:53    Initialized HMAC-SHA-256 client->server MAC algorithm`

9. The server initializes the transport layer encryption using AES-256 with SDCTR enabled and uses SHA-256 for message authentication:

   `2016-01-07 12:26:53    Initialized AES-256 SDCTR server->client encryption`

   `2016-01-07 12:26:53    Initialized HMAC-SHA-256 server->client MAC algorithm`

10. The client sends a password.

    `2016-01-07 12:27:12    Sent password`

11. The server validates the password and granted access to the user:

    `2016-01-07 12:27:12    Access granted`

12. The session opens a shell for user interaction:

    `2016-01-07 12:27:12    Opening session as main channel`

    `2016-01-07 12:27:12    Opened main channel`

    `2016-01-07 12:27:12    Allocated pty (ospeed 38400bps, ispeed 38400bps)`

    `2016-01-07 12:27:12    Started a shell/command`

### Confirming Proper Operation

Things to look for in an SSH log:

- Verifies the host IP address that you are connecting to
- Verifies the port is correct for the address that you are connecting to
- Verifies that you are not using an outdated SSH client
- Verifies the SSH protocol you are using
- Verifies what group exchange algorithm is being used
- Verifies the server identity using the presented fingerprint. If the fingerprint is not expected then there may be malicious server between you and the remote host you want to connect to. Alert the administrator to verify if the host key has changed or if there is another issue.
- Verifies  the transport layer and HMAC ciphers being used
- Verifies  that the password or key being sent is accepted by the server
- If a connection does not open, it notes what the last successful step was and then what the next failed step is to find what the issue is.
- If using SS proxy, it is useful to collect the client-to-proxy SSH log and then the proxy-to-remote-host log from the remote server.