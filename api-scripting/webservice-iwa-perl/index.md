[title]: # (Using Webservices with IWA via Perl)
[tags]: # (API,Scripting,perl,webservices,IWA,authentication)
[priority]: # (1000)

# Using Webservices with IWA via Perl

## Overview 

You can enable webservices at **Admin \> Configuration** on the **General** tab. Checking the **Enable Webservices** check box makes the ASP.NET SOAP and REST webservices built into SS available for use. Additional steps are needed in IIS to ensure proper access. 

> **Note:** Integrated Windows Authentication (IWA) does **not** work on Secret Server Cloud. 

> **Note:** This procedure only works if SS on-premises is installed on IIS 7 or greater.

## Procedure 

 To enable IWA for webservices in IIS:

1. Open IIS Manager (`inetmgr`).

1. Expand the **Sites** node until you locate your Secret Server application or website

1. Expand the **Secret Server** node to locate the **winauthwebservices** folder.

1. Click on the **winauthwebservices** folder.

1. Click on **authentication** in the **Security** section. 

1. Disable **Anonymous Authentication**.

1. Enable **Windows Authentication**. 

   > **Note:** If you are using IIS7 or greater and do not see this option, the option will need to be added through the server roles (webserver). IIS may give an alert about using both challenge and redirect-based authentication, which you can ignore.)

1. Open Windows Explorer.

1. Navigate to the **winauthwebservices** folder.

1. Give **read access** to the **winauthwebservices** folder to the domain users and groups that will be using IWA to access the webservices.

## Example

### Overview

The SOAP web service URL for IWA is `<Secret Server URL>/winauthwebservices/sswinauthwebservice.asmx`.

The method below uses the `SecretServerGetSecret.ps1` PowerShell script to  make the SecretGet WebService call, exposing it through the `SecretServer.pm` Perl package. The `Sample.pl` file uses the `SecretServer.pm` package to retrieve specific fields from the result.

The flow is as follows:

1. Your Perl script (`sample.pl`) makes a request to the `SecretServer.pm` package.
1. The `SecretServer.pm`package passes the request on to the `SecretServerGetSecret.ps1` PowerShell script.
1. The `SecretServerGetSecret.ps1` PowerShell script calls the Secret Server web services and authenticates using the service account that `sample.pl` is running under.
1. The results are passed back to `SecretServer.pm` and then on to your Perl script (`Sample.pl`)

Create the following three files:

### SecretServerGetSecret.ps1

```powershell
# Sample Powershell Script
# demonstrating retrieval of a Secret from Secret Server
# via web service protected by Windows Authentication 
# returned as Xml

$where = $args[0]
$secretId = $args[1]
$ws = New-WebServiceProxy -uri $where -UseDefaultCredential
$wsResult = $ws.GetSecret($secretId)
$res = convertto-xml $wsResult.Secret -As string -Depth 20
$res
```
### SecretServer.pm:

```perl
package SecretServer;
use strict;

sub usage {    
    print "\nUsage: GetSecret [webservice url] [secretid]\n";
}

sub new {    
    my($class, %args) = @_;
    my $self = bless({}, $class);
    return($self);
}

sub get_secret {
        
    my($self, $url, $secretid) = @_;
    my $result = `powershell.exe .\\SecretServerGetSecret.ps1 $url $secretid`;
    return($result);
}

sub get_field_from_result {
        
    my($self, $result, $field) = @_;
    $result =~/<Property Name="Value" Type="System.String">([^<>]+)<\/Property>(?:\s*<Property Name="(?!FieldName)[^"]+"[^>]+>[^<]+<\/Property>\s*)*<Property Name="FieldName"[^<>]+>$field<\/Property>/gsi;
    
    return("$1");
}
1;

# this is if you want to execute the Get Secret call manually from the command line
# if (@ARGV != 2)
# {
  # usage();  # Call subroutine usage()
  # exit();   # When usage() has completed execution,
            # # exit the program.
# }

# my $url = $ARGV[0];
# my $secretid = $ARGV[1];
# my $result = `powershell.exe .\\SecretServerGetSecret.ps1 $url $secretid`;

# print $result;
```
### Sample.pl

```perl
use lib 'C:/<Path to the SecretServer.pm file>';
use SecretServer;

my $x = SecretServer->new();

#Change this value to match your URL
my $url = 'http://<Your Secret Server Url>/winauthwebservices/sswinauthwebservice.asmx';

#Change this value to match your desired Secret Id
my $secretid = 17; 

my $result = $x->get_secret($url, $secretid);
my $username = $x->get_field_from_result($result, 'UserName');
my $password = $x->get_field_from_result($result, 'Password');
print "$username : $password";


```