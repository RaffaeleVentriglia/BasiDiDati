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

