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
    ImportoStipendio              NUMBER(4,2)    NOT NULL,
    TrattenuteStipendio           NUMBER(3,2)    NOT NULL,
    DataStipendio                 DATE           NOT NULL,
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
    NumScontrino                  VARCHAR(3)     UNIQUE NOT NULL,
    DataScontrino                 DATE           UNIQUE NOT NULL,
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

CREATE TABLE Offerta (
    CodiceOfferta                 VARCHAR(10)    PRIMARY KEY,
    PeriodoOfferta                CHAR(3)        NOT NULL,
    TipoOfferta                   VARCHAR(25)    NOT NULL
);

CREATE TABLE Offerta_Prodotto (
    CodiceABarre                  CHAR(13)      NOT NULL,
    CodiceOfferta                 VARCHAR(10)   NOT NULL,
    CONSTRAINT FK1_offprod        FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE CASCADE,
    CONSTRAINT FK2_offprod        FOREIGN KEY (CodiceOfferta) REFERENCES Offerta (CodiceOfferta) ON DELETE CASCADE,
    CONSTRAINT PK_offprod         PRIMARY KEY (CodiceABarre, CodiceOfferta)
);

CREATE TABLE Scontrino_Prodotto (
    NumScontrino                  VARCHAR(3)    NOT NULL,
    DataScontrino                 DATE          NOT NULL,
    CodiceABarre                  CHAR(13)      NOT NULL,
    CONSTRAINT FK1_scontprod      FOREIGN KEY (NumScontrino) REFERENCES Scontrino (NumScontrino) ON DELETE CASCADE,
    CONSTRAINT FK2_scontprod      FOREIGN KEY (DataScontrino) REFERENCES Scontrino (DataScontrino) ON DELETE CASCADE,
    CONSTRAINT FK3_scontprod      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE CASCADE,
    CONSTRAINT PK_scontprod       PRIMARY KEY (NumScontrino, DataScontrino, CodiceABarre)
);

CREATE TABLE Videogioco (
    PiattaformaV                  VARCHAR(25)   NOT NULL,
    CodiceABarre                  CHAR(13)      NOT NULL,
    CONSTRAINT FK_videogioco      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL,
    CONSTRAINT PK_videogioco      PRIMARY KEY (CodiceABarre)
);

CREATE TABLE Console (
    CapienzaConsole               VARCHAR(6)    NOT NULL,
    CodiceABarre                  CHAR(13)      NOT NULL,
    CONSTRAINT PK_console         PRIMARY KEY (CodiceABarre),
    CONSTRAINT FK_console         FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL
);

CREATE TABLE Accessorio (
    PiattaformaA                  VARCHAR(25)   NOT NULL,
    CodiceABarre                  CHAR(13)      NOT NULL,
    CONSTRAINT PK_accessorio      PRIMARY KEY (CodiceABarre),
    CONSTRAINT FK_accessorio      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL
);

CREATE TABLE Fornitore (
    PIvaFornitore                 CHAR(11)      PRIMARY KEY,
    NomeFornitore                 VARCHAR(25)   UNIQUE NOT NULL,
    EmailFornitore                VARCHAR(255)  UNIQUE NOT NULL,
    NumTelFornitore               VARCHAR(14)   UNIQUE NOT NULL
);

CREATE TABLE Corriere (
    PIvaCorriere                  CHAR(11)      PRIMARY KEY,
    NomeCorriere                  varchar(25)   UNIQUE NOT NULL
);

CREATE TABLE CaricoMerce (
    NumCarico                     CHAR(5)       PRIMARY KEY,
    NumTracking                   CHAR(18)      UNIQUE NOT NULL,
    DataConsegna                  DATE          NOT NULL,
    DataSpedizione                DATE          NOT NULL,
    PIvaFornitore                 CHAR(11)      NOT NULL,
    PIvaCorriere                  CHAR(11)      NOT NULL,
    CONSTRAINT FK1_caricomerce    FOREIGN KEY (PIvaFornitore) REFERENCES Fornitore (PIvaFornitore) ON DELETE SET NULL,
    CONSTRAINT FK2_caricomerce    FOREIGN KEY (PIvaCorriere) REFERENCES Corriere (PIvaCorriere) ON DELETE SET NULL
);

CREATE TABLE CaricoMerce_Prodotto (
    NumCarico                     CHAR(5)       NOT NULL,
    CodiceABarre                  CHAR(13)      NOT NULL,
    CostoProdotto                 NUMBER(4,2)   NOT NULL,
    QuantitaProdotto              NUMBER(4)     NOT NULL,
    CONSTRAINT FK1_carprod        FOREIGN KEY (NumCarico) REFERENCES CaricoMerce (NumCarico) ON DELETE CASCADE,
    CONSTRAINT FK2_carprod        FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE CASCADE,
    CONSTRAINT PK_carprod         PRIMARY KEY (NumCarico, CodiceABarre)
);