-- PROBLEM # 1158
-- Generation # 0
-- Difficulty: moderate
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

-- External Knowledge: who were born in 1937 refers to year(birthday) = '1937'; total cholesterol was beyond the normal range refers to `T-CHO` > = '250'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List all patients who were born in 1937 whose total cholesterol was beyond the normal range.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Patient.ID, Patient.Birthday, Laboratory.`T-CHO` FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE YEAR(Patient.Birthday) = '1937' AND Laboratory.`T-CHO` > = '250'
----------------------------


-- EXCEPTION
near "=": syntax error
----------------------------




