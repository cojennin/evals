-- PROBLEM # 955
-- Generation # 0
-- Difficulty: challenging
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

-- External Knowledge: only champion's finished time is represented by 'HH:MM:SS.mmm'; finished the game refers to time is not null.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the average time in seconds of champion for each year?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT AVG(strftime('%s', r.time) - strftime('%s', '00:00:00')) as avg_time, s.year FROM results r JOIN races s ON r.raceId = s.raceId WHERE r.position = 1 GROUP BY s.year;
----------------------------




-- RESULTS FROM GENERATED SQL
[(None, 1950), (None, 1951), (None, 1952), (None, 1953), (None, 1954), (None, 1955), (None, 1956), (None, 1957), (None, 1958), (None, 1959), (None, 1960), (None, 1961), (None, 1962), (None, 1963), (None, 1964), (None, 1965), (None, 1966), (None, 1967), (None, 1968), (None, 1969), (None, 1970), (None, 1971), (None, 1972), (None, 1973), (None, 1974), (None, 1975), (None, 1976), (None, 1977), (None, 1978), (None, 1979), (None, 1980), (None, 1981), (None, 1982), (None, 1983), (None, 1984), (None, 1985), (None, 1986), (None, 1987), (None, 1988), (None, 1989), (None, 1990), (None, 1991), (None, 1992), (None, 1993), (None, 1994), (None, 1995), (None, 1996), (None, 1997), (None, 1998), (None, 1999), (None, 2000), (None, 2001), (None, 2002), (None, 2003), (None, 2004), (None, 2005), (None, 2006), (None, 2007), (None, 2008), (None, 2009), (None, 2010), (None, 2011), (None, 2012), (None, 2013), (None, 2014), (None, 2015), (None, 2016), (None, 2017)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(1950, 9712.595714285713), (1951, 10870.532222222224), (1952, 11061.585000000001), (1953, 10828.476666666664), (1954, 11213.074444444444), (1955, 10792.332857142856), (1956, 10871.64888888889), (1957, 11323.316666666666), (1958, 8380.19090909091), (1959, 8745.945555555554), (1960, 8772.149000000001), (1961, 8258.5375), (1962, 8411.155555555557), (1963, 8281.240000000002), (1964, 8005.464999999999), (1965, 8165.670000000001), (1966, 7834.694444444444), (1967, 7645.836363636362), (1968, 7626.578333333334), (1969, 7006.87090909091), (1970, 6520.591538461538), (1971, 6111.991), (1972, 6526.209500000001), (1973, 6236.232066666666), (1974, 6047.1144), (1975, 6540.819571428573), (1976, 6196.1404999999995), (1977, 6149.7786470588235), (1978, 6061.830625), (1979, 5939.0074), (1980, 5916.4595), (1981, 6013.3536), (1982, 5938.81225), (1983, 5863.424666666667), (1984, 5665.7318749999995), (1985, 5860.028187499999), (1986, 5898.368437499999), (1987, 5758.625375), (1988, 5967.781437500001), (1989, 6027.3515625), (1990, 5739.4275), (1991, 5858.884625000001), (1992, 5761.236312499999), (1993, 5791.421687499999), (1994, 5911.31825), (1995, 6001.662235294116), (1996, 5923.734437499999), (1997, 5612.94288235294), (1998, 5765.0872500000005), (1999, 5738.62925), (2000, 5676.334882352942), (2001, 5473.506529411765), (2002, 5501.913823529413), (2003, 5449.198187500001), (2004, 5363.524555555556), (2005, 5387.884842105263), (2006, 5521.753833333334), (2007, 5669.5253529411775), (2008, 5728.08327777778), (2009, 5590.685529411765), (2010, 5971.443789473684), (2011, 6302.775105263158), (2012, 6009.600500000001), (2013, 5874.325210526316), (2014, 6045.882315789475), (2015, 5871.536888888889), (2016, 6092.1327619047615), (2017, 5692.346642857143)]
----------------------------
