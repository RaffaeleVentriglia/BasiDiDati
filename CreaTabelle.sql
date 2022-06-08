CREATE TABLE Credenziali (
    Username                      VARCHAR(25)    PRIMARY KEY,
    Passwd                        VARCHAR(25)    NOT NULL
);

CREATE TABLE Dipendente (
    CFdipendente                  CHAR(16)       PRIMARY KEY,
    NomeDipendente                VARCHAR(25)    NOT NULL,
    CognomeDipendente             VARCHAR(25)    NOT NULL,
    DNdipendente                  DATE           NOT NULL,
    ViaDip                        VARCHAR(25)    NOT NULL,
    CapDip                        CHAR(5)        NOT NULL,
    CittaDip                      VARCHAR(25)    NOT NULL,
    Username                      VARCHAR(25)    NOT NULL,
    CONSTRAINT FK_dipendente      FOREIGN KEY (Username) REFERENCES Credenziali (Username) ON DELETE SET NULL
);

CREATE TABLE Presenza (
    PrimaOra                      DATE           NOT NULL,
    UltimaOra                     DATE           NOT NULL,
    CFdipendente                  CHAR(16)       NOT NULL,
    CONSTRAINT FK_presenza        FOREIGN KEY (CFdipendente) references Dipendente (CFdipendente) ON DELETE SET NULL,
    CONSTRAINT PK_presenza        PRIMARY KEY (PrimaOra, CFdipendente)
);

CREATE TABLE Stipendio (
    Importo                       NUMBER(4,2)   NOT NULL,
    Trattenute                    NUMBER(3,2)    NOT NULL,
    Datastipendio                 DATE           NOT NULL,
    CFdipendente                  CHAR(16)       NOT NULL,
    CONSTRAINT FK_stipendio       FOREIGN KEY (CFdipendente) REFERENCES Dipendente (CFdipendente),
    CONSTRAINT PK_stipendio       PRIMARY KEY (DataStipendio, CFdipendente)
);

CREATE TABLE Cassa (
    NumCassa                      CHAR(1)        PRIMARY KEY,
    CFdipendente                  CHAR(16)       NOT NULL,
    CONSTRAINT FK_scontrino       FOREIGN KEY (CFDipendente) REFERENCES Dipendente (CFDipendente) ON DELETE SET NULL
);

CREATE TABLE Tessera (
    CodiceTessera                 NUMBER(5)      PRIMARY KEY,
    ScadenzaTessera               DATE           NOT NULL,
    EmailCliente                  VARCHAR(255)   UNIQUE NOT NULL
);

CREATE TABLE Scontrino (
    NumScontrino                  VARCHAR(3)     NOT NULL,
    DataScontrino                 DATE           NOT NULL,
    NumCassa                      CHAR(1)        NOT NULL,
    CodiceTessera                 NUMBER(5)      NOT NULL,
    CONSTRAINT FK1_scontrino      FOREIGN KEY (NumCassa) REFERENCES Cassa (NumCassa) ON DELETE SET NULL,
    CONSTRAINT FK2_scontrino      FOREIGN KEY (CodiceTessera) REFERENCES Tessera (CodiceTessera) ON DELETE SET NULL,
    CONSTRAINT PK_scontrino       PRIMARY KEY (NumScontrino, DataScontrino)
);

CREATE TABLE Cliente (
    CFcliente                     CHAR(16)       PRIMARY KEY,
    NomeCliente                   VARCHAR(25)    NOT NULL,
    CognomeCliente                VARCHAR(25)    NOT NULL,
    DNcliente                     DATE           NOT NULL,
    ViaCl                         VARCHAR(25)    NOT NULL,
    CapCl                         CHAR(5)        NOT NULL,
    CittaCl                       VARCHAR(20)    NOT NULL,
    CodiceTessera                 NUMBER(5)      NOT NULL,
    CONSTRAINT FK_cliente         FOREIGN KEY (CodiceTessera) REFERENCES Tessera (CodiceTessera) ON DELETE SET NULL
);




CREATE TABLE Brand (
    NomeBrand                     VARCHAR(25)    PRIMARY KEY,
    NumTelBrand                   VARCHAR(14)    UNIQUE NOT NULL,
    EmailBrand                    VARCHAR(255)   UNIQUE NOT NULL
);

CREATE TABLE Prodotto (
    CodiceABarre                  CHAR(13)       PRIMARY KEY,
    PrezzoProdotto                NUMBER(4,2)    NOT NULL,
    NomeProdotto                  VARCHAR(20)    NOT NULL,
    NomeBrand                     VARCHAR(25)    NOT NULL,
    CONSTRAINT FK_prodotto        FOREIGN KEY (NomeBrand) REFERENCES Brand (NomeBrand) ON DELETE SET NULL
);

CREATE TABLE Videogioco (
    PiattaformaV                  VARCHAR(25)    NOT NULL,
    CodiceABarre                  CHAR(13)       NOT NULL,
    CONSTRAINT PK_videogioco      PRIMARY KEY (CodiceABarre),
    CONSTRAINT FK_videogioco      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL
);