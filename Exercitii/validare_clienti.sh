#!/bin/bash
NUME_PRENUME="[A-Z][a-z][a-z]* [A-Z][a-z][a-z]*"
dd="\([0-2][0-9]\|(3)[0-1]\)"
MM="\(\(\(0\)[0-9]\)\|\(\(1\)[0-2]\)\)"
yyyy="\([0-2][0-9][0-9][0-9]\)"
DATA_REGEX="${dd}\(\.\)${MM}\(\.\)${yyyy}"

# Verificăm dacă numărul de argumente este corect
if [ "$#" -ne 2 ]; then
    echo "Usage $0 : director_sursa director_destinatie"
    exit 1
fi

# Verificăm dacă primul argument este un director
if [ ! -d "$1" ]; then
    echo "Primul argument nu este director"
    exit 1
fi

# Verificăm dacă al doilea argument este un director
if [ ! -d "$2" ]; then
    echo "Al doilea argument nu este director"
    exit 1
fi

# Directorul sursă și destinație
dir_sursa="$1"
dir_destinatie="$2"

# Initializăm variabile pentru numărul total de fișiere și de linii prelucrate
numar_fisiere=0
numar_linii=0

# Creăm fișierul statistică
statistica_file="$dir_destinatie/statistica.txt"
echo -n "" > "$statistica_file"

# Parcurgem fișierele din directorul sursă
for fisier in "$dir_sursa"/*.txt; do
    if [ -f "$fisier" ]; then
        # Incrementăm numărul de fișiere prelucrate
        ((numar_fisiere++))

        # Numărăm linii și clienti valizi
        linii=$(wc -l < "$fisier")
        nr_clienti_valizi=0

        while IFS= read -r linie; do
            # Extragere informații din linie
            nr_asigurare=$(echo "$linie" | cut -d ',' -f 1)
            nume_prenume=$(echo "$linie" | cut -d ',' -f 2)
            farmacie=$(echo "$linie" | cut -d ',' -f 3)
            data=$(echo "$linie" | cut -d ',' -f 4)
            var=("$nr_asigurare" =~ ^[A-Z]{2}[0-9]{5}$)
            # echo $data
            # Verificare validitate
            if grep -q "$NUME_PRENUME" <<< "$nume_prenume"; then
                # [[ "$farmacie" =~ Med ]] &&\
                # [[ "$data" =~ ^[0-9]{2}\.[0-9]{2}\.[0-9]{4}$ ]]; then
                echo $var
                ((nr_clienti_valizi++))
            fi
        done < "$fisier"

        # Scriem în fișierul statistică informațiile
        echo "Fisier:$fisier:contine:$nr_clienti_valizi" >> "$statistica_file"

        # Incrementăm numărul total de linii
        ((numar_linii += linii))
    fi
done

# Scriem în fișierul statistică numărul total de fișiere și de linii
echo "Au fost prelucrate $numar_fisiere fisiere, avand in total $numar_linii linii." >> "$statistica_file"
