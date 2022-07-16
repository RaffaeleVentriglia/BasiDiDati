CREATE TABLE Credenziali (
    Username                      VARCHAR2(25)    PRIMARY KEY,
    Passwd                        VARCHAR2(25)    NOT NULL CHECK (LENGTH(Passwd) > 10)
);

CREATE TABLE Dipendente (
    CFDip                         CHAR(16)       PRIMARY KEY,
    NomeDipendente                VARCHAR2(25)    NOT NULL,
    CognomeDipendente             VARCHAR2(25)    NOT NULL,
    DNdipendente                  DATE           NOT NULL,
    ViaDip                        VARCHAR2(25)    NOT NULL,
    CapDip                        CHAR(5)        NOT NULL,
    CittaDip                      VARCHAR2(25)    NOT NULL,
    Username                      VARCHAR2(25)    UNIQUE,
    Ruolo                         VARCHAR2(20)    NOT NULL,
    CONSTRAINT FK_dipendente      FOREIGN KEY (Username) REFERENCES Credenziali (Username) ON DELETE SET NULL
);

CREATE TABLE Contratto (
    CodiceContratto               CHAR(7)        PRIMARY KEY,
    TipoContratto                 VARCHAR2(20)    NOT NULL,
    InizioContratto               DATE           NOT NULL,
    FineContratto                 DATE,
    CFDip                         CHAR(16)       NOT NULL,
    CONSTRAINT FK_contratto       FOREIGN KEY (CFDip) REFERENCES Dipendente (CFDip) ON DELETE CASCADE
);

CREATE TABLE Stipendio (
    ImportoStipendio              NUMBER(6,2)    NOT NULL CHECK (ImportoStipendio >= 1250),
    TrattenuteStipendio           NUMBER(5,2)    NOT NULL,
    DataStipendio                 DATE,
    CodiceContratto               CHAR(7) NOT NULL,
    CONSTRAINT FK_stipendio       FOREIGN KEY (CodiceContratto) REFERENCES Contratto (CodiceContratto) ON DELETE CASCADE,
    CONSTRAINT PK_stipendio       PRIMARY KEY (DataStipendio, CodiceContratto)
);

CREATE TABLE Presenza (
    PrimaOra                      TIMESTAMP,
    UltimaOra                     TIMESTAMP      NOT NULL,
    CFDip                         CHAR(16),
    CONSTRAINT FK_presenza        FOREIGN KEY (CFDip) REFERENCES Dipendente (CFDip) ON DELETE SET NULL,
    CONSTRAINT PK_presenza        PRIMARY KEY (PrimaOra, CFDip),
    CONSTRAINT Check_presenza	  CHECK(PrimaOra < UltimaOra)					
);

CREATE TABLE Ferie (
    InizioFerie                   DATE,
    FineFerie                     DATE           NOT NULL,
    CFDip                         CHAR(16)       NOT NULL,
    Retribuzione                  NUMBER(6, 2)   NOT NULL,
    CONSTRAINT FK_ferie           FOREIGN KEY (CFDip) REFERENCES Dipendente (CFDip),
    CONSTRAINT PK_ferie           PRIMARY KEY (InizioFerie, CFDip),
    CONSTRAINT Check_ferie        CHECK (InizioFerie < FineFerie)
);

CREATE TABLE Cassa (
    NumCassa                      CHAR(2)        PRIMARY KEY,
    CFDip                         CHAR(16)       NOT NULL,
    CONSTRAINT FK_scontrino       FOREIGN KEY (CFDip) REFERENCES Dipendente (CFDip) ON DELETE SET NULL
);

CREATE TABLE Scontrino (
    NumScontrino                  CHAR(3),
    DataScontrino                 DATE,
    NumCassa                      CHAR(2)        NOT NULL,
    CONSTRAINT FK1_scontrino      FOREIGN KEY (NumCassa) REFERENCES Cassa (NumCassa) ON DELETE SET NULL,
    CONSTRAINT PK_scontrino       PRIMARY KEY (NumScontrino, DataScontrino)
);

CREATE TABLE Brand (
    NomeBrand                     VARCHAR2(25)    PRIMARY KEY,
    NumTelBrand                   VARCHAR2(14)    UNIQUE NOT NULL,
    EmailBrand                    VARCHAR2(255)   UNIQUE NOT NULL
);

CREATE TABLE Prodotto (
    CodiceABarre                  CHAR(13)       PRIMARY KEY,
    PrezzoProdotto                NUMBER(6,2)    NOT NULL CHECK (PrezzoProdotto > 0),
    NomeProdotto                  VARCHAR2(50)    NOT NULL,
    NomeBrand                     VARCHAR2(25)    NOT NULL,
    CONSTRAINT FK_prodotto        FOREIGN KEY (NomeBrand) REFERENCES Brand (NomeBrand) ON DELETE SET NULL
);

