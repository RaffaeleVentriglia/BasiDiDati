CREATE TABLE Credenziali (
    Username                      VARCHAR(25)    PRIMARY KEY,
    Password                      VARCHAR(25)    NOT NULL
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

)

CREATE TABLE Stipendio (

)

CREATE TABLE Cassa (
    NumCassa                      CHAR(1)        PRIMARY KEY,
    CFdipendente                  CHAR(16)       NOT NULL,
    CONSTRAINT FK_Dipendente      FOREIGN KEY (CFDipendente) REFERENCES Dipendente (CFDipendente) ON DELETE SET NULL
)