[title]: # (RabbitMQ Durable Exchanges)
[tags]: # (RabbitMQ Durable Exchanges)
[priority]: # (60)

# RabbitMQ Durable Exchanges

The SS MessageQueue Client attempts to create durable exchanges and log it when it does so. A durable exchange is automatically re-created if RabbitMQ restarts for any reason. Non-durable exchanges disappear when RabbitMQ goes down and can only be recreated by some external action. If the MessageQueue client detects that creating the durable queue failed, it will log an error and attempt to create a non-durable queue.

> **Note:** Older Advanced Session Recording Agents (ASRAs) work with the latest version of SS, but they do not benefit from durable exchange failover handling. To include failover capability for an existing, older ASRA, you must deploy a new ASRA.
