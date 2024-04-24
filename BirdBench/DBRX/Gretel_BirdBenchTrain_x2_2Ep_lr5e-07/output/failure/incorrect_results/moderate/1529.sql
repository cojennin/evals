-- PROBLEM # 1529
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

-- External Knowledge: January 2012 refers '201201' in the table transactions_1k
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the amount spent by customer "38508" at the gas stations? How much had the customer spent in January 2012?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 38508 as CustomerID, SUM(Amount) as TotalAmount FROM transactions_1k WHERE CustomerID = 38508;
----------------------------




-- RESULTS FROM PREDICTION
[(38508, 148)]
----------------------------



-- ACTUAL RESULTS
[(68740.19999999992, 3437.0099999999998)]
----------------------------
