[title]: # (C# Example Code for SOAP)
[tags]: # (SOAP API,API,Scripting,c#)
[priority]: # (1000)

# C# Example Code for SOAP

## Overview

Secret Server webservices can be called using scripts. This example demonstrates how to authenticate and retrieve secrets and folders programmatically in C# using SOAP.  There are also [Perl](../soap-perl-example-code/index.md) and [PHP](../soap-php-example-code/index.md) versions.

You can use your own account username, organization code (omit this if you are not using Secret Server Online Edition), and password to run it. To use this code, a WebReference named SSWebService must be added to the Visual Studio project for `https://<Your_URL>/webservices/SSWebService.asmx`. If connecting to an installed instance, change the web reference URL to match your site and pass in an empty string for organizationCode.

## Code

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SecretServerWebServices
{
    class Program
    {
        public const string Username = "your username";
        public const string Organization = "your org code";
        public const string Password = "your password";

        static void Main(string[] args)
        {
            using (var service = new SSWebService.SSWebService())
            {
                //secrets
                var token = service.Authenticate(Username, Password, Organization, null);
                var secrets = service.SearchSecrets(token.Token, "", true, true); //find all Secrets
                foreach (var secret in secrets.SecretSummaries)
                {
                    Console.WriteLine("{0}: {1}", secret.SecretName, secret.SecretTypeName);
                }

                //folders
                var folders = service.SearchFolders(token.Token, ""); //find all folders
                foreach (var folder in folders.Folders)
                {
                    Console.WriteLine("{0}: {1}", folder.Name, folder.Id);
                }
            }
            Console.WriteLine("Folders Found");
            Console.ReadKey();
        }
    }
}
```
