[title]: # (Perl Example Code for SOAP)
[tags]: # (SOAP API,API,Scripting,Perl)
[priority]: # (1000)

# Perl Example Code for SOAP

## Overview

Secret Server webservices can be called using scripts. This example demonstrates how to authenticate and retrieve secrets programmatically in Perl using SOAP. There are also [PHP](../soap-php-example-code/index.md) and [C#](../soap-C#-example-code/index.md) versions. 

This is a working example for Secret Server Online. A test user has been filled in and OrganizationCode passed in. The test user has  been restricted to only viewing secrets. If connecting to an installed instance, change the web reference URL to match your site and pass in an empty string for organizationCode. 

For instructions with using Perl and Integrated Windows Authentication see: http://support.thycotic.com/KB/a180/using-web-services-with-windows-authentication-perl.aspx 

This example runs using standard Perl libraries. We used Strawberry Perl 5.10.1.1.

## Code

```perl
use LWP::UserAgent; 
use HTTP::Request; 
use XML::Parser;

# Update these values to match your user settings and instance URL. This example will work against Secret Server Online.
my $username = "ThycoticTest";
my $password= "passwordt";
my $organizationCode= "RT9R"; # Can be left blank for Secret Server Installed (on-premise) edition
my $domain = ""; # Only needed for AD login
my $WebServiceUrl = "https://www.secretserveronline.com/webservices/SSWebService.asmx"; # Or URL to your server and to the SSWebService.asmx file

# The main script calls
my $authtoken = GetToken($username ,$password,$organizationCode,$domain);
my $secretInXML = GetSecretLegacy($authtoken, "88395");
print $secretInXML;

# 1) Authentication Token
sub GetToken()
{
	my($username, $password, $organizationCode, $domain) = @_;
	my $url = $WebServiceUrl."/Authenticate?username=$username&password=$password&organization=$organizationCode&domain=$domain"; 
	my $response = WSRequest($url);
	my $token = "";
	if ($response->is_success){ 
		my $tokenXML = $response->content; 
		if ($tokenXML =~ m/<Token>(.+)<\/Token>/)
		{
			$token = $1;
		}
		if($token eq "")
		{
			die "Login failed";
		}
	} else {
		print $response->content; 
	}
	return $token;
}

# 2) Load a Secret
# Note: The SecretId can be found by going to the SecretView page and in the QueryString will be SecretId=#
sub GetSecretLegacy()
{
	my($token, $secretId) = @_;
	my $url = $WebServiceUrl."/GetSecretLegacy?token=". $token . "&secretId=" . $secretId; 
	my $response = WSRequest($url);
	my $secret;
	if ($response->is_success){ 
		$secret = $response->content; 
	}
	return $secret;
}

sub WSRequest()
{
	my($url) = @_;
	my $agent = LWP::UserAgent->new(env_proxy => 1,keep_alive => 1, timeout => 30); 
	my $header = HTTP::Request->new(GET => $url); 
	my $request = HTTP::Request->new('GET', $url, $header); 
	my $response = $agent->request($request);
	return $response;
}
```

