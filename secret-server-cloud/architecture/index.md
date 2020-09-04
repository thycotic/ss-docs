[title]: # "Secret Server Cloud Architecture"
[tags]: # "Secret Server Cloud, Architecture"
[priority]: # "1000"

# Secret Server Cloud Architecture

## Generic  Hybrid Configuration

**Figure:** Secret Server Cloud Hybrid Multi-Tenant Architecture

![image-20200522120219066](images/image-20200522120219066.png)

> **Note:** Arrows indicate the direction of initial connection.

## Details

### 1: Service Buses

IP Address whitelisting is not necessary unless outbound firewall rules are in place. If IP whitelisting is necessary, Azure data center public IPs can be downloaded here:

- secretservercloud.com: https://www.microsoft.com/en-us/download/details.aspx?id=56519 (id = ServiceBus.EastUS)

- secretservercloud.com.au: https://www.microsoft.com/en-us/download/details.aspx?id=56519 (id = ServiceBus.AustraliaCentral)

- secretservercloud.eu: https://www.microsoft.com/en-us/download/details.aspx?id=57064 (id = ServiceBus.GermanyCentral)

- secretservercloud.com.sg: https://www.microsoft.com/en-us/download/details.aspx?id=56519 (id = ServiceBus.SoutheastAsia)

If you wish to restrict outbound traffic, Thycotic Support can provide you with your customer-specific service bus hostnames.

### 2: Web Application Firewall (WAF)

IP Address whitelisting is not necessary unless outbound firewall rules are in place. Public IP is based on geographical location.

IP addresses for all regions: 45.60.38.37, 45.60.40.37, 45.60.32.37, 45.60.34.37, 45.60.36.37, 45.60.104.37

### 3: Content Delivery Network (CDN)

IP Address whitelisting is not necessary unless outbound firewall rules are in place. Public IP is based on geographical location.

Edge nodes for all regions: https://docs.microsoft.com/rest/api/cdn/edgenodes/list (type=Standard_Verizon)

### 4: RADIUS

Inbound whitelisting is necessary if RADIUS authentication is configured. Port 1812 needs to be open for inbound connection on the RADIUS server. The RADIUS server could either be publicly accessible or have port forwarding configured for Secret Server Cloud to be able to reach it. IP addresses:

- secretservercloud.com: 40.76.197.147, 40.121.181.52

- secretservercloud.com.au: 20.36.47.199, 20.36.45.106

- secretservercloud.eu: 51.4.141.94, 51.4.194.120

- secretservercloud.com.sg: 137.116.141.200, 137.116.143.17

### 5: Distributed Engine (DE)

If external clients must be able to connect to internal SSH or RDP endpoints, an SSH proxy can be configured on the DE. Additionally, TCP port 22 needs to be open for inbound connections on the DE server, as well as appropriate configuration to allow inbound connections from the public Internet.

### 6: Certificate CRLs

Whitelisting is not necessary unless outbound firewall rules are in place. If whitelisting is necessary, access to CRL distribution points is necessary.

secretservercloud.com:

- `http://crl.usertrust.com/USERTrustRSACertificationAuthority.crl` (Web server)

- `http://mscrl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%205.crl` (service bus)

- `http://crl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%205.crl` (service bus)

secretservercloud.com.au:

- `http://crl.comodoca.com/COMODORSADomainValidationSecureServerCA.crl` (Web server)

- `http://mscrl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%204.crl` (service bus)

- `http://crl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%204.crl` (service bus)

secretservercloud.eu:

- `http://crl.comodoca.com/COMODORSADomainValidationSecureServerCA.crl` (Web server)

- `ldap://directory.d-trust.net/CN=D-TRUST%20SSL%20Class%203%20CA%201%202009,O=DTrust%20GmbH,C=DE?certificaterevocationlist` (service bus)

- `http://crl.d-trust.net/crl/d-trust_ssl_class_3_ca_1_2009.der.crl` (service bus)

- `http://cdn.d-trust-cloudcrl.net/crl/d-trust_ssl_class_3_ca_1_2009.crl` (service bus)

 secretservercloud.com.sg:

- http://crl.usertrust.com/USERTrustRSACertificationAuthority.crl (Web server)
- `http://mscrl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%202.crl` (service bus)
- `http://crl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%202.crl` (service bus)

## 