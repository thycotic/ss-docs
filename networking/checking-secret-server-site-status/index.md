
# Checking Secret Server Site Status

To query Secret Server status without authentication for basic latency check, follow the steps below.

1. In a web browser, go to <https://yoursecretserverurl/healthcheck.aspx>

1. Compare the information displayed in your browser to the information below:

   `{"healthy":true,"now":"2019-04-08T12:59:06.0455458-04:00","utcNow":"2019-04-08T16:59:06.0455458Z"}`

* If your information is similar, your Secret Server should be operational.

* If your information displays other text such as **timed out** or **service unavailable**, there may be issues with the web site where the application is installed.
