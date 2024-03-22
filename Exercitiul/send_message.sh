#!/bin/bash
source ./config.sh

send_message() {
    local userId=$1
    local message=$2
    local chatId=$3
    #TODO: Cripteaza mesajul, dupa transforma stringul criptat in base64, exemplu "echo "$string" | base64"
    local response=$(curl -s -X POST "$BASE_URL$SEND_ENDPOINT" \
                            -d "userId=$userId" \
                            -d "chatId=$chatId" \
                            -d message=${message})
}
userID=$(cat ./userId.txt)
chatID=$(cat ./chatId.txt)
message=$1
send_message $userID "$message" $chatID