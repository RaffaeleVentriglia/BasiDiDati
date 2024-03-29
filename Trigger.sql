--    controlla se il dipendente inserito abbia un'età
--    inferiore ai 18 anni o superiore ai 60.

CREATE OR REPLACE TRIGGER EtaDip
BEFORE INSERT ON Dipendente
FOR EACH ROW
DECLARE
    etaDipendente NUMBER := (sysdate - :new.DNDipendente) / 365;
    Check_Eta EXCEPTION;
BEGIN
    IF etaDipendente NOT BETWEEN 18 AND 60
        THEN RAISE Check_Eta;
    END IF;
EXCEPTION
    WHEN Check_Eta
        THEN RAISE_APPLICATION_ERROR(-20001, 'Dipendente troppo piccolo o troppo grande.');
END;
/


--    il dipendente non può iniziare un nuovo turno senza che
--    quello precedente sia finito

CREATE OR REPLACE TRIGGER Controllo_Turno
BEFORE INSERT ON Presenza
FOR EACH ROW
DECLARE
    Turno presenza.ULtimaOra%Type;
    Check_Turno EXCEPTION;
BEGIN
    SELECT MAX(UltimaOra) INTO Turno FROM presenza where CFDip = :new.CFDip;
    IF Turno > :new.PrimaOra
        THEN raise Check_Turno;
    END IF;
EXCEPTION
    WHEN Check_Turno
        THEN RAISE_APPLICATION_ERROR(-20001, 'Errore nei turni inseriti');
END;
/


--    il dipendente non può effettuare più di 9 ore di lavoro, considerando
--    anche l'ora di pranzo

CREATE OR REPLACE TRIGGER Ore_Lavoro
BEFORE INSERT ON Presenza
FOR EACH ROW
DECLARE
    Durata_Turno NUMBER := (cast(:new.UltimaOra as date) - cast(:new.PrimaOra as date)) * 24 * 60;
    Check_Ore_Lavoro EXCEPTION;
BEGIN
    IF Durata_Turno > 540
        THEN RAISE Check_Ore_Lavoro;
    END IF;
EXCEPTION
    WHEN Check_Ore_Lavoro
        THEN RAISE_APPLICATION_ERROR(-20001, 'Ore di lavoro superate');
END;
/


--    per una politica aziendale, il negozio apre alle ore 9 e chiude alle ore 21, e quindi
--    la presenza di un dipendente non può andare oltre questi orari

CREATE OR REPLACE TRIGGER AperturaChiusura
BEFORE INSERT ON Presenza
FOR EACH ROW
DECLARE
    InizioTurno NUMBER := extract(HOUR FROM :new.PrimaOra);
    FineTurno NUMBER := extract(HOUR FROM :new.UltimaOra);
    Check_Apertura_Chiusura EXCEPTION;
BEGIN
    IF (InizioTurno < 9 OR InizioTurno > 20) OR (FineTurno > 21 OR FineTurno <= 9)
        THEN RAISE Check_Apertura_Chiusura;
    END IF;
EXCEPTION
    WHEN Check_Apertura_Chiusura
        THEN RAISE_APPLICATION_ERROR(-20001, 'Orari di inizio o fine turno errati');
END;
/


--    tra tutti i ruoli, solamente gli scaffalisti non hanno accesso
--    al portale, e quindi non devono avere le credenziali

CREATE OR REPLACE TRIGGER AccessoPortale
BEFORE INSERT ON Dipendente
FOR EACH ROW
DECLARE
    Check_Accesso_Portale EXCEPTION;
BEGIN
    IF(INITCAP(:new.Ruolo) = 'Scaffalista' OR INITCAP(:new.Ruolo) = 'Tecnico') AND :new.Username IS NOT NULL
          THEN RAISE Check_Accesso_Portale;
    END IF;
EXCEPTION
    WHEN Check_Accesso_Portale
        THEN RAISE_APPLICATION_ERROR(-20001, 'Il dipendente non ha accesso al portale');
END;
/


--    controllare se lo stipendio è sufficiente in base al ruolo del dipendente

CREATE OR REPLACE TRIGGER MinStipendio
BEFORE INSERT ON Stipendio
FOR EACH ROW
DECLARE
    mansione VARCHAR2(20);
    contatore NUMBER;
    Check_Stipendio EXCEPTION;
BEGIN
    SELECT COUNT(*), ruolo INTO contatore, mansione FROM Dipendente dip JOIN contratto contr on dip.CFDip = contr.CFDip
    WHERE contr.CodiceContratto = :new.CodiceContratto
    GROUP BY contr.CFDip, Ruolo;
    IF contatore > 0 THEN
        IF :new.ImportoStipendio < 1250 AND mansione = 'Scaffalista'
            THEN RAISE Check_Stipendio;
        ELSIF :new.ImportoStipendio < 1900 AND mansione = 'Magazziniere'
            THEN RAISE Check_Stipendio;
        ELSIF :new.ImportoStipendio < 1500 AND mansione = 'Cassiere'
            THEN RAISE Check_Stipendio;
        ELSIF :new.ImportoStipendio < 2200 AND mansione = 'Tecnico'
            THEN RAISE Check_Stipendio;
        ELSIF :new.ImportoStipendio < 2500 AND mansione = 'Dirigente'
            THEN RAISE Check_Stipendio;
        END IF;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        IF :new.ImportoStipendio <= 1250
            THEN RAISE Check_Stipendio;
        END IF;
    WHEN Check_Stipendio
        THEN raise_application_error(-20001,'Stipendio inferiore a quello minimo per questa data mansione.');
END;
/


--    controllo del massimo numero di dipendenti

CREATE OR REPLACE TRIGGER MaxDipendenti
BEFORE INSERT ON Dipendente
FOR EACH ROW
DECLARE
    num_dipendenti NUMBER;
    Check_Max_Dipendenti EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO num_dipendenti FROM DIPENDENTE;
    IF num_dipendenti = 25
        THEN RAISE Check_Max_Dipendenti;
    END IF;
EXCEPTION
    WHEN Check_Max_Dipendenti
        THEN RAISE_APPLICATION_ERROR(-20001, 'Numero massimo di dipendenti raggiunto.');
END;
/


-- trigger che controlla le scadenze per ogni tipo di contratto

CREATE OR REPLACE TRIGGER ContrattoValido
BEFORE INSERT ON Contratto
FOR EACH ROW
DECLARE
    Check_Contratto EXCEPTION;
BEGIN
    IF :new.FineContratto > SYSDATE AND INITCAP(:new.TipoContratto) = 'Indeterminato' AND :new.FineContratto IS NOT NULL
        THEN RAISE Check_Contratto;
    ELSIF (INITCAP(:new.TipoContratto) = 'Part-Time' OR INITCAP(:new.TipoContratto) = 'Determinato') AND :new.FineContratto IS NULL
        THEN RAISE Check_Contratto;
    END IF;
EXCEPTION
    WHEN Check_Contratto
        THEN RAISE_APPLICATION_ERROR(-20001, 'La scadenza inserita per questo contratto non e'' valida.');
END;