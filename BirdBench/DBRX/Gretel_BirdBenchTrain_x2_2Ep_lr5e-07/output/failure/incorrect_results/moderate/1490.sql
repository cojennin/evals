-- PROBLEM # 1490
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

-- External Knowledge: Percentage of LAM customer consumed more than 46.73 = (Total no. of LAM customers who consumed more than 46.73 / Total no. of LAM customers) * 100%.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- How many percent of LAM customer consumed more than 46.73?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(DISTINCT CASE WHEN Consumption > 46.73 THEN CustomerID END) / COUNT(DISTINCT CustomerID) FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'LAM')
----------------------------




-- RESULTS FROM GENERATED SQL
[(99.52921628357795,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(98.5267932135058,)]
----------------------------
