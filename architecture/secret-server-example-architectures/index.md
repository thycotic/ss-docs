[title]: # "Secret Server Example Architectures"
[tags]: # "Secret Server, Architecture"
[priority]: # "1000"

# Secret Server Example Architectures

> **Note:** If you are a current customer with support hours for Thycotic Professional Services, you can discuss any of these diagrams in detail with one of our Services Solutions Architects.

## Minimal Single-Site Enterprise Deployment

### Overview

- Single-site minimum-cost HA configuration.

- No shared storage requirement.

- RabbitMQ Installed on SS Web servers (typically in a cluster on a primary + secondary node).

- Single-site design with no native DR capacity. DR can be provided by VM replication if subnets are spanning locations, otherwise re-IP + DNS changes may be necessary.

### Requirements

#### General

- SQL Standard Edition: Basic availability group configuration local load balancers can be used for all Web server nodes.

- Configuring a file share witness for SQL quorum voting is required for SQL to stay online during single node unplanned failures.

- [Distributed Engine Ports](https://thycotic.force.com/support/s/article/Ports-used-by-Secret-Server).

- [SQL Quorum Ports](http://dsfnet.blogspot.com/2013/04/windows-server-clustering-sql-server.html).

#### Virtual IP or Computer

- ss.company.com: 443 (load balancer)

- ss.company.com: 5671 or 5672 (load balancer)

- ss-aoag.company.com: 1433 (created as part of SQL AlwaysOn configuration). Computer object or virtual IP.

- Windows Failover Cluster Object (created as part of Windows failover clustering configuration):

  - Computer object or virtual IP

  - One additional virtual IP address may be required as part of Windows failover cluster for single-site design for the network configuration of the failover cluster.

### Diagram

> **Note:** The reference number for this diagram is A1.

**Figure:** Minimal Single-Site Enterprise Deployment

![image-20200922112805644](images/image-20200922112805644.png)

## Average Single-Site Enterprise Deployment

### Overview

- Single-site minimum-cost HA configuration.

- No shared storage requirement.

- RabbitMQ Installed on separate, dedicated servers.

- Single-site design with no native DR capacity. DR can be provided by VM replication if subnets are spanning locations, otherwise re-IP + DNS changes may be necessary.

### Requirements

#### General

- SQL Standard Edition: Basic availability group configuration local load balancers can be used for all Web server nodes.

- Configuring a file share witness for SQL quorum voting is required for SQL to stay online during single node unplanned failures.

- [Distributed Engine Ports](https://thycotic.force.com/support/s/article/Ports-used-by-Secret-Server).

- [SQL Quorum Ports](http://dsfnet.blogspot.com/2013/04/windows-server-clustering-sql-server.html).


#### Virtual IP or Computer

- ss.company.com: 443 (load balancer)

- ss.company.com: 5671 or 5672 (load balancer)

- ss-aoag.company.com: 1433 (created as part of SQL AlwaysOn configuration). Computer object or virtual IP.

- Windows Failover Cluster Object (created as part of Windows failover clustering configuration):

  - Computer object or virtual IP

  - One additional virtual IP address may be required as part of Windows failover cluster for single-site design for the network configuration of the failover cluster.

### Diagram

> **Note:** The reference number for this diagram is A2.

**Figure:** Average Single-Site Enterprise Deployment![image-20200922113746702](images/image-20200922113746702.png)

## Minimal Multi-Site Enterprise Deployment

### Overview

- Minimum cost HA/DR configuration

- No shared storage requirement

- Lower infrastructure footprint for DR

- RabbitMQ installed on Secret Server Web servers

- DR site acts as temporary site only with no intention for long-term usage or becoming primary site.

- No secondary SQL node at primary site for "planned" Failover. Secondary SQL node in DR site for planned or unplanned failover.

- Uses single RabbitMQ site connector design.

- Can accommodate automatic failover with synchronous replication (30 ms or less latency between SQL DB nodes).

- Global load balancers for Web and RMQ configurations are configured to force all traffic to primary site unless primary site is down (priority group activation)

### Requirements

#### General

- SQL Standard Edition (basic availability group configuration).

- If no global load balancers exist due to costs or infrastructure missing, local load balancers can be used for all Web server nodes, but DNS change may be required if primary location goes offline.

- Configuring a file share witness for SQL quorum voting is required for SQL to stay online during single-node unplanned failures. A cloud witness is recommended. 

- [Distributed Engine Ports](https://thycotic.force.com/support/s/article/Ports-used-by-Secret-Server).

- [SQL Quorum Ports](http://dsfnet.blogspot.com/2013/04/windows-server-clustering-sql-server.html).

#### Virtual IP or Computer

- ss.company.com: 443 (load balancer).

- rmq.company.com: 5671 or 5672 (two virtual IPs, global load balancer). 

- ss-a.company.com: 443. 

- ss-b.company.com: 443 (two virtual IPs, local load balancer) 

- rmq-a.company.com: 5671 or 5672 (load balancer).

- rmq-b.company.com: 5671 or 5672 (two virtual IPs, local load balancer).

- ss-aoag.company.com: 1433 (created as part of SQL AlwaysOn configuration):


  - ss-aoag.company.com computer object/virtual IP.
  - Two virtual IP addresses may be required as part of this configuration .

- Windows failover cluster object (created as part of Windows failover clustering configuration):

  - Computer object/virtual IP.

  - Two additional virtual IP addresses may be required as part of Windows failover cluster for single site design for the network configuration of the failover cluster representing both networks at each respective site.

### Diagram

> **Note:** The reference number for this diagram is B1.

**Figure:** Minimal Multi-Site Enterprise Deployment 

![image-20200923082534021](images/image-20200923082534021.png)

## Average Multi-Site Enterprise Deployment

### Overview

- Minimum cost HA/DR configuration with no shared storage requirement, resulting in a smaller infrastructure footprint for DR.

- No shared storage requirement

- Lower infrastructure footprint for DR

- RabbitMQ installed on Secret Server Web servers

- DR site acts at temporary site only with no intention for long-term usage or becoming primary site.

- No secondary SQL node at primary site for "planned" Failover. Secondary SQL node in DR site for planned or unplanned failover.

- Multiple site connector design intended for RabbitMQ. All distributed engines communicate to one local load balancer/RMQ cluster for its response bus. There is two site connectors, one for each respective location. 

- Global load balancers are unavailable, thus requiring a manual failover process/DNS change for Web traffic to the DR site. Additional application specific changes will be needed for full functionality to resume in DR site:

  - Change the internal site connector to the DR site connector.

  - Change the response bus to the DR site connector.

- Design assumes the Web server in the DR location is joined to the cluster and is online so that work is also being generated from Web servers in the DR location. If server is online and has roles configured, cross-data-center RabbitMQ communication may occur. Work may be generated at either location's Web servers and is placed on either site connector, based on how secrets are configured.

### Requirements

#### General

- SQL Enterprise Edition.

- DNS change may be required if primary location off offline.

- Configuring a file share witness for SQL quorum voting is required for SQL to stay online during single-node unplanned failures. A cloud witness is recommended. 

- [Distributed Engine Ports](https://thycotic.force.com/support/s/article/Ports-used-by-Secret-Server).

- [SQL Quorum Ports](http://dsfnet.blogspot.com/2013/04/windows-server-clustering-sql-server.html).

#### Virtual IP or Computer

- ss.company.com: 443 (load balancer).

- rmq.company.com: 5671 or 5672 (two virtual IPs, global load balancer). 

- ss-a.company.com: 443. 

- ss-b.company.com: 443 (two virtual IPs, local load balancer) 

- rmq-a.company.com: 5671 or 5672 (load balancer).

- rmq-b.company.com: 5671 or 5672 (two virtual IPs, local load balancer).

- ss-aoag.company.com: 1433 (created as part of SQL AlwaysOn configuration). ss-aoag.company.com computer object/virtual IP.

- Windows failover cluster object (created as part of Windows failover clustering configuration):

  - Computer object/virtual IP.

  - One additional virtual IP addresses may be required as part of Windows failover cluster for single site design for the network configuration of the failover cluster.

### Diagram

**Note:** The reference number for this diagram is B2.

**Figure:** Average Multi-Site Enterprise Deployment

![image-20200922142635330](images/image-20200922142635330.png)

## Best Multi-Site Enterprise Deployment (C1)

### Overview

- Higher Cost HA/DR Configuration with no shared storage requirement. Smaller Infrastructure footprint for DR RabbitMQ clusters installed on dedicated systems.

- DR site acts as temporary site only when there is no intention of long-term use. Services in DR site being down can incur downtime.

- Secondary SQL node at primary site for planned failover "patching." Secondary SQL Node in DR Site for unplanned failover.

- Uses single RabbitMQ site connector design.

- Can accommodate automatic failover with synchronous replication (30 ms or less latency between SQL DB nodes).

- Global load balancers for Web and RMQ configurations are configured to force all traffic to go to primary site unless primary site is down (priority group activation).

### Requirements

#### General

- SQL Enterprise Edition.

- Global and local load balancers.

- Configuring a file share witness for SQL quorum voting is recommended. A cloud witness or DFSR share is recommended for witness configuration. Simultaneous failure of both SQL nodes in the primary location will still allow cluster to survive.

- [Distributed Engine Ports](https://thycotic.force.com/support/s/article/Ports-used-by-Secret-Server).

- [SQL Quorum Ports](http://dsfnet.blogspot.com/2013/04/windows-server-clustering-sql-server.html).

#### Virtual IP or Computer

- ss.company.com: 443 (load balancer).

- rmq.company.com: 5671 or 5672 (two virtual IPs, global load balancer). 

- ss-a.company.com: 443. 

- ss-b.company.com: 443 (two virtual IPs, local load balancer) 

- rmq-a.company.com: 5671 or 5672 (load balancer).

- rmq-b.company.com: 5671 or 5672 (Two virtual IPs, local load balancer).

- ss-aoag.company.com: 1433 (created as part of SQL AlwaysOn configuration):

  -  ss-aoag.company.com computer object/virtual IP.

  - Two virtual IP addresses may be required as part of this configuration.

- Windows failover cluster object (created as part of Windows failover clustering configuration):
  - Computer object/virtual IP.
  - Two additional virtual IP addresses may be required as part of Windows failover cluster for single site design for the network configuration of the failover cluster.

### Diagram

> **Note:** The reference number for this diagram is C1.

**Figure:** Best Multi-Site Enterprise Deployment (C1)

![image-20200922144819813](images/image-20200922144819813.png)

## Best Multi-Site Enterprise Deployment (C2)

### Overview

- Higher Cost HA/DR Configuration with no shared storage requirement. Smaller Infrastructure footprint for DR RabbitMQ clusters installed on dedicated systems.

- DR site acts as temporary site only when there is no intention of long-term use. Services in DR site being down can incur downtime.

- Secondary SQL node at primary site for planned failover "patching." Secondary SQL Node in DR Site for unplanned failover.

- Can accommodate manual failover only with asynchronous replication (30 ms or more latency between SQL DB nodes).

- Singular site connector using only the local site. The local site comes with two distributed engines now. The distributed engine layer can be online/active but cross-data-center communication may occur (as depicted). It can alternatively be marked as yellow as other layers. 

- Global load balancers are unavailable, thus requiring a manual failover process/DNS change for Web traffic to the DR site. Additional application specific changes will be needed for full functionality to resume in DR site:

  - Change the internal site connector to the DR site connector.

  - Change the response bus to the DR site connector.

- Design assumes the Web server in DR location is joined to the cluster but is shut down (marked in yellow) so that no work is being generated from the Web servers in the DR location. If server is online and has roles configured, cross-data-center RabbitMQ communication may occur. The RabbitMQ layer is also marked as yellow, indicative of the server being built/online but the RabbitMQ service shut down.

### Requirements

#### General

- SQL Enterprise Edition.

- DNS change may be required if primary location goes offline.

- Configuring a file share witness for SQL quorum voting is recommended. A cloud witness or DFSR share is recommended for witness configuration. Simultaneous failure of both SQL nodes in the primary location will still allow cluster to survive.

- [Distributed Engine Ports](https://thycotic.force.com/support/s/article/Ports-used-by-Secret-Server).

- [SQL Quorum Ports](http://dsfnet.blogspot.com/2013/04/windows-server-clustering-sql-server.html).

#### Virtual IP or Computer

- ss.company.com: 443 (load balancer).

- rmq.company.com: 5671 or 5672 (load balancer). 

- ss-aoag.company.com: 1433 (created as part of SQL AlwaysOn configuration). ss-aoag.company.com computer object/virtual IP.

- Windows failover cluster object (created as part of Windows failover clustering configuration):

  - Computer object/virtual IP.

  - One additional virtual IP addresses may be required as part of Windows failover cluster for single site design for the network configuration of the failover cluster.

### Diagram

> **Note:** The reference number for this diagram is C2.

**Figure:** Best Multi-Site Enterprise Deployment (C2)

![image-20200922150218977](images/image-20200922150218977.png)

## Best Multi-Site Enterprise Deployment (C3)

### Overview

- Higher cost HA/DR configuration with no shared storage requirement. Smaller Infrastructure footprint for DR RabbitMQ clusters installed on dedicated systems.

- DR site can act as permanent secondary site for long term use.

- DR site acts as temporary site only when there is no intention of long-term use. 

- Equivalent infrastructure at two sites.

- Secondary SQL node at primary site for planned failover "patching." Secondary SQL Node in DR Site for unplanned failover.

- Can accommodate manual failover only with asynchronous replication (30 ms or more latency between SQL DB nodes).

- Uses single RabbitMQ site connector design.

- Global load balancers for Web and RMQ configurations are configured to force all traffic to go to primary site unless primary site is down (priority group activation).

### Requirements

#### General

- SQL Enterprise Edition.

- Global and local load balancers.

- Configuring a file share witness for SQL quorum voting is recommended. A cloud witness or DFSR share is recommended for witness configuration. Simultaneous failure of both SQL nodes in the primary location will still allow cluster to survive.

- [Distributed Engine Ports](https://thycotic.force.com/support/s/article/Ports-used-by-Secret-Server).

- [SQL Quorum Ports](http://dsfnet.blogspot.com/2013/04/windows-server-clustering-sql-server.html).

#### Virtual IP or Computer

- ss.company.com: 443 (load balancer).

- rmq.company.com: 5671 or 5672 (two virtual IPs, global load balancer). 

- ss-a.company.com: 443. 

- ss-b.company.com: 443 (two virtual IPs, local load balancer) 

- rmq-a.company.com: 5671 or 5672 (load balancer).

- rmq-b.company.com: 5671 or 5672 (Two virtual IPs, local load balancer).

- ss-aoag.company.com: 1433 (created as part of SQL AlwaysOn configuration):

  -  ss-aoag.company.com computer object/virtual IP.

  - Two virtual IP addresses may be required as part of this configuration.

- Windows failover cluster object (created as part of Windows failover clustering configuration):

  - Computer object/virtual IP.

  - Two additional virtual IP addresses may be required as part of Windows failover cluster for single site design for the network configuration of the failover cluster.

### Diagram

> **Note:** The reference number for this diagram is C3.

**Figure:** Best Multi-Site Enterprise Deployment (C3)

![image-20200922151502292](images/image-20200922151502292.png)
