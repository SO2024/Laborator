#!/bin/bash

# Script pentru înlocuirea ID-urilor cu nume în mesaje

# Funcție pentru înlocuirea ID-urilor cu nume
replace_ids_with_names() {
    local message=$1
    local users_json=$2
    local names=()
    local ids=()

    # Parsarea JSON-ului pentru a obține lista de utilizatori
    while IFS= read -r line; do
        ids+=( $(echo "$line" | jq -r 'keys[]') )
        names+=( $(echo "$line" | jq -r 'values[]') )
    done < <(echo "$users_json" | jq -c '.[]')

    # Înlocuirea ID-urilor cu nume
    for ((i=0; i<${#ids[@]}; i++)); do
        local id="${ids[i]}"
        local name="${names[i]}"
        message=$(echo "$message" | sed "s/$id/$name/g")
    done
    echo "$message"
}

get_messages() {
    local response=$(curl -s -X GET "$MESSAGES_URL")
    echo "$response" > ./chat.txt
}

get_users() {
    local response=$(curl -s -X GET "$USERS_URL")
    echo "$response" > ./users.json
}

# Exemplu de utilizare
message="845ecb8a-fe68-4267-8bff-8c31761e41f4: Salut lume"
users_json='{"845ecb8a-fe68-4267-8bff-8c31761e41f4": "Ion"}'
echo "$(replace_ids_with_names "$message" "$users_json")"