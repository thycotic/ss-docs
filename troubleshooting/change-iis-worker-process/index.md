[title]: # (Changing IIS to Not Stop Worker Process in IIS 7.0 and Later)
[tags]: # (troubleshooting, workaround, IIS, worker process)
[priority]: # (1000)

# Changing IIS to Not Stop Worker Process in IIS 7.0 and Later

## Overview 

When using IIS version 7.0 and above, by default, the worker process terminates after a period of inactivity. If SS is in its own application pool, the application pool will stop after a period of no requests. To make sure that the application pool associated with SS does not stop when idle:

- Set the idle time-out to 0 minutes.

- Set the regular time interval to 0.

- Ensure there are no specific times scheduled for recycling. 

Additionally, by default, IIS launches a worker process when the first request for the Web application is received. So if the SS application takes a long time to start, we recommend launching the worker process as soon as IIS is started by setting the start mode to AlwaysRunning to launch the worker process for the SS application pool as soon as IIS is started.

## Procedure 

To change IIS advanced settings:
$1
$2$1
$22. Click **Application Pools**.
$1
$2   1. Expand **Sites** at the left, then find the website SS is running on. 
   1. Click on the SS website or virtual directory (if it is running on one).
   1. Click **Basic Settings** on the right panel. This indicates Secret Server's application pool.
$1
$24. Go to the **(General)** section.
$1
$24. Go to the **Process Model** section.
$1
$24. Go to the **Recycling** section.
$1
$24. Select **Specific Times**.
$1
$2   **Or** click the **...** to see if there are any values in the **TimeSpan Collection Editor** dialog box. 
   If so, clear it out.
$1
$24. Click the **OK** button.