#!/bin/bash
source ./config.sh

get_messages() {
    local response=$(curl -s -X POST "$BASE_URL$CHAT_GENERATOR_ENDPOINT?chatId=$1")
    echo "$response" 
}

get_messages $1
