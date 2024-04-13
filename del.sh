#!/bin/bash

# Replace <api_token> with your Telegram bot API token
api_token="6860769706:AAHE-Wy1tSx1WCSFk1mYMvFbcIGonmXjEik"
chat_id="1395896130"
message_id="$1"  # Replace with the ID of the message to delete

# Delete the message
url="https://api.telegram.org/bot${api_token}/deleteMessage"
payload=$(cat <<EOF
{
    "chat_id": "${chat_id}",
    "message_id": "${message_id}"
}
EOF
)
response=$(curl -s -X POST -H "Content-Type: application/json" -d "${payload}" "${url}")

# Print the response from the Telegram API
echo "${response}"
