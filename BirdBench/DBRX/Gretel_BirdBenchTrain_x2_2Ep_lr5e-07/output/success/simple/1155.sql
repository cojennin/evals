-- PROBLEM # 1155
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

-- External Knowledge: LDH beyond normal range refers to LDH > '500'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the patient ID, sex and birthday of patient with LDH beyond normal range.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Patient.ID, Patient.SEX, Patient.Birthday FROM Patient INNER JOIN Laboratory ON Patient.ID = Laboratory.ID WHERE Laboratory.LDH > 500;
----------------------------






-- ACTUAL RESULTS
[(27654, 'F', '1936-03-25'), (57266, 'M', '1923-07-25'), (81043, 'M', '1967-03-25'), (540520, 'F', '1941-11-21'), (912147, 'F', '1975-02-17'), (944797, 'F', '1975-01-31'), (1078741, 'F', '1937-12-18'), (1110526, 'F', '1966-01-01'), (1124385, 'F', '1944-04-20'), (1137040, 'M', '1966-12-01'), (1138737, 'F', '1965-11-18'), (1650222, 'F', '1947-03-17'), (1673252, 'F', '1989-08-28'), (1944990, 'F', '1950-08-03'), (2265184, 'F', '1926-01-02'), (2276582, 'F', '1941-07-10'), (2307640, 'M', '1953-04-06'), (2308236, 'F', '1951-01-20'), (2343945, 'F', '1952-09-10'), (2371753, 'F', '1932-12-05'), (2395148, 'F', '1971-04-03'), (2931207, 'F', '1959-01-05'), (2933261, 'F', '1967-08-26'), (3150681, 'F', '1974-09-30'), (3173679, 'F', '1980-09-04'), (3178036, 'F', '1929-03-22'), (3182521, 'M', '1952-10-16'), (3310582, 'F', '1965-11-10'), (3362815, 'M', '1969-02-06'), (3418071, 'F', '1957-11-12'), (3545964, 'F', '1926-08-01'), (3552067, 'F', '1938-04-05'), (4007151, 'M', '1968-06-11'), (4021070, 'F', '1928-07-10'), (4415406, 'F', '1935-06-03'), (4416959, 'F', '1949-07-16'), (4417978, 'F', '1941-10-06'), (4424808, 'F', '1936-05-22'), (4425292, 'F', '1954-12-23'), (4466420, 'F', '1930-02-15'), (4466840, 'F', '1953-07-12'), (4472142, 'F', '1973-03-27'), (4483771, 'M', '1967-03-15'), (4618443, 'M', '1922-12-01'), (4621629, 'F', '1962-07-19'), (4630092, 'F', '1949-04-21'), (4632421, 'F', '1941-07-29'), (4632519, 'F', '1925-03-25'), (4632548, 'F', '1927-01-25'), (4634342, 'F', '1967-11-11'), (4643816, 'F', '1949-05-13'), (4648912, 'F', '1974-11-25'), (4649885, 'F', '1952-03-03'), (4652830, 'F', '1946-05-12'), (4790235, 'F', '1943-11-28'), (4791049, 'F', '1939-01-07'), (4792459, 'M', '1931-02-11'), (4823634, 'F', '1938-04-08'), (4840422, 'F', '1962-01-18'), (4843434, 'F', '1971-09-20'), (4861720, 'F', '1973-04-13'), (4862013, 'F', '1964-01-29'), (4865142, 'M', '1961-12-12'), (4869782, 'M', '1961-03-18'), (4878272, 'F', '1945-12-04'), (4879930, 'F', '1958-11-24'), (4894243, 'F', '1956-12-07'), (4915498, 'F', '1959-01-22'), (4916710, 'F', '1939-09-19'), (4921572, 'F', '1950-09-04'), (4927381, 'F', '1977-02-26'), (5064814, 'F', '1965-03-19'), (5065022, 'F', '1971-11-16'), (5093188, 'M', '1944-04-25'), (5093771, 'F', '1964-10-17'), (5094107, 'F', '1969-04-05'), (5096552, 'F', '1938-01-01'), (5098691, 'F', '1950-10-19'), (5105683, 'F', '1976-04-03'), (5115307, 'F', '1976-12-15'), (5115815, 'M', '1950-04-04'), (5119703, 'M', '1968-05-21'), (5122312, 'F', '1969-11-30'), (5123360, 'F', '1960-08-24'), (5126587, 'F', '1964-01-01'), (5164396, 'F', '1938-03-23'), (5174645, 'M', '1938-11-07'), (5176234, 'F', '1957-01-19'), (5176755, 'F', '1931-05-27'), (5179581, 'F', '1955-01-07'), (5181621, 'M', '1942-03-04'), (5184284, 'F', '1963-12-13'), (5186147, 'F', '1949-05-11'), (5296268, 'F', '1969-02-15'), (5300381, 'F', '1953-12-26'), (5302954, 'F', '1978-02-10'), (5397059, 'F', '1976-01-14'), (5404650, 'F', '1963-04-07'), (5405581, 'F', '1956-06-25'), (5408290, 'M', '1957-11-06'), (5441886, 'F', '1968-02-16'), (5446559, 'F', '1931-03-19'), (5452747, 'F', '1972-03-22')]
----------------------------
