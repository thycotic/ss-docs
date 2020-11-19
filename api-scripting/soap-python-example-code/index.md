[title]: # "Ruby Example Code for SOAP"
[tags]: # "SOAP API,API,Scripting,Ruby"
[priority]: # "1000"

# Ruby Example Code for SOAP

## Overview

Secret Server webservices can be called using scripts. This example demonstrates how to authenticate and retrieve secrets programmatically in Ruby using SOAP. There are also [Perl](../soap-perl-example-code/index.md) and [C#](../soap-C#-example-code/index.md) versions.

> **Note:** Webservices can be enabled at the Administration \> Configuration general tab. Enabling Webservices simply makes the [ASP.NET](http://asp.net/) SOAP and REST Webservices built into Secret Server available.

This is an example of getting a secret and updating its Name using Ruby.  XML (using Nokogiri) is used to construct the secret update call.  To run, save the two files as ss.rb and test.rb in the same directory, fill in the URL to your Secret Server in test.rb and specify a username/password, then run test.rb.

## Code

### ss.rb File

````ruby
require 'savon'
require 'nokogiri'

class SecretServer

  def initialize(wsdl, ssl_verify_mode, ssl_version)
    @@wsdl=wsdl
    @@ssl_verify_mode=ssl_verify_mode
    @@ssl_version=ssl_version
    client = Savon.client(wsdl: @@wsdl, ssl_verify_mode: :none, ssl_version: :TLSv1)
  end

  def Authenticate(username, password, domain)
    client = Savon.client(wsdl: @@wsdl, ssl_verify_mode: :none, ssl_version: :TLSv1)

    response = client.call(:authenticate, message: {
      username: username,
      password: password,
      organization: "",
      domain: domain 
    })

    @@token = response.to_hash[:authenticate_response][:authenticate_result][:token]

    return @@token
  end

  def GetTokenIsValid
    client = Savon.client(wsdl: @@wsdl, ssl_verify_mode: :none, ssl_version: :TLSv1)
    response = client.call(:get_token_is_valid, message: {
      token: @@token
    })

    return response
  end

  def GetSecret(secretId)
	thesame = lambda { |key| key }	
    
    client = Savon.client(wsdl: @@wsdl, ssl_verify_mode: :none, ssl_version: :TLSv1, convert_request_keys_to: :none) #, convert_response_tags_to: thesame)
    response = client.call(:get_secret, message: {
      token: @@token,
      secretId: secretId,
    })
    return response.to_xml
  end

  def UpdateSecret(secret)
    client = Savon.client(wsdl: @@wsdl, ssl_verify_mode: :none, ssl_version: :TLSv1)
	# Nokogiri is stripping the 'xsi' prefix which is required, and it also puts a 'default' prefix in, which is disallowed.
	fixedXml = secret.to_s.gsub! 'nil=', 'xsi:nil='
	fixedXml = fixedXml.gsub! 'default:',''

    response = client.call(:update_secret, xml: fixedXml)
    return response
  end  

  def WhoAmI
    client = Savon.client(wsdl: @@wsdl, ssl_verify_mode: :none, ssl_version: :TLSv1)
    response = client.call(:who_am_i, message: {
      token: @@token
    })
    return response
  end

  def VersionGet
    client = Savon.client(wsdl: @@wsdl, ssl_verify_mode: :none, ssl_version: :TLSv1)
    response = client.call(:version_get, message: {
      token: @@token
    })
    return response
  end

end
````

### test.rb File

````ruby
require './ss'

ss = SecretServer.new('https://your_secret_server_url/webservices/SSWebService.asmx?WSDL';, ':none', ':TLSv1')
username = ""
password = ""
domain = ""
secretId = 20

puts " "

puts "### Authenticate ###"
token = ss.Authenticate(username, password, domain)
puts token
puts " "

puts "### GetSecret ###"
secretResult = ss.GetSecret(secretId)
puts secretResult
puts " "

# Convert the result to a Nokogiri xml document.
@doc = Nokogiri::XML::Document.parse(secretResult)
namespaces = @doc.collect_namespaces
ns = Hash.new
namespaces.each_pair do |key, value|
  ns[key.sub(/^xmlns:/, '')] = value
end

# Get the Secret by xpath and set the secret name to 'My New Secret Name'
secretNode = @doc.at_xpath('/soap:Envelope/soap:Body/xmlns:GetSecretResponse/xmlns:GetSecretResult/xmlns:Secret', ns)
nameNode = secretNode.at_xpath('//xmlns:Name', ns)
nameNode.content = "My New Secret111 Name"

# Build the soap envelope for posting to UpdateSecret and set the token and secret
puts "### UpdateSecret ###"
updateSoapPackage = '<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"" xmlns:xsd="http://www.w3.org/2001/XMLSchema"" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">;
  <soap:Body>
    <UpdateSecret xmlns="urn:thesecretserver.com">    
		<token></token>
		<secret></secret>
	</UpdateSecret>
  </soap:Body>
</soap:Envelope>'
@updateDoc = Nokogiri::XML::Document.parse(updateSoapPackage)
@updateDoc.at_xpath('//*[name() = \'token\']').content = token
@updateDoc.at_xpath('//*[name() = \'secret\']').add_child(secretNode.children())
ss.UpdateSecret(@updateDoc)

puts '-> Finished'
````

