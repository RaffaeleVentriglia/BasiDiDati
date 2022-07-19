CREATE USER Dirigente IDENTIFIED BY DirigenteNegozio;
CREATE USER Tecnico IDENTIFIED BY TecnicoDB;
CREATE USER Cassiere IDENTIFIED BY CassiereNegozio;
CREATE USER Magazziniere IDENTIFIED BY MagazziniereNegozio;

-- PERMESSI PER IL DIRIGENTE
GRANT ALL PRIVILEGES TO Tecnico;

-- PERMESSI PER L'ESECUZIONE DELLE PROCEDURE
GRANT EXECUTE ON ApplicazioneOfferta TO Dirigente;
GRANT EXECUTE ON VenditaProdotti TO Cassiere;
GRANT EXECUTE ON CassierePiuProduttivo TO Dirigente;
GRANT EXECUTE ON OffertaMenoVenduto TO Dirigente;

-- PERMESSI PER IL TECNICO
GRANT SELECT ON Credenziali TO Dirigente;
GRANT SELECT ON Dipendente TO Dirigente;
GRANT ALL ON Contratto TO Dirigente;
GRANT ALL ON Stipendio TO Dirigente;
GRANT SELECT ON Presenza TO Dirigente;
GRANT SELECT ON Ferie TO Dirigente;

-- PERMESSI PER IL CASSIERE
GRANT SELECT ON Scontrino TO Cassiere;

-- PERMESSI PER IL MAGAZZINIERE
GRANT ALL ON Prodotto TO Magazziniere;
GRANT ALL ON Videogioco TO Magazziniere;
GRANT ALL ON Console TO Magazziniere;
GRANT ALL ON Accessorio TO Magazziniere;