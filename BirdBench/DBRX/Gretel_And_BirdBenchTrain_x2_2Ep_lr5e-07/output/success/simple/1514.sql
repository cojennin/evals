-- PROBLEM # 1514
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

-- External Knowledge: '2012/8/24' can be represented by '2012-08-24'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What kind of currency did the customer paid at 16:25:00 in 2012/8/24?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Currency FROM customers c JOIN transactions_1k t ON c.CustomerID = t.CustomerID WHERE t.Date = '2012-08-24' AND t.Time = '16:25:00'
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('CZK',), ('CZK',), ('CZK',)]
----------------------------
