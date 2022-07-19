-- vista che permette di visualizzare i dipendenti con contratti attivi

CREATE OR REPLACE VIEW DipendentiAttivi AS
SELECT 
    Dip.CFDip, 
    NomeDipendente, 
    CognomeDipendente, 
    Ruolo, 
    CodiceContratto
FROM Dipendente Dip JOIN Contratto Contr ON Dip.CFDip = Contr.CFDip
WHERE FineContratto IS NULL OR SYSDATE BETWEEN InizioContratto AND FineContratto;
/

-- vista che permette di visualizzare i dipendenti in ferie

CREATE OR REPLACE VIEW DipendentiInFerie AS
SELECT 
    Dip.CFDip, 
    NomeDipendente, 
    CognomeDipendente, 
    InizioFerie, 
    FineFerie, 
    Retribuzione
FROM Dipendente Dip JOIN Ferie Fr ON Dip.CFDip = Fr.CFDip
WHERE SYSDATE BETWEEN InizioFerie AND FineFerie;
/

-- vista che permette di visualizzare i primi 10 videogiochi più venduti

CREATE OR REPLACE VIEW ClassificaVideogiochi AS
SELECT 
    Vg.CodiceABarre AS CodiceABarre, 
    SUM(QuantitaVendute) AS Quantita_Vendute, 
    MAX(NomeProdotto) AS Videogioco, 
    MAX(PrezzoProdotto) AS Prezzo
FROM Videogioco Vg 
JOIN Prodotto Pr ON Vg.CodiceABarre = Pr.CodiceABarre 
JOIN Scontrino_Prodotto ScPr ON Vg.CodiceABarre = ScPr.CodiceABarre
GROUP BY Vg.CodiceABarre
ORDER BY SUM(QuantitaVendute) DESC
FETCH FIRST 10 ROW ONLY;
/

-- vista che permette di visualizzare le prime 10 console più vendute

CREATE OR REPLACE VIEW ClassificaConsole AS
SELECT 
    Cn.CodiceABarre AS CodiceABarre, 
    SUM(QuantitaVendute) AS Quantita_Vendute, 
    MAX(NomeProdotto) AS Console, 
    MAX(CapienzaConsole) AS Capienza_Console, 
    MAX(PrezzoProdotto) AS Prezzo
FROM Console Cn 
JOIN Prodotto Pr ON Cn.CodiceABarre = Pr.CodiceABarre 
JOIN Scontrino_Prodotto ScPr ON Cn.CodiceABarre = ScPr.CodiceABarre
GROUP BY Cn.CodiceABarre
ORDER BY SUM(QuantitaVendute) DESC
FETCH FIRST 10 ROW ONLY;
/

-- vista che permette di visualizzare i primi 10 accessori più venduti

CREATE OR REPLACE VIEW ClassificaAccessori AS
SELECT 
    Ac.CodiceABarre AS CodiceABarre, 
    SUM(QuantitaVendute) AS Quantita_Vendute, 
    MAX(NomeProdotto) AS Accessorio, 
    MAX(PiattaformaA) AS Piattaforma, 
    MAX(PrezzoProdotto) AS Prezzo
FROM Accessorio Ac 
JOIN Prodotto Pr ON Ac.CodiceABarre = Pr.CodiceABarre 
JOIN Scontrino_Prodotto ScPr ON Ac.CodiceABarre = ScPr.CodiceABarre
GROUP BY Ac.CodiceABarre
ORDER BY SUM(QuantitaVendute) DESC
FETCH FIRST 10 ROW ONLY;
/


-- vista che permette di visualizzare gli scontrini con annesso prezzo totale

CREATE OR REPLACE VIEW TotaleScontrini AS
SELECT 
    scontr_prod.NumScontrino AS Numero_Scontrino, 
    scontr_prod.DataScontrino AS Data_Scontrino, 
    MAX(scontr.NumCassa) as Cassa, 
    SUM(prod.PrezzoProdotto) * SUM(scontr_prod.QuantitaVendute) AS Totale
FROM Cassa cs JOIN Scontrino scontr on cs.NumCassa = scontr.NumCassa
JOIN Scontrino_Prodotto scontr_prod ON scontr.NumScontrino = scontr_prod.NumScontrino JOIN Prodotto prod ON scontr_prod.CodiceABarre = prod.CodiceABarre
GROUP BY scontr_prod.NumScontrino, scontr_prod.DataScontrino
ORDER BY scontr_prod.DataScontrino DESC;