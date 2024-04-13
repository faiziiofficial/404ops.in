#6860769706:AAHE-Wy1tSx1WCSFk1mYMvFbcIGonmXjEik


#!/bin/bash

# Replace 6860769706:AAHE-Wy1tSx1WCSFk1mYMvFbcIGonmXjEik with your Telegram bot API token
api_token="6860769706:AAHE-Wy1tSx1WCSFk1mYMvFbcIGonmXjEik"

# Get the latest update ID
get_update_url="https://api.telegram.org/bot${api_token}/getUpdates?offset=-1"
response=$(curl -s $get_update_url)
update_id=$(echo $response | jq -r '.result[] | .update_id')

# Loop to continuously check for new updates
while true
do
  # Send request to Telegram Bot API to get updates
  get_update_url="https://api.telegram.org/bot${api_token}/getUpdates?offset=$update_id-1"
  response=$(curl -s $get_update_url)

  # Check if there are any updates
  num_updates=$(echo $response | jq -r '.result | length')

      update_id=$(echo $response | jq -r ".result[$i] | .update_id")
      chat_id=$(echo $response | jq -r ".result[$i].message.chat.id")
      message=$(echo $response | jq -r ".result[$i].message.text")
      echo $update_id $chat_id $message $response

    if [ "$message" == "/calculate" ]
    then
    timeout 120 bash session.sh $chat_id &
    fi

  # Wait for 1 second, then check for updates again
  sleep 1
done
