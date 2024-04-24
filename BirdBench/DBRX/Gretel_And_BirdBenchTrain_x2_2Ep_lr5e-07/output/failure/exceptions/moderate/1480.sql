-- PROBLEM # 1480
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

-- External Knowledge: 'in 2013' refers to the first 4 strings of yearmonth.date = '2013', The 5th and 6th string of the date can refer to month.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What was the gas consumption peak month for SME customers in 2013?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT EXTRACT(MONTH FROM Date) as Month, SUM(Consumption) as Total_Consumption FROM yearmonth WHERE CustomerID IN (SELECT CustomerID FROM customers WHERE Segment = 'SME') AND Date LIKE '2013%' GROUP BY Month ORDER BY Total_Consumption DESC LIMIT 1;
----------------------------


-- EXCEPTION
near "FROM": syntax error
----------------------------




