## Tree simulator

Scrieți un script în Bash care afișează structura arborescentă a unui director și subdirectoarele sale, precum și dimensiunea fiecărui fișier exprimată în biți.

Cerințe:

- Scriptul trebuie să primească ca argument opțional un director. Dacă nu este specificat niciun director, trebuie să afișeze structura arborescentă a directorului curent.
- Scriptul trebuie să afișeze numele directorului dat ca argument, urmat de toate fișierele și subdirectoarele sale, sub forma unei ierarhii arborescente.
- Pentru fiecare subdirector, indentarea trebuie să fie mai adâncă, pentru a indica structura ierarhică a directorului.
- Dacă un subdirector conține alte subdirectoare, acestea trebuie afișate la rândul lor, cu indentare corespunzătoare.
Pentru fiecare fișier, în afara numelui său, trebuie să se afișeze și dimensiunea fișierului exprimată în biți.

Exemplu de output:
```
└── Desktop/
    └── SO/
        └── Laborator/
            └── Exercitii/
                ├── Exercitii.md (0 bits)
                ├── tree_simulator.sh (1166 bits)
            ├── README.md (11 bits)
```
Indicii:

- Pentru a extrage dimensiunea unui fișier în biți, puteți utiliza comanda `stat -c "%s" "$file"` pentru a obține dimensiunea fișierului în octeți, și apoi puteți înmulți această valoare cu 8 pentru a obține dimensiunea în biți.

- Pentru a declara variabile locale într-o funcție Bash, puteți utiliza sintaxa local nume_variabilă=valoare.

- Este recomandat să implementați întâi funcțiile în script și apoi să le apelați. Acest lucru este important deoarece Bash interpretează scriptul în mod secvențial, de la stânga la dreapta și de sus în jos. Dacă apelați o funcție înainte de a fi definită, veți primi o eroare de "comandă necunoscută". De aceea, este mai sigur să implementați funcțiile mai întâi și apoi să le apelați în cadrul scriptului.

## Extensie:

Dacă un fișier are extensia specificată ca argument al scriptului, se vor afișa primele 5 linii din acel fișier.

Indicii:
- Pentru a verifica extensia unui fișier, puteți utiliza comanda `basename "$file" | grep -q "\.$extensie$"` pentru a verifica dacă fișierul are extensia specificată.
  
- Pentru a afișa primele 5 linii dintr-un fișier, puteți utiliza comanda `head -n 5 "$file"`.
``` bash
./tree_extension.sh /dir/ "txt"
```