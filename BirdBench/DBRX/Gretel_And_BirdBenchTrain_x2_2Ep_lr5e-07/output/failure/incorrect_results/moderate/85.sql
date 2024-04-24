-- PROBLEM # 85
-- Generation # 0
-- Difficulty: moderate
----------------------------

-- PROMPT
CREATE TABLE frpm
(
    CDSCode                                       TEXT not null
        primary key,
    `Academic Year`                               TEXT  null,
    `County Code`                                 TEXT  null,
    `District Code`                               INTEGER         null,
    `School Code`                                 TEXT  null,
    `County Name`                                 TEXT null,
    `District Name`                               TEXT null,
    `School Name`                                 TEXT null,
    `District Type`                               TEXT null,
    `School Type`                                 TEXT null,
    `Educational Option Type`                     TEXT null,
    `NSLP Provision Status`                       TEXT null,
    `Charter School (Y/N)`                        INTEGER    null,
    `Charter School Number`                       TEXT  null,
    `Charter Funding Type`                        TEXT null,
    IRC                                           INTEGER    null,
    `Low Grade`                                   TEXT  null,
    `High Grade`                                  TEXT null,
    `Enrollment (K-12)`                           REAL      null,
    `Free Meal Count (K-12)`                      REAL       null,
    `Percent (%) Eligible Free (K-12)`            REAL       null,
    `FRPM Count (K-12)`                           REAL       null,
    `Percent (%) Eligible FRPM (K-12)`            REAL       null,
    `Enrollment (Ages 5-17)`                      REAL       null,
    `Free Meal Count (Ages 5-17)`                 REAL       null,
    `Percent (%) Eligible Free (Ages 5-17)`       REAL       null,
    `FRPM Count (Ages 5-17)`                      REAL       null,
    `Percent (%) Eligible FRPM (Ages 5-17)`       REAL       null,
    `2013-14 CALPADS Fall 1 Certification Status` INTEGER    null,
    foreign key (CDSCode) references schools (CDSCode)
)

CREATE TABLE satscores
(
    cds         TEXT not null
        primary key,
    rtype       TEXT  not null,
    sname       TEXT null,
    dname       TEXT null,
    cname       TEXT null,
    enroll12    INTEGER         not null,
    NumTstTakr  INTEGER          not null,
    AvgScrRead  INTEGER          null,
    AvgScrMath  INTEGER          null,
    AvgScrWrite INTEGER          null,
    NumGE1500   INTEGER          null,
--     PctGE1500   double      null,
        foreign key (cds) references schools (CDSCode)
)

CREATE TABLE schools
(
    CDSCode     TEXT not null
        primary key,
    NCESDist    TEXT  null,
    NCESSchool  TEXT  null,
    StatusType  TEXT  not null,
    County      TEXT not null,
    District    TEXT not null,
    School      TEXT null,
    Street      TEXT null,
    StreetAbr   TEXT null,
    City        TEXT null,
    Zip         TEXT null,
    State       TEXT  null,
    MailStreet  TEXT null,
    MailStrAbr  TEXT null,
    MailCity    TEXT null,
    MailZip     TEXT null,
    MailState   TEXT  null,
    Phone       TEXT null,
    Ext         TEXT  null,
    Website     TEXT null,
    OpenDate    DATE        null,
    ClosedDate  DATE        null,
    Charter     INTEGER    null,
    CharterNum  TEXT  null,
    FundingType TEXT null,
    DOC         TEXT  not null,
    DOCType     TEXT not null,
    SOC         TEXT  null,
    SOCType     TEXT null,
    EdOpsCode   TEXT  null,
    EdOpsName   TEXT null,
    EILCode     TEXT  null,
    EILName     TEXT null,
    GSoffered   TEXT null,
    GSserved    TEXT  null,
    Virtual     TEXT  null,
    Magnet      INTEGER   null,
    Latitude    REAL      null,
    Longitude   REAL      null,
    AdmFName1   TEXT null,
    AdmLName1   TEXT null,
    AdmEmail1   TEXT null,
    AdmFName2   TEXT null,
    AdmLName2   TEXT null,
    AdmEmail2   TEXT null,
    AdmFName3   TEXT  null,
    AdmLName3   TEXT null,
    AdmEmail3   TEXT null,
    LastUpdate  DATE        not null
)

-- External Knowledge: Percent (%) Eligible Free (K-12) = `Free Meal Count (K-12)` / `Enrollment (K-12)` * 100%
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the Percent (%) Eligible Free (K-12) in the school administered by an administrator whose first name is Alusine. List the district code of the school.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * `Free Meal Count (K-12)` / `Enrollment (K-12)` as Percent_Free FROM frpm WHERE `District Name` = (SELECT District FROM schools WHERE AdmFName1 = 'Alusine')
----------------------------




-- RESULTS FROM GENERATED SQL
[(86.25,), (70.1863354037267,), (72.95434969853575,), (84.61538461538461,), (56.73913043478261,), (59.57918050941307,), (65.24300441826215,), (89.5320197044335,), (57.58176412289396,), (81.12965340179717,), (85.84729981378027,), (90.96126255380202,), (79.29515418502203,), (77.1264367816092,), (76.8527918781726,), (75.34076827757126,), (73.33333333333333,), (75.88005215123859,), (70.15113350125945,), (70.36199095022624,), (67.09451575262544,), (70.70707070707071,), (61.46220570012392,), (70.3562340966921,), (69.66145833333333,), (67.28665207877462,), (65.39877300613497,), (58.29959514170041,), (70.23255813953489,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(70.15113350125945, 64857)]
----------------------------
