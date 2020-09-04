[title]: # (Secret Server Cloud Architecture)
[tags]: # (Secret Server Cloud, Architecture)
[priority]: # (1000)

# Secret Server Cloud Architecture

## Hybrid Multi-Tenant Example Architecture 

### Diagram

**Figure:** Secret Server Cloud Hybrid Multi-Tenant Example Architecture

![image-20200522120219066](images/image-20200522120219066.png)

> **Note:** Arrows indicate the direction of initial connection.

### Details

#### 1: Service Buses

IP Address whitelisting is not necessary unless outbound firewall rules are in place. If IP whitelisting is necessary, please open a ticket with [Thycotic Support](../../support/index.md) to use your customer-specific service bus host names.

#### 2: Web Application Firewall (WAF)

IP Address whitelisting is not necessary unless outbound firewall rules are in place. Public IP is based on geographical location.

IP addresses for all regions: 45.60.38.37, 45.60.40.37, 45.60.32.37, 45.60.34.37, 45.60.36.37, 45.60.104.37

#### 3: Content Delivery Network (CDN)

IP Address whitelisting is not necessary unless outbound firewall rules are in place. Public IP is based on geographical location.

Edge nodes for all regions: https://docs.microsoft.com/rest/api/cdn/edgenodes/list (type=Standard_Verizon)

#### 4: RADIUS

Inbound whitelisting is necessary if RADIUS authentication is configured. Port 1812 needs to be open for inbound connection on the RADIUS server. The RADIUS server could either be publicly accessible or have port forwarding configured for Secret Server Cloud to be able to reach it. IP addresses:

- secretservercloud.com: 40.76.197.147, 40.121.181.52

- secretservercloud.com.au: 20.36.47.199, 20.36.45.106

- secretservercloud.eu: 51.4.141.94, 51.4.194.120

- secretservercloud.com.sg: 137.116.141.200, 137.116.143.17

#### 5: Distributed Engine (DE)

If external clients must be able to connect to internal SSH or RDP endpoints, an SSH proxy can be configured on the DE. Additionally, TCP port 22 needs to be open for inbound connections on the DE server, as well as appropriate configuration to allow inbound connections from the public Internet.

#### 6: Certificate CRLs

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

- `http://crl.usertrust.com/USERTrustRSACertificationAuthority.crl` (Web server)
- `http://mscrl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%202.crl` (service bus)
- `http://crl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%202.crl` (service bus)

## Distributed Engine Example Architecture

### Diagram

**Figure:** Secret Server Cloud Distributed Engine Example Architecture

![image-20200904111444011](images/image-20200904111444011.png)

>**Note:** This design is fully supported by Thycotic.

> **Note:** Arrows indicate the direction of initial connection.

> **Note:** Reference architecture requirements:
>
> - Ports for accessing, managing and discovering end-points must have the required ports opened between the site DEs the appropriate devices. Please see [Ports Used by Secret Server](../../networking/secret-server-ports/index.md).
> - All DE servers must run on Windows Server 2008R2 to Windows Server 2019.
> - Distributed Engines servers must have 4 cores and 4 GB RAM. We encourage increasing CPUs before RAM to improve DE efficiency.

> **Note:** Your first distributed engines will likely be located in the primary datacenter and will
> serve as the management zone for all other locations and domains. This includes:
>
> - AD synchronization
> - Account discovery
> - Password changing and heartbeats
> - SSH and RDP proxy
> - Session recording

### Details

#### 1: Service Buses

IP Address whitelisting is not necessary unless outbound firewall rules are in place. If IP whitelisting is necessary, please open a ticket with Thycotic Support for your customer-specific service bus hostnames

#### 2: Web Application Firewall (WAF)

IP Address whitelisting is not necessary unless outbound firewall rules are in place. Public IP is based on geographical location.
IP addresses for all regions: 45.60.38.37, 45.60.40.37, 45.60.32.37, 45.60.34.37, 45.60.36.37, and 45.60.104.37.

#### 3: Content Delivery Network (CDN)

IP Address whitelisting is not necessary unless outbound firewall rules are in place. Public IP is based on geographical location.
Edge nodes for all regions: [Microsoft Edge Node List](https://docs.microsoft.com/en-us/rest/api/cdn/edgenodes/list).

#### 4: RADIUS

Inbound whitelisting is necessary if RADIUS authentication is configured. Port 1812 needs to be open for inbound connection on the RADIUS server. The RADIUS server could either be publicly accessible or have port forwarding configured for Secret Server Cloud to be able to reach it. IP addresses:

- secretservercloud.com: 40.76.197.147, 40.121.181.52
- secretservercloud.com.au: 20.36.47.199, 20.36.45.106
- secretservercloud.eu: 51.4.141.94, 51.4.194.120
- secretservercloud.com.sg: 137.116.141.200, 137.116.143.17

#### 5: Distributed Engine (DE)

If external clients must be able to connect to internal SSH or RDP endpoints, an SSH proxy can be configured on the DE. Additionally, TCP port 22 needs to be open for inbound connections on the DE server, as well as
be configured to allow inbound connections from the public Internet.

##### 6: Certificate CRLs

Whitelisting is not necessary unless outbound firewall rules are in place. If whitelisting is necessary, access to CRL distribution points is necessary too.

secretservercloud.com:

- `http://crl.usertrust.com/USERTrustRSACertificationAuthority.crl`(Web server)
- `http://mscrl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%205.crl` (service bus)
- `http://crl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%205.crl` (service bus)

secretservercloud.com.au:

- `http://crl.comodoca.com/COMODORSADomainValidationSecureServerCA.crl` (Web server)
- `http://mscrl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%204.crl `(service bus)
- `http://crl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%204.crl` (service bus)

secretservercloud.eu:

- `http://crl.comodoca.com/COMODORSADomainValidationSecureServerCA.crl` (Web server)
- `ldap://directory.d-trust.net/CN=D-TRUST%20SSL%20Class%203%20CA%201%202009,O=DTrust%20GmbH,C=DE?certificaterevocationlist` (service bus)
- `http://crl.d-trust.net/crl/d-trust_ssl_class_3_ca_1_2009.der.crl` (service bus)
- `http://cdn.d-trust-cloudcrl.net/crl/d-trust_ssl_class_3_ca_1_2009.crl` (service bus)

secretservercloud.com.sg:

- `http://crl.usertrust.com/USERTrustRSACertificationAuthority.crl` (Web server)
- `http://mscrl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%202.crl` (service bus)
- `http://crl.microsoft.com/pki/mscorp/crl/Microsoft%20IT%20TLS%20CA%202.crl` (service bus)