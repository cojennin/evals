-- PROBLEM # 956
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

-- External Knowledge: born after 1975 refers to year(dob) >1975;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which drivers born after 1975 have been ranked 2? Please give their forenames and surnames.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT drivers.forename, drivers.surname FROM drivers WHERE drivers.dob > '1975-01-01' AND drivers.driverId IN (SELECT results.driverId FROM results WHERE results.position = 2);
----------------------------




-- RESULTS FROM GENERATED SQL
[('Lewis', 'Hamilton'), ('Nick', 'Heidfeld'), ('Nico', 'Rosberg'), ('Fernando', 'Alonso'), ('Heikki', 'Kovalainen'), ('Kimi', 'Räikkönen'), ('Robert', 'Kubica'), ('Timo', 'Glock'), ('Nelson', 'Piquet Jr.'), ('Felipe', 'Massa'), ('Mark', 'Webber'), ('Jenson', 'Button'), ('Sebastian', 'Vettel'), ('Ralf', 'Schumacher'), ('Juan', 'Pablo Montoya'), ('Romain', 'Grosjean'), ('Sergio', 'Pérez'), ('Daniel', 'Ricciardo'), ('Valtteri', 'Bottas'), ('Kevin', 'Magnussen'), ('Daniil', 'Kvyat'), ('Max', 'Verstappen')]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Lewis', 'Hamilton'), ('Kimi', 'Räikkönen'), ('Nick', 'Heidfeld'), ('Felipe', 'Massa'), ('Lewis', 'Hamilton'), ('Heikki', 'Kovalainen'), ('Nick', 'Heidfeld'), ('Felipe', 'Massa'), ('Nick', 'Heidfeld'), ('Lewis', 'Hamilton'), ('Felipe', 'Massa'), ('Lewis', 'Hamilton'), ('Lewis', 'Hamilton'), ('Sébastien', 'Bourdais'), ('Felipe', 'Massa'), ('Kimi', 'Räikkönen'), ('Kimi', 'Räikkönen'), ('Timo', 'Glock'), ('Fernando', 'Alonso'), ('Fernando', 'Alonso'), ('Lewis', 'Hamilton'), ('Lewis', 'Hamilton'), ('Lewis', 'Hamilton'), ('Lewis', 'Hamilton'), ('Lewis', 'Hamilton'), ('Kimi', 'Räikkönen'), ('Felipe', 'Massa'), ('Fernando', 'Alonso'), ('Lewis', 'Hamilton'), ('Felipe', 'Massa'), ('Lewis', 'Hamilton'), ('Kimi', 'Räikkönen'), ('Fernando', 'Alonso'), ('Fernando', 'Alonso'), ('Lewis', 'Hamilton'), ('Fernando', 'Alonso'), ('Kimi', 'Räikkönen'), ('Fernando', 'Alonso'), ('Kimi', 'Räikkönen'), ('Fernando', 'Alonso'), ('Felipe', 'Massa'), ('Felipe', 'Massa'), ('Felipe', 'Massa'), ('Felipe', 'Massa'), ('Felipe', 'Massa'), ('Nick', 'Heidfeld'), ('Fernando', 'Alonso'), ('Jenson', 'Button'), ('Kimi', 'Räikkönen'), ('Kimi', 'Räikkönen'), ('Fernando', 'Alonso'), ('Fernando', 'Alonso'), ('Kimi', 'Räikkönen'), ('Mark', 'Webber'), ('Fernando', 'Alonso'), ('Fernando', 'Alonso'), ('Fernando', 'Alonso'), ('Jenson', 'Button'), ('Jenson', 'Button'), ('Takuma', 'Sato'), ('Fernando', 'Alonso'), ('Kimi', 'Räikkönen'), ('Robert', 'Kubica'), ('Sebastian', 'Vettel'), ('Timo', 'Glock'), ('Jenson', 'Button'), ('Jenson', 'Button'), ('Sebastian', 'Vettel'), ('Mark', 'Webber'), ('Kimi', 'Räikkönen'), ('Jenson', 'Button'), ('Nick', 'Heidfeld'), ('Kimi', 'Räikkönen'), ('Lewis', 'Hamilton'), ('Sebastian', 'Vettel'), ('Sebastian', 'Vettel'), ('Sébastien', 'Buemi'), ('Adrian', 'Sutil'), ('Nico', 'Rosberg'), ('Fernando', 'Alonso'), ('Sebastian', 'Vettel'), ('Mark', 'Webber'), ('Mark', 'Webber'), ('Mark', 'Webber'), ('Lewis', 'Hamilton'), ('Felipe', 'Massa'), ('Fernando', 'Alonso'), ('Mark', 'Webber'), ('Mark', 'Webber'), ('Mark', 'Webber'), ('Sebastian', 'Vettel'), ('Jenson', 'Button'), ('Sebastian', 'Vettel'), ('Fernando', 'Alonso'), ('Jenson', 'Button'), ('Fernando', 'Alonso'), ('Fernando', 'Alonso'), ('Jaime', 'Alguersuari'), ('Sebastian', 'Vettel'), ('Sebastian', 'Vettel'), ('Fernando', 'Alonso'), ('Felipe', 'Massa'), ('Mark', 'Webber'), ('Lewis', 'Hamilton'), ('Jenson', 'Button'), ('Jenson', 'Button'), ('Sebastian', 'Vettel'), ('Sergio', 'Pérez'), ('Mark', 'Webber'), ('Mark', 'Webber'), ('Jenson', 'Button'), ('Jenson', 'Button'), ('Sebastian', 'Vettel'), ('Mark', 'Webber'), ('Jean-Éric', 'Vergne'), ('Kamui', 'Kobayashi'), ('Kimi', 'Räikkönen'), ('Nico', 'Hülkenberg'), ('Felipe', 'Massa'), ('Mark', 'Webber'), ('Romain', 'Grosjean'), ('Fernando', 'Alonso'), ('Sergio', 'Pérez'), ('Nico', 'Rosberg'), ('Sergio', 'Pérez'), ('Kamui', 'Kobayashi'), ('Jenson', 'Button'), ('Felipe', 'Massa'), ('Bruno', 'Senna'), ('Fernando', 'Alonso'), ('Felipe', 'Massa'), ('Jenson', 'Button'), ('Jean-Éric', 'Vergne'), ('Felipe', 'Massa'), ('Jenson', 'Button'), ('Adrian', 'Sutil'), ('Felipe', 'Massa'), ('Kimi', 'Räikkönen'), ('Fernando', 'Alonso'), ('Nico', 'Rosberg'), ('Kimi', 'Räikkönen'), ('Sebastian', 'Vettel'), ('Jenson', 'Button'), ('Nico', 'Rosberg'), ('Adrian', 'Sutil'), ('Romain', 'Grosjean'), ('Nico', 'Rosberg'), ('Sebastian', 'Vettel'), ('Sebastian', 'Vettel'), ('Romain', 'Grosjean'), ('Fernando', 'Alonso'), ('Nico', 'Hülkenberg'), ('Nico', 'Rosberg'), ('Lewis', 'Hamilton'), ('Lewis', 'Hamilton'), ('Nico', 'Rosberg'), ('Daniel', 'Ricciardo'), ('Kimi', 'Räikkönen'), ('Lewis', 'Hamilton'), ('Sebastian', 'Vettel'), ('Kevin', 'Magnussen'), ('Daniel', 'Ricciardo'), ('Adrian', 'Sutil'), ('Nico', 'Rosberg'), ('Kevin', 'Magnussen'), ('Jenson', 'Button'), ('Nico', 'Rosberg'), ('Fernando', 'Alonso'), ('Nico', 'Rosberg'), ('Felipe', 'Massa'), ('Nico', 'Rosberg'), ('Lewis', 'Hamilton'), ('Nico', 'Rosberg'), ('Sebastian', 'Vettel'), ('Nico', 'Rosberg'), ('Nico', 'Rosberg'), ('Sebastian', 'Vettel'), ('Lewis', 'Hamilton'), ('Nico', 'Rosberg'), ('Nico', 'Rosberg'), ('Lewis', 'Hamilton'), ('Nico', 'Rosberg'), ('Sebastian', 'Vettel'), ('Nico', 'Rosberg'), ('Kimi', 'Räikkönen'), ('Lewis', 'Hamilton'), ('Lewis', 'Hamilton'), ('Nico', 'Rosberg'), ('Sebastian', 'Vettel'), ('Sebastian', 'Vettel'), ('Lewis', 'Hamilton'), ('Romain', 'Grosjean'), ('Felipe', 'Massa'), ('Sebastian', 'Vettel'), ('Sebastian', 'Vettel'), ('Lewis', 'Hamilton'), ('Lewis', 'Hamilton'), ('Nico', 'Rosberg'), ('Fernando', 'Alonso'), ('Nico', 'Rosberg'), ('Sebastian', 'Vettel'), ('Nico', 'Rosberg'), ('Daniel', 'Ricciardo'), ('Sebastian', 'Vettel'), ('Max', 'Verstappen'), ('Lewis', 'Hamilton'), ('Kimi', 'Räikkönen'), ('Sebastian', 'Vettel'), ('Daniel', 'Ricciardo'), ('Fernando', 'Alonso'), ('Valtteri', 'Bottas'), ('Sebastian', 'Vettel'), ('Daniel', 'Ricciardo'), ('Sebastian', 'Vettel'), ('Sebastian', 'Vettel'), ('Sebastian', 'Vettel'), ('Sebastian', 'Vettel'), ('Lewis', 'Hamilton'), ('Daniel', 'Ricciardo'), ('Max', 'Verstappen'), ('Kimi', 'Räikkönen'), ('Lewis', 'Hamilton'), ('Lewis', 'Hamilton'), ('Daniel', 'Ricciardo')]
----------------------------
