[title]: # (Server SSH Key Verification)
[tags]: # (Authentication, SSH key)
[priority]: # (1000)

# Server SSH Key Verification

Host SSH key verification is supported for use with heartbeat, proxied launchers, password changers, and discovery. Host SSH key verification can be used to ensure that the machine you are connecting to is a trusted host.  Host SSH key verification will not pass credentials to the target machine unless the public key digest matches the SHA1 digest that Secret Server (SS) has on file.  This helps prevent man-in-the middle attacks.

## How to Map a Server SHA1 Digest to a Secret

To configure host SSH key verification:

1. go to Secret Templates and add a field for the host's SSH key digest.

1. Click **Configure Extended Mappings**.

1. Add a "Server SSH Key" mapping to your newly created SSH key digest field.

1. On your secrets, add the SSH Key digest of the hosts to your digest field. Verification takes effect the next time you connect to the host.

## Heartbeat

If no "Server SSH Key" mapping exists for the secret or if the mapped digest field is blank, the digest will not be checked.  If a digest is mapped and present and it does not match, then heartbeat will fail with a "UnableToValidateServerPublicKey" error.  The heartbeat log will show the expected and actual values for the SHA1 digest.

## Password Changing

If no "Server SSH Key" mapping exists for the secret or if the mapped digest field is blank, the digest will not be checked.  If a digest is mapped and present and it does not match, then the password change will fail.  The Remote Password Changing log will show the expected and actual values for the SHA1 digest.

## Non-Proxied Launcher

When launching PuTTY, it displays a message if the server's public key digest is not yet trusted.

## Proxied Launcher

If no "Server SSH Key" mapping exists for the secret or if the mapped digest field is blank, the digest will not be checked.  If a digest is mapped and present and it does not match, then a message will be written to PuTTY displaying the expected and actual values for the SHA1 digest. The credentials from the secret will not be passed to the target machine.

## SSH Script Dependencies

SSH Script dependencies now have a "Server Key Digest" field.  When this field is blank, the server's digest will not be checked.  When it is filled in, if it does not match, an error is returned indicating the expected and actual values from that server.  No credentials are passed to the target machine unless the digest matches.

## Unix Account Discovery

To validate SHA1 server digests for Unix account discovery, create a file named `KeyDigests.txt` in the root of the SS website.  Each line should contain an IP address or other computer identifier, a comma, and then the SHA1 digest (see example below).  When the file exists and has data, all machines to be scanned must match one of the SHA1 hashes in the file.  Any computers that do not match will still show up on the Discovery Network View page, but authenticated scanning will not take place (no credentials will be passed to the machine, and accounts will not be retrieved from the machine).

Sample `KeyDigests.txt`:

```
192.168.1.5,7E:24:0D:E7:4F:B1:ED:08:FA:08:D3:80:63:F6:A6:A9:14:62:A8:15
apollo,7A:25:AB:38:3C:DD:32:D1:EA:86:6E:1C:A8:C8:37:8C:A6:48:F9:7B
```

Be sure that your digest value which you input into `KeyDigests.txt` is not an MD5 value. MD5 values are 32 bytes, whereas a SHA1 is 40. So the above is correct whereas if you obtain a digest of your public key file and the result has 32 bytes, this is likely an MD5. One command which could be used to obtain the SHA1 digest of the public key file for use in `KeyDigests.txt` is:

`awk '{$print $2}' id_xxx.pub | openssl base64 -d -A | openssl sha1`

After which, you should add `:` to every two characters to the output such that it matches the above. We will try to connect to the keys which we have the strongest preference for first in the event of multiple keys and it is legal to have multiple digests for the same IP address or hostname in the file. In the event of multiple keys on your system, it is usually correct to get the digest from `/etc/ssh/ssh_host_rsa_key.pub` and put it into `KeyDigests.txt` if this public key exists.