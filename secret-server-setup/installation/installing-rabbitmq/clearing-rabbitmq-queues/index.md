[title]: # (Clearing RabbitMQ Message Queues)
[tags]: # (rabbitmq,message,queue,clear)
[priority]: # (1000)

# Clearing RabbitMQ Message Queues

Some users note that older RabbitMQ message queues in Ready state are not clearing as expected, so messages accumulate. To clear the message queues, use the procedure below.

1. On the machine where RabbitMQ is installed, download the [utility](https://updates.thycotic.net/secretserver/RabbitMQScriptFIX/RMQ_QueueRemoval.zip) for removing old RabbitMQ queues.

   `SHA1(RMQ_QueueRemoval.zip)= B8EE3CD2488AF2D7A42421B870EB8041434245C8`

   `SHA256(RMQ_QueueRemoval.zip)= B9AF3BF51B0E1E6E937830A6CF0974D3546183B78E1E86F6C8563E5E7243146A`

1. Extract the zip file.

1. Open Windows PowerShell.

1. Navigate to the directory where you extracted the zip file.

1. Load the file by typing the following command:

   `. .\RMQ_QueueRemoval.ps1`

1. Run the commands below in the order shown:

   1. `ShowAllQueues`

   1. `ShowQueuesNoConsumer`

   1. `DeleteQueuesNoConsumer`
