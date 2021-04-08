[title]: # (SSC Customer Example Architectures)
[tags]: # (Secret Server Cloud, Architecture,example)
[priority]: # (1000)

# Secret Server Cloud Customer Example Architectures

> **Note:** If you are a current customer with support hours for Thycotic Professional Services, you can discuss any of these diagrams in detail with one of our Professional Services support architects.

## Multi-Site with ASR Agents Example Architecture

**Figure:** Multi-site with ASR Agents Example Architecture

![image-20210405162451314](images/image-20210405162451314.png)

>**Note:** This design is fully supported by Thycotic.

> **Note:** Arrows indicate the direction of initial connection.

> **Note:** Reference architecture requirements:
>
> - Ports for accessing, managing and discovering end-points must have the required ports opened between the site DEs the appropriate devices. Please see [Ports Used by Secret Server](../../networking/secret-server-ports/index.md).
> - All DE servers must run on Windows Server 2012 to 2019.
> - Distributed Engines servers must have 4 cores and 4 GB RAM. We encourage increasing CPUs before RAM to improve DE efficiency.

> **Note:** Your first distributed engines will likely be located in the primary datacenter and will
> serve as the management zone for all other locations and domains. This includes:
>
> - AD synchronization
> - Account discovery
> - Password changing and heartbeats
> - SSH and RDP proxy
> - Session recording

## Details for All Architectures

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

- Inbound allowlisting is necessary if RADIUS authentication is configured. IP addresses:

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
