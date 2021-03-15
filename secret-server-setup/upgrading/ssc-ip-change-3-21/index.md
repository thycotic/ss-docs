[title]: # (SSC IP Change for March to May 2021)
[tags]: # (Upgrade, IP change, secret server cloud)
[priority]: # (1000)

# Secret Server Cloud IP Address Change for March to May 2021

## Overview

Thycotic is making infrastructure upgrades to Secret Server Cloud (SSC) over the next few weeks. As part of this work, the IP addresses for SSC will change. Your SSC subdomain will not change.

You may need to modify your inbound or outbound firewall configurations to maintain uninterrupted service.

## FAQ

### Who Is Affected?

Customers using inbound or outbound firewall rules to control traffic to and from SSC are affected.

Inbound firewall rules are necessary for customers using Remote Authentication Dial-In User Service (RADIUS) authentication.

### What Other Thycotic Products Are Affected?

None—these products are ***not*** affected:

- All other Thycotic cloud products
- SS private cloud customers
- SS on-premises customers

### What Thycotic Domains Are Affected?

If you use IP filtering, the following domains are affected:

**Table:** Affected Domains by Region

| **Region** | **Domain**               |
| ---------- | ------------------------ |
| America    | secretservercloud.com    |
| Australia  | secretservercloud.com.au |
| Canada     | secretservercloud.ca     |
| Europe     | secretservercloud.eu     |
| Singapore  | secretservercloud.com.sg |

[]()

### How Do I Verify My Domain Is Affected?

Review the table above to see if any of those domains appear in your SSC URL. For example, if your domain were `https://acmewidgets.secretservercloud.eu` you would be affected.

### What Do I Need to Change?

If you confirmed your domain is affected, you need to change your inbound IP address and outbound hostnames for your firewall rules prior to the dates in the **New IP Addresses and Hostnames** table below.

## When Are The IP Addresses and Hostnames Changing?

The IP addresses and host names for the listed regions are ***not*** changing at the same time. Please see the **New IP Addresses and Hostnames** table below for the date or dates applying to you.

### Will I Lose Connectivity During the Change?

It is unlikely you will lose connectivity with SSC unless you use inbound or outbound IP filtering and have not updated to the new IP addresses or hostnames found the table below.

### How Will I Know When the Change Is Complete?

Thycotic will update the SSC banner as we complete the IP address change. 

### Who Do I Contact I Have Issues After the Change?

Contact Thycotic technical support at any of the phone numbers below or by opening a case using the [Support Portal](https://thycotic.force.com/support/s/login/). 

## Thycotic Support

### Support Portal

[Support Portal](https://thycotic.force.com/support/s/login/)

### Telephone

#### Americas

+1 202 991 0540 (US)

#### EMEA

- +44 20 3880 0017 (UK)
- +49 69 6677 37597 (Germany)

####  APAC

* +61 3 8595 5827 (Australia)

- +63 2 231 3885 (Philippines)
- +64 9-887 4015 (New Zealand)
- +65 3157 0602 (Singapore)

## IP Addresses and Hostnames

### New IP Addresses and Hostnames

**Table:** New IP Addresses and Hostnames

| Domain Name           | New Inbound IP Addresses for RADIUS | New Outbound Hostnames                                       | Change Date(s)             |
| --------------------- | --------------------------------- | ------------------------------------------------------------ | -------------------------- |
| secretservercloud.com | 52.224.253.7<br/>  52.224.253.4   | <ul><li>thycotic-ssc-us-er-sb-01-prod-b.servicebus.windows.net  (primary)</li>   <li>thycotic-ssc-us-er-sb-01-prod-g.servicebus.windows.net  (primary)</li>   <li>thycotic-ssc-us-er-sb-02-prod-b.servicebus.windows.net  (dr)</li>  <li>thycotic-ssc-us-er-sb-02-prod-g.servicebus.windows.net  (dr)</li></ul> | 24 April 2021<br/>8 May 2021 |
| secretservercloud.com.au | 20.37.251.37<br/>  20.37.251.120                  | <ul><li>thycotic-ssc-au-er-sb-01-prod-b.servicebus.windows.net  (primary)</li>   <li>thycotic-ssc-au-er-sb-01-prod-g.servicebus.windows.net  (primary)</li>   <li>thycotic-ssc-au-er-sb-02-prod-b.servicebus.windows.net  (dr)</li>   <li>thycotic-ssc-au-er-sb-02-prod-g.servicebus.windows.net  (dr)</li></ul> | 10 April 2021              |
| secretservercloud.ca     | 52.228.117.246<br/>  52.228.113.119               | <ul><li>thycotic-ssc-ca-er-sb-01-prod-b.servicebus.windows.net  (primary)</li>   <li>thycotic-ssc-ca-er-sb-01-prod-g.servicebus.windows.net  (primary)</li>   <li>thycotic-ssc-ca-er-sb-02-prod-b.servicebus.windows.net  (dr)</li>   <li>thycotic-ssc-ca-er-sb-02-prod-g.servicebus.windows.net  (dr)</li></ul> | 3 April 2020               |
| secretservercloud.eu     | 20.79.64.213<br/>    20.79.65.3                   | <ul><li>thycotic-ssc-eu-er-sb-01-prod-b.servicebus.windows.net  (primary)</li>   <li>thycotic-ssc-eu-er-sb-01-prod-g.servicebus.windows.net  (primary)</li>   <li>thycotic-ssc-eu-er-sb-02-prod-b.servicebus.windows.net  (dr)</li>   <li>thycotic-ssc-eu-er-sb-02-prod-g.servicebus.windows.net  (dr)</li></ul> | 1 May 2021<br/>   15 May 2021 |
| secretservercloud.com.sg | 20.195.97.220<br/>   20.195.98.154                | <ul><li>thycotic-ssc-sea-er-sb-01-prod-b.servicebus.windows.net  (primary)</li>           <li>thycotic-ssc-sea-er-sb-01-prod-g.servicebus.windows.net  (primary)</li>           <li>thycotic-ssc-sea-er-sb-02-prod-b.servicebus.windows.net (dr)</li>           thycotic-ssc-sea-er-sb-02-prod-g.servicebus.windows.net (dr)</li></ul> | 3 April 2021               |

[]()

> **Note:** The US and EU regions have two dates listed for changes because the upgrade work will be performed over two days. Please make any necessary changes before the earlier date.

### Old IP Addresses and Hostnames

For reference, the original IP addresses and hostnames were as follows:

**Table:** Old IP Addresses and Hostnames

| Domain Name              | Original Inbound IP Addresses for RADIUS | Old Outbound Hostnames                                       |
| ------------------------ | ---------------------------------------- | ------------------------------------------------------------ |
| secretservercloud.com.au | 20.36.47.199<br/>  20.36.45.106          | <ul><li>thycotic-ssc-02-prod-auce-bus-er.servicebus.windows.net</li>  <li>thycotic-ssc-02-prod-auce-bus-er-g.servicebus.windows.net</li></ul> |
| secretservercloud.ca     | 13.88.237.67<br/> 52.228.62.157          | <ul><li>thycotic-ssc-02-prod-ca-bus-er.servicebus.windows.net    <li>thycotic-ssc-02-prod-ca-bus-er-g.servicebus.windows.net</li></ul> |
| secretservercloud.eu     | 51.116.228.208<br/> 51.116.228.152       | <ul><li>thycotic-ssc-02-prod-dewc-bus-er.servicebus.windows.net</li>  <li>thycotic-ssc-02-prod-dewc-bus-er-g.servicebus.windows.net</li></ul> |
| secretservercloud.com.sg | 137.116.141.200<br/> 137.116.143.17      | <ul><li>thycotic-ssc-02-prod-sea-bus-er.servicebus.windows.net</li>    <li>thycotic-ssc-02-prod-sea-bus-er-g.servicebus.windows.net</li></ul> |
| secretservercloud.com    | 40.76.197.147<br/> 40.121.181.52         | <ul><li>thycotic-ssc-02-prod-use1-bus-er.servicebus.windows.net</li>  <li>thycotic-ssc-02-prod-use1-bus-er-g.servicebus.windows.net</li></ul> |

