START TRANSACTION;
  INSERT INTO CICLISTA
  VALUES(4, 'nome_4', 'cognome_4', 'nazionalita_4', 2, 1996);
COMMIT;

START TRANSACTION
  INSERT INTO CLASSIFICA_INDIVIDUALE
  VALUES(4, 1, 1, 4);
COMMIT;
