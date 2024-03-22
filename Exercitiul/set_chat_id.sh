#!/bin/bash
source ./config.sh

chatID=$1

if [[ -n $chatID ]]; then
    echo $chatID > $CHATID_STORE
fi