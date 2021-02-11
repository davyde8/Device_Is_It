# Device_is_it

Account amministratore per gestire utenti e contenuti:	
email: admin@admin.it	
password: admin


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


Ecco alcune immagini:
![alt text](https://i.ibb.co/7jH1kJW/Schermata-2021-01-25-alle-22-59-26.png)
![alt text](https://i.ibb.co/7vb4WLK/Schermata-2021-01-25-alle-23-04-36.png)
![alt text](https://i.ibb.co/Kmmwpmz/Schermata-2021-01-25-alle-23-04-21.png)

