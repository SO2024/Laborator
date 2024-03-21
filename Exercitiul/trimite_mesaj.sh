#!/bin/bash
source ./config.sh

send_message() {
    local userId=$1
    local message=$2
    local chatId=$3
    
    local encrypted_message=$(echo "$message" | base64)
    echo $encrypted_message
    local response=$(curl -s -X POST "$BASE_URL$SEND_ENDPOINT" \
                            -d "userId=$userId" \
                            -d "chatId=$chatId" \
                            -d "message=$encrypted_message")
}
userID=$(cat ./userId.txt)
chatID=$(cat ./chatId.txt)
message=$1
send_message $userID "$message" $chatID