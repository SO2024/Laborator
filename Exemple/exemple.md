# Rezumatul și ce lipsește din îndrumător:
## Redirecționari
Redirectările în Linux sunt folosite pentru a redirecționa ieșirea standard (stdout), intrarea standard (stdin) și erorile standard (stderr) către diferite locuri, cum ar fi fișiere sau alte fluxuri.

### Redirecționarea stdout (ieșire standard):
- > `>`: Redirectează ieșirea standard către un fișier sau îl suprascrie dacă acesta există.
    ```bash
    echo "Hello, world!" > output.txt
    ```
- > `>>`: Redirectează ieșirea standard către un fișier și adaugă la conținutul existent al fișierului.
    ```bash
    echo "Another line" >> output.txt
    ```
---
### Redirecționarea stdin (intrare standard):

- > `<`: Redirectează intrarea standard dintr-un fișier.
    ``` bash
    sort < input.txt
    ```
---
### Redirecționarea stderr (erori standard):

- >    `2>`: Redirectează erorile standard către un fișier sau îl suprascrie dacă acesta există.

    ``` bash
    command_not_found 2> error.txt
    ```
- > `2>>`: Redirectează erorile standard către un fișier și adaugă la conținutul existent al fișierului.
    ``` bash
        command_not_found 2>> error.txt
    ```
---
### Combinații:

- >    `&>` sau `&>>`: Redirectează atât ieșirea standard, cât și erorile standard către un fișier.

    ```bash
    command &> output_and_error.txt
    ```
---
## Variabilele de mediu
În Linux, variabilele de mediu pot fi create și setate folosind sintaxa NumeVariabilă=valoare. Aceste variabile sunt accesibile de către procesele copil și pot fi folosite pentru a controla comportamentul lor. Iată câteva exemple de cum să creați variabile de mediu:

- > Crearea unei variabile de mediu simple:

    ```bash
    MY_VAR="Hello World"
    ```
- > Definirea unei variabile de mediu care indică un director:

    ```bash
    MY_DIR="/path/to/directory"
    ```
- > Variabile de mediu pentru căi (paths):

    ```bash
    PATH="$PATH:/new/directory"
    ```
Comanda `export` în shell-ul Linux este folosită pentru a face o variabilă de mediu disponibilă pentru toate procesele copil. Atunci când folosiți `export` pentru o variabilă, aceasta devine o variabilă de mediu, ceea ce înseamnă că va fi moștenită de către toate procesele copil create din acel shell.

```bash
export var="val"
```
---
Comenzile $0, $1, $2, etc., sunt variabile în shell-ul Linux care conțin argumentele primite de un script sau de o funcție în momentul în care sunt apelate.

- >$0: Conține numele scriptului sau al comenzii care este în execuție.

    ```bash
    echo $0   # Va afișa numele scriptului sau al comenzii executate
    ```
- > $1, $2, ...: Aceste variabile conțin valorile argumentelor primite de script sau de o funcție în shell. $1 reprezintă primul argument, $2 al doilea, și așa mai departe.

    ```bash
    echo "Primul argument: $1, Al doilea argument: $2"
    ```
Pentru a accesa parametrii din linia de comandă atunci când aceștia depășesc 9, puteți folosi și constructia shift, care permite să parcurgi toți parametrii într-un mod iterativ.

```bash
#!/bin/bash

echo "Numele scriptului este: $0"
echo "Numărul total de argumente este: $#"

# Iterăm prin toți parametrii folosind shift
while [ "$#" -gt 0 ]; do
    echo "Argument: $1"
    shift
done
```
---
În Bash, array-urile sunt colecții de elemente indexate. Acestea pot fi create și utilizate pentru a stoca și manipula multiple valori într-un singur obiect. Iată cum poți crea și utiliza array-uri în Bash, împreună cu un exemplu:

```bash
my_array1=(element1 element2 element3)

my_array2[0]=element1
my_array2[1]=element2
my_array2[2]=element3
```
Accesarea elementelor array-ului:

```bash
echo "${my_array[0]}"  # Va afișa primul element
echo "${my_array[1]}"  # Va afișa al doilea element
```
Poți obține lungimea unui array folosind `${#nume_array[@]}`:

```bash
echo "Lungimea array-ului este: ${#my_array[@]}"
```
> Exemplu 
```bash
#!/bin/bash

# Crearea array-ului
fruits=("Apple" "Banana" "Orange" "Grape")

# Lungimea array-ului
length=${#fruits[@]}

# Inițializarea indexului
index=0

# Parcurgerea array-ului și afișarea elementelor folosind o buclă while
while [ $index -lt $length ]; do
    echo "${fruits[$index]}"
    ((index++))
done

```
---
## Instrucțiuni de decizie

Instrucțiunile de decizie în shell script permit executarea diferitelor blocuri de cod în funcție de anumite condiții. În shell-ul Linux, cele mai utilizate instrucțiuni de decizie sunt `if`, `elif` (opțional), și `else`.

> Exemplu de utilizare a instrucțiunilor de decizie:

```bash
#!/bin/bash

# Verificăm dacă un număr este pozitiv, negativ sau zero
num=10

if [ $num -gt 0 ]; then
    echo "Numărul este pozitiv"
elif [ $num -lt 0 ]; then
    echo "Numărul este negativ"
else
    echo "Numărul este zero"
fi
```
---
Pentru a crea un script care să accepte opțiuni și argumente din linia de comandă, poți utiliza variabilele speciale $1, $2, etc., pentru a accesa argumentele și comanda getopts pentru a gestiona opțiunile.

- >Un exemplu simplu de script care acceptă două opțiuni -a și -b, fiecare urmată de un argument:

```bash
#!/bin/bash

# Setăm valorile implicite pentru argumente
arg_a=""
arg_b=""

# Parsăm opțiunile și argumentele folosind getopts
while getopts ":a:b:" opt; do
  case $opt in
    a)
      arg_a=$OPTARG
      ;;
    b)
      arg_b=$OPTARG
      ;;
    \?)
      echo "Opțiune invalidă: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Opțiunea -$OPTARG necesită un argument." >&2
      exit 1
      ;;
  esac
done

# Shift pentru a elimina opțiunile parcurse de getopts
shift $((OPTIND -1))

# Afișăm argumentele
echo "Argumentul pentru opțiunea -a: $arg_a"
echo "Argumentul pentru opțiunea -b: $arg_b"
echo "Alte argumente: $@"
```

```bash
./script.sh -a value1 -b value2 other_argument1 other_argument2
```
