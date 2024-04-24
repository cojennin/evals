-- PROBLEM # 1515
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

-- External Knowledge: '2012/8/23 21:20:00' can refer to date = '2012-08-23' AND T1.time = '21:20:00' in the database
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What segment did the customer have at 2012/8/23 21:20:00?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT customers.Segment FROM customers WHERE customers.CustomerID = (SELECT transactions_1k.CustomerID FROM transactions_1k WHERE transactions_1k.Date = '2012-08-23' AND transactions_1k.Time = '21:20:00' LIMIT 1) LIMIT 1;
----------------------------






-- ACTUAL RESULTS
[('KAM',)]
----------------------------
