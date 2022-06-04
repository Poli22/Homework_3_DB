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
  CodS SMALLINT NOT NULL,
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
  CodC SMALLINT,
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

INSERT INTO SQUADRA
VALUES(1, 'squadra_1', 1988, 'sede1');
INSERT INTO SQUADRA
VALUES(2, 'squadra_2', 1976, 'sede2');
INSERT INTO SQUADRA
VALUES(3, 'squadra_3', 1993, 'sede3');

INSERT INTO CICLISTA
VALUES(1, 'nome_1', 'cognome_1', 'nazionalita_1', 1, 1999);
INSERT INTO CICLISTA
VALUES(2, 'nome_2', 'cognome_2', 'nazionalita_2', 2, 1998);
INSERT INTO CICLISTA
VALUES(3, 'nome_3', 'cognome_3', 'nazionalita_3', 1, 1997);

INSERT INTO TAPPA
VALUES(1, 1, 'partenza_1', 'arrivo_1', 173, 568, 4);
INSERT INTO TAPPA
VALUES(1, 2, 'partenza_2', 'arrivo_2', 166, 204, 2);
INSERT INTO TAPPA
VALUES(1, 3, 'partenza_3', 'arrivo_3', 201, 803, 7);

INSERT INTO CLASSIFICA_INDIVIDUALE
VALUES(1, 1, 1, 1);
INSERT INTO CLASSIFICA_INDIVIDUALE
VALUES(2, 1, 1, 2);
INSERT INTO CLASSIFICA_INDIVIDUALE
VALUES(3, 1, 1, 3);