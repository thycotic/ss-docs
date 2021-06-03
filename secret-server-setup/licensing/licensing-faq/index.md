[title]: # (License Activation FAQ)
[tags]: # (License, activation, faq)
[priority]: #	(1000)

# License Activation FAQ

**What happens if we find that we had more named users than licenses after activation? Will the account lock us out?**
The user licenses are per named individual.  You can simply disable any excess users so you are within your license count—these users can be re-enabled at a later time and all audit log information is kept.

**Why is license activation required?**

Activation of license keys is standard practice in the software industry. We try to focus exclusively on implementing customer requests but occasionally we have to spend time on licensing especially as Secret Server goes into new geographical markets.

**Is there a grace period before we have to activate?**

Existing customers have 30 days to activate their licenses after upgrading. New licenses have to be activated immediately on adding them to Secret Server. Evaluation licenses do not require activation.

**How is license activation implemented in Secret Server?**
Activation is per license and Web server (the combination of the two). Therefore, even if a Web server was already activated, if you bring up a new Web server, it also needs activation. The activation process gathers the name, email, and phone number of the individual activating, for internal purposes only. No other personal information is sent to Thycotic.

**What will happen if we don’t activate our licenses?**

Secret Server will go into Limited Mode if you don’t activate your licenses. Limited Mode allows you to view passwords but many other features are disabled such as creating Secrets, editing Secrets, changing permissions and using web services. Simply activate your licenses to get out of Limited Mode.

**We have several license keys. Do we need to activate each license key individually?**

No, the license activation process will activate all license keys that are currently added to your Secret Server. However, additional license key for Distributed Engine may need to be activated individually if you receive the key after the other licenses.

**What if we have been using our license keys on more than one instance of Secret Server?**

Secret Server software licenses (user licenses, Professional or Enterprise or Enterprise Plus edition licenses) may only be used on a **single production instance** of Secret Server. You may use your same licenses for a single testing (non-production) environment. If you have used your licenses on multiple production instances of Secret Server, please [contact us](http://thycotic.com/company/contact/).

**What information is collected and sent during license activation?**

License Activation is required for each web server that will be running Secret Server. The request and the response to/from `thycotic.com` are encrypted for added security.

The following information is sent to `thycotic.com` when you activate:

- Name (user entered)
- Phone Number (user entered)
- Email (user entered)
- All Licenses (license name, license key)
- Hardware Hash of each web server

This information is one way hashed before it is sent so it does not reveal any identifiable hardware information.

- Secret Server version
- An encrypted value to identify the instance
- This does not include any secret data or the `encryption.config` file.
- The data is gathered for the purpose of contact if there is a licensing issue and Thycotic will not sell or distribute the information provided during activation.  The only information available to Thycotic staff is the contact information solely for the purposes of technical support and customer service.

**Our Secret Server does not have outbound access to the thycotic.com Web site. Can activation be done while offline?**

Yes, there is an offline option for activating licenses. See [Adding, Activating, and Deleting Licenses](../adding-activating-deleting-licenses/index.md).

**If we have trouble activating our licenses, what should we do?**

1. If your Secret Server is currently supported, with an equal number of current support licenses and user licenses, our technical support team will be able to help you. Please [contact us](http://thycotic.com/products/secret-server/support-2/).

1. If an error message persists after successful activation, remove expired/invalid licenses from Secret Server by clicking the license name and then Delete (the license information will remain available to you from your account at [my.thycotic.com](http://my.thycotic.com)).

**My Server is a VM that moves to different hardware often.  Will this cause me to need to reactivate over and over?**

As of version 7.8.000000, you will not need to reactivate over and over. When you activate, you will be able to use Secret Server for a year without needing to reactivate regardless VM hardware changes. However, if your machine name changes as well as your hardware, you will need to reactivate. If you are using a version older than 7.8.000000, you will need to reactivate when the VM moves.
