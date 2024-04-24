-- PROBLEM # 952
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

-- External Knowledge: 
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which constructors have been ranked 1?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT constructors.name FROM constructors JOIN constructorStandings ON constructors.constructorId = constructorStandings.constructorId WHERE constructorStandings.position = 1;
----------------------------




-- RESULTS FROM GENERATED SQL
[('McLaren',), ('McLaren',), ('BMW Sauber',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('McLaren',), ('Ferrari',), ('Ferrari',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('McLaren',), ('Renault',), ('Renault',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Brawn',), ('Williams',), ('McLaren',), ('McLaren',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Benetton',), ('Benetton',), ('Williams',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('McLaren',), ('McLaren',), ('Williams',), ('Williams',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('McLaren',), ('McLaren',), ('McLaren',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Williams',), ('Williams',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Ferrari',), ('McLaren',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Williams',), ('Williams',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Ferrari',), ('Renault',), ('Renault',), ('Renault',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Williams',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Williams',), ('McLaren',), ('McLaren',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Brawn',), ('Ferrari',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Williams',), ('McLaren',), ('McLaren',), ('McLaren',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Team Lotus',), ('Williams',), ('McLaren',), ('McLaren',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('McLaren',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Brabham',), ('McLaren',), ('McLaren',), ('Ferrari',), ('Ferrari',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('Ferrari',), ('Renault',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Renault',), ('Renault',), ('Renault',), ('Renault',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Renault',), ('Renault',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Brawn',), ('Cooper',), ('Cooper',), ('Cooper',), ('Cooper',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Vanwall',), ('Vanwall',), ('Vanwall',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Cooper-Climax',), ('Lotus-Climax',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('BRM',), ('Cooper-Climax',), ('BRM',), ('BRM',), ('Lotus-Climax',), ('BRM',), ('BRM',), ('BRM',), ('BRM',), ('BRM',), ('BRM',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('BRM',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('BRM',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Lotus-Climax',), ('BRM',), ('BRM',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('Lotus-Climax',), ('BRM',), ('Ferrari',), ('Ferrari',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Cooper-Maserati',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Brabham-Repco',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Lotus-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Matra-Ford',), ('Brabham',), ('March',), ('Brabham',), ('March',), ('March',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Ferrari',), ('Ferrari',), ('Tyrrell',), ('Ferrari',), ('Tyrrell',), ('Tyrrell',), ('Tyrrell',), ('Tyrrell',), ('Tyrrell',), ('Tyrrell',), ('Tyrrell',), ('Team Lotus',), ('Tyrrell',), ('McLaren',), ('McLaren',), ('McLaren',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Tyrrell',), ('Tyrrell',), ('Tyrrell',), ('Team Lotus',), ('Team Lotus',), ('Tyrrell',), ('Tyrrell',), ('Tyrrell',), ('Tyrrell',), ('Team Lotus',), ('Team Lotus',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Ferrari',), ('McLaren',), ('Ferrari',), ('Ferrari',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Brabham',), ('Brabham',), ('McLaren',), ('Brabham',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Wolf',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Team Lotus',), ('Ligier',), ('Ligier',), ('Ligier',), ('Ferrari',), ('Ligier',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('McLaren',), ('McLaren',), ('Red Bull',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('McLaren',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Renault',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('McLaren',), ('McLaren',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('McLaren',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Ferrari',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Red Bull',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Williams',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Benetton',), ('Williams',), ('Benetton',), ('Williams',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('Ferrari',), ('McLaren',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Ferrari',), ('Mercedes',), ('Ferrari',), ('Mercedes',), ('Mercedes',), ('Ferrari',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',), ('Mercedes',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('McLaren',), ('BMW Sauber',), ('Ferrari',), ('Williams',), ('Renault',), ('Toyota',), ('Brawn',), ('Red Bull',), ('Force India',), ('Lotus F1',), ('Sauber',), ('Mercedes',), ('Toro Rosso',)]
----------------------------
