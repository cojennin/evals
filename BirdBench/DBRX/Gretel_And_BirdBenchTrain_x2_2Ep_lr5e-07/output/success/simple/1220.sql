-- PROBLEM # 1220
-- Generation # 0
-- Difficulty: simple
----------------------------

-- PROMPT
CREATE TABLE Examination
(
    ID                 INTEGER          null,
    `Examination Date` DATE         null,
    `aCL IgG`          REAL        null,
    `aCL IgM`          REAL        null,
    ANA                INTEGER          null,
    `ANA Pattern`      TEXT null,
    `aCL IgA`          INTEGER          null,
    Diagnosis          TEXT null,
    KCT                TEXT null,
    RVVT              TEXT null,
    LAC                TEXT null,
    Symptoms           TEXT null,
    Thrombosis         INTEGER          null,
    foreign key (ID) references Patient (ID)
            on update cascade on delete cascade
)

CREATE TABLE Patient
(
    ID           INTEGER default 0 not null
        primary key,
    SEX          TEXT  null,
    Birthday     DATE          null,
    Description  DATE          null,
    `First Date` DATE          null,
    Admission    TEXT  null,
    Diagnosis    TEXT  null
)

CREATE TABLE Laboratory
(
    ID        INTEGER  default 0            not null,
    Date      DATE default '0000-00-00' not null,
    GOT       INTEGER                       null,
    GPT       INTEGER                        null,
    LDH       INTEGER                        null,
    ALP       INTEGER                        null,
    TP        REAL             null,
    ALB       REAL             null,
    UA        REAL             null,
    UN        INTEGER                       null,
    CRE       REAL             null,
    `T-BIL`   REAL             null,
    `T-CHO`   INTEGER                       null,
    TG        INTEGER                       null,
    CPK       INTEGER                       null,
    GLU       INTEGER                       null,
    WBC       REAL             null,
    RBC       REAL             null,
    HGB       REAL             null,
    HCT       REAL             null,
    PLT       INTEGER                       null,
    PT        REAL             null,
    APTT      INTEGER                       null,
    FG        REAL             null,
    PIC       INTEGER                       null,
    TAT       INTEGER                       null,
    TAT2      INTEGER                       null,
    `U-PRO`   TEXT              null,
    IGG       INTEGER                       null,
    IGA       INTEGER                       null,
    IGM       INTEGER                       null,
    CRP       TEXT              null,
    RA        TEXT              null,
    RF        TEXT              null,
    C3        INTEGER                       null,
    C4        INTEGER                       null,
    RNP       TEXT              null,
    SM        TEXT              null,
    SC170     TEXT              null,
    SSA       TEXT              null,
    SSB       TEXT              null,
    CENTROMEA TEXT              null,
    DNA       TEXT              null,
    `DNA-II`  INTEGER                       null,
    primary key (ID, Date),
        foreign key (ID) references Patient (ID)
            on update cascade on delete cascade
)

-- External Knowledge: urea nitrogen (UN) just within the borderline of passing refers to UN = 29
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Provide all ID, sex and birthday of patients whose urea nitrogen (UN) just within the borderline of passing?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT ID, SEX, Birthday FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE UN = 29)
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(27654, 'F', '1936-03-25'), (444499, 'M', '1954-01-24'), (912147, 'F', '1975-02-17'), (1138737, 'F', '1965-11-18'), (1185720, 'F', '1953-10-12'), (2315140, 'F', '1935-04-19'), (3171569, 'F', '1971-03-19'), (3362815, 'M', '1969-02-06'), (3418071, 'F', '1957-11-12'), (3545964, 'F', '1926-08-01'), (4413615, 'F', '1963-02-20'), (4424808, 'F', '1936-05-22'), (4618443, 'M', '1922-12-01'), (4634342, 'F', '1967-11-11'), (4885128, 'F', '1968-09-25'), (5064814, 'F', '1965-03-19'), (5122312, 'F', '1969-11-30'), (5181621, 'M', '1942-03-04'), (5397059, 'F', '1976-01-14'), (5446559, 'F', '1931-03-19')]
----------------------------
