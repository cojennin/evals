-- PROBLEM # 1221
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

-- External Knowledge: within the UN normal index refers to UN < 30; Diagnosis = 'RA'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Provide the ID, sex, birthday of all patients diagnosed with 'RA' that are within the UN normal index.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT ID, SEX, Birthday FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE UN < 30 AND Diagnosis = 'RA')
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(57266, 'M', '1923-07-25'), (71417, 'F', '1929-10-20'), (130312, 'F', '1948-02-23'), (130370, 'F', '1952-08-22'), (1138737, 'F', '1965-11-18'), (1595837, 'F', '1939-12-06'), (2069395, 'F', '1959-01-30'), (2256652, 'F', '1938-11-22'), (2371753, 'F', '1932-12-05'), (2429726, 'F', '1972-09-23'), (2927464, '', '1931-04-04'), (3151150, 'F', '1946-08-06'), (4002938, 'F', '1935-11-23'), (4006679, 'F', '1956-06-04'), (4021070, 'F', '1928-07-10'), (4401269, 'F', '1972-02-12'), (4413615, 'F', '1963-02-20'), (4621629, 'F', '1962-07-19'), (4632519, 'F', '1925-03-25'), (4641445, 'F', '1976-04-05'), (4648912, 'F', '1974-11-25'), (4791049, 'F', '1939-01-07'), (4792459, 'M', '1931-02-11'), (4794628, 'M', '1953-07-15'), (4865142, 'M', '1961-12-12'), (4872463, 'F', '1984-02-11'), (4879930, 'F', '1958-11-24'), (4916710, 'F', '1939-09-19'), (5063068, 'F', '1965-10-01'), (5092228, 'M', '1963-07-09'), (5096552, 'F', '1938-01-01'), (5098691, 'F', '1950-10-19'), (5162169, 'F', '1971-05-22'), (5174645, 'M', '1938-11-07'), (5176755, 'F', '1931-05-27'), (5179581, 'F', '1955-01-07'), (5181621, 'M', '1942-03-04'), (5446559, 'F', '1931-03-19')]
----------------------------
