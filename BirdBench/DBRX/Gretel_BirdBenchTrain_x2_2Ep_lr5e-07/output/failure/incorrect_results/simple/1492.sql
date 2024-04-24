-- PROBLEM # 1492
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

-- External Knowledge: Percentage of KAM uses Euro = (Total of KAM uses Euro / Total of KAM) * 100%.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What percentage of KAM customers pay in euros?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(*) / (SELECT COUNT(*) FROM customers WHERE Segment = 'KAM') as Percentage FROM customers WHERE Currency = 'Euro' AND Segment = 'KAM'
----------------------------




-- RESULTS FROM PREDICTION
[(0.0,)]
----------------------------



-- ACTUAL RESULTS
[(3.480392156862745,)]
----------------------------
