#!/bin/bash
source ./config.sh

# Funcție pentru înlocuirea ID-urilor cu nume
replace_ids_with_names() {
    #TODO seteaza variabele locale

    #TODO parseaza fiecare user si adaugal intr-un array parsarea o poti face cu "( $(echo "$line" | cut -d ':' -f 1) )"

    #TODO: Înlocuiti ID-urilor cu nume

    #TODO: decripteaza si afiseaza mesajele (nu uita sa decriptezi inca cu base64 --decript)

}

get_messages() {
    local response=$(curl -s -X GET "$BASE_URL$CHAT_ENDPOINT?chatId=$1")
    echo "$response" 
}

get_users() {
    local response=$(curl -s -X GET "$BASE_URL$USERS_ENDPOINT")
    echo "$response"
}

chatID=$(cat ./chatId.txt)

while true; do
    message=$(get_messages $chatID)
    ussers=$(get_users)
    replace_ids_with_names "$message" "$ussers"
    sleep 5
    clear
done

# # Exemplu de raspuns
# message=845ecb8a-fe68-4267-8bff-8c31761e41f4: U2FsdXQgTHVtZQo=
# users=845ecb8a-fe68-4267-8bff-8c31761e41f4": TestUser
