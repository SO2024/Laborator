#!/bin/bash
source ./config.sh

send_message() {
    local userId=$1
    local message=$(echo $2 | base64)
    local chatId=$3
    local response=$(curl -s -X POST "$BASE_URL$SEND_ENDPOINT" \
                            -d "userId=$userId" \
                            -d "chatId=$chatId" \
                            -d message=${message})
}
userID=$(cat ./userId.txt)
chatID=$(cat ./chatId.txt)
message=$1
send_message $userID "$message" $chatID