-- PROBLEM # 1471
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

-- External Knowledge: ratio of costumers who pay in EUR against customers who pay in CZK = count(Currency = 'EUR') / count(Currency = 'CZK').
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the ratio of costumers who pay in EUR against customers who pay in CZK?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 1.0 * COUNT(CASE WHEN Currency = 'EUR' THEN 1 END) / COUNT(CASE WHEN Currency = 'CZK' THEN 1 END) FROM customers;
----------------------------






-- ACTUAL RESULTS
[(0.06572769953051644,)]
----------------------------
