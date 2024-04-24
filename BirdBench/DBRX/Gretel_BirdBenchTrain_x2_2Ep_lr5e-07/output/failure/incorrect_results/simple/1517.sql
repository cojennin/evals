-- PROBLEM # 1517
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
-- For the earliest customer, what segment did he/she have?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT customers.Segment FROM customers INNER JOIN (SELECT CustomerID, MIN(Date) as MinDate FROM yearmonth GROUP BY CustomerID) as minDate ON customers.CustomerID = minDate.CustomerID WHERE minDate.MinDate = (SELECT MIN(Date) FROM yearmonth)
----------------------------




-- RESULTS FROM GENERATED SQL
[('KAM',), ('SME',), ('LAM',), ('KAM',), ('SME',), ('SME',), ('SME',), ('KAM',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('KAM',)]
----------------------------
