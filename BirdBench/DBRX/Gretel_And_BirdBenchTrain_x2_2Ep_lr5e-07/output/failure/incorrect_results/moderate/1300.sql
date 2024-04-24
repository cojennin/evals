-- PROBLEM # 1300
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

-- External Knowledge: disease name referse to Diagnosis; highest level of triglyceride within the normal range refers to MAX(TG < 200);
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the disease name of the patient who has the highest level of triglyceride within the normal range?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Diagnosis FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TG < 200 GROUP BY ID HAVING MAX(TG))
----------------------------




-- RESULTS FROM GENERATED SQL
[('RA, SLE susp',), ('SLE, MCTD',), ("Raynaud's phenomenon",), ('SLE',), ('PM/DM',), ('RA',), ('PSS',), ('SJS',), ('BEHCET',), ('SLE',), ('SJS',), ('SJS',), ('PSS',), ('SLE',), ('RA',), ('RA',), ('SLE',), ('SLE',), ('PSS',), ('PN (vasculitis)',), ('RA, SJS',), ('MRA',), ('SLE',), ('SJS susp',), ('vasculitis, TA susp',), ('PSS',), ('AORTITIS',), ('SJS',), ('SJS',), ('SLE',), ('MCTD, SJS',), ('Sweet',), ('SJS, MCTD, AORTITIS',), ('RA,SJS',), ('DM, RA',), ('SLE',), ('PM, SJS susp',), ('PNc',), ('SLE',), ('SJS, PM susp',), ('SJS',), ('SLE',), ('SLE susp',), ('RA',), ('Raynaud',), ('SLE',), ('DM',), ('BEHCET',), ('BEHCET',), ('SLE',), ('BEHCET',), ('RA',), ('SJS',), ('SJS',), ('PSS, SJS',), ('DM',), ('PN',), ('PSS, PM, SJS, RA\x1dSJS\x1dPM',), ('SJS, RA',), ('SLE, SJS',), ('SJS, ITP',), ('SLE',), ('SLE',), ('SJS',), ('AORTITIS',), ('SLE, SJS, Adie',), ('Vasculitis susp',), ('SLE',), ('BEHCET',), ('SJS',), ('MCTD, SJS',), ('SLE, APS',), ('SLE, PSS, MCTD',), ('RA (seronegative)',), ('PSS',), ('SLE',), ('SJS',), ('RA',), ('BEHCET',), ('Vasculitis',), ('PSS, PM',), ('BEHCET',), ('PMR',), ('SLE',), ('RA, UC',), ('PSS',), ('PSS',), ('BEHCET',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SJS',), ('SLE',), ('PSS',), ('SJS',), ('SLE, SJS',), ('RA',), ('SLE, PM',), ('BEHCET',), ('SJS',), ('RA',), ('MCTD',), ('RA',), ('SLE, APS',), ('SLE',), ('PSS, SJS',), ('RA, SJS',), ('SLE, APS',), ('SLE susp',), ('SJS',), ('RA',), ('SLE',), ('SJS',), ('SLE, SJS',), ('SLE',), ('Adult STILL',), ('DM',), ('MRA, SJS',), ('SLE',), ('FUO',), ('SLE',), ('PSS, SJS, PBC',), ('PM\x1dPSS\x1dRA',), ('PNc',), ('SLE',), ('SLE, APS',), ('SLE',), ('DM',), ('SLE, SJS',), ('BEHCET',), ('SJS susp',), ('SJS',), ('SLE, SJS',), ('SLE',), ('SJS, PN susp',), ('SJS',), ('Psoriatic Arthritis',), ('SLE, SJS susp',), ('SLE susp',), ('SLE, SJS',), ('SLE',), ('RA',), ('RA',), ('PN, AGA',), ('BEHCET',), ('SJS',), ('SJS',), ('RA',), ('BEHCET',), ('MCTD',), ('RA',), ('RA',), ('PSS, RA susp',), ('RA (seronegative)',), ('PM',), ('AORTITIS',), ('AORTITIS',), ('SJS',), ('collagen susp',), ('PNc',), ('SJS',), ('ITP',), ('SJS, MCTD',), ('APS',), ('CPK !',), ('SLE',), ('MRA',), ('RA',), ('PSS',), ('PSS',), ('RA',), ('SLE',), ('SJS, SLE susp',), ('SJS',), ('SLE',), ('RA',), ('PSS',), ('RA',), ('SLE, SJS',), ('DM',), ('SLE',), ('RA',), ('RA',), ('SJS, SLE susp',), ('RA',), ('SJS',), ('SLE',), ('SJS',), ('SLE, APS\x1dAPS',), ('SLE',), ('SJS',), ('AORTITIS susp',), ('RA',), ('PSS,SJS',), ('Adult STILL',), ('RA',), ('Raynaud',), ('PM',), ('RA',), ('BEHCET',), ('AORTITIS',), ('SLE, neonatal LE',), ('SLE, SJS, APS, RA susp',), ('SLE',), ('RA (seronegative), PSS',), ('SJS',), ('MCTD, SJS',), ('RA',), ('SJS',), ('SLE susp',), ('Raynaud',), ('Sarcoidosis',), ('SLE',), ('RA (seronegative)',), ('PN, AORTITIS susp',), ('SLE',), ('RA',), ('SLE',), ('PM',), ('OA',), ('SJS',), ('RA',), ('',), ('BEHCET',), ('SLE, ITP',), ('BEHCET',), ('BEHCET',), ('RA',), ('RA',), ('SLE, SJS',), ('DM (amyopathic)',), ('RA (seronegative)',), ('DM',), ('SLE',), ('PM',), ('SLE, APS',), ('PMR',), ('DM (amyopathic)',), ('RA',), ('SLE',), ('RA',), ('RA,SJS',), ('RA',), ('RA',), ('RA',), ('SLE',), ('PM/DM',), ('RA susp',), ('FUO',), ('Adult STILL',), ('PM, SJS',), ('SJS',), ('SLE',), ('SLE',), ('SLE',), ('SJS, MCTD',), ('BEHCET',), ('PM, SJS',), ('RA, SJS, PM',), ('BEHCET',), ('SLE',), ('SJS',), ('SJS',), ('SLE, SJS',), ('SJS',), ('RA',), ('SJS',), ('SJS',), ('SJS',), ('DM, SJS, RA',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('SLE',)]
----------------------------
