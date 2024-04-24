-- PROBLEM # 1309
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

-- External Knowledge: PLT > 100 and PLT < 400 means platelet level is within the normal range; PLT < 100 and PLT > 400 means platelet level is not within the normal range; diagnosed with MCTD refers to Diagnosis = 'MCTD';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list a patient's platelet level if it is within the normal range and if he or she is diagnosed with MCTD.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Laboratory.PLT FROM Laboratory WHERE Laboratory.PLT > 100 AND Laboratory.PLT < 400 AND Laboratory.ID IN (SELECT Patient.ID FROM Patient WHERE Patient.Diagnosis = 'MCTD')
----------------------------






-- ACTUAL RESULTS
[(219,), (222,), (326,), (286,), (236,), (278,), (232,), (272,), (222,), (231,), (249,), (202,), (275,), (255,), (251,), (211,), (248,), (191,), (243,), (292,), (238,), (364,), (253,), (284,), (302,), (351,), (368,), (356,), (357,), (362,), (367,), (349,), (327,), (328,), (380,), (336,), (350,), (287,), (309,), (333,), (389,), (327,), (303,), (304,), (313,), (309,), (329,), (347,), (117,), (350,), (295,), (263,), (270,), (282,), (315,), (342,), (290,), (258,), (258,), (270,), (126,), (149,), (124,), (145,), (128,), (203,), (202,), (214,), (200,), (205,), (213,), (189,), (212,), (230,), (209,), (170,), (178,), (156,), (186,), (210,), (213,), (166,), (187,), (167,), (183,), (178,), (168,), (163,), (172,), (179,), (162,), (159,), (185,), (209,), (200,), (200,), (191,), (198,), (175,), (167,), (200,), (162,), (204,), (189,), (232,), (230,), (196,), (200,), (243,), (199,), (247,), (225,), (215,), (214,), (209,), (197,), (201,), (193,), (214,), (219,), (206,), (210,), (199,), (221,), (210,), (210,), (184,), (174,), (184,), (171,), (178,), (169,), (177,), (186,), (194,), (190,), (202,), (178,), (189,), (216,), (193,)]
----------------------------