CREATE TABLE Offerta (
    CodiceOfferta                 CHAR(3)    PRIMARY KEY,
    DataInizio                    DATE       NOT NULL,
    DataFine                      DATE       NOT NULL,
    CONSTRAINT Data_Offerta		  CHECK (DataInizio < DataFine)
);

CREATE TABLE Offerta_Prodotto (
    CodiceABarre                  CHAR(13),
	CodiceOfferta		   	      CHAR(3),
	ScontoApplicato		     	  NUMBER(3,2),
    CONSTRAINT PK_OffProd         PRIMARY KEY (CodiceABarre, CodiceOfferta),
	CONSTRAINT FK_Off	          FOREIGN KEY (CodiceOfferta) REFERENCES Offerta (CodiceOfferta) ON DELETE SET NULL,	
	CONSTRAINT FK_Prod		      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL
);

CREATE TABLE Scontrino_Prodotto (
    NumScontrino                  CHAR(3),
    DataScontrino                 DATE,
    CodiceABarre                  CHAR(13),
    QuantitaVendute               NUMBER(4),
    CONSTRAINT FK1_scontprod      FOREIGN KEY (NumScontrino, DataScontrino) REFERENCES Scontrino (NumScontrino, DataScontrino) ON DELETE CASCADE,
    CONSTRAINT FK2_scontprod      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE CASCADE,
    CONSTRAINT PK_scontprod       PRIMARY KEY (NumScontrino, DataScontrino, CodiceABarre)
);

CREATE TABLE Console (
    CapienzaConsole               VARCHAR2(6)     NOT NULL,
    CodiceABarre                  CHAR(13),
    CONSTRAINT FK_console         FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE CASCADE,
    CONSTRAINT PK_console         PRIMARY KEY (CodiceABarre)
);

CREATE TABLE Videogioco (
    PiattaformaV                  VARCHAR2(25)    NOT NULL,
    CodiceABarre                  CHAR(13),
    CONSTRAINT FK_videogioco      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL,
    CONSTRAINT PK_videogioco      PRIMARY KEY (CodiceABarre)
);

CREATE TABLE Accessorio (
    PiattaformaA1                 VARCHAR2(25)    NOT NULL,
    PiattaformaA2                 VARCHAR2(25),
    PiattaformaA3                 VARCHAR2(25),
    CodiceABarre                  CHAR(13),
    CONSTRAINT FK_accessorio      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE CASCADE,
    CONSTRAINT PK_accessorio      PRIMARY KEY (CodiceABarre)
);

CREATE TABLE Fornitore (
    PIvaFornitore                 CHAR(11)       PRIMARY KEY,
    NomeFornitore                 VARCHAR2(25)    UNIQUE NOT NULL,
    EmailFornitore                VARCHAR2(255)   UNIQUE NOT NULL,
    NumTelFornitore               VARCHAR2(14)    UNIQUE NOT NULL
);

CREATE TABLE Corriere (
    PIvaCorriere                  CHAR(11)       PRIMARY KEY,
    NomeCorriere                  VARCHAR2(25)    UNIQUE NOT NULL
);

CREATE TABLE CaricoMerce (
    NumCarico                     CHAR(5)        PRIMARY KEY,
    NumTracking                   CHAR(18)       UNIQUE NOT NULL,
    DataSpedizione                DATE           NOT NULL,
    DataConsegna                  DATE           NOT NULL,
    PIvaFornitore                 CHAR(11)       NOT NULL,
    PIvaCorriere                  CHAR(11)       NOT NULL,
    CONSTRAINT FK1_caricomerce    FOREIGN KEY (PIvaFornitore) REFERENCES Fornitore (PIvaFornitore) ON DELETE SET NULL,
    CONSTRAINT FK2_caricomerce    FOREIGN KEY (PIvaCorriere) REFERENCES Corriere (PIvaCorriere) ON DELETE SET NULL
);

CREATE TABLE CaricoMerce_Prodotto (
    NumCarico                     CHAR(5),
    CodiceABarre                  CHAR(13),
    CostoProdotto                 NUMBER(6,2)    NOT NULL,
    QuantitaProdotto              NUMBER(4)      NOT NULL,
    CONSTRAINT FK1_carprod        FOREIGN KEY (NumCarico) REFERENCES CaricoMerce (NumCarico) ON DELETE CASCADE,
    CONSTRAINT FK2_carprod        FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE CASCADE,
    CONSTRAINT PK_carprod         PRIMARY KEY (NumCarico, CodiceABarre)
);