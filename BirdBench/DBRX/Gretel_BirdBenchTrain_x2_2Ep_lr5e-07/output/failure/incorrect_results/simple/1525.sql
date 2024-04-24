-- PROBLEM # 1525
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

-- External Knowledge: '2012/8/25' can be represented by '2012-08-25'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the percentage of the customers who used EUR in 2012/8/25?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(DISTINCT c.CustomerID) / (SELECT COUNT(DISTINCT CustomerID) FROM customers) as percentage FROM customers c WHERE c.Currency = 'EUR' AND c.CustomerID IN (SELECT t.CustomerID FROM transactions_1k t WHERE t.Date = '2012-08-25');
----------------------------




-- RESULTS FROM PREDICTION
[(0.021564338744955485,)]
----------------------------



-- ACTUAL RESULTS
[(1.6470588235294117,)]
----------------------------
