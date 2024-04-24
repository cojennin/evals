-- PROBLEM # 1521
-- Generation # 0
-- Difficulty: moderate
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

-- External Knowledge: Gas station in the Czech Republic implies that Country = CZE; '2012/8/26' can be represented by '2012-08-26'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For all the transactions happened during 8:00-9:00 in 2012/8/26, how many happened in CZE?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT COUNT(*) FROM transactions_1k WHERE Time BETWEEN '08:00:00' AND '09:00:00' AND Date = '2012-08-26' AND GasStationID IN (SELECT GasStationID FROM gasstations WHERE Country = 'CZE')
----------------------------






-- ACTUAL RESULTS
[(14,)]
----------------------------
