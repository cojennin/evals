-- PROBLEM # 983
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

-- External Knowledge: introduction website refers to url; Italian is a nationality
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which of the Italian constructor got the highest point to date? Give its introduction website?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.url, c.name, MAX(cr.points) as max_points FROM constructors c JOIN constructorResults cr ON c.constructorId = cr.constructorId WHERE c.nationality = 'Italian' GROUP BY c.name;
----------------------------




-- RESULTS FROM PREDICTION
[('http://en.wikipedia.org/wiki/ATS_(wheels)', 'ATS', 2.0), ('http://en.wikipedia.org/wiki/Alfa_Romeo_(Formula_One)', 'Alfa Romeo', 6.0), ('http://en.wikipedia.org/wiki/Andrea_Moda_Formula', 'Andrea Moda', 0.0), ('http://en.wikipedia.org/wiki/Behra-Porsche', 'Behra-Porsche', 0.0), ('http://en.wikipedia.org/wiki/Benetton_Formula', 'Benetton', 16.0), ('http://en.wikipedia.org/wiki/Enzo_Coloni_Racing_Car_Systems', 'Coloni', 0.0), ('http://en.wikipedia.org/wiki/Dallara', 'Dallara', 5.0), ('http://en.wikipedia.org/wiki/De_Tomaso', 'De Tomaso', 0.0), ('http://en.wikipedia.org/wiki/De_Tomaso', 'De Tomaso-Alfa Romeo', 0.0), ('http://en.wikipedia.org/wiki/De_Tomaso', 'De Tomaso-Ferrari', 0.0), ('http://en.wikipedia.org/wiki/De_Tomaso', 'De Tomaso-Osca', 0.0), ('http://en.wikipedia.org/wiki/Euro_Brun', 'Euro Brun', 0.0), ('http://en.wikipedia.org/wiki/Scuderia_Ferrari', 'Ferrari', 43.0), ('http://en.wikipedia.org/wiki/Fondmetal', 'Fondmetal', 0.0), ('http://en.wikipedia.org/wiki/Forti', 'Forti', 0.0), ('http://en.wikipedia.org/wiki/Modena_(racing_team)', 'Lambo', 0.0), ('http://en.wikipedia.org/wiki/Life_(Racing_Team)', 'Life', 0.0), ('http://en.wikipedia.org/wiki/Maserati', 'Maserati', 15.0), ('http://en.wikipedia.org/wiki/Merzario', 'Merzario', 0.0), ('http://en.wikipedia.org/wiki/Minardi', 'Minardi', 7.0), ('http://en.wikipedia.org/wiki/Officine_Specializate_Costruzione_Automobili', 'OSCA', 0.0), ('http://en.wikipedia.org/wiki/Osella', 'Osella', 3.0), ('http://en.wikipedia.org/wiki/Tec-Mec', 'Tec-Mec', 0.0), ('http://en.wikipedia.org/wiki/Tecno', 'Tecno', 1.0), ('http://en.wikipedia.org/wiki/Scuderia_Toro_Rosso', 'Toro Rosso', 18.0)]
----------------------------



-- ACTUAL RESULTS
[('http://en.wikipedia.org/wiki/Scuderia_Ferrari',)]
----------------------------
