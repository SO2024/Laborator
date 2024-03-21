#!/bin/bash

send_message() {
    local userId=$1
    local message=$2
    local encrypted_message=$(echo "$message" | base64)
    local response=$(curl -s -X POST "$BASE_URL$SEND_ENDPOINT" -d "userId=$userId" -d "message=$encrypted_message")
    echo "$response"  # Returnează răspunsul (succes sau eroare)
}

message=$1