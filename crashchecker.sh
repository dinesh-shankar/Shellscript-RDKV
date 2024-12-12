#!/bin/bash

# Specify the number of iterations
ITERATIONS=1

# Loop for the specified number of iterations
for (( i=1; i<=$ITERATIONS; i++ ))
do
        echo > core_log.txt
        echo "Launching Max App - Attempt $i"
    # Execute the curl command to launch the app
    curl -H "Authorization: Bearer `WPEFrameworkSecurityUtility | cut -d '"' -f 4`" --header "Content-Type: application/json" --request POST --data '{"jsonrpc":"2.0","id":"3","method":"org.rdk.VoiceControl.1.voiceSessionByText","params":{"transcription":"launch Max"}}' h

    # Wait for seconds
    sleep 60

    grep -i "uploaded minidump file" /opt/logs/core_log.txt

    grep "process crashed" /opt/logs/core_log.txt

    done
