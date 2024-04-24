-- PROBLEM # 1187
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

-- External Knowledge: examined between 1987/7/6 and 1996/1/31 refers to Date BETWEEN '1987-07-06' AND '1996-01-31'; GPT level greater than 30 refers to GPT > 30; ALB level less than 4 ALB < 4
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- How many patients who were examined between 1987/7/6 and 1996/1/31 had a GPT level greater than 30 and an ALB level less than 4? List them by their ID.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT ID FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE Date BETWEEN '1987-07-06' AND '1996-01-31' AND GPT > 30 AND ALB < 4)
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(27654,), (71417,), (912147,), (944797,), (1078741,), (1650222,), (2265184,), (2371753,), (2436816,), (2933261,), (3178036,), (3182521,), (3299630,), (3334746,), (3353383,), (3399558,), (3545964,), (4413615,), (4415406,), (4417978,), (4425292,), (4432946,), (4466420,), (4466840,), (4471732,), (4618443,), (4632421,), (4632825,), (4641445,), (4643816,), (4648912,), (4649885,), (4652830,), (4790235,), (4792459,), (4792723,), (4794628,), (4840422,), (4843434,), (4865142,), (4878272,), (4884792,), (4894243,), (4927381,), (5064814,), (5092228,), (5093771,), (5105683,), (5115307,), (5119703,), (5122312,), (5126587,), (5162169,), (5164396,), (5176755,), (5179581,), (5181621,), (5184284,), (5186147,), (5296268,), (5302954,), (5397059,), (5405581,)]
----------------------------
