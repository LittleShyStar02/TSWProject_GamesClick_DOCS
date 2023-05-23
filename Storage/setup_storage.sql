DROP DATABASE IF EXISTS TSWProject;
CREATE DATABASE IF NOT EXISTS TSWProject;
USE TSWProject;

/*
  TABLE: Amministratore
*/
CREATE TABLE IF NOT EXISTS Amministratore
(
  IDAdmin INT NOT NULL AUTO_INCREMENT UNIQUE,
  Nome VARCHAR(32) NOT NULL,
  Cognome VARCHAR(32) NOT NULL,
  Email VARCHAR(128)  NOT NULL UNIQUE,
  Password VARCHAR(32) NOT NULL,
  DataNascita DATE,
  Indirizzo VARCHAR(64) NOT NULL,
  PRIMARY KEY(IDAdmin)
);

/*
  TABLE: Gioco
*/
CREATE TABLE IF NOT EXISTS Gioco
(
  IDGioco INT NOT NULL AUTO_INCREMENT UNIQUE,
  Nome VARCHAR(32) NOT NULL UNIQUE,
  Descrizione VARCHAR(2000),
  Prezzo DOUBLE NOT NULL,
  DataRilascio DATE NOT NULL,
  EtaMinima INT,
  PreviewUrl VARCHAR(256),
  IDAdmin INT NOT NULL,
  PRIMARY KEY(IDGioco),
  FOREIGN KEY (IDAdmin) REFERENCES Amministratore(IDAdmin)
);

/*
  TABLE: Console
*/
CREATE TABLE IF NOT EXISTS Console
(
  IDConsole INT NOT NULL AUTO_INCREMENT UNIQUE,
  Nome VARCHAR(32) NOT NULL,
  Descrizione VARCHAR(2000),
  PRIMARY KEY(IDConsole)
);

/*
  TABLE: EsecuzioneGioco
*/
CREATE TABLE IF NOT EXISTS EsecuzioneGioco
(
  IDConsole INT NOT NULL,
  IDGioco INT NOT NULL,
  FOREIGN KEY (IDConsole) REFERENCES Console(IDConsole),
  FOREIGN KEY (IDGioco) REFERENCES Gioco(IDGioco)
);

/*
  TABLE: Categoria
*/
CREATE TABLE IF NOT EXISTS Categoria
(
  IDCategoria INT NOT NULL AUTO_INCREMENT UNIQUE,
  Nome VARCHAR(32) NOT NULL,
  Descrizione VARCHAR(2000),
  PRIMARY KEY(IDCategoria)
);

/*
  TABLE: CategoriaGioco
*/
CREATE TABLE IF NOT EXISTS CategoriaGioco
(
  IDCategoria INT NOT NULL,
  IDGioco INT NOT NULL,
  FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria),
  FOREIGN KEY (IDGioco) REFERENCES Gioco(IDGioco)
);

/*
  TABLE: Utente
*/
CREATE TABLE IF NOT EXISTS Utente
(
  IDUtente INT NOT NULL AUTO_INCREMENT UNIQUE,
  Nome VARCHAR(32) NOT NULL,
  Cognome VARCHAR(32) NOT NULL,
  Email VARCHAR(128)  NOT NULL UNIQUE,
  Password VARCHAR(32) NOT NULL,
  DataNascita DATE,
  Indirizzo VARCHAR(64) NOT NULL,
  PRIMARY KEY(IDUtente)
);

/*
  TABLE: Recensione (?)
*/
CREATE TABLE IF NOT EXISTS Recensione
(
  IDRecensione INT NOT NULL AUTO_INCREMENT UNIQUE,
  IDUtente INT NOT NULL,
  IDGioco INT NOT NULL,
  Testo VARCHAR(2000),
  PRIMARY KEY(IDRecensione),
  FOREIGN KEY (IDUtente) REFERENCES Utente(IDUtente),
  FOREIGN KEY (IDGioco) REFERENCES Gioco(IDGioco)
);

/*
  TABLE: Acquisto
*/
CREATE TABLE IF NOT EXISTS Acquisto
(
  IDAcquisto INT NOT NULL AUTO_INCREMENT UNIQUE,
  IDUtente INT NOT NULL,
  IDGioco INT NOT NULL,
  Quantita INT NOT NULL,
  DataAcquisto DATE NOT NULL,
  OrarioAcquisto DATE NOT NULL,
  PRIMARY KEY(IDAcquisto),
  FOREIGN KEY (IDUtente) REFERENCES Utente(IDUtente),
  FOREIGN KEY (IDGioco) REFERENCES Gioco(IDGioco)
);

/*
  TABLE: Carrello
*/
CREATE TABLE IF NOT EXISTS Carrello
(
  IDCarrello INT NOT NULL AUTO_INCREMENT UNIQUE,
  IDAcquisto INT NOT NULL,
  PRIMARY KEY(IDCarrello),
  FOREIGN KEY(IDAcquisto) REFERENCES Acquisto(IDAcquisto)
);

/*
  TABLE: Pagamento
*/
CREATE TABLE IF NOT EXISTS Pagamento
(
  IDPagamento INT NOT NULL AUTO_INCREMENT UNIQUE,
  IDUtente INT NOT NULL,
  Ammonto DOUBLE NOT NULL,
  DataPagamento DATE NOT NULL,
  OrarioPagamento DATE NOT NULL,
  PRIMARY KEY(IDPagamento),
  FOREIGN KEY (IDUtente) REFERENCES Utente(IDUtente)
);

/*
  Insert Console
*/
INSERT INTO Console(Nome,Descrizione) VALUES("Nintendo Switch","Nintendo Switch, inizialmente conosciuta con il nome in codice di NX, è una console a 64 bit di natura ibrida sviluppata da Nintendo e distribuita in tutto il mondo a partire dal 3 marzo 2017.");
INSERT INTO Console(Nome,Descrizione) VALUES("Xbox Series","Xbox Series X e Xbox Series S (collettivamente Xbox Series X/S) sono console per videogiochi prodotte da Microsoft. Annunciate come successori di Xbox One durante l'E3 2019 sotto il nome di Project Scarlett, sono state commercializzate in tutto il mondo a partire dal 10 novembre 2020.");
INSERT INTO Console(Nome,Descrizione) VALUES("PlayStation 4","PlayStation 4 (abbreviata con la sigla PS4) è una console per videogiochi prodotta da Sony Interactive Entertainment, dotata di varie funzioni multimediali oltre a quelle di intrattenimento videoludico. Annunciata come successore di PlayStation 3 da Andrew House il 20 febbraio 2013 in Europa durante il PlayStation Meeting, tenutosi a Manhattan, New York, la console è disponibile dal 15 novembre del 2013 nel Nord America e dal 29 novembre del 2013 in Europa e Sud America, mentre in Giappone dal 22 febbraio del 2014 includendo la versione digitale del gioco Knack. Fa parte dell'ottava generazione di console e compete commercialmente con Wii U e Nintendo Switch di Nintendo e Xbox One di Microsoft.");
INSERT INTO Console(Nome,Descrizione) VALUES("PlayStation 5","La PlayStation 5 (abbreviata con la sigla PS5) è una console per videogiochi prodotta da Sony Interactive Entertainment. Annunciata come successore di PlayStation 4 il 16 aprile 2019 in un'intervista a Wired e ufficialmente il 7 gennaio 2020 al CES di Las Vegas, fa parte della nona generazione di console, e compete commercialmente con Xbox Series X/S di Microsoft. Il design è stato reso noto l'11 giugno 2020, e la console è in vendita in Nord America e in Giappone dal 12 novembre 2020, e in Europa dal 19 novembre 2020.");

/*
  Insert Categorie Giochi
*/
INSERT INTO Categoria(Nome,Descrizione) VALUES("Azione","Giochi dove si combatte, spesso con armi tipo pistole e simili");
INSERT INTO Categoria(Nome,Descrizione) VALUES("Avventura","Giochi basati sull'esplorazione");
INSERT INTO Categoria(Nome,Descrizione) VALUES("Giochi di ruolo","Giochi in cui devi interagire con altri personaggio o altre persone");
INSERT INTO Categoria(Nome,Descrizione) VALUES("Simulazione","Giochi di simulazione come simulazione volo, guida auto e altri veivoli e simili");
INSERT INTO Categoria(Nome,Descrizione) VALUES("Strategia","Devi essere abile e muovere le pedine sul campo altrimenti sei finito!");
INSERT INTO Categoria(Nome,Descrizione) VALUES("MMORPG","Gioco Open World con meccaniche MMO e allo stesso tempo gioco di ruolo");
INSERT INTO Categoria(Nome,Descrizione) VALUES("Open World","");
INSERT INTO Categoria(Nome,Descrizione) VALUES("Horror","Gioco che ha contenuti soprannaturali spaventosi come rituali satanici, demoni e simili");
INSERT INTO Categoria(Nome,Descrizione) VALUES("Altro","Gioco che non rientra nelle altre categorie");