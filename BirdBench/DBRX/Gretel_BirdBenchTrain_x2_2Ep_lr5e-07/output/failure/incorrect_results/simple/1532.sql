-- PROBLEM # 1532
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
-- Which country had the gas station that sold the most expensive product id No.2 for one unit?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT GasStationID, MAX(Price) FROM transactions_1k WHERE ProductID = 2 GROUP BY GasStationID ORDER BY MAX(Price) DESC LIMIT 1;
----------------------------




-- RESULTS FROM PREDICTION
[(3250, 5762.49)]
----------------------------



-- ACTUAL RESULTS
[('CZE',)]
----------------------------
