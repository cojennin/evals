-- PROBLEM # 1482
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

-- External Knowledge: Increase or Decrease = consumption for 2013 - consumption for 2012; Percentage of Increase = (Increase or Decrease / consumption for 2013) * 100%; Between 2012 And 2013 can be represented by Between 201201 And 201312; First 4 strings of Date represents the year.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which of the three segments—SME, LAM and KAM—has the biggest and lowest percentage increases in consumption paid in EUR between 2012 and 2013?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Segment, (SUM(Consumption) - SUM(Consumption_2012)) / SUM(Consumption) * 100 AS Percentage_Increase FROM (SELECT CustomerID, Date, Consumption, (SELECT Consumption FROM yearmonth WHERE CustomerID = customers.CustomerID AND Date = substr(yearmonth.Date, 1, 4) || '12') AS Consumption_2012 FROM customers JOIN yearmonth ON customers.CustomerID = yearmonth.CustomerID WHERE Date BETWEEN '201201' AND '201312' AND Currency = 'EUR') GROUP BY Segment ORDER BY Percentage_Increase DESC, Segment ASC LIMIT 1;
----------------------------


-- EXCEPTION
ambiguous column name: CustomerID
----------------------------



-- RESULTS FROM PREDICTION
[]
----------------------------


