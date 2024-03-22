#!/bin/bash
source ./config.sh

# Funcție pentru înlocuirea ID-urilor cu nume
replace_ids_with_names() {
    local message=$1
    local users=$2
    local names=()
    local ids=()

    while IFS= read -r line; do
        ids+=( $(echo "$line" | cut -d ':' -f 1) )
        names+=( $(echo "$line" | cut -d ':' -f 2) )
    done < <(echo "$users")

    # Înlocuirea ID-urilor cu nume
    for ((i=0; i<${#ids[@]}; i++)); do
        local id="${ids[i]}"
        local name="${names[i]}"
        message=$(echo "$message" | sed "s/$id/$name/g")
    done

    while IFS= read -r line; do
        text=( $(echo "$line" | cut -d ':' -f 2) )
        name=( $(echo "$line" | cut -d ':' -f 1) )
        echo "$name:"
        echo "$text" | base64 --decode 
    done < <(echo "$message")

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
