-- PROBLEM # 1475
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

-- External Knowledge: Year 2012 can be presented as Between 201201 And 201212, which means between January and December in 2012
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- How many customers in KAM had a consumption of less than 30,000 for the year 2012?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT COUNT(DISTINCT CustomerID) FROM yearmonth WHERE Consumption < 30000 AND Date BETWEEN 201201 AND 201212 AND CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'KAM');
----------------------------




-- RESULTS FROM GENERATED SQL
[(1746,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(1123,)]
----------------------------
