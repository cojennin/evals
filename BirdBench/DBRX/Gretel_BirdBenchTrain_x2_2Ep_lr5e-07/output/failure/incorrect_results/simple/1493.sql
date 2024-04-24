-- PROBLEM # 1493
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

-- External Knowledge: February 2012 refers to '201202' in yearmonth.date
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- In February 2012, what percentage of customers consumed more than 528.3?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(*) / (SELECT COUNT(*) FROM customers) as percentage FROM customers WHERE CustomerID IN (SELECT CustomerID FROM yearmonth WHERE date = '201202' AND Consumption > 528.3)
----------------------------




-- RESULTS FROM PREDICTION
[(37.60820677120237,)]
----------------------------



-- ACTUAL RESULTS
[(66.62300807683911,)]
----------------------------
