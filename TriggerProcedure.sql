-- TRIGGER

/*
    trigger 1: controlla se, all'inserimento della tupla di un dipendente,
    questo sia minorenne, e nel caso in cui lo fosse ritornerà l'errore
    'Dipendente minorenne'
*/

CREATE OR REPLACE TRIGGER Minorenne
BEFORE INSERT ON Dipendente
FOR EACH ROW
DECLARE
    Check_Minorenne EXCEPTION;
BEGIN
    IF (((sysdate - :new.DNdipendente) / 365) < 18)
    THEN
        RAISE Check_Minorenne;
    END IF;
EXCEPTION
    WHEN Check_Minorenne
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'Dipendente minorenne');
END;

/*
    trigger 2: il dipendente non può iniziare un nuovo turno o presenza, senza che
               quello precedente sia finito
*/

/*
    trigger 3: il dipendente non può effettuare più di 9 ore di lavoro, considerando
               anche l'ora di pranzo
*/

CREATE OR REPLACE TRIGGER Ore_Lavoro
BEFORE INSERT ON Presenza
FOR EACH ROW
DECLARE
    Durata_Turno NUMBER := EXTRACT(HOUR FROM :new.UltimaOra - :new.PrimaOra);
    Check_Ore_Lavoro EXCEPTION;
BEGIN
    IF Durata_Turno > 9
    THEN
        RAISE Check_Ore_Lavoro;
    END IF;
EXCEPTION
    WHEN Check_Ore_Lavoro
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'Ore di lavoro superate');
END;

/*
    trigger 4: per una politica aziendale, il negozio apre alle ore 9 e chiude alle ore 21, e quindi
               la presenza di un dipendente non può andare oltre questi orari
*/

CREATE OR REPLACE TRIGGER AperturaChiusura
BEFORE INSERT ON Presenza
FOR EACH ROW
DECLARE
    InizioTurno NUMBER := extract(HOUR FROM :new.PrimaOra);
    FineTurno NUMBER := extract(HOUR FROM :new.UltimaOra);
    Check_Apertura_Chiusura EXCEPTION;
BEGIN
    IF (InizioTurno < 9 OR InizioTurno > 20) OR (FineTurno > 21 OR FineTurno <= 9)
    THEN
        RAISE Check_Apertura_Chiusura;
    END IF;
EXCEPTION
    WHEN Check_Apertura_Chiusura
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'Orari di inizio o fine turno errati');
END;

/*
    trigger 5: solo i cassieri e i magazzinieri hanno accesso al portale del magazzino,
               quindi uno scaffalista non ha credenziali di accesso


    trigger 6: 
*/



-- PROCEDURE

/*

    procedura 1: promuove l'impiegato che lavora di più


    procedura 2: converte i soldi spesi in punti tessera

*/