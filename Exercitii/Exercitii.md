# Exercitiu

Scrieți un script Bash care primește două argumente: un director sursă și un director destinație. Scriptul verifică dacă primește exact două argumente, altfel afișează mesajul de eroare: "Usage: nume_script director_sursa director_destinatie". Verifică de asemenea dacă cele două argumente reprezintă căi către două directoare valide. Dacă nu sunt directoare, scriptul afișează mesajele de eroare corespunzătoare.

Fișierele cu extensia .txt din directorul sursă conțin pe fiecare linie date despre diferiți pacienți. Fiecare pacient este de forma "Nr asigurare, Nume Prenume, Farmacie, DD.MM.YYYY". Scriptul validează fiecare linie din aceste fișiere, aplicând următoarele reguli de validare:

- Numărul de asigurare trebuie să înceapă cu două litere majuscule și să fie urmat de cinci cifre.
- Numele și prenumele trebuie să înceapă cu litere majuscule și să fie urmate de litere mici (acest lucru poate fi complicat pentru persoanele care au nume duble).
- Numele farmaciei este valid doar dacă conține cuvântul "Med".
- Data trebuie să fie de forma DD.MM.YYYY și să conțină doar cifre și puncte.

Scriptul creează în directorul destinație un fișier numit statistica.txt. Acesta parcurge fișierele din directorul sursă și scrie în fișierul statistica.txt informații despre fiecare fișier prelucrat, inclusiv numărul de clienți valizi găsiți în fiecare fișier, de forma `<file_name>: <nr_clienti valizi>`. La final, scriptul scrie în statistica.txt un mesaj care indică numărul total de fișiere procesate și numărul total de linii prelucrate. Fisierul rezultat.txt va contine toate datele din fisierele citite doar ca ordonate dupa data. Data va fi in formatul `dd/MM/yyyy`.

## Indicii

Folosirea lui grep pentru a valida un string care contine repetari `[A-Z]{2}[0-9]{5}`:

```bash
echo "$nr_asigurare" | grep -qE "$NR_ASIGURARE"
```
Această comandă va căuta în fișierul fisier.txt toate liniile care conțin șirul "cuvant_cheie" și va afișa acele linii.

Parcurgerea liniilor unui fișier: În scriptul Bash, se poate folosi o buclă while împreună cu read pentru a parcurge liniile unui fișier. De exemplu:

```bash
while IFS= read -r linie; do
    echo "$linie"
done < fisier.txt
```

Această buclă va citi fiecare linie din fisier.txt și va afișa linia respectivă.

Extragerea unui anumit cuvant din linie

```bash
nume_prenume=$(echo "$line" | cut -d ',' -f 2)
```
Descompunerea expresiei regulate în bucăți mai mici: Pentru a face expresiile regulate mai ușor de înțeles și de gestionat, este o practică bună să le descompunem în bucăți mai mici, mai ușor de digerat și de testat separat. Acest lucru poate implica crearea de expresii regulate separate pentru diferitele aspecte pe care doriți să le validați într-o linie de text. De exemplu, în loc să creați o singură expresie regulată complexă pentru a valida întreaga linie, puteți crea expresii regulate separate pentru numărul de asigurare, numele, data etc., apoi să le validați separat în cadrul scriptului.