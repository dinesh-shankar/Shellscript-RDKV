#!/bin/bash

# Specify the number of iterations
ITERATIONS=5

# Loop for the specified number of iterations
for (( i=1; i<=$ITERATIONS; i++ ))
do
    echo "Launching YouTube App - Attempt $i"

    # Execute the curl command to launch the app
    curl -H "Authorization: Bearer `WPEFrameworkSecurityUtility | cut -d '"' -f 4`" --header "Content-Type: application/json" --request POST --data '{"jsonrpc":"2.0","id":"3","method":"org.rdk.VoiceControl.1.voiceSessionByText","params":{"transcription":"launch Netflix App"}}' http://127.0.0.1:9998/jsonrpc

    # Wait for 15 seconds
    sleep 15

    echo "Exiting App - Attempt $i"

    # Execute the curl command to exit the app
    curl -H "Authorization: Bearer `WPEFrameworkSecurityUtility | cut -d '"' -f 4`" --header "Content-Type: application/json" --request POST --data '{"jsonrpc":"2.0","id":"3","method":"org.rdk.VoiceControl.1.voiceSessionByText","params":{"transcription":"exit"}}' http://127.0.0.1:9998/jsonrpc

    # Wait for 15 seconds before the next iteration
    sleep 15
done
