-- PROBLEM # 1159
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

-- External Knowledge: albumin level lower than 3.5 refers to ALB < 3.5;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For patient with albumin level lower than 3.5, list their ID, sex and diagnosis.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Patient.ID, Patient.SEX, Patient.Diagnosis FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.ALB < 3.5;
----------------------------






-- ACTUAL RESULTS
[(27654, 'F', 'RA, SLE susp'), (57266, 'M', 'RA'), (287122, 'F', 'SLE'), (444499, 'M', 'MRA'), (912147, 'F', 'MCTD, SJS'), (940737, 'F', 'SJS, MCTD, AORTITIS'), (944797, 'F', 'RA,SJS'), (1078741, 'F', 'PM, SJS susp'), (1124385, 'F', 'SJS'), (1130007, 'F', 'SLE'), (1138737, 'F', 'RA'), (1185720, 'F', 'SLE'), (1557464, '', 'SJS'), (1650222, 'F', 'SLE, SJS'), (1755350, 'F', 'SLE'), (1923445, 'F', 'SLE, PSS, MCTD'), (2265184, 'F', 'PMR'), (2307640, 'M', 'SLE'), (2315140, 'F', 'SLE'), (2343945, 'F', 'SLE'), (2370675, 'F', 'SLE, SJS'), (2927464, '', 'RA'), (2931207, 'F', 'SLE, APS'), (2933261, 'F', 'SLE'), (2956679, 'F', 'SLE, APS'), (3150681, 'F', 'SJS'), (3174630, 'F', 'SLE, SJS'), (3178036, 'F', 'Adult STILL'), (3182521, 'M', 'DM'), (3215988, 'F', 'MRA, SJS'), (3353383, 'F', 'PM\x1dPSS\x1dRA'), (3362815, 'M', 'SLE'), (3380563, 'F', 'SLE, APS'), (3413715, 'F', 'SLE, SJS'), (3418071, 'F', 'SLE'), (3545964, 'F', 'SJS, PN susp'), (4007151, 'M', 'PN, AGA'), (4413615, 'F', 'RA'), (4416959, 'F', 'RA (seronegative)'), (4425292, 'F', 'SJS'), (4432946, 'M', 'PNc'), (4471732, 'F', 'SJS, MCTD'), (4618443, 'M', 'MRA'), (4632548, 'F', 'SLE'), (4634342, 'F', 'SJS'), (4641445, 'F', 'RA'), (4649885, 'F', 'SLE, SJS'), (4652830, 'F', 'DM'), (4790235, 'F', 'SLE'), (4840422, 'F', 'SLE, APS\x1dAPS'), (4843434, 'F', 'SLE'), (4865142, 'M', 'RA'), (4879930, 'F', 'RA'), (4885128, 'F', 'SLE, neonatal LE'), (4894243, 'F', 'SLE'), (4916710, 'F', 'RA'), (4934716, 'M', 'PN, AORTITIS susp'), (5060913, 'F', 'SLE'), (5063068, 'F', 'RA'), (5064814, 'F', 'SLE'), (5092228, 'M', 'RA'), (5105683, 'F', 'SLE, SJS'), (5119703, 'M', 'PM'), (5122312, 'F', 'SLE, APS'), (5123360, 'F', 'PMR'), (5126587, 'F', 'DM (amyopathic)'), (5162169, 'F', 'RA'), (5164396, 'F', 'SLE'), (5176234, 'F', 'RA,SJS'), (5176755, 'F', 'RA'), (5181621, 'M', 'RA'), (5184284, 'F', 'SLE'), (5186147, 'F', 'PM/DM'), (5295122, 'F', 'FUO'), (5296268, 'F', 'Adult STILL'), (5300381, 'F', 'PM, SJS'), (5397059, 'F', 'SLE'), (5405581, 'F', 'RA, SJS, PM'), (5408290, 'M', 'BEHCET'), (5441886, 'F', 'SLE, SJS')]
----------------------------
