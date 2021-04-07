[title]: # (Secret Server Cloud Architecture)
[tags]: # (Secret Server Cloud, Architecture)
[priority]: # (1000)

# Secret Server Cloud Architecture

> **Note:** If you are a current customer with support hours for Thycotic Professional Services, you can discuss any of these diagrams in detail with one of our Professional Services support architects.

> **Note:**  This, the standard SSC architecture, is "hybrid multi-tenant" because only the front-end is multi-tenant—it is shared with other customers. The databases, service busses, and storage accounts are single-tenant (dedicated to you).

## Diagram

**Figure:** Secret Server Cloud Architecture

![image-20210405132742976](images/image-20210405132742976.png)

> **Note:** Arrows indicate the direction of initial connection.

## Details

### 1: Service Buses

IP Address allowlisting is not necessary unless outbound firewall rules are in place. If IP allowlisting is necessary, please contact [Thycotic Support](../../support/index.md) to obtain the shared engine response service bus and your dedicated customer service bus hostnames.  The TCP port requirement is based on the transport type configured in the distributed engine settings.  The default is Web sockets, which requires TCP 443. If the AMQP option is selected within the application, TCP 5671/5672 ports are also required.

### 2: Web Application Firewall (WAF)

IP Address allowlisting is not necessary unless outbound firewall rules are in place. Generally, the public IP the hostname resolves to is based on geographical location of the request source. All IPs below should be allowlisted to ensure uninterrupted connectivity.

All regions: 

- 45.60.32.37
- 45.60.34.37
- 45.60.36.37
- 45.60.38.37
- 45.60.40.37
- 45.60.104.37

### 3: RADIUS

Inbound allowlisting is necessary if RADIUS authentication is configured. IP addresses:

- secretservercloud.com: 
  - 52.160.67.38
  - 52.160.67.39
  - 52.224.253.4
  - 52.224.253.7
- secretservercloud.com.au: 
  - 20.37.251.37
  - 20.37.251.120
  - 20.53.142.34
  - 20.53.142.37
- secretservercloud.eu: 
  - 20.50.180.187
  - 20.50.180.242
  - 20.79.65.3
  - 20.79.64.213
- secretservercloud.com.sg: 
  - 20.195.97.220
  - 20.195.98.154
  - 65.52.160.251
  - 65.52.165.108
- secretservercloud.ca:
  - 52.228.113.119
  - 52.228.117.246
  - 52.229.119.89
  - 52.229.119.193

### 4: Distributed Engine (DE)

If external clients must be able to connect to internal SSH or RDP endpoints, an SSH proxy can be configured on the DE. Additionally, TCP port 22 needs to be open for inbound connections on the DE server, as well as have an appropriate configuration to allow inbound connections from the public Internet.

### 5: Certificate CRLs

Allowlisting is not necessary unless outbound firewall rules are in place. If it is necessary, access to CRLs or OSCP endpoints may be required. CRL and OSCP endpoints may differ from customer to customer. To determine the endpoints, review the certificates presented by the:

- Web application firewall
- Customer service bus
- Engine response service bus
- CDN for DE updates

>**Note:** Obtaining and reviewing certificates is not within the scope of this document, but you can find resources online, such as [OCSP & CRL and Revoked SSL Certificates](https://www.digicert.com/kb/util/utility-test-ocsp-and-crl-access-from-a-server.htm), which is not owned or maintained by Thycotic.


