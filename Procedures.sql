/*
    Procedura 1: Applicazione di un'offerta ad un dato prodotto
*/
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

    IF InizioOfferta <= SYSDATE AND FineOfferta >= SYSDATE THEN 
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
-- per le prove: exec ApplicazioneOfferta('3877265963667', '731');

/*
    Procedura 2: Vendita dei prodotti
*/
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
-- per le prove: exec VenditaProdotti('3877265963667', 1, '020', '01');

/*
    Procedura 3: Rinnovo del contratto di un dipendente
*/




/*
    Procedura 4: Creazione di una promozione del 50% dei videogiochi meno venduto sulla console meno venduta
*/
CREATE OR REPLACE PROCEDURE OffertaMenoVenduto
IS
VideogiocoMenoVenduto   VARCHAR2(13);
CodOfferta              VARCHAR2(3);
OffertaProva            VARCHAR2(3);
VideogiocoNonEsistente  EXCEPTION;

BEGIN
    select max(vg.codiceabarre) into VideogiocoMenoVenduto
    from scontrino_prodotto sc join videogioco vg on sc.codiceabarre = vg.codiceabarre join prodotto pr on vg.codiceabarre = pr.codiceabarre
    group by sc.codiceabarre
    having max(piattaformav) = (
        select max(nomeprodotto) as Console
        from scontrino_prodotto sc join console con on sc.codiceabarre = con.codiceabarre join prodotto pr on con.codiceabarre = pr.codiceabarre
        group by sc.codiceabarre
        having sum(quantitavendute) = (
            select min(sum(quantitavendute))
            from scontrino_prodotto sc join console con on sc.codiceabarre = con.codiceabarre
            group by con.codiceabarre
        )
    )
    fetch first 1 row only;

    IF VideogiocoMenoVenduto IS NULL
        THEN RAISE VideogiocoNonEsistente;
    END IF;
    
    /*LOOP
        CodOfferta := TO_CHAR(FLOOR(dbms_random.value(900, 999)));
        dbms_output.put_line(CodOfferta);
        OffertaProva := NULL;
        SELECT CodiceOfferta INTO OffertaProva FROM Offerta WHERE CodiceOfferta = CodOfferta;
        IF OffertaProva IS NULL
            THEN exit;
        END IF;
    END LOOP;*/

    INSERT INTO Offerta VALUES (CodOfferta, SYSDATE, add_months(SYSDATE, 1));
    INSERT INTO Offerta_Prodotto VALUES(VideogiocoMenoVenduto, CodOfferta, 0.50);

EXCEPTION
    WHEN VideogiocoNonEsistente
        THEN RAISE_APPLICATION_ERROR(-20001, 'Non è stato venduto alcun videogioco per la piattaforma meno venduta.');
END;
/
-- Per le prove: exec OffertaMenoVenduto;

/*
    Procedura 5: Ripristino prezzo del prodotto prima dell'offerta.
*/