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
BEGIN
    SELECT DNdipendente INTO DNnascita
    FROM Dipendente
    WHERE DNnascita = :new.DNdipendente;
    IF :new.DNdipendente > '01/01/2004'
    THEN
        RAISE_APPLICATION_ERROR(-2061, 'Dipendente minorenne');
    END IF;
END;