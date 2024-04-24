-- PROBLEM # 906
-- Generation # 0
-- Difficulty: moderate
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

-- External Knowledge: first race refers to min(Year)
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which was Lewis Hamilton first race? What was his points recorded for his first race event?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT r.name, r.year, r.round, r.date, r.time, r.url, r.circuitId, r.raceId, r.driverId, r.constructorId, r.number, r.grid, r.position, r.positionText, r.positionOrder, r.points, r.laps, r.time, r.milliseconds, r.fastestLap, r.rank, r.fastestLapTime, r.fastestLapSpeed, r.statusId, r.driverId, r.constructorId, r.statusId, d.forename, d.surname, d.dob, d.nationality, d.url, c.name, c.nationality, c.url, s.year, s.url FROM results r JOIN drivers d ON r.driverId = d.driverId JOIN constructors c ON r.constructorId = c.constructorId JOIN races ON r.raceId = races.raceId JOIN seasons s ON r.year = s.year WHERE d.forename = 'Lewis' AND d.surname = 'Hamilton' AND r.position IS NOT NULL ORDER BY r.year, r.round LIMIT 1;
----------------------------


-- EXCEPTION
no such column: r.name
----------------------------




