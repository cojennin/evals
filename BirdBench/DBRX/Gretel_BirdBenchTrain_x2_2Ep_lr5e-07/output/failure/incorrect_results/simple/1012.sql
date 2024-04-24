-- PROBLEM # 1012
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

-- External Knowledge: fastest lap refers to MIN(time)
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What was the position of the circuits during Lewis Hamilton's fastest lap in a Formula_1 race?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT position FROM results WHERE driverId = (SELECT driverId FROM results WHERE time = (SELECT MIN(time) FROM results WHERE driverId = (SELECT driverId FROM drivers WHERE forename = 'Lewis' AND surname = 'Hamilton'))) AND statusId = 1;
----------------------------




-- RESULTS FROM GENERATED SQL
[(1,), (5,), (3,), (2,), (1,), (10,), (1,), (1,), (5,), (2,), (3,), (7,), (3,), (12,), (1,), (5,), (3,), (2,), (2,), (2,), (2,), (1,), (1,), (3,), (3,), (1,), (5,), (2,), (4,), (1,), (7,), (6,), (4,), (13,), (1,), (2,), (1,), (3,), (3,), (3,), (6,), (6,), (2,), (5,), (1,), (1,), (2,), (2,), (4,), (1,), (5,), (2,), (4,), (2,), (2,), (8,), (1,), (4,), (2,), (6,), (4,), (4,), (1,), (4,), (4,), (5,), (5,), (2,), (7,), (1,), (3,), (3,), (3,), (8,), (8,), (5,), (1,), (8,), (1,), (1,), (5,), (10,), (4,), (1,), (5,), (3,), (3,), (5,), (4,), (3,), (4,), (5,), (1,), (3,), (9,), (5,), (5,), (6,), (7,), (4,), (9,), (1,), (1,), (1,), (1,), (2,), (2,), (1,), (3,), (3,), (1,), (1,), (1,), (1,), (1,), (2,), (1,), (1,), (2,), (1,), (1,), (2,), (3,), (1,), (2,), (1,), (6,), (1,), (1,), (1,), (1,), (1,), (2,), (2,), (2,), (2,), (3,), (7,), (2,), (1,), (1,), (5,), (1,), (1,), (1,), (1,), (3,), (2,), (3,), (3,), (1,), (1,), (1,), (1,), (2,), (1,), (2,), (4,), (1,), (7,), (1,), (5,), (4,), (1,), (4,), (1,), (1,), (1,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(5,)]
----------------------------
