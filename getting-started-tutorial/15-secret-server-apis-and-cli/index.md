[title]: # (15. Secret Server APIs and CLI)
[tags]: # (API)
[priority]: # (150)

# 15. Secret Server APIs and CLI

You can access SS without using the user interface for automation and integration purposes. Currently, there are two APIs:

- An asynchronous REST (representational state transfer) API for Web services, which is based on JSON (JavaScript Object Notation). This is the preferred method. It is faster and easier to read than than the SOAP API and is still actively updated.
- A synchronous SOAP (Simple Object Access Protocol) for Web services, which is based on XML. This method is deprecated, but we still support it. It is based on an older technology, which has largely been replaced in recent years. There will be no enhancements to this API. There are, however, a few, rarely used capabilities that only our SOAP API has.

We offer a software development kit (SDK) that contains a .NET framework and a command line interface (CLI) for accessing the REST API with Windows applications or scripting languages.

Both APIs, the .NET framework, and the CLI support:

- GET Requests: Retrieve information from SS, including entire secrets, individual secret fields, and security tokens
- POST Requests: Create SS data
- PUT Requests: Update SS data
- DELETE Requests: Remove SS data

- Once-per-session permissions (tested once and then based on the IP address), administered with a SS rule

SDK Documentation:

-  [Secret Server SDK Guide](https://thycotic.force.com/support/s/article/SS-SDK-Guide): Includes these topics:
   - SS configuration
   - Roles and permissions
   - SDK client installation
   - Connecting to SS
   - SDK client caching
   - Examples
-  [Secret Server SDK Downloads](https://thycotic.force.com/support/s/article/SS-SDK-Downloads): Includes these topics:
   - SDK downloads
   - Download
   - SDK release notes
   - NuGet packages
-  [SDK Integration Document](https://github.com/thycotic/sdk-documentation): Includes these topics:
   - Integrating using C#
   - Integrating using the `web.config` file
   - Methods of the SecretServerClient() class

REST API Documentation:

- [REST Web Services API - Secret Server](https://thycotic.force.com/support/s/article/REST-Web-Services-API): Links to online reference guides (by SS release)
- [REST API PowerShell Scripts - Getting Started](https://thycotic.force.com/support/s/article/REST-API-PowerShell-Scripts-Getting-Started)
- [REST API Perl Examples](https://thycotic.force.com/support/s/article/REST-API-Perl-Scripts)
- [REST API Java Examples](https://updates.thycotic.net/links.ashx?RESTJavaExamples): Downloadable Zip file

SOAP API Documentation:

- [SOAP Web Services API - Secret Server](https://updates.thycotic.net/secretserver/documents/SS_WebServicesGuide.pdf): Reference guide in a downloadable PDF

- [Using Web Services with SOAP and JavaScript](https://thycotic.force.com/support/s/article/Using-Web-Services-with-SOAP-Javascript)

- [SOAP-based Web services API - Getting Started](https://thycotic.force.com/support/s/article/API-PowerShell-Scripts-Getting-Started)
