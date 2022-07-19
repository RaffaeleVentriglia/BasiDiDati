CREATE USER Dirigente IDENTIFIED BY DirigenteNegozio;
CREATE USER Tecnico IDENTIFIED BY TecnicoDB;
CREATE USER Cassiere IDENTIFIED BY CassiereNegozio;
CREATE USER Magazziniere IDENTIFIED BY MagazziniereNegozio;

-- PERMESSI PER IL TECNICO
GRANT ALL PRIVILEGES TO Tecnico;

-- PERMESSI PER IL DIRIGENTE
GRANT SELECT, INSERT, UPDATE ON Credenziali TO Dirigente;
GRANT SELECT, INSERT, UPDATE ON Dipendente TO Dirigente;
GRANT SELECT ON Presenza TO Dirigente;
GRANT SELECT ON DipendentiAttivi TO Dirigente;
GRANT SELECT ON DipendentiInFerie TO Dirigente;
GRANT SELECT ON Cassa TO Dirigente;
GRANT SELECT ON Scontrino TO Dirigente;
GRANT SELECT ON Prodotto TO Dirigente;
GRANT SELECT ON Offerta TO Dirigente; 
GRANT SELECT ON Offerta_Prodotto TO Dirigente;
GRANT SELECT ON Scontrino_Prodotto TO Dirigente;
GRANT SELECT ON Fornitore TO Dirigente;
GRANT SELECT ON CaricoMerce TO Dirigente;
GRANT SELECT ON CaricoMerce_Prodotto TO Dirigente;
GRANT SELECT ON ClassificaVideogiochi TO Dirigente;
GRANT SELECT ON ClassificaAccessori TO Dirigente;
GRANT SELECT ON ClassificaConsole TO Dirigente;
GRANT ALL ON Contratto TO Dirigente;
GRANT ALL ON Stipendio TO Dirigente;
GRANT EXECUTE ON ApplicazioneOfferta TO Dirigente;
GRANT EXECUTE ON CassierePiuProduttivo TO Dirigente;
GRANT EXECUTE ON OffertaMenoVenduto TO Dirigente;

-- PERMESSI PER IL CASSIERE
GRANT SELECT ON TotaleScontrini TO Cassiere;
GRANT SELECT ON Prodotto TO Cassiere;
GRANT SELECT ON Offerta TO Cassiere;
GRANT SELECT ON Offerta_Prodotto TO Cassiere;
GRANT EXECUTE ON VenditaProdotti TO Cassiere;

-- PERMESSI PER IL MAGAZZINIERE
GRANT ALL ON Prodotto TO Magazziniere;
GRANT ALL ON Videogioco TO Magazziniere;
GRANT ALL ON Console TO Magazziniere;
GRANT ALL ON Accessorio TO Magazziniere;
GRANT SELECT ON ProdottiDisponibili TO Magazziniere;