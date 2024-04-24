-- PROBLEM # 1214
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

-- External Knowledge: total protein (TP) below the lower range of the normal index refers to TP < 6.0
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List ID, sex and date of birth of patient whose total protein (TP) below the lower range of the normal index.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT ID, SEX, Birthday FROM Patient WHERE ID IN (SELECT ID FROM Laboratory WHERE TP < 6.0)
----------------------------






-- ACTUAL RESULTS
[(27654, 'F', '1936-03-25'), (57266, 'M', '1923-07-25'), (287122, 'F', '1953-05-26'), (287861, 'F', '1943-07-06'), (444499, 'M', '1954-01-24'), (460574, 'F', '1985-06-28'), (912147, 'F', '1975-02-17'), (940737, 'F', '1943-05-19'), (944797, 'F', '1975-01-31'), (1078741, 'F', '1937-12-18'), (1185720, 'F', '1953-10-12'), (1567380, 'F', '1959-03-01'), (1755350, 'F', '1944-05-24'), (1923445, 'F', '1959-01-10'), (2307640, 'M', '1953-04-06'), (2308236, 'F', '1951-01-20'), (2315140, 'F', '1935-04-19'), (2343945, 'F', '1952-09-10'), (2355809, 'F', '1938-01-01'), (2370675, 'F', '1974-10-04'), (2436816, 'F', '1931-04-03'), (2927464, '', '1931-04-04'), (2931207, 'F', '1959-01-05'), (2933261, 'F', '1967-08-26'), (2956679, 'F', '1944-05-26'), (3174630, 'F', '1974-02-16'), (3182521, 'M', '1952-10-16'), (3215988, 'F', '1939-05-30'), (3299630, 'M', '1975-04-14'), (3362815, 'M', '1969-02-06'), (3380563, 'F', '1956-04-10'), (3418071, 'F', '1957-11-12'), (4007151, 'M', '1968-06-11'), (4417978, 'F', '1941-10-06'), (4425292, 'F', '1954-12-23'), (4432946, 'M', '1960-03-28'), (4466840, 'F', '1953-07-12'), (4618443, 'M', '1922-12-01'), (4632548, 'F', '1927-01-25'), (4652830, 'F', '1946-05-12'), (4790235, 'F', '1943-11-28'), (4840422, 'F', '1962-01-18'), (4843434, 'F', '1971-09-20'), (4862013, 'F', '1964-01-29'), (4865142, 'M', '1961-12-12'), (4879930, 'F', '1958-11-24'), (4884792, 'F', '1971-05-12'), (4885128, 'F', '1968-09-25'), (4894243, 'F', '1956-12-07'), (4910103, 'F', '1927-10-05'), (5060913, 'F', '1968-08-13'), (5064814, 'F', '1965-03-19'), (5115307, 'F', '1976-12-15'), (5117606, 'F', '1946-04-06'), (5119703, 'M', '1968-05-21'), (5122312, 'F', '1969-11-30'), (5126587, 'F', '1964-01-01'), (5164396, 'F', '1938-03-23'), (5181621, 'M', '1942-03-04'), (5184284, 'F', '1963-12-13'), (5186147, 'F', '1949-05-11'), (5296268, 'F', '1969-02-15'), (5300381, 'F', '1953-12-26'), (5302954, 'F', '1978-02-10'), (5397059, 'F', '1976-01-14'), (5405581, 'F', '1956-06-25'), (5441886, 'F', '1968-02-16'), (5452747, 'F', '1972-03-22')]
----------------------------
