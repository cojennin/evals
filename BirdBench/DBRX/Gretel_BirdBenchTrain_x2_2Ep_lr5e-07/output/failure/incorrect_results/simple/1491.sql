-- PROBLEM # 1491
-- Generation # 0
-- Difficulty: simple
----------------------------

-- PROMPT
CREATE TABLE customers
(
    CustomerID INTEGER UNIQUE     not null
        primary key,
    Segment    TEXT null,
    Currency   TEXT null
)

CREATE TABLE gasstations
(
    GasStationID INTEGER    UNIQUE   not null
        primary key,
    ChainID      INTEGER          null,
    Country      TEXT null,
    Segment      TEXT null
)

CREATE TABLE products
(
    ProductID   INTEGER   UNIQUE      not null
        primary key,
    Description TEXT null
)

CREATE TABLE "transactions_1k"
(
    TransactionID INTEGER
        primary key autoincrement,
    Date          DATE,
    Time          TEXT,
    CustomerID    INTEGER,
    CardID        INTEGER,
    GasStationID  INTEGER,
    ProductID     INTEGER,
    Amount        INTEGER,
    Price         REAL
)

CREATE TABLE sqlite_sequence(name,seq)

CREATE TABLE "yearmonth"
(
    CustomerID  INTEGER not null
        references customers
            on update cascade on delete cascade
        references customers,
    Date        TEXT    not null,
    Consumption REAL,
    primary key (Date, CustomerID)
)

-- External Knowledge: 
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which country has more "value for money" gas stations? Please give a total number of "value for money" gas stations in each country.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT gs.Country, COUNT(*) as num_stations FROM gasstations gs JOIN (SELECT GasStationID, AVG(Price) as avg_price FROM transactions_1k GROUP BY GasStationID) t ON gs.GasStationID = t.GasStationID WHERE t.avg_price < (SELECT AVG(Price) FROM transactions_1k) GROUP BY gs.Country;
----------------------------




-- RESULTS FROM PREDICTION
[('CZE', 214), ('SVK', 27)]
----------------------------



-- ACTUAL RESULTS
[('CZE', 597)]
----------------------------
