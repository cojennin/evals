-- PROBLEM # 1520
-- Generation # 0
-- Difficulty: moderate
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

-- External Knowledge: '2012/8/24' can be represented by '2012-08-24'; expense and the consumption has the similar meaning.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For the customer who paid 124.05 in 2012/8/24, how much did he/she spend during the January of 2012? And what is the date and expenses exactly?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Date, SUM(Price) FROM transactions_1k WHERE CustomerID = (SELECT CustomerID FROM transactions_1k WHERE Price = 124.05 AND Date = '2012-08-24') AND Date LIKE '2012-01-%' GROUP BY Date;
----------------------------




-- RESULTS FROM PREDICTION
[]
----------------------------



-- ACTUAL RESULTS
[(40333, '201201', 4084.9), (7630, '201201', 24953.81)]
----------------------------
