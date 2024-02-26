#!/bin/bash

# Verificăm dacă sunt furnizate argumente în linia de comandă
if [ "$#" -eq 0 ]; then
    echo "Eroare: Nu au fost furnizate argumente în linia de comandă."
    exit 1
fi

# Declaram două array-uri pentru numerele pare și impare
pare=()
impare=()

# Parcurgem argumentele primite și le distribuim în array-urile corespunzătoare
for numar in "$@"; do
    if (( numar % 2 == 0 )); then
        pare+=("$numar")
    else
        impare+=("$numar")
    fi
done

# Sortăm numerele pare crescător și le scriem în fișierul numere_pare.txt
if [ ${#pare[@]} -gt 0 ]; then
    printf "%s\n" "${pare[@]}" | sort -n > numere_pare.txt
else
    > numere_pare.txt
fi

# Sortăm numerele impare descrescător și le scriem în fișierul numere_impare.txt
if [ ${#impare[@]} -gt 0 ]; then
    printf "%s\n" "${impare[@]}" | sort -nr > numere_impare.txt
else
    > numere_impare.txt
fi

echo "Sortarea a fost efectuată cu succes. Rezultatele au fost scrise în fișierele numere_pare.txt și numere_impare.txt."
