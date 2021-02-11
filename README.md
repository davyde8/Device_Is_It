# Device_is_it

Device Is It è un sito web che si occupa di recensire e pubblicare articoli riguardanti dispositivi elettronici. L’obiettivo principale del sito è quello di fornire ai suoi visitatori un’idea di quali siano i dispositivi presenti sul mercato, delle loro caratteristiche e di come questi possano, attraverso le loro funzionalità, migliorare la quotidianità di un individuo. 

Il sito offre ai visitatori la possibilità di leggere schede tecniche, recensioni e articoli riguardanti dispositivi elettronici. Il sito offre, inoltre, la possibilità di registrarsi per poter usufruire di funzioni più particolari, quali: la possibilità di commentare, valutare un contenuto e condividerlo, di effettuare la ricerca di contenuti riguardanti un particolare dispositivo utilizzando la barra di ricerca presente nel sito. Inoltre, un utente registrato, può sottoscriversi alla Newsletter per ricevere aggiornamenti riguardo l’aggiunta di nuovi contenuti all’interno del sito e può, qualora desiderasse farlo, modificare le informazioni riguardanti il proprio profilo inserite al momento dell’iscrizione.

Nel sito è presente anche un tipo particolare di utente, quello dell’amministratore:
egli, oltre le funzioni di un utente registrato comune, ha la possibilità di usufruire di funzionalità aggiuntive come la creazione e la pubblicazione di un nuovo contenuto, la modifica o l’eliminazione di un contenuto già presente nella piattaforma. L’utente amministratore può, ancora, moderare e rispondere ai commenti pubblicati da altri utenti. 
L’utente amministratore, inoltre, ha accesso alle informazioni degli utenti registrati (ad esclusione della password) e può decidere, qualora lo ritenesse necessario, di bloccare o di eliminare definitivamente il profilo di un utente, impedendogli di utilizzare le funzioni sopra elencate. Sotto richiesta esplicita di un utente, l’amministratore può modificare i dati inseriti dall’utente al momento dell’iscrizione, ad esclusione della password che , invece, sarà generata automaticamente e sarà sconosciuta all’amministratore.


Ecco alcune immagini:
![alt text](https://i.ibb.co/7jH1kJW/Schermata-2021-01-25-alle-22-59-26.png)
![alt text](https://i.ibb.co/7vb4WLK/Schermata-2021-01-25-alle-23-04-36.png)
![alt text](https://i.ibb.co/Kmmwpmz/Schermata-2021-01-25-alle-23-04-21.png)



ISTRUZIONI:

Fasi da seguire per importare il database:

1) Crea una nuova cartella chiamata "postgresDB" sul progetto
2) Apri Docker e lanciare un'immagine Postgres sulla porta 5432 caricando come volume la cartella creata al passo precedente

 Esempio del codice da eseguire ( sostituire "pathTuaCartella" con il path della cartella creata al punto 1)

 docker run --rm --name pg-docker_device_is_it  -e POSTGRES_PASSWORD=postgres -d -p 5432:5432 -v "pathTuaCartella":/var/lib/postgresql/data postgres

3) Apri pgAdmin e creare un nuovo Server (se necessario).

	Dati richiesti da inserire su General:
		- Nome:  Device Is It
	Dati richiesti da inserire su Connection:
		-  Host / name address: localhost
		-  Port: 5432
		-  Username: postgres
		-  Password: postgres 
	Salva
		
		
4) Crea un nuovo Database sul Server appena creato 
	Dati richiesti da inserire su General:
		- Database: deviceIsIt  (importante: il nome del Database è key sensitive)
	Salva 

5) Clicca con il tasto destro sul Database appena creato e selezionare "Restore"
6) Clicca su Filename e seleziona il file "DB_device_is_it.backup" che si trova nella cartella "Backup Database" e poi su Restore
7) Il Database è stato importato correttamente.  

In caso di problemi col  DB è possibile ripristinare il database su PGAdmin attraverso il file backup "db_device_is_it.backup".


Account amministratore per gestire utenti e contenuti:	
email: admin@admin.it	
password: admin


