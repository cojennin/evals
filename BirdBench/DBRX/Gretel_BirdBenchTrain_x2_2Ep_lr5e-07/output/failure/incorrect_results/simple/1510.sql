-- PROBLEM # 1510
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

-- External Knowledge: Gas station in the Czech Republic implies that Country = 'CZE'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the average total price of the transactions taken place in gas stations in the Czech Republic?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT AVG(Price * Amount) FROM transactions_1k t JOIN gasstations g ON t.GasStationID = g.GasStationID WHERE g.Country = 'CZE'
----------------------------




-- RESULTS FROM GENERATED SQL
[(18696.139271168275,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(453.15031082529475,)]
----------------------------
