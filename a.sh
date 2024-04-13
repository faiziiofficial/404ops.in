#!/bin/bash

# Replace <api_token> with your Telegram bot API token
api_token="6860769706:AAHE-Wy1tSx1WCSFk1mYMvFbcIGonmXjEik"
chat_id="1395896130"
message="self"
duration_seconds=10  # Adjust the duration in seconds as needed

# Send the message as a self-destructing message
url="https://api.telegram.org/bot${api_token}/sendPhoto"
payload=$(cat <<EOF
{
    "chat_id": "${chat_id}",
    "photo": "https://telegram.org/img/t_logo.png",
    "caption": "${message}",
    "reply_markup": {
        "inline_keyboard": [[{"text": "self-destruct in ${duration_seconds} seconds", "callback_data": "self-destruct"}]]
    },
    "ttl_seconds": ${duration_seconds}
}
EOF
)
response=$(curl -s -X POST -H "Content-Type: application/json" -d "${payload}" "${url}")

# Print the response from the Telegram API
echo "${response}"
