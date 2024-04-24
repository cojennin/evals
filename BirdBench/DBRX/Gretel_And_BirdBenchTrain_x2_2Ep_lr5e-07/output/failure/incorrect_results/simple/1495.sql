-- PROBLEM # 1495
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

-- External Knowledge: September 2013 refers to yearmonth.date = '201309'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which client ID consumed the most in September 2013?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT CustomerID, SUM(Consumption) as TotalConsumption FROM yearmonth WHERE Date = '201309' GROUP BY CustomerID ORDER BY TotalConsumption DESC LIMIT 1;
----------------------------




-- RESULTS FROM GENERATED SQL
[(12459, 1830161.05)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(12459,)]
----------------------------
