-- PROBLEM # 1499
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

-- External Knowledge: Monthly consumption = SUM(consumption) / 12
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the biggest monthly consumption of the customers who use euro as their currency?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT MAX(Consumption) FROM (SELECT CustomerID, SUM(Amount) / 12 as Consumption FROM transactions_1k JOIN customers ON transactions_1k.CustomerID = customers.CustomerID WHERE customers.Currency = 'euro' GROUP BY CustomerID)
----------------------------


-- EXCEPTION
ambiguous column name: CustomerID
----------------------------




