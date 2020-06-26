
[title]: # (Enabling FIPS Compliance)
[tags]: # (authentication,FIPS)
[priority]: # (1000)

# Enabling FIPS Compliance

## Overview

The Federal Information Processing Standard 140-1 (FIPS 140-1) and its successor FIPS 140-2 are United States Government standards that provide a benchmark for implementing cryptographic software. Secret Server (SS) was tested and operates correctly in FIPS-compliant environments.

> **Note:** The Microsoft .NET implementations of AES and SHA are not FIPS certified so Secret Server uses the Windows API versions for encryption functionality which *are* FIPS certified. 

See [FIPS 140-2 Validation](http://technet.microsoft.com/en-us/library/cc750357.aspx) for the FIPS certificate numbers for the Windows operating systems, including the algorithm implementations that we use. Supported operating systems include Windows Server 2008 R2 and above.

## Procedure

To enable FIPS compliance:

### Task 1: Enable FIPS in Secret Server

1. Ensure SS is already installed.
   
    > **Important:** Secret Server is unavailable and may give errors (such as "Parser Error Message: This implementation is not part of the Windows Platform FIPS validated cryptographic algorithms") until all the steps are completed.
    
    > **Important:** During SS installation, if FIPS compliance for Windows has already been enabled 'InvalidOperationException' error messages may result. To resolve the issue, please contact support for assistance.
    
    > **Important:** If FIPS is enabled as part of a domain group policy, it must be disabled before the option can be enabled in SS, otherwise an error may occur. It can be re-enabled using group policy once the feature has been enabled in the application.
    
1. In SS, go to **Admin \> Configuration**.

1. Click the **Security** tab.

1. Click the **Edit** button at the bottom of the page.

1. Click to enable the **Enable FIPS Compliance** check box in the **FIPS Compliance** section.

1. Click the **Save** button.

### Task 2: Enable FIPS in Windows

1. At the Windows command prompt, run `secpol.msc`. The Local Security Policy application appears.
1. In the left pane, drill down to **Security Settings \> Local Policies \> Security Options**.
1. In the right pane double-click the **System Cryptography: Use FIPS Compliant algorithms for encryption, hashing, and signing** policy. Its properties appear.
1. Click to enable the **Enabled** selection button on the **Local Security Setting** tab.
1. Click the **OK** button.
1. Close the **Local Security Policy** application.

### Task 3: Reset the IIS Server

Run `iisreset` from the Windows command prompt. IIS resets.

> **Note:** When using FIPS compliance mode in SS, we use the NIST-certified encryption algorithms within the Windows Operating System.

> **Note:** There should be no need to enable FIPS on the database server operating system because the encryption applies between the application and the database, not between the operating systems. Data is encrypted before it reaches the database.

## Related Information

- [NIST Cryptographic Module Validation Program Information](http://csrc.nist.gov/groups/STM/cmvp/documents/140-1/140val-all.htm#1892)
- [FIPS information for Windows](https://technet.microsoft.com/en-us/library/cc750357.aspx)
- [IIS Reset](https://thycotic.force.com/support/s/article/IIS-Reset) (KBA)