-- PROBLEM # 1481
-- Generation # 0
-- Difficulty: challenging
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

-- External Knowledge: annual average consumption of customer with the lowest consumption in each segment = total consumption per year / the number of customer with lowest consumption in each segment; Difference in annual average = SME's annual average - LAM's annual average; Difference in annual average = LAM's annual average - KAM's annual average; Year 2013 can be presented as Between 201301 And 201312; First 4 strings of Date represents the year.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the difference in the annual average consumption of the customers with the least amount of consumption paid in CZK for 2013 between SME and LAM, LAM and KAM, and KAM and SME?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 1.0 * SUM(Consumption) / COUNT(DISTINCT CustomerID) AS AnnualAverage FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' AND Segment = 'SME' AND CustomerID IN (SELECT CustomerID FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' GROUP BY CustomerID HAVING MIN(Consumption) = (SELECT MIN(Consumption) FROM yearmonth WHERE Date BETWEEN '201301' AND '201312' GROUP BY CustomerID))
----------------------------


-- EXCEPTION
no such column: Segment
----------------------------



-- RESULTS FROM PREDICTION
[]
----------------------------


