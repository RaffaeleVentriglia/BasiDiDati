/*
    Trigger che controlla se, all'inserimento della tupla di un dipendente,
    questo sia minorenne, e nel caso in cui lo fosse ritornerà l'errore
    'Dipendente minorenne'
*/

CREATE TRIGGER Minorenne
BEFORE INSERT ON Dipendente
FOR EACH ROW
DECLARE
    DNnascita DATE;
    Check_Minorenne EXCEPTION;
BEGIN
    SELECT DNdipendente INTO DNnascita
    FROM Dipendente
    WHERE DNnascita = :new.DNdipendente;
    IF (FLOOR((sysdate - :new.DNdipendente) / 365) < 17)
    THEN
        RAISE Check_Minorenne;
    END IF;
EXCEPTION
    WHEN Check_Minorenne
    THEN
        RAISE_APPLICATION_ERROR(-20001, 'Dipendente minorenne');
END;

/*
    Procedura che controlla se, dopo l'inserimento della tupla di una tessera,
    siano presenti almeno 50 punti, e nel caso in cui ci fossero allora il cliente
    riceve uno sconto sullo scontrino di Euro 20
*/

CREATE OR REPLACE PROCEDURE PuntiTessera (SogliaPunti NUMBER) IS
CURSOR PROVA IS
SELECT Punti
    FROM Tessera
    WHERE Punti >= 50;
BEGIN
    
END;