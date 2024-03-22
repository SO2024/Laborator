#!/bin/bash
source ./config.sh

generate_chat() {
    local response=$(curl -s -X POST "$BASE_URL$CHAT_GENERATOR_ENDPOINT?chatId=$1")
    echo "$response" 
}

generate_chat $1
