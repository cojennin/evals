-- PROBLEM # 10
-- Generation # 0
-- Difficulty: simple
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

-- External Knowledge: 
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For the school with the highest average score in Reading in the SAT test, what is its FRPM count for students aged 5-17?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.cds, s.sname, s.dname, s.cname, s.enroll12, s.NumTstTakr, s.AvgScrRead, s.AvgScrMath, s.AvgScrWrite, s.NumGE1500, s.PctGE1500, f.CDSCode, f.`Academic Year`, f.`County Code`, f.`District Code`, f.`School Code`, f.`County Name`, f.`District Name`, f.`School Name`, f.`District Type`, f.`School Type`, f.`Educational Option Type`, f.`NSLP Provision Status`, f.`Charter School (Y/N)`, f.`Charter School Number`, f.`Charter Funding Type`, f.IRC, f.`Low Grade`, f.`High Grade`, f.`Enrollment (K-12)`, f.`Free Meal Count (K-12)`, f.`Percent (%) Eligible Free (K-12)`, f.`FRPM Count (K-12)`, f.`Percent (%) Eligible FRPM (K-12)`, f.`Enrollment (Ages 5-17)`, f.`Free Meal Count (Ages 5-17)`, f.`Percent (%) Eligible Free (Ages 5-17)`, f.`FRPM Count (Ages 5-17)`, f.`Percent (%) Eligible FRPM (Ages 5-17)`, f.`2013-14 CALPADS Fall 1 Certification Status` FROM satscores s INNER JOIN frpm f ON s.cds = f.CDSCode WHERE s.AvgScrRead = (SELECT MAX(AvgScrRead) FROM satscores) AND f.`Enrollment (Ages 5-17)` = (SELECT MAX(f.`Enrollment (Ages 5-17)`) FROM frpm f WHERE s.cds = f.CDSCode)
----------------------------


-- EXCEPTION
no such column: s.PctGE1500
----------------------------




