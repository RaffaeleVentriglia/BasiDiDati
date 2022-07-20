--    Procedura 1: Applicazione di un'offerta ad un dato prodotto

CREATE OR REPLACE PROCEDURE ApplicazioneOfferta(ProdottoDaScontare VARCHAR2, OffertaDaApplicare VARCHAR2) 
IS 
    ScontoDaApplicare  Offerta_prodotto.ScontoApplicato%type; 
    InizioOfferta      Offerta.DataInizio%type; 
    FineOfferta        Offerta.DataFine%type;
    Ex_Offerta         EXCEPTION;
    Offerta_Scaduta    EXCEPTION;
BEGIN 
    SELECT ScontoApplicato INTO ScontoDaApplicare FROM Offerta_Prodotto 
    WHERE CodiceOfferta = OffertaDaApplicare;

    SELECT DataInizio, DataFine INTO InizioOfferta, FineOfferta FROM Offerta 
    WHERE CodiceOfferta = OffertaDaApplicare;

    IF SYSDATE BETWEEN InizioOfferta AND FineOfferta THEN 
        UPDATE Prodotto SET PrezzoProdotto = (PrezzoProdotto - (PrezzoProdotto * ScontoDaApplicare)) WHERE CodiceABarre = ProdottoDaScontare;
        dbms_output.put_line('Offerta applicata correttamente.');
        COMMIT;
    ELSE
        RAISE Offerta_Scaduta;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN RAISE_APPLICATION_ERROR(-20001, 'Offerta/Prodotto non valida/o.');
    WHEN Offerta_Scaduta
        THEN RAISE_APPLICATION_ERROR(-20001, 'Offerta scaduta.');
END;
/
-- per le prove: exec ApplicazioneOfferta('3877265963667', '731');


--    Procedura 2: Vendita dei prodotti

CREATE OR REPLACE PROCEDURE VenditaProdotti(ProdottoDaVendere VARCHAR2, QuantitaDaVendere NUMBER, NumeroScontrino VARCHAR2, NumeroCassa VARCHAR2)
IS
    QuantitaProdottoTotali  NUMBER;
    QuantitaProdottoVendute NUMBER;
    QuantitaDisponibili     NUMBER;
    ProdottoNonValido       EXCEPTION;
    ProdottoEsaurito        EXCEPTION;

BEGIN
    SELECT SUM(QuantitaProdotto) INTO QuantitaProdottoTotali FROM CaricoMerce_Prodotto
    WHERE CodiceABarre = ProdottoDaVendere;

    IF QuantitaProdottoTotali IS NULL
        THEN RAISE ProdottoNonValido;
    END IF;
    
    SELECT SUM(QuantitaVendute) INTO QuantitaProdottoVendute FROM Scontrino_Prodotto
    WHERE CodiceABarre = ProdottoDaVendere;
    
    IF QuantitaProdottoVendute IS NULL
        THEN QuantitaProdottoVendute := 0;
    END IF;

    QuantitaDisponibili := QuantitaProdottoTotali - QuantitaProdottoVendute;
    IF QuantitaDisponibili - QuantitaDaVendere < 0
        THEN RAISE ProdottoEsaurito;
    END IF;

    INSERT INTO SCONTRINO VALUES(NumeroScontrino, TRUNC(SYSDATE), NumeroCassa);
    COMMIT;
    INSERT INTO Scontrino_Prodotto VALUES(NumeroScontrino, TRUNC(SYSDATE), ProdottoDaVendere, QuantitaDaVendere);
    COMMIT;
    dbms_output.put_line('Le quantità disponibili sono: ' || TO_CHAR(QuantitaDisponibili - QuantitaDaVendere));
EXCEPTION
    WHEN ProdottoNonValido
        THEN RAISE_APPLICATION_ERROR(-20001, 'Prodotto non valido.');
    WHEN ProdottoEsaurito
        THEN RAISE_APPLICATION_ERROR(-20001, 'Prodotto esaurito.');
END;
/
-- per le prove: exec VenditaProdotti('3877265963667', 1, '020', '01');


--    Procedura 3: Il dipendente che ha fatto incassare di più nel mese precedente ottiene un aumento del 10% il mese prossimo.

CREATE OR REPLACE PROCEDURE CassierePiuProduttivo
IS
    CF                  Cassa.CFDip%type;
    UltimoContratto     Contratto.CodiceContratto%type;
    UltimoStipendio     Stipendio.ImportoStipendio%type;
    UltimeTrattenute    Stipendio.TrattenuteStipendio%type;
    DataUltimoStipendio Stipendio.DataStipendio%type;
BEGIN
    SELECT cs.CFDip, MAX(contr.CodiceContratto) INTO CF, UltimoContratto
    FROM Cassa cs JOIN Contratto contr ON cs.CFDip = contr.CFDip JOIN Scontrino scontr ON cs.NumCassa = scontr.NumCassa
    JOIN Scontrino_Prodotto scontr_prod ON scontr.NumScontrino = scontr_prod.NumScontrino JOIN Prodotto prod ON scontr_prod.CodiceABarre = prod.CodiceABarre 
    WHERE (FineContratto IS NULL OR (ADD_MONTHS(SYSDATE, 1) BETWEEN InizioContratto AND FineContratto)) AND TO_CHAR(ADD_MONTHS(SYSDATE, -1), 'MM-YYYY') = TO_CHAR(ADD_MONTHS(scontr.DataScontrino, -1), 'MM-YYYY')
    GROUP BY cs.CFDip
    ORDER BY SUM(prod.PrezzoProdotto) * SUM(QuantitaVendute) DESC
    FETCH FIRST 1 ROW ONLY;

    SELECT ImportoStipendio, TrattenuteStipendio, DataStipendio INTO UltimoStipendio, UltimeTrattenute, DataUltimoStipendio FROM Stipendio 
    WHERE CodiceContratto = UltimoContratto
    ORDER BY DataStipendio DESC
    FETCH FIRST 1 ROW ONLY;
    
    INSERT INTO Stipendio VALUES(UltimoStipendio + (UltimoStipendio * 0.1), UltimeTrattenute, ADD_MONTHS(DataUltimoStipendio, 1), UltimoContratto);
    COMMIT;
    dbms_output.put_line('Stipendio inserito con successo.');
EXCEPTION
    WHEN NO_DATA_FOUND
        THEN RAISE_APPLICATION_ERROR(-20001, 'Errore nei dati.');
END;
/
--exec CassierePiuProduttivo;
    

--    Procedura 4: Creazione di una promozione del 50% dei videogiochi meno venduto sulla console meno venduta

CREATE OR REPLACE PROCEDURE OffertaMenoVenduto
IS
    VideogiocoMenoVenduto   VARCHAR2(13);
    CodOfferta              VARCHAR2(3);
    Contatore               INTEGER;
    VideogiocoNonEsistente  EXCEPTION;

BEGIN
    SELECT MAX(vg.codiceabarre) INTO VideogiocoMenoVenduto
    FROM scontrino_prodotto sc JOIN videogioco vg ON sc.codiceabarre = vg.codiceabarre JOIN prodotto pr ON vg.codiceabarre = pr.codiceabarre
    GROUP BY sc.CodiceABarre
    HAVING MAX(PiattaformaV) = (
        SELECT MAX(nomeprodotto) as Console
        FROM scontrino_prodotto sc JOIN console con ON sc.codiceabarre = con.codiceabarre JOIN prodotto pr ON con.codiceabarre = pr.codiceabarre
        GROUP BY sc.codiceabarre
        HAVING SUM(quantitavendute) = (
            SELECT MIN(SUM(quantitavendute))
            FROM scontrino_prodotto sc JOIN console con ON sc.codiceabarre = con.codiceabarre
            GROUP BY con.codiceabarre
        )
    )
    FETCH FIRST 1 ROW only;

    IF VideogiocoMenoVenduto IS NULL
        THEN RAISE VideogiocoNonEsistente;
    END IF;

    SELECT COUNT(*) INTO Contatore FROM Offerta
    WHERE CodiceOfferta BETWEEN '800' AND '998';
    IF Contatore = 0
        THEN CodOfferta := '800';
    ELSIF
        SELECT MAX(CodiceOfferta) + 1 INTO CodOfferta FROM Offerta
        WHERE CodiceOfferta BETWEEN '800' AND '998';
    END IF;

    INSERT INTO Offerta VALUES (CodOfferta, SYSDATE, add_months(SYSDATE, 1));
    COMMIT;
    INSERT INTO Offerta_Prodotto VALUES(VideogiocoMenoVenduto, CodOfferta, 0.50);
    COMMIT;

EXCEPTION
    WHEN VideogiocoNonEsistente
        THEN RAISE_APPLICATION_ERROR(-20001, 'Non è stato venduto alcun videogioco per la piattaforma meno venduta.');
END;
/
-- Per le prove: exec OffertaMenoVenduto;