#!/bin/bash

# Funcție recursivă pentru calcularea n-lea număr Fibonacci
fibonacci() {
    local n=$1
    if [ "$n" -eq 0 ]; then
        echo 0
    elif [ "$n" -eq 1 ]; then
        echo 1
    else
        local fib1=$(fibonacci "$((n - 1))")
        local fib2=$(fibonacci "$((n - 2))")
        echo $((fib1 + fib2))
    fi
}

# Verificăm dacă a fost furnizat un singur argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <n>"
    exit 1
fi

# Extragem valoarea lui n din argumentul dat
n=$1

# Verificăm dacă n este mai mic sau egal cu 0
if [ "$n" -le 0 ]; then
    echo "Eroare: n trebuie să fie un număr întreg pozitiv."
    exit 1
fi

# Calculăm și afișăm al n-lea număr Fibonacci
result=$(fibonacci "$n")
echo "Al $n-lea număr Fibonacci este: $result"
