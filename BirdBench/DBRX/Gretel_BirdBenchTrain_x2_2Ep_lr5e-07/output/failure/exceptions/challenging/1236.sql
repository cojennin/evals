-- PROBLEM # 1236
-- Generation # 0
-- Difficulty: challenging
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

-- External Knowledge: female patient refers to Sex = 'F'; age 50 and above = SUBTRACT(year(current_timestamp), year(Birthday)) > = 50; abnormal red blood cell count refers to RBC < = 3.5 or RBC > = 6.0; Admission = '+' means the patient was admitted to the hospital; Admission = '-' means the patient was not admitted to the hospital;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For all the female patient age 50 and above, who has abnormal red blood cell count. State if they were admitted to hospital.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Patient.ID, Patient.SEX, Patient.Birthday, Patient.Description, Patient.`First Date`, Patient.Admission, Laboratory.Date, Laboratory.GOT, Laboratory.GPT, Laboratory.LDH, Laboratory.ALP, Laboratory.TP, Laboratory.ALB, Laboratory.UA, Laboratory.UN, Laboratory.CRE, Laboratory.`T-BIL`, Laboratory.`T-CHO`, Laboratory.TG, Laboratory.CPK, Laboratory.GLU, Laboratory.WBC, Laboratory.RBC, Laboratory.HGB, Laboratory.HCT, Laboratory.PLT, Laboratory.PT, Laboratory.APTT, Laboratory.FG, Laboratory.PIC, Laboratory.TAT, Laboratory.TAT2, Laboratory.`U-PRO`, Laboratory.IGG, Laboratory.IGA, Laboratory.IGM, Laboratory.CRP, Laboratory.RA, Laboratory.RF, Laboratory.C3, Laboratory.C4, Laboratory.RNP, Laboratory.SM, Laboratory.SC170, Laboratory.SSA, Laboratory.SSB, Laboratory.CENTROMEA, Laboratory.DNA, Laboratory.`DNA-II` FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Patient.SEX = 'F' AND SUBTRACT(year(current_timestamp), year(Patient.Birthday)) > = 50 AND (Laboratory.RBC < = 3.5 OR Laboratory.RBC > = 6.0) AND Patient.Admission = '+'
----------------------------


-- EXCEPTION
near "=": syntax error
----------------------------




