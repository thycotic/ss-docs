[title]: # (Secret Key Rotation)
[tags]: # (secret key rotation)
[priority]: # (1000)

# Secret Key Rotation

## Overview

Secret key rotation is a somewhat similar process to RPC by which the encryption key, used for securing secret data, is changed and that secret data is re-encrypted. Each secret receives a new, unique AES-256 key.  Secret key rotation can be used to meet compliance requirements that mandate encryption keys be changed on a regular basis.

## How to Perform Secret Key Rotation

> **Note:** Secret key rotation requires the Rotate Encryption Keys permission.

1. Go to **Admin \> Configuration \> Security.**
1. In the **Key Rotation** section, click the **Rotate Secret Keys** button.

Secret key rotation begins as soon as SS enters maintenance mode. Because maintenance mode disables various functionality (such as secrets cannot be updated), the timing of secret key rotation merits consideration of SS processing time.  We recommend running secret key rotation during off-peak or non-business hours.

Note: To learn more about maintenance mode, see the [Maintenance Mode FAQ](../../admin/maintenance-mode-faq/index.md).

## Estimated Processing Time

Maintenance mode takes five minutes to enable before secret key rotation is started. The processing time for secret key rotation varies greatly, depending on the following factors:

- Total number of secrets

- Total number of secrets with file attachments and the size of those file attachments

- Hardware configuration:
  - Number of CPUs and cores
  - Memory size
  - Network latency
- HSM key size, if applicable

As a general guideline, use the following:

**Table:** Secret Key Rotation Processing Time

| Configuration           | Approximate Time Taken          |
| ----------------------- | ------------------------------- |
| Without HSM (default)   | 2,000-12,000 secrets per minute |
| HSM with a 2048-bit key | 240-600 secrets per minute      |
| HSM with a 4096-bit key | 120-300 Secrets per minute      |

 