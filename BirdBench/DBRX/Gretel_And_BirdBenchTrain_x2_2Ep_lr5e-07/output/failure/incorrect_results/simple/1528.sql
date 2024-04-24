-- PROBLEM # 1528
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

-- External Knowledge: 
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the percentage of "premium" against the overall segment in "SVK"?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(*) / (SELECT COUNT(*) FROM gasstations WHERE Country = 'SVK') as percentage FROM gasstations WHERE Country = 'SVK' AND Segment = 'premium'
----------------------------




-- RESULTS FROM GENERATED SQL
[(0.0,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(35.68181818181818,)]
----------------------------
