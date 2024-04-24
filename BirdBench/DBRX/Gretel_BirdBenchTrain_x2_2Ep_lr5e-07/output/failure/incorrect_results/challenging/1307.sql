-- PROBLEM # 1307
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

-- External Knowledge: RBC < = 3.5 or RBC > = 6.0 means the patient has an abnormal level of red blood cell; 3.5 < RBC < 6.0 means the patient has a normal level of red blood cell; followed at the outpatient clinic refers to Admission = '-';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the patient's ID if he or she has an abnormal level of red blood cell and is followed at the outpatient clinic.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT ID FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE RBC < 3.5 OR RBC > 6.0) AND Admission = '-';
----------------------------




-- RESULTS FROM GENERATED SQL
[(30609,), (58139,), (71417,), (528900,), (619178,), (1043570,), (1124385,), (1180510,), (1557464,), (1711181,), (1755350,), (2256652,), (2307640,), (2931207,), (3182521,), (3310582,), (3362815,), (3545964,), (4416959,), (4417978,), (4466840,), (4471732,), (4632519,), (4840422,), (4862013,), (5063068,), (5117606,), (5122312,), (5303768,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(30609,), (58139,), (71417,), (525998,), (528900,), (619178,), (1043570,), (1124385,), (1180510,), (1557464,), (1711181,), (1755350,), (2256652,), (2276582,), (2307640,), (2355809,), (2931207,), (3182521,), (3310582,), (3362815,), (3545964,), (3561498,), (4416959,), (4417978,), (4466840,), (4471732,), (4632519,), (4632825,), (4840422,), (4862013,), (4915498,), (5063068,), (5117606,), (5122312,), (5303768,)]
----------------------------
