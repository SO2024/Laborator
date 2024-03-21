#!/bin/bash

login() {
    local name=$1
    local response=$(curl -s -X POST "$BASE_URL$LOGIN_ENDPOINT" -d "name=$name")
    echo "$response"  # Returnează răspunsul (ID-ul utilizatorului sau un mesaj de eroare)
}
nume_utilizator=$1

echo "Autentificare..."
userId=$(login "nume_utilizator")
if [[ $userId =~ "" ]]; then
    echo "Autentificare cu succes! ID utilizator: $userId"
    echo "Acum trimitere un mesaj"
    echo $userId > $USERID_STORE
else
    echo "Eroare la autentificare: $nume_utilizator"
fi