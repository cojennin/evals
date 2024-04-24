-- PROBLEM # 1153
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

-- External Knowledge: '30609' is an ID; disease means diagnosis
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the disease patient '30609' diagnosed with. List all the date of laboratory tests done for this patient.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Laboratory.Date FROM Laboratory WHERE Laboratory.ID = 30609;
----------------------------




-- RESULTS FROM GENERATED SQL
[('1984-07-12',), ('1984-08-02',), ('1984-09-03',), ('1984-10-01',), ('1984-10-22',), ('1984-11-19',), ('1984-12-17',), ('1984-12-27',), ('1985-01-24',), ('1985-02-21',), ('1985-04-04',), ('1985-05-02',), ('1985-06-03',), ('1985-06-13',), ('1985-07-01',), ('1985-08-05',), ('1985-09-09',), ('1985-10-14',), ('1985-11-11',), ('1985-12-12',), ('1986-01-09',), ('1986-02-06',), ('1986-03-06',), ('1986-04-03',), ('1986-05-01',), ('1986-06-05',), ('1986-07-03',), ('1986-07-31',), ('1986-09-11',), ('1986-10-16',), ('1986-11-20',), ('1986-12-18',), ('1987-02-19',), ('1987-04-23',), ('1987-05-21',), ('1987-06-18',), ('1987-07-23',), ('1987-08-20',), ('1987-09-21',), ('1987-10-19',), ('1987-11-16',), ('1987-12-14',), ('1988-01-18',), ('1988-02-15',), ('1988-03-14',), ('1988-04-11',), ('1988-05-09',), ('1988-06-13',), ('1988-07-11',), ('1988-08-08',), ('1988-09-05',), ('1988-10-03',), ('1988-10-31',), ('1988-11-28',), ('1988-12-26',), ('1989-01-30',), ('1989-02-27',), ('1989-03-27',), ('1989-04-24',), ('1989-05-22',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('SLE, MCTD', '1984-07-12'), ('SLE, MCTD', '1984-08-02'), ('SLE, MCTD', '1984-09-03'), ('SLE, MCTD', '1984-10-01'), ('SLE, MCTD', '1984-10-22'), ('SLE, MCTD', '1984-11-19'), ('SLE, MCTD', '1984-12-17'), ('SLE, MCTD', '1984-12-27'), ('SLE, MCTD', '1985-01-24'), ('SLE, MCTD', '1985-02-21'), ('SLE, MCTD', '1985-04-04'), ('SLE, MCTD', '1985-05-02'), ('SLE, MCTD', '1985-06-03'), ('SLE, MCTD', '1985-06-13'), ('SLE, MCTD', '1985-07-01'), ('SLE, MCTD', '1985-08-05'), ('SLE, MCTD', '1985-09-09'), ('SLE, MCTD', '1985-10-14'), ('SLE, MCTD', '1985-11-11'), ('SLE, MCTD', '1985-12-12'), ('SLE, MCTD', '1986-01-09'), ('SLE, MCTD', '1986-02-06'), ('SLE, MCTD', '1986-03-06'), ('SLE, MCTD', '1986-04-03'), ('SLE, MCTD', '1986-05-01'), ('SLE, MCTD', '1986-06-05'), ('SLE, MCTD', '1986-07-03'), ('SLE, MCTD', '1986-07-31'), ('SLE, MCTD', '1986-09-11'), ('SLE, MCTD', '1986-10-16'), ('SLE, MCTD', '1986-11-20'), ('SLE, MCTD', '1986-12-18'), ('SLE, MCTD', '1987-02-19'), ('SLE, MCTD', '1987-04-23'), ('SLE, MCTD', '1987-05-21'), ('SLE, MCTD', '1987-06-18'), ('SLE, MCTD', '1987-07-23'), ('SLE, MCTD', '1987-08-20'), ('SLE, MCTD', '1987-09-21'), ('SLE, MCTD', '1987-10-19'), ('SLE, MCTD', '1987-11-16'), ('SLE, MCTD', '1987-12-14'), ('SLE, MCTD', '1988-01-18'), ('SLE, MCTD', '1988-02-15'), ('SLE, MCTD', '1988-03-14'), ('SLE, MCTD', '1988-04-11'), ('SLE, MCTD', '1988-05-09'), ('SLE, MCTD', '1988-06-13'), ('SLE, MCTD', '1988-07-11'), ('SLE, MCTD', '1988-08-08'), ('SLE, MCTD', '1988-09-05'), ('SLE, MCTD', '1988-10-03'), ('SLE, MCTD', '1988-10-31'), ('SLE, MCTD', '1988-11-28'), ('SLE, MCTD', '1988-12-26'), ('SLE, MCTD', '1989-01-30'), ('SLE, MCTD', '1989-02-27'), ('SLE, MCTD', '1989-03-27'), ('SLE, MCTD', '1989-04-24'), ('SLE, MCTD', '1989-05-22')]
----------------------------
