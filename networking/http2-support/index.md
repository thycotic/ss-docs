[title]: # (Secret Server Support for HTTP/2)
[tags]: # (HTTP/2, Networking)
[priority]: # (1000)

# Secret Server Support for HTTP/2

HTTP/2 is supported in IIS 10. HTTP/2 is handled within IIS, so this is primarily a Microsoft question in regards to compatibility. Please see [HTTP/2 on IIS](https://docs.microsoft.com/en-us/iis/get-started/whats-new-in-iis-10/http2-on-iis). At the end of this article, it clarifies when HTTP/2 is not supported

Secret Server does support Windows Integrated Authentication where a user’s windows session is passed through for authentication to SS. That is, there is no log on page for SS. The majority of our customers are (and the default  configuration for SS is) using forms-based authentication with a log on page. Only the latter is HTTP/2 compliant.

HTTP/2 is only  compatible with HTTPS protocol. SS can also be configured to  operate only on HTTPS (Admin \> Configuration \> Security \> Force HTTPS/SSL), which we strongly recommend.
