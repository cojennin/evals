-- PROBLEM # 28
-- Generation # 0
-- Difficulty: challenging
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

-- External Knowledge: Difference between K-12 enrollment and 15-17 enrollment can be computed by `Enrollment (K-12)` - `Enrollment (Ages 5-17)`
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Consider the average difference between K-12 enrollment and 15-17 enrollment of schools that are locally funded, list the names and DOC type of schools which has a difference above this average.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.School, s.DOCType FROM schools s INNER JOIN frpm f ON s.CDSCode = f.CDSCode WHERE f.`Charter Funding Type` = 'Locally Funded' AND (f.`Enrollment (K-12)` - f.`Enrollment (Ages 5-17)`) > (SELECT AVG(f2.`Enrollment (K-12)` - f2.`Enrollment (Ages 5-17)`) FROM frpm f2 WHERE f2.`Charter Funding Type` = 'Locally Funded')
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Mountain Oaks', '00'), ('Castle Rock', '00'), ('Charter Community School Home Study Academy', '00'), ('Clovis Online Charter', '54'), ('Washington Elementary', '52'), ('West Park Charter Academy', '52'), ('Mattole Valley Charter (#159)', '54'), ('YouthBuild Charter School of California', '00'), ('The Education Corps', '00'), ('College Bridge Academy', '00'), ('Kern Workforce 2000 Academy', '56'), ('Kings River-Hardwick Elementary', '52'), ('Soledad Enrichment Action Charter High', '00'), ('Chatsworth Charter High', '54'), ('Grover Cleveland Charter High', '54'), ('Sylmar Charter High', '54'), ('Taft Charter High', '54'), ('Calahan Community Charter', '54'), ('Carpenter Community Charter', '54'), ('YES Academy', '54'), ('Pomelo Community Charter', '54'), ('Serrania Avenue Charter For Enriched Studies', '54'), ('Westwood Charter Elementary', '54'), ('Wilbur Charter For Enriched Academics', '54'), ('Marlton', '54'), ('School of Extended Educational Options', '54'), ('Madera County Independent Academy', '00'), ('Pioneer Technical Center', '00'), ('Monterey County Home Charter', '00'), ('Forest Charter', '00'), ('Union Hill Elementary', '52'), ('Come Back Kids', '00'), ('George Washington Charter', '54'), ('Elk Grove Charter', '54'), ('Visions In Education', '54'), ('San Juan Choices Charter', '54'), ('Natomas Charter', '54'), ('Riverside Preparatory', '52'), ('Delta Home Charter', '52'), ('Delta Charter Online', '52'), ('Delta Charter', '52'), ('Stockton High', '54'), ('Grizzly ChalleNGe Charter', '00'), ('Arundel Elementary', '52'), ('Fammatre Elementary', '52'), ('Castlemont Elementary', '52'), ('Lynhaven Elementary', '52'), ('Rosemary Elementary', '52'), ('Pacific Coast Charter', '54'), ('Fairmont Charter Elementary', '54'), ('Gateway to College Academy', '56'), ('Stanislaus Alternative Charter', '00'), ('Denair Charter Academy', '54'), ('Summit Charter Academy', '52'), ('Visalia Charter Independent Study', '54'), ('Butterfield Charter High', '54'), ('Yuba County Career Preparatory Charter', '00')]
----------------------------
