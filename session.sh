api_token="6860769706:AAHE-Wy1tSx1WCSFk1mYMvFbcIGonmXjEik"
chat_id=$1
count=0
while true
do
echo "I am alive till 120 sec for chatID $chat_id"
sleep 1
echo $count
((count++))
done

    #   reply_url="https://api.telegram.org/bot${api_token}/sendMessage?chat_id=${chat_id}&text=You sent: ${message}"
    #   curl -s $reply_url > /dev/null
    #   exit