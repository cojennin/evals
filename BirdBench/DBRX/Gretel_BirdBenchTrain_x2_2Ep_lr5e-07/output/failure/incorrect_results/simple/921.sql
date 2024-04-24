-- PROBLEM # 921
-- Generation # 0
-- Difficulty: simple
----------------------------

-- PROMPT
CREATE TABLE sqlite_sequence(name,seq)

CREATE TABLE circuits
(
    circuitId  INTEGER
        primary key autoincrement,
    circuitRef TEXT default '' not null,
    name       TEXT default '' not null,
    location   TEXT,
    country    TEXT,
    lat        REAL,
    lng        REAL,
    alt        INTEGER,
    url        TEXT default '' not null
        unique
)

CREATE TABLE constructors
(
    constructorId  INTEGER
        primary key autoincrement,
    constructorRef TEXT default '' not null,
    name           TEXT default '' not null
        unique,
    nationality    TEXT,
    url            TEXT default '' not null
)

CREATE TABLE drivers
(
    driverId    INTEGER
        primary key autoincrement,
    driverRef   TEXT default '' not null,
    number      INTEGER,
    code        TEXT,
    forename    TEXT default '' not null,
    surname     TEXT default '' not null,
    dob         DATE,
    nationality TEXT,
    url         TEXT default '' not null
        unique
)

CREATE TABLE seasons
(
    year INTEGER default 0  not null
        primary key,
    url  TEXT    default '' not null
        unique
)

CREATE TABLE races
(
    raceId    INTEGER
        primary key autoincrement,
    year      INTEGER default 0            not null,
    round     INTEGER default 0            not null,
    circuitId INTEGER default 0            not null,
    name      TEXT    default ''           not null,
    date      DATE    default '0000-00-00' not null,
    time      TEXT,
    url       TEXT unique,
    foreign key (year) references seasons(year),
    foreign key (circuitId) references circuits(circuitId)
)

CREATE TABLE constructorResults
(
    constructorResultsId INTEGER
        primary key autoincrement,
    raceId               INTEGER default 0 not null,
    constructorId        INTEGER default 0 not null,
    points               REAL,
    status               TEXT,
    foreign key (raceId) references races(raceId),
    foreign key (constructorId) references constructors(constructorId)

)

CREATE TABLE constructorStandings
(
    constructorStandingsId INTEGER
        primary key autoincrement,
    raceId                 INTEGER default 0 not null,
    constructorId          INTEGER default 0 not null,
    points                 REAL   default 0 not null,
    position               INTEGER,
    positionText           TEXT,
    wins                   INTEGER default 0 not null,
    foreign key (raceId) references races(raceId),
    foreign key (constructorId) references constructors(constructorId)
)

CREATE TABLE driverStandings
(
    driverStandingsId INTEGER
        primary key autoincrement,
    raceId            INTEGER default 0 not null,
    driverId          INTEGER default 0 not null,
    points            REAL   default 0 not null,
    position          INTEGER,
    positionText      TEXT,
    wins              INTEGER default 0 not null,
    foreign key (raceId) references races(raceId),
    foreign key (driverId) references drivers(driverId)
)

CREATE TABLE lapTimes
(
    raceId       INTEGER not null,
    driverId     INTEGER not null,
    lap          INTEGER not null,
    position     INTEGER,
    time         TEXT,
    milliseconds INTEGER,
    primary key (raceId, driverId, lap),
    foreign key (raceId) references races(raceId),
    foreign key (driverId) references drivers(driverId)
)

CREATE TABLE pitStops
(
    raceId       INTEGER not null,
    driverId     INTEGER not null,
    stop         INTEGER not null,
    lap          INTEGER not null,
    time         TEXT    not null,
    duration     TEXT,
    milliseconds INTEGER,
    primary key (raceId, driverId, stop),
    foreign key (raceId) references races(raceId),
    foreign key (driverId) references drivers(driverId)
)

CREATE TABLE qualifying
(
    qualifyId     INTEGER
        primary key autoincrement,
    raceId        INTEGER default 0 not null,
    driverId      INTEGER default 0 not null,
    constructorId INTEGER default 0 not null,
    number        INTEGER default 0 not null,
    position      INTEGER,
    q1            TEXT,
    q2            TEXT,
    q3            TEXT,
    foreign key (raceId) references races(raceId),
    foreign key (driverId) references drivers(driverId),
    foreign key (constructorId) references constructors(constructorId)
)

CREATE TABLE status
(
    statusId INTEGER
        primary key autoincrement,
    status   TEXT default '' not null
)

CREATE TABLE results
(
    resultId        INTEGER
        primary key autoincrement,
    raceId          INTEGER default 0  not null,
    driverId        INTEGER default 0  not null,
    constructorId   INTEGER default 0  not null,
    number          INTEGER,
    grid            INTEGER default 0  not null,
    position        INTEGER,
    positionText    TEXT    default '' not null,
    positionOrder   INTEGER default 0  not null,
    points          REAL   default 0  not null,
    laps            INTEGER default 0  not null,
    time            TEXT,
    milliseconds    INTEGER,
    fastestLap      INTEGER,
    rank            INTEGER default 0,
    fastestLapTime  TEXT,
    fastestLapSpeed TEXT,
    statusId        INTEGER default 0  not null,
    foreign key (raceId) references races(raceId),
    foreign key (driverId) references drivers(driverId),
    foreign key (constructorId) references constructors(constructorId),
    foreign key (statusId) references status(statusId)
)

-- External Knowledge: more information refers to url
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please give more information about the Formula_1 races that used the Silverstone Circuit.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT races.name, circuits.name, races.date FROM races INNER JOIN circuits ON races.circuitId = circuits.circuitId WHERE circuits.name = 'Silverstone Circuit';
----------------------------




-- RESULTS FROM GENERATED SQL
[('British Grand Prix', 'Silverstone Circuit', '2009-06-21'), ('British Grand Prix', 'Silverstone Circuit', '2008-07-06'), ('British Grand Prix', 'Silverstone Circuit', '2007-07-08'), ('British Grand Prix', 'Silverstone Circuit', '2006-06-11'), ('British Grand Prix', 'Silverstone Circuit', '2005-07-10'), ('British Grand Prix', 'Silverstone Circuit', '2004-07-11'), ('British Grand Prix', 'Silverstone Circuit', '2003-07-20'), ('British Grand Prix', 'Silverstone Circuit', '2002-07-07'), ('British Grand Prix', 'Silverstone Circuit', '2001-07-15'), ('British Grand Prix', 'Silverstone Circuit', '2000-04-23'), ('British Grand Prix', 'Silverstone Circuit', '1999-07-11'), ('British Grand Prix', 'Silverstone Circuit', '1998-07-12'), ('British Grand Prix', 'Silverstone Circuit', '1997-07-13'), ('British Grand Prix', 'Silverstone Circuit', '1996-07-14'), ('British Grand Prix', 'Silverstone Circuit', '1995-07-16'), ('British Grand Prix', 'Silverstone Circuit', '1994-07-10'), ('British Grand Prix', 'Silverstone Circuit', '1993-07-11'), ('British Grand Prix', 'Silverstone Circuit', '1992-07-12'), ('British Grand Prix', 'Silverstone Circuit', '1991-07-14'), ('British Grand Prix', 'Silverstone Circuit', '1990-07-15'), ('British Grand Prix', 'Silverstone Circuit', '2010-07-11'), ('British Grand Prix', 'Silverstone Circuit', '1989-07-16'), ('British Grand Prix', 'Silverstone Circuit', '1988-07-10'), ('British Grand Prix', 'Silverstone Circuit', '1987-07-12'), ('British Grand Prix', 'Silverstone Circuit', '1985-07-21'), ('British Grand Prix', 'Silverstone Circuit', '1983-07-16'), ('British Grand Prix', 'Silverstone Circuit', '1981-07-18'), ('British Grand Prix', 'Silverstone Circuit', '1979-07-14'), ('British Grand Prix', 'Silverstone Circuit', '1977-07-16'), ('British Grand Prix', 'Silverstone Circuit', '1975-07-19'), ('British Grand Prix', 'Silverstone Circuit', '1973-07-14'), ('British Grand Prix', 'Silverstone Circuit', '1971-07-17'), ('British Grand Prix', 'Silverstone Circuit', '1969-07-19'), ('British Grand Prix', 'Silverstone Circuit', '1967-07-15'), ('British Grand Prix', 'Silverstone Circuit', '1965-07-10'), ('British Grand Prix', 'Silverstone Circuit', '1963-07-20'), ('British Grand Prix', 'Silverstone Circuit', '1960-07-16'), ('British Grand Prix', 'Silverstone Circuit', '1958-07-19'), ('British Grand Prix', 'Silverstone Circuit', '1956-07-14'), ('British Grand Prix', 'Silverstone Circuit', '1954-07-17'), ('British Grand Prix', 'Silverstone Circuit', '1953-07-18'), ('British Grand Prix', 'Silverstone Circuit', '1952-07-19'), ('British Grand Prix', 'Silverstone Circuit', '1951-07-14'), ('British Grand Prix', 'Silverstone Circuit', '1950-05-13'), ('British Grand Prix', 'Silverstone Circuit', '2011-07-10'), ('British Grand Prix', 'Silverstone Circuit', '2012-07-08'), ('British Grand Prix', 'Silverstone Circuit', '2013-06-30'), ('British Grand Prix', 'Silverstone Circuit', '2014-07-06'), ('British Grand Prix', 'Silverstone Circuit', '2015-07-05'), ('British Grand Prix', 'Silverstone Circuit', '2016-07-10'), ('British Grand Prix', 'Silverstone Circuit', '2017-07-16')]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('http://en.wikipedia.org/wiki/Silverstone_Circuit',)]
----------------------------
