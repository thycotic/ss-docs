[title]: # (Internal Site Connector)
[tags]: # (RabbitMQ, internal site connector, backbone bus)
[priority]: # (1000)

# Internal Site Connector

Starting in Secret Server 10.2 it became possible to change how Secret Server processes messages by navigating to:

`<Your Secret Server URL>/AdminBackboneBusConfigurationView.aspx`

These messages are generated and placed on the internal site connector, or backbone bus, every time a background operation is triggered whether by a schedule or on-demand.

The internal site connector receives and processes messages as a result of numerous actions:

- Bulk Operations

- Generate Password

- Bulk Operations

- Run Heartbeat Now

- Bulk Operations

- Run Password Change Now

- Bulk Operations

- Run Discovery Now

- Bulk Operations

- Run AD Sync Now

- Bulk Operations

- Elements of Session Recording

The internal site connector, using the internal hosted bus, is adequate for bulk operations, heartbeat, discovery, and the like, but some SS features, such as a clustered Web server node configuration or session recording, require a scalable messaging solution to boost processing performance. Our choice is [RabbitMQ](https://www.rabbitmq.com/features.html), which is an intermediary messaging broker that can handle large-scale message processing. 


The following is a typical internal hosted bus operation (for a bulk operation): 

$1
$21. A message is formed and sent over a TCP connection to the internal hosted bus.
$1
$21. SS (on the same machine) processes the message.

While the internal hosted bus is something we will constantly strive to improve, we recommend using RabbitMQ for a performance boost for those scalable operations. See [Installing RabbitMQ](../../secret-server-setup/installation/installing-rabbitmq/index.md) for more information.