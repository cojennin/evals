-- PROBLEM # 891
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
-- Name all drivers in the 2010 Singapore Grand Prix order by their position stands.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT drivers.forename, drivers.surname, results.position FROM drivers JOIN results ON drivers.driverId = results.driverId WHERE results.raceId = (SELECT raceId FROM races WHERE name = 'Singapore Grand Prix' AND year = 2010) ORDER BY results.position;
----------------------------




-- RESULTS FROM PREDICTION
[('Timo', 'Glock', None), ('Nick', 'Heidfeld', None), ('Lewis', 'Hamilton', None), ('Christian', 'Klien', None), ('Kamui', 'Kobayashi', None), ('Bruno', 'Senna', None), ('Jarno', 'Trulli', None), ('Vitantonio', 'Liuzzi', None), ('Fernando', 'Alonso', 1), ('Sebastian', 'Vettel', 2), ('Mark', 'Webber', 3), ('Jenson', 'Button', 4), ('Nico', 'Rosberg', 5), ('Rubens', 'Barrichello', 6), ('Robert', 'Kubica', 7), ('Felipe', 'Massa', 8), ('Adrian', 'Sutil', 9), ('Nico', 'Hülkenberg', 10), ('Vitaly', 'Petrov', 11), ('Jaime', 'Alguersuari', 12), ('Michael', 'Schumacher', 13), ('Sébastien', 'Buemi', 14), ('Lucas', 'di Grassi', 15), ('Heikki', 'Kovalainen', 16)]
----------------------------



-- ACTUAL RESULTS
[('Mark', 'Webber'), ('Fernando', 'Alonso'), ('Lewis', 'Hamilton'), ('Sebastian', 'Vettel'), ('Jenson', 'Button'), ('Felipe', 'Massa'), ('Nico', 'Rosberg'), ('Robert', 'Kubica'), ('Adrian', 'Sutil'), ('Michael', 'Schumacher'), ('Rubens', 'Barrichello'), ('Kamui', 'Kobayashi'), ('Vitaly', 'Petrov'), ('Nico', 'Hülkenberg'), ('Vitantonio', 'Liuzzi'), ('Sébastien', 'Buemi'), ('Pedro', 'de la Rosa'), ('Jaime', 'Alguersuari'), ('Heikki', 'Kovalainen'), ('Karun', 'Chandhok'), ('Lucas', 'di Grassi'), ('Jarno', 'Trulli'), ('Bruno', 'Senna'), ('Timo', 'Glock'), ('Sakon', 'Yamamoto'), ('Nick', 'Heidfeld'), ('Christian', 'Klien')]
----------------------------
