[title]: # (Installing a Self-Signed SSL Certificate)
[tags]: # (Authentication, Certificate, Testing)
[priority]: # (1000)

# Installing a Self-Signed SSL Certificate

## Overview

An SSL (Secure Sockets Layer) certificate greatly enhances the security between the user’s browser and the server your SS is installed on. It encrypts all data between the server and the client’s browser so if an attacker were to look at the data being transmitted between the two, they would not be able to decipher it. 

> **Note:** SSL is required when using Integrated Windows Authentication.

## Obtaining an SSL Certificate

You can get a certificate from various companies such as [Thawte](http://www.thawte.com/) or [VeriSign](http://www.verisign.com/). If you already obtained a certificate from one of them, please follow their instructions for installing their certificates.

> **Note:** Thycotic does **not** provide certificates.

## Installing a Self-Signed Certificate

You can create your own certificate for trial or sandbox environments:

> **Note:** This requires IIS 7 or later.

### Task One: Generate an IIS Self-Signed Certificate

1. Open IIS manager (**inetmgr**) on your Web server.
1. Click on the server node (one of the root nodes) in the left panel.
1. Double-click the **Server certificates** icon.
1. Click the **Create Self-Signed Certificate** link in the **Actions** panel. The Specify Friendly Name dialog box appears.
1. Type any name you desire in the **Specify a Friendly name for the certificate** text box.
1. Click the **OK** button. You now have an IIS self-signed certificate that is valid for one year. It appears under the Server Certificates panel. The certificate common name (Issued To column) is the host name of the machine running the site. 

### Task Two: Bind the Self-Signed Certificate to the IIS Site

1. In IIS Manager, click the server you want to bind to on the **Connections** panel tree.
1. Drill down to **Sites \> Default Web Site**.
1. Click the **Bindings…** link in the **Actions** panel. The Site Bindings dialog box appears.
1. Click the **Add…** button. The Edit Site Binding dialog box appears.
1. Click the **Type** dropdown list and select **https**.
1. Click the **SSL certificate** dropdown list to select the certificate you just created.
1. Click the **OK** button. You return to the Site Bindings dialog box, where the HTTPS binding now appears.
1. Click the **Close** button. The dialog box closes.

### Task Three: Test the Self-Signed Certificate

1. In a browser, go to the Website using the certificate. You should see a warning that there is an issue with the site's security certificate—specifically, the security certificate was issued for a different website's address. This occurs because IIS uses the server's name as the common name when using a self-signed certificate, which usually does not match the hostname to access the site in your browser.
1. To access the website, click the "continue to the website" link or button. You will have to do this each time you access the site. Because this is a test environment, this should not be an issue. 

> **Note:** It is possible to remove the warning by adding the self-signed certificate to the trusted root certificate authorities, but that is beyond the scope of this instruction.