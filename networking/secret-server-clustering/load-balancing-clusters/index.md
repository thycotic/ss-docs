

[title]: # (Load Balancing Secret Server Clusters)
[tags]: # (load balancing, Clustering, Networking)
[priority]: # (1000)

# Load Balancing Secret Server Clusters

In a clustered Secret Server environment set up behind a load balancer, the accessible outside URL may be something other than the server name.

## Custom URL Configuration

In SS 8.5 and later, the Custom URL setting can be configured to ensure that links and resources are resolved correctly and are not based upon the server name:

1. Navigate to **Admin \> Configuration**.
1. On the **General** tab, click the **Edit** button.
1. Go to the **Application Settings** section.
1. Click to select the **Custom URL** check box.
1. Type the desired URL in the **Secret Server Custom URL** text box.

## SSL Recommendations

For the best security, we recommend placing the SSL certificate on each of the Web servers. This ensures the traffic leaving the server is encrypted by SSL. Optionally, the load balancer would need the certificates as well for adding the client's IP address.

If the connection between the load balancer and the server is isolated in a security zone, you could leave HTTP between the load balancer and the server and have the SSL on the load balancer.

## Configuring Client's IP Address (X-Forwarded-For) 


Routing traffic through a load balancer will cause SS to audit the IP address of the load balancer instead of the end user. To avoid this:

First, configure the load balancer to pass along the client's IP address in the header. 

Then add the `appSettings` key `IpAddressHeader` with the value of the name of the header field containing the client's IP address. This setting must be added to **all** SS Web servers. Depending on your SS version, do this in one of two ways:

For SS prior to 10.5.000000:

In the `web-appSetting.config` file in your SS directory, add the following key:

```xml 
<?xml version="1.0" encoding="utf-8" ?>
<appSettings>
  <add key="IpAddressHeader" value="X-Forwarded-For" />
</appSettings>
```

For SS 10.5.000000 and later:   
1. Go to `https://<SecretServerAddress>/ConfigurationAdvanced.aspx`.
1. Scroll to the bottom and click **Edit**.
1. Locate the **IP Address Header** text box, type `X-Forwarded-For`.
1. Click the **Save** button.

> **Note:** The SSL certificate needs to exist on the load balancer and the Web server to ensure it has access to add the client IP address header.

 