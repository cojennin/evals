-- PROBLEM # 72
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

-- External Knowledge: State Special School means EdOpsCode = 'SSS'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- How many students from the ages of 5 to 17 are enrolled at the State Special School school in Fremont for the 2014-2015 academic year?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT COUNT(*) FROM satscores WHERE satscores.cds = 'A1234567' AND satscores.rtype = 'Enrollment (Ages 5-17)' AND satscores.sname = 'State Special School' AND satscores.dname = 'Fremont' AND satscores.cname = 'Alameda' AND satscores.enroll12 = 1 AND satscores.NumTstTakr = 1 AND satscores.AvgScrRead = 1 AND satscores.AvgScrMath = 1 AND satscores.AvgScrWrite = 1 AND satscores.NumGE1500 = 1 AND satscores.PctGE1500 = 1 AND satscores.cds IN (SELECT schools.CDSCode FROM schools WHERE schools.CDSCode = 'A1234567' AND schools.NCESDist = 'A1234567' AND schools.NCESSchool = 'A1234567' AND schools.StatusType = 'Active' AND schools.County = 'Alameda' AND schools.District = 'Fremont' AND schools.School = 'State Special School' AND schools.Street = 'A1234567' AND schools.StreetAbr = 'A1234567' AND schools.City = 'A1234567' AND schools.Zip = 'A1234567' AND schools.State = 'A1234567' AND schools.MailStreet = 'A1234567' AND schools.MailStrAbr = 'A1234567' AND schools.MailCity = 'A1234567' AND schools.MailZip = 'A1234567' AND schools.MailState = 'A1234567' AND schools.Phone = 'A1234567' AND schools.Ext = 'A1234567' AND schools.Website = 'A1234567' AND schools.OpenDate = 'A1234567' AND schools.ClosedDate = 'A1234567' AND schools.Charter = 1 AND schools.CharterNum = 'A1234567' AND schools.FundingType = 'A1234567' AND schools.DOC = 'A1234567' AND schools.DOCType = 'A1234567' AND schools.SOC = 'A1234567' AND schools.SOCType = 'A1234567' AND schools.EdOpsCode = 'SSS' AND schools.EdOpsName = 'A1234567' AND schools.EILCode = 'A1234567' AND schools.EILName = 'A1234567' AND schools.GSoffered = 'A1234567' AND schools.GSserved = 'A1234567' AND schools.Virtual = 'A1234567' AND schools.Magnet = 1 AND schools.Latitude = 1 AND schools.Longitude = 1 AND schools.AdmFName1 = 'A1234567' AND schools.AdmLName1 = 'A1234567' AND schools.AdmEmail1 = 'A1234567' AND schools.AdmFName2 = 'A1234567' AND schools.AdmLName2 = 'A1234567' AND schools.AdmEmail2 = 'A1234567' AND schools.AdmFName3 = 'A1234567' AND schools.AdmLName3 = 'A1234567' AND schools.AdmEmail3 = 'A1234567' AND schools.LastUpdate = 'A1234567') AND satscores.cds IN (SELECT frpm.CDSCode FROM frpm WHERE frpm.CDSCode = 'A1234567' AND frpm.`Academic Year` = 'A1234567' AND frpm.`County Code` = 'A1234567' AND frpm.`District Code` = 1 AND frpm.`School Code` = 'A1234567' AND frpm.`County Name` = 'A1234567' AND frpm.`District Name` = 'A1234567' AND frpm.`School Name` = 'A1234567' AND frpm.`District Type` = 'A1234567' AND frpm.`School Type` = 'A1234567' AND frpm.`Educational Option Type` = 'A1234567' AND frpm.`NSLP Provision Status` = 'A1234567' AND frpm.`Charter School (Y/N)` = 1 AND frpm.`Charter School Number` = 'A1234567' AND frpm.`Charter Funding Type` = 'A1234567' AND frpm.IRC = 1 AND frpm.`Low Grade` = 'A1234567' AND frpm.`High Grade` = 'A1234567' AND frpm.`Enrollment (K-12)` = 1 AND frpm.`Free Meal Count (K-12)` = 1 AND frpm.`Percent (%) Eligible Free (K-12)` = 1 AND frpm.`FRPM Count (K-12)` = 1 AND frpm.`Percent (%) Eligible FRPM (K-12)` = 1 AND frpm.`Enrollment (Ages 5-17)` = 1 AND frpm.`Free Meal Count (Ages 5-17)` = 1 AND frpm.`Percent (%) Eligible Free (Ages 5-17)` = 1 AND frpm.`FRPM Count (Ages 5-17)` = 1 AND frpm.`Percent (%) Eligible FRPM (Ages 5-17)` = 1 AND frpm.`2013-14 CALPADS Fall 1 Certification Status` = 1)
----------------------------


-- EXCEPTION
no such column: satscores.PctGE1500
----------------------------




