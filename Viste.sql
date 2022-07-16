-- vista che permette di visualizzare i dipendenti con contratti attivi

CREATE OR REPLACE VIEW RuoloDipendentiAttivi AS
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
    MAX(PiattaformaA1) AS Piattaforma_1, 
    MAX(PiattaformaA2) AS Piattaforma_2, 
    MAX(PiattaformaA3) AS Piattaforma_3, 
    MAX(PrezzoProdotto) AS Prezzo
FROM Accessorio Ac 
JOIN Prodotto Pr ON Ac.CodiceABarre = Pr.CodiceABarre 
JOIN Scontrino_Prodotto ScPr ON Ac.CodiceABarre = ScPr.CodiceABarre
GROUP BY Ac.CodiceABarre
ORDER BY SUM(QuantitaVendute) DESC
FETCH FIRST 10 ROW ONLY;
/