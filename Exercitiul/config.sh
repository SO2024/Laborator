#!/bin/bash

export BASE_URL="http://13.49.148.97:8080"      # Adresa de bază a serverului
export LOGIN_ENDPOINT="/api/login"              # Endpoint-ul pentru autentificare
export SEND_ENDPOINT="/api/sendMessage"         # Endpoint-ul pentru trimiterea mesajelor
export CHAT_ENDPOINT="/api/chat"                # Endpoint-ul
export USERS_ENDPOINT="/api/users"              # Endpoint-ul
export CHAT_GENERATOR_ENDPOINT="/api/chatGenerator" # Endpoint pentru a genera noi chaturi
export USERID_STORE="./userId.txt"
export CHATID_STORE="./chatId.txt"