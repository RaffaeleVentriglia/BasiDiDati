/*
    Procedura 1: Applicazione di un'offerta ad un dato prodotto
*/
CREATE OR REPLACE PROCEDURE ApplicazioneOfferta(ProdottoDaScontare VARCHAR2, OffertaDaApplicare VARCHAR2) 
IS 
    ScontoDaApplicare  Offerta_prodotto.ScontoApplicato%type; 
    InizioOfferta      Offerta.DataInizio%type; 
    FineOfferta        Offerta.DataFine%type; 
BEGIN 
    SELECT ScontoApplicato INTO ScontoDaApplicare FROM Offerta_Prodotto 
    WHERE CodiceOfferta = OffertaDaApplicare;
    
    SELECT DataInizio, DataFine INTO InizioOfferta, FineOfferta FROM Offerta 
    WHERE CodiceOfferta = OffertaDaApplicare; 
    dbms_output.put_line(ProdottoDaScontare);

    IF InizioOfferta <= SYSDATE AND FineOfferta >= SYSDATE THEN 
        UPDATE Prodotto SET PrezzoProdotto = (PrezzoProdotto - (PrezzoProdotto * ScontoDaApplicare)) WHERE CodiceABarre = ProdottoDaScontare;
        COMMIT; 
    END IF; 
END;
-- per le prove: exec ApplicazioneOfferta('3877265963667', '731');

/*
    Procedura 2: Vendita dei prodotti
*/
CREATE OR REPLACE PROCEDURE VenditaProdotti(ProdottoDaVendere VARCHAR2, QuantitaDaVendere NUMBER, NumeroScontrino VARCHAR2, NumeroCassa VARCHAR2)
IS
    QuantitaProdottoTotali  NUMBER;
    QuantitaProdottoVendute NUMBER;
    QuantitaDisponibili     NUMBER;
BEGIN
    SELECT SUM(QuantitaProdotto) INTO QuantitaProdottoTotali FROM CaricoMerce_Prodotto
    WHERE CodiceABarre = ProdottoDaVendere;

    IF QuantitaProdottoTotali IS NULL
        THEN dbms_output.put_line('Prodotto non valido.');
        RETURN;
    END IF;
    
    SELECT SUM(QuantitaVendute) INTO QuantitaProdottoVendute FROM Scontrino_Prodotto
    WHERE CodiceABarre = ProdottoDaVendere;
    
    IF QuantitaProdottoVendute IS NULL
        THEN QuantitaProdottoVendute := 0;
    END IF;

    QuantitaDisponibili := QuantitaProdottoTotali - QuantitaProdottoVendute;
    IF QuantitaDisponibili - QuantitaDaVendere < 0
        THEN dbms_output.put_line('Prodotto esaurito.');
        RETURN;
    END IF;
    INSERT INTO SCONTRINO VALUES(NumeroScontrino, TRUNC(SYSDATE), NumeroCassa);
    COMMIT;
    INSERT INTO Scontrino_Prodotto VALUES(NumeroScontrino, TRUNC(SYSDATE), ProdottoDaVendere, QuantitaDaVendere);
    COMMIT;
    dbms_output.put_line('Le quantità disponibili sono: ' || TO_CHAR(QuantitaDisponibili - QuantitaDaVendere));
END;
-- per le prove: exec VenditaProdotti('3877265963667', 1, '020', '01');