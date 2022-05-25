SET storage_engine=InnoDB;
CREATE DATABASE IF NOT EXISTS Campionato_Ciclistico;
USE Campionato_Ciclistico;
SET FOREIGN_KEY_CHECKS=1;

DROP TABLE IF EXISTS CLASSIFICA_INDIVIDUALE;
DROP TABLE IF EXISTS TAPPA;
DROP TABLE IF EXISTS CICLISTA;
DROP TABLE IF EXISTS SQUADRA;

CREATE TABLE SQUADRA(
  CodS SMALLINT,
  NomeS VARCHAR(50) NOT NULL,
  AnnoFondazione SMALLINT
  CHECK(AnnoFondazione >= 1900 AND AnnoFondazione <= 2000),
  SedeLegale VARCHAR(50) NULL,
  PRIMARY KEY(CodS)
);

CREATE TABLE CICLISTA(
  CodC SMALLINT,
  Nome VARCHAR(50) NOT NULL,
  Cognome VARCHAR(50) NOT NULL,
  Nazionalita VARCHAR(50) NOT NULL,
  CodS CHAR (5) NOT NULL,
  AnnoNascita SMALLINT,
  PRIMARY KEY(CodC),
  FOREIGN KEY(CodS) REFERENCES SQUADRA(CodS)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

CREATE TABLE TAPPA(
  Edizione SMALLINT,
  CodT SMALLINT,
  CittaPartenza VARCHAR(50) NOT NULL,
  CittaArrivo VARCHAR(50) NOT NULL,
  Lunghezza INT NOT NULL, -- rivedi
  Dislivello INT NOT NULL,
  GradoDifficolta TINYINT NOT NULL
  CHECK(GradoDifficolta >= 1 AND GradoDifficolta <= 10),
  PRIMARY KEY(Edizione, CodT)
);

CREATE TABLE CLASSIFICA_INDIVIDUALE(
  CodC CHAR(5),
  Edizione SMALLINT,
  CodT SMALLINT,
  Posizione SMALLINT NOT NULL,
  UNIQUE(Edizione, CodT, Posizione),
  PRIMARY KEY(CodC, CodT, Edizione),
  FOREIGN KEY(CodC) REFERENCES CICLISTA(CodC)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY(Edizione, CodT) REFERENCES TAPPA(Edizione, CodT)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);