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

1. Open **Internet Information Server (IIS) Manager**: On the taskbar, click **Server Manager**, click **Tools**, and then click **Internet Information Services (IIS) Manager**.

2. In the **Connections** pane, expand the server name.
2. Click **Application Pools**.

3. Locate the application pool SS is running as. To determine this:
   1. Expand **Sites** at the left, then find the website SS is running on. 
   1. Click on the SS website or virtual directory (if it is running on one).
   1. Click **Basic Settings** on the right panel. This indicates Secret Server's application pool.

4. Right-click the application pool, and select **Advanced Settings**. The Advanced Settings panel appears.
4. Go to the **(General)** section.
4. Set **Start Mode** to **AlwaysRunning**.
4. Go to the **Process Model** section.
4. Set **Idle Time-out (minutes)** to **0**.
4. Go to the **Recycling** section.
4. Set the **Regular Time Interval (minutes)** to **0**.
4. Select **Specific Times**.
4. **Either** click the **>** expander arrow to see if there is time specified below.
   **Or** click the **...** to see if there are any values in the **TimeSpan Collection Editor** dialog box. 
   If so, clear it out.
4. Click the **OK** button. The dialog closes.
4. Click the **OK** button.