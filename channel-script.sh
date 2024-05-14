#!/bin/bash

LOGS_DIR="/opt/logs"
ITERATIONS=50

# Function to perform the curl request
perform_curl() {
  transcription="$1"
  authorization_token=$(WPEFrameworkSecurityUtility | cut -d '"' -f 4)

  curl -H "Authorization: Bearer $authorization_token" \
       --header "Content-Type: application/json" \
       --request POST \
       --data "{\"jsonrpc\":\"2.0\",\"id\":\"3\",\"method\":\"org.rdk.VoiceControl.1.voiceSessionByText\",\"params\":{\"transcription\":\"$transcription\"}}" \
       http://127.0.0.1:9998/jsonrpc
}

# Perform the sequence of commands for 50 iterations
transcriptions=("FOOD Channel" "HGTV" "ESPN" "MTV")

for ((i=1; i<=$ITERATIONS; i++)); do
  for transcription in "${transcriptions[@]}"; do
    perform_curl "$transcription"
    sleep 60  # Change sleep duration to 60 seconds
    grep -i "DRM license request aborted by player" "$LOGS_DIR"/sky-messages.log*
  done
done
