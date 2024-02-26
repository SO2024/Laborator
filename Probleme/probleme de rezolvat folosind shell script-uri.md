# Probleme
## Parametri
## Liste

Scrieți un script Bash numit `sort_numbers.sh` care primește ca parametru o listă de numere. Scriptul trebuie să sorteze numerele pare crescător și să le scrie într-un fișier numit `numere_pare.txt`, iar numerele impare trebuie să fie sortate descrescător și să fie scrise într-un fișier numit `numere_impare.txt`. Dacă nu sunt numere pare sau impare în lista dată, atunci fișierele corespunzătoare trebuie să fie goale. Scrieți un mesaj de eroare dacă nu sunt furnizate argumente în linia de comandă.
Dați-i permisiuni de execuție cu 

```bash
chmod +x sort_numbers.sh
```
Puteți apoi rula scriptul, furnizând o listă de numere ca argumente în linia de comandă. de exemplu: 

```bash
./sort_numbers.sh 3 7 2 10 5
```
## Functii
Scrieți un script shell numit `fibonacci.sh` care primește un singur parametru, n, reprezentând poziția în șirul lui Fibonacci. Scriptul trebuie să calculeze al n-lea număr din șirul lui Fibonacci și să-l afișeze în consolă. Dacă n este mai mic sau egal cu 0, scriptul ar trebui să afișeze un mesaj de eroare corespunzător. Asigurați-vă că scriptul poate calcula și afișa valori mari din șirul Fibonacci.

Puteți considera că primul și al doilea număr din șirul lui Fibonacci sunt 0 și 1, respectiv. Restul numerelor din șir sunt suma celor două precedente. De exemplu, al treilea număr este 1 (0 + 1), al patrulea este 2 (1 + 1), al cincilea este 3 (1 + 2) etc.