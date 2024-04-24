-- PROBLEM # 1228
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

-- External Knowledge: triglyceride (TG) index greater than 100 of the normal range refers to TG > 300;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Provide list of patients and their diagnosis with triglyceride (TG) index greater than 100 of the normal range?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Patient.ID, Patient.Diagnosis FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.TG > 300;
----------------------------






-- ACTUAL RESULTS
[(57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (57266, 'RA'), (287861, 'PSS'), (287861, 'PSS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (940737, 'SJS, MCTD, AORTITIS'), (1137040, 'SLE susp'), (1491832, 'DM'), (1491832, 'DM'), (1618929, 'PN'), (1923445, 'SLE, PSS, MCTD'), (1923445, 'SLE, PSS, MCTD'), (1923445, 'SLE, PSS, MCTD'), (1923445, 'SLE, PSS, MCTD'), (1923445, 'SLE, PSS, MCTD'), (1923445, 'SLE, PSS, MCTD'), (1923445, 'SLE, PSS, MCTD'), (1923445, 'SLE, PSS, MCTD'), (2307640, 'SLE'), (2307640, 'SLE'), (2307640, 'SLE'), (2307640, 'SLE'), (2307640, 'SLE'), (2315140, 'SLE'), (2370675, 'SLE, SJS'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (2933261, 'SLE'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3182521, 'DM'), (3353383, 'PM\x1dPSS\x1dRA'), (3353383, 'PM\x1dPSS\x1dRA'), (3418071, 'SLE'), (3418071, 'SLE'), (3418071, 'SLE'), (3418071, 'SLE'), (3418071, 'SLE'), (3418071, 'SLE'), (3418071, 'SLE'), (3418071, 'SLE'), (3418071, 'SLE'), (3418071, 'SLE'), (3418071, 'SLE'), (4466420, 'SJS'), (4466420, 'SJS'), (4466420, 'SJS'), (4466420, 'SJS'), (4472142, 'APS'), (4632548, 'SLE'), (4632548, 'SLE'), (4632548, 'SLE'), (4632548, 'SLE'), (4632548, 'SLE'), (4643816, 'PSS'), (4643816, 'PSS'), (4643816, 'PSS'), (4643816, 'PSS'), (4652830, 'DM'), (4652830, 'DM'), (4652830, 'DM'), (4652830, 'DM'), (4652830, 'DM'), (4652830, 'DM'), (4840422, 'SLE, APS\x1dAPS'), (4840422, 'SLE, APS\x1dAPS'), (4840422, 'SLE, APS\x1dAPS'), (4840422, 'SLE, APS\x1dAPS'), (4840422, 'SLE, APS\x1dAPS'), (4840422, 'SLE, APS\x1dAPS'), (4840422, 'SLE, APS\x1dAPS'), (4840422, 'SLE, APS\x1dAPS'), (4843434, 'SLE'), (4843434, 'SLE'), (4843434, 'SLE'), (4843434, 'SLE'), (4843434, 'SLE'), (4843434, 'SLE'), (4843434, 'SLE'), (4843434, 'SLE'), (4843434, 'SLE'), (4843434, 'SLE'), (4884792, 'AORTITIS'), (4915498, 'MCTD, SJS'), (4915498, 'MCTD, SJS'), (4915498, 'MCTD, SJS'), (4915498, 'MCTD, SJS'), (4927381, 'SLE'), (5092228, 'RA'), (5093771, 'SLE, ITP'), (5123360, 'PMR'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5126587, 'DM (amyopathic)'), (5164396, 'SLE'), (5164396, 'SLE'), (5174645, 'RA'), (5174645, 'RA'), (5174645, 'RA'), (5176755, 'RA'), (5176755, 'RA'), (5176755, 'RA'), (5181621, 'RA'), (5181621, 'RA'), (5181621, 'RA'), (5184284, 'SLE'), (5184284, 'SLE'), (5186147, 'PM/DM'), (5296268, 'Adult STILL'), (5300381, 'PM, SJS'), (5300381, 'PM, SJS'), (5300381, 'PM, SJS'), (5300381, 'PM, SJS'), (5300381, 'PM, SJS'), (5300381, 'PM, SJS'), (5302954, 'SLE'), (5302954, 'SLE'), (5302954, 'SLE'), (5441886, 'SLE, SJS'), (5441886, 'SLE, SJS'), (5452747, 'DM, SJS, RA'), (5452747, 'DM, SJS, RA'), (5452747, 'DM, SJS, RA')]
----------------------------
