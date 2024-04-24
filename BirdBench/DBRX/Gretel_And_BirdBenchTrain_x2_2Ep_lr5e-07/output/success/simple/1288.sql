-- PROBLEM # 1288
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

-- External Knowledge: total protein is lower than normal refers to TP < 6.0;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the diagnosis of the patients whose total protein is lower than normal.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Patient.Diagnosis FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TP < 6.0;
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA, SLE susp',), ('RA',), ('RA',), ('SLE',), ('PSS',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('SLE',), ('MCTD, SJS',), ('MCTD, SJS',), ('MCTD, SJS',), ('MCTD, SJS',), ('SJS, MCTD, AORTITIS',), ('SJS, MCTD, AORTITIS',), ('SJS, MCTD, AORTITIS',), ('SJS, MCTD, AORTITIS',), ('SJS, MCTD, AORTITIS',), ('SJS, MCTD, AORTITIS',), ('SJS, MCTD, AORTITIS',), ('SJS, MCTD, AORTITIS',), ('RA,SJS',), ('RA,SJS',), ('PM, SJS susp',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE, PSS, MCTD',), ('SLE, PSS, MCTD',), ('SLE, PSS, MCTD',), ('SLE, PSS, MCTD',), ('SLE, PSS, MCTD',), ('SLE, PSS, MCTD',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE, SJS',), ('SLE, SJS',), ('SLE, SJS',), ('SLE, SJS',), ('MCTD',), ('RA',), ('RA',), ('RA',), ('RA',), ('RA',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, SJS',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('DM',), ('MRA, SJS',), ('MRA, SJS',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE, APS',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PN, AGA',), ('PM',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('SJS',), ('PNc',), ('PNc',), ('PNc',), ('ITP',), ('ITP',), ('ITP',), ('ITP',), ('ITP',), ('ITP',), ('ITP',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('MRA',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('DM',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE, APS\x1dAPS',), ('SLE, APS\x1dAPS',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('AORTITIS susp',), ('AORTITIS susp',), ('RA',), ('RA',), ('AORTITIS',), ('AORTITIS',), ('AORTITIS',), ('SLE, neonatal LE',), ('SLE, neonatal LE',), ('SLE, neonatal LE',), ('SLE, neonatal LE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('RA (seronegative), PSS',), ('RA (seronegative), PSS',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM',), ('DM',), ('PM',), ('PM',), ('PM',), ('PM',), ('PM',), ('PM',), ('PM',), ('PM',), ('PM',), ('PM',), ('PM',), ('PM',), ('PM',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('SLE, APS',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('DM (amyopathic)',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('RA',), ('RA',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('PM/DM',), ('PM/DM',), ('PM/DM',), ('PM/DM',), ('PM/DM',), ('PM/DM',), ('Adult STILL',), ('PM, SJS',), ('PM, SJS',), ('PM, SJS',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('SLE',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('RA, SJS, PM',), ('SLE, SJS',), ('DM, SJS, RA',), ('DM, SJS, RA',), ('DM, SJS, RA',)]
----------------------------
