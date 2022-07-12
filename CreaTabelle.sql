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
    Username                      VARCHAR(25)    UNIQUE,
    Ruolo                         VARCHAR(20)    NOT NULL,
    CONSTRAINT FK_dipendente      FOREIGN KEY (Username) REFERENCES Credenziali (Username) ON DELETE SET NULL
);

CREATE TABLE Contratto (
    CodiceContratto               CHAR(7)        PRIMARY KEY,
    TipoContratto                 VARCHAR(20)    NOT NULL,
    InizioContratto               DATE           NOT NULL,
    FineContratto                 DATE,
    CFDip                         CHAR(16)       NOT NULL,
    CONSTRAINT FK_contratto       FOREIGN KEY (CFDip) REFERENCES Dipendente (CFDip) ON DELETE CASCADE
)

CREATE TABLE Presenza (
    PrimaOra                      TIMESTAMP,
    UltimaOra                     TIMESTAMP      NOT NULL,
    CFdipendente                  CHAR(16),
    CONSTRAINT FK_presenza        FOREIGN KEY (CFdipendente) REFERENCES Dipendente (CFdipendente) ON DELETE SET NULL,
    CONSTRAINT PK_presenza        PRIMARY KEY (PrimaOra, CFdipendente),
    CONSTRAINT Check_presenza	  CHECK(PrimaOra < UltimaOra)					
);

CREATE TABLE Stipendio (
    ImportoStipendio              NUMBER(6,2)    NOT NULL CHECK (ImportoStipendio >= 1400),
    TrattenuteStipendio           NUMBER(5,2)    NOT NULL,
    DataStipendio                 DATE,
    CFdipendente                  CHAR(16),
    CONSTRAINT FK_stipendio       FOREIGN KEY (CFdipendente) REFERENCES Dipendente (CFdipendente) ON DELETE CASCADE,
    CONSTRAINT PK_stipendio       PRIMARY KEY (DataStipendio, CFdipendente)
);

CREATE TABLE Ferie (
    InizioFerie                   DATE,
    FineFerie                     DATE           NOT NULL,
    CFdipendente                  CHAR(16)       NOT NULL,
    Retribuzione                  NUMBER(4, 2)   NOT NULL,
    -- eliminato TipoFerie
    CONSTRAINT FK_ferie           FOREIGN KEY (CFdipendente) REFERENCES Dipendente (CFdipendente),
    CONSTRAINT PK_ferie           PRIMARY KEY (InizioFerie, CFdipendente),
    CONSTRAINT Check_ferie        CHECK (InizioFerie < FineFerie)
);

CREATE TABLE Cassa (
    NumCassa                      CHAR(2)        PRIMARY KEY,
    CFdipendente                  CHAR(16)       NOT NULL,
    CONSTRAINT FK_scontrino       FOREIGN KEY (CFDipendente) REFERENCES Dipendente (CFDipendente) ON DELETE SET NULL
);

CREATE TABLE Scontrino (
    NumScontrino                  VARCHAR(3),
    DataScontrino                 DATE,
    NumCassa                      CHAR(2)        NOT NULL,
    CodiceTessera                 CHAR(5),
    CONSTRAINT FK1_scontrino      FOREIGN KEY (NumCassa) REFERENCES Cassa (NumCassa) ON DELETE SET NULL,
    CONSTRAINT PK_scontrino       PRIMARY KEY (NumScontrino, DataScontrino)
);

CREATE TABLE Brand (
    NomeBrand                     VARCHAR(25)    PRIMARY KEY,
    NumTelBrand                   VARCHAR(14)    UNIQUE NOT NULL,
    EmailBrand                    VARCHAR(255)   UNIQUE NOT NULL
);

CREATE TABLE Prodotto (
    CodiceABarre                  CHAR(13)       PRIMARY KEY,
    PrezzoProdotto                NUMBER(6,2)    NOT NULL,
    NomeProdotto                  VARCHAR(50)    NOT NULL,
    NomeBrand                     VARCHAR(25)    NOT NULL,
    CONSTRAINT FK_prodotto        FOREIGN KEY (NomeBrand) REFERENCES Brand (NomeBrand) ON DELETE SET NULL
);

CREATE TABLE Offerta (
    CodiceOfferta                 VARCHAR(10)    PRIMARY KEY,
    DataInizio                    CHAR(3)        NOT NULL,
    DataFine                      VARCHAR(25)    NOT NULL,
    CONSTRAINT Data_Offerta		  CHECK (DataInizio < DataFine)
);

CREATE TABLE Offerta_Prodotto (
    CodiceABarre                  CHAR(13),
	CodiceOfferta		   	      VARCHAR(10),
	ScontoApplicato		     	  NUMBER(2,2),
	CONSTRAINT FK_Off	          FOREIGN KEY (CodiceOfferta) REFERENCES Offerta (CodiceOfferta) ON DELETE SET NULL,	
	CONSTRAINT FK_Prod		      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL	
);

CREATE TABLE Scontrino_Prodotto (
    NumScontrino                  VARCHAR(3),
    DataScontrino                 DATE,
    CodiceABarre                  CHAR(13),
    QuantitaVendute               NUMBER(2),
    CONSTRAINT FK1_scontprod      FOREIGN KEY (NumScontrino, DataScontrino) REFERENCES Scontrino (NumScontrino, DataScontrino) ON DELETE CASCADE,
    CONSTRAINT FK2_scontprod      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE CASCADE,
    CONSTRAINT PK_scontprod       PRIMARY KEY (NumScontrino, DataScontrino, CodiceABarre)
);

CREATE TABLE Videogioco (
    PiattaformaV                  VARCHAR(25)    NOT NULL,
    CodiceABarre                  CHAR(13),
    CONSTRAINT FK_videogioco      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL,
    CONSTRAINT PK_videogioco      PRIMARY KEY (CodiceABarre)
);

CREATE TABLE Console (
    CapienzaConsole               VARCHAR(6)     NOT NULL,
    CodiceABarre                  CHAR(13),
    CONSTRAINT PK_console         PRIMARY KEY (CodiceABarre),
    CONSTRAINT FK_console         FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL
);

CREATE TABLE Accessorio (
    PiattaformaA                  VARCHAR(25)    NOT NULL,
    CodiceABarre                  CHAR(13),
    CONSTRAINT PK_accessorio      PRIMARY KEY (CodiceABarre),
    CONSTRAINT FK_accessorio      FOREIGN KEY (CodiceABarre) REFERENCES Prodotto (CodiceABarre) ON DELETE SET NULL
);

CREATE TABLE Fornitore (
    PIvaFornitore                 CHAR(11)       PRIMARY KEY,
    NomeFornitore                 VARCHAR(25)    UNIQUE NOT NULL,
    EmailFornitore                VARCHAR(255)   UNIQUE NOT NULL,
    NumTelFornitore               VARCHAR(14)    UNIQUE NOT NULL
);

CREATE TABLE Corriere (
    PIvaCorriere                  CHAR(11)       PRIMARY KEY,
    NomeCorriere                  VARCHAR(25)    UNIQUE NOT NULL
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