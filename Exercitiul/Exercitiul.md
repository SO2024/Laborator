# Problema:

Trebuie să dezvolvați o aplicație simplă de chat, care să permită utilizatorilor să trimită și să primească mesaje într-un chatroom. Până în prezent, problema este parțial rezolvată, oferindu-vă un șablon de proiect și cinci fișiere pentru a implementa funcționalitatea dorită:

> `Fișier de configurare (config.sh)`:
    Acest fișier va conține configurările necesare pentru aplicație, cum ar fi adresele URL ale endpoint-urilor pentru preluarea utilizatorilor și mesajelor, precum și alte setări relevante.

> `Fișier de autentificare (auth.sh)`:
    Acest fișier va conține o funcție pentru autentificarea utilizatorilor în aplicație. Utilizatorii vor trimite un nume de utilizator, iar apoi li se va returna un ID de utilizator, care va fi utilizat pentru a trimite mesaje și a identifica utilizatorul în chat.

> `Fișier pentru setarea ID-ului chatului (set_chat_id.sh)`:
    Acest fișier va conține o funcție pentru a seta ID-ul chatului în aplicație. Acest ID va fi utilizat pentru a trimite mesaje către chatroom-ul specificat.

> `Fișier pentru trimiterea mesajelor (send_message.sh)`:
    Acest fișier va conține o funcție pentru trimiterea mesajelor către chatroom-ul specificat. În plus față de mesaj, utilizatorii vor putea cripta mesajul înainte de a-l trimite.

> `Fișier pentru afișarea mesajelor (display_messages.sh)`:
    Acest fișier va conține o funcție pentru a afișa mesajele primite în chatroom-ul specificat. Mesajele primite vor fi decriptate și în locul ID-ului utilizatorului vor fi afișate numele de utilizator corespunzător. Numele de utilizator și ID-ul utilizatorului vor fi accesate de la un endpoint al aplicației.

> `Fisierul pentru generarea unui chatroom (chatGenerator.sh)`:
    acest fisier are ca scop, verificarea daca exista, astfel de chat room, in caz ca nu exista il creeaza

Vă rug să completați secțiunile `TODO` din fișiere pentru a finaliza implementarea funcționalității dorite.                                              