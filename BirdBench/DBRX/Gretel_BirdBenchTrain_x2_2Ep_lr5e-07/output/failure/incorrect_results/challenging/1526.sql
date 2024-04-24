-- PROBLEM # 1526
-- Generation # 0
-- Difficulty: challenging
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

-- External Knowledge: '2012/8/24' can be represented by '2012-08-24'; Consumption decrease rate = (consumption_2012 - consumption_2013) / consumption_2012
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For the customer who paid 634.8 in 2012/8/25, what was the consumption decrease rate from Year 2012 to 2013?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * (SUM(CASE WHEN Date = '2012-08-25' THEN Amount ELSE 0 END) - SUM(CASE WHEN Date = '2013-08-25' THEN Amount ELSE 0 END)) / SUM(CASE WHEN Date = '2012-08-25' THEN Amount ELSE 0 END) FROM transactions_1k WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Date = '2012-08-25' AND Price = 634.8 LIMIT 1) AND Date IN ('2012-08-25', '2013-08-25');
----------------------------




-- RESULTS FROM GENERATED SQL
[(100.0,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(-5.815242674672345,)]
----------------------------
