const { delay, ServiceBusClient, ServiceBusMessage } = require("@azure/service-bus");

// connection string to your Service Bus namespace
const connectionString = process.env.SB_CONNECTION_STRING;


// name of the queue
const queueName = process.env.SB_QUEUE_NAME;


 async function main() {
    // create a Service Bus client using the connection string to the Service Bus namespace
    const sbClient = new ServiceBusClient(connectionString, {  });

    // createReceiver() can also be used to create a receiver for a subscription.
    const receiver = sbClient.createReceiver(queueName);

    // function to handle messages
    const myMessageHandler = async (messageReceived) => {
        console.log(`Received message: ${messageReceived.body}`);
        await delay(2000);
        console.log(`Finished processing: ${messageReceived.body}`);

    };

    // function to handle any errors
    const myErrorHandler = async (error) => {
        console.log(error);
    };

    // subscribe and specify the message and error handlers
    receiver.subscribe({
        processMessage: myMessageHandler,
        processError: myErrorHandler
    });

    console.log("esperando mensagens");

    var p = new Promise(resolve => {
        process.on('SIGTERM', async () => {
            console.info('SIGTERM signal received.');
            await receiver.close(); 
            await sbClient.close();
            resolve();
        });    
    });


    
    // Waiting process exit
    await p;

}    
// call the main function
main().catch((err) => {
    console.log("Error occurred: ", err);
    process.exit(1);
 });