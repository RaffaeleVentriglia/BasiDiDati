CREATE TABLE Credenziali (
    Username                      VARCHAR(25)    PRIMARY KEY,
    Passwd                        VARCHAR(25)    NOT NULL
)

CREATE TABLE Dipendente (
    CFdipendente                  CHAR(16)       PRIMARY KEY,
    NomeDipendente                VARCHAR(25)    NOT NULL,
    CognomeDipendente             VARCHAR(25)    NOT NULL,
    DNdipendente                  DATE           NOT NULL,
    ViaDip                        VARCHAR(25)    NOT NULL,
    CapDip                        CHAR(5)        NOT NULL,
    CittaDip                      VARCHAR(25)    NOT NULL,
    Username                      VARCHAR(25)    NOT NULL,
    CONSTRAINT FK_credenziali     FOREIGN KEY (Username) REFERENCES Credenziali (Username) ON DELETE SET NULL
)

CREATE TABLE Presenza (
    PrimaOra                      DATE           NOT NULL,
    UltimaOra                     DATE           NOT NULL,
    CFdipendente                  CHAR(16)       NOT NULL,
    CONSTRAINT FK_presenza        FOREIGN KEY (CFdipendente) references dDipendente (CFdipendente) ON DELETE SET NULL,
    CONSTRAINT PK_presenza        PRIMARY KEY (PrimaOra, CFdipendente) ON DELETE SET NULL
);

CREATE TABLE stipendio (
    Importo                       NUMBER(4, 2)   NOT NULL,
    Trattenute                    NUMBER(3,2)    NOT NULL,
    Datastipendio                 DATE           NOT NULL,
    CFdipendente                  CHAR(16)       NOT NULL,
    constraint FK_stipendio       FOREIGN KEY (CFdipendente) REFERENCES Dipendente (CFdipendente),
    constraint PK_stipendio       PRIMARY KEY (DataStipendio, CFdipendente)
)

CREATE TABLE Cassa (
    NumCassa                      CHAR(1)        PRIMARY KEY,
    CFdipendente                  CHAR(16)       NOT NULL,
    CONSTRAINT FK_Dipendente      FOREIGN KEY (CFDipendente) REFERENCES Dipendente (CFDipendente) ON DELETE SET NULL
)