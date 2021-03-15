[title]: # (SSC IP Change for March to May 2021)
[tags]: # (Upgrade, IP change, secret server cloud)
[priority]: # (1000)

# Secret Server Cloud IP Address Change for March to May 2021

## Overview

Thycotic is making infrastructure upgrades to Secret Server Cloud (SSC) over the next few weeks. As part of this work, the IP addresses for SSC will change. Your SSC subdomain will not change.

You may need to modify your inbound or outbound firewall configurations to maintain uninterrupted service.

## Who Is Affected?

Customers using inbound or outbound firewall rules to control traffic to and from SSC are affected.

Inbound firewall rules are necessary for customers using RADIUS authentication.
Outbound firewall rules are optional. If that applies, you may need to adjust the IP allow lists to reflect changes in the SS service bus infrastructure. We are changing the hostnames for shared engine response buses. The hostname for your dedicated customer service bus will not change.

## What Do I Need to Change?

The information below provides the updated IP addresses for inbound rules and the updates hostnames for outbound rules. The date of the change is different depending on the Thycotic cloud region hosting your SSC instance. We provide details for each region individually. 

The US and EU regions have two dates listed for changes because the upgrade work will be performed over two days. We advise that you make any necessary changes before the earlier date.

### Australia

For all customers using a domain ending in secretservercloud.com.au:

- New IP addresses for inbound RADIUS connections: 20.37.251.37, 20.37.251.120
- New hostnames for outbound service bus connections:
    - thycotic-ssc-au-er-sb-01-prod-b.servicebus.windows.net (primary)
    - thycotic-ssc-au-er-sb-01-prod-g.servicebus.windows.net (primary)
    - thycotic-ssc-au-er-sb-02-prod-b.servicebus.windows.net (dr)
    - thycotic-ssc-au-er-sb-02-prod-g.servicebus.windows.net (dr)
- Change date: 10 April 2021

### Canada

For all customers using a domain secretservercloud.ca:

- New IP addresses for inbound RADIUS connections: 52.228.117.246, 52.228.113.119
- New hostnames for outbound service bus connections:
    - thycotic-ssc-ca-er-sb-01-prod-b.servicebus.windows.net (primary)
    - thycotic-ssc-ca-er-sb-01-prod-g.servicebus.windows.net (primary)
    - thycotic-ssc-ca-er-sb-02-prod-b.servicebus.windows.net (dr)
    - thycotic-ssc-ca-er-sb-02-prod-g.servicebus.windows.net (dr)
- Change dates: 3 April 2021

### European Union

For all customers using a domain ending in secretservercloud.eu:

- New IP addresses for inbound RADIUS connections: 20.79.64.213, 20.79.65.3
- New hostnames for outbound service bus connections:
    - thycotic-ssc-eu-er-sb-01-prod-b.servicebus.windows.net (primary)
    - thycotic-ssc-eu-er-sb-01-prod-g.servicebus.windows.net (primary)
    - thycotic-ssc-eu-er-sb-02-prod-b.servicebus.windows.net (dr)
    - thycotic-ssc-eu-er-sb-02-prod-g.servicebus.windows.net (dr)
- Change dates: 24 April 2021 or 8 May 2021

### Southeast Asia

For all customers using a domain ending in secretservercloud.com.sg:
- New IP addresses for inbound RADIUS connections: 20.195.97.220, 20.195.98.154
- New hostnames for outbound service bus connections:
    - thycotic-ssc-sea-er-sb-01-prod-b.servicebus.windows.net (primary)
    - thycotic-ssc-sea-er-sb-01-prod-g.servicebus.windows.net (primary)
    - thycotic-ssc-sea-er-sb-02-prod-b.servicebus.windows.net (dr)
    - thycotic-ssc-sea-er-sb-02-prod-g.servicebus.windows.net (dr)
- Change dates: 27 March 2021 or 3 April 2021

### United States

For all customers using a domain ending in secretservercloud.com:
- New IP addresses for inbound RADIUS connections: 52.224.253.7, 52.224.253.4
- New hostnames for outbound service bus connections:
    - thycotic-ssc-us-er-sb-01-prod-b.servicebus.windows.net (primary)
    - thycotic-ssc-us-er-sb-01-prod-g.servicebus.windows.net (primary)
    - thycotic-ssc-us-er-sb-02-prod-b.servicebus.windows.net (dr)
    - thycotic-ssc-us-er-sb-02-prod-g.servicebus.windows.net (dr)
- Change dates: 17 April 2021 or 1 May 2021
