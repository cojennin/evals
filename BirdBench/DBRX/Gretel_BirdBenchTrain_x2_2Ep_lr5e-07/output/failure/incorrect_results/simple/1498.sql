-- PROBLEM # 1498
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

-- External Knowledge: The first 4 strings of yearmonth.date can represent the year.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the highest monthly consumption in the year 2012?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT MAX(Consumption) FROM yearmonth WHERE Date LIKE '2012-%';
----------------------------




-- RESULTS FROM PREDICTION
[(None,)]
----------------------------



-- ACTUAL RESULTS
[(51787161.73999976,)]
----------------------------
