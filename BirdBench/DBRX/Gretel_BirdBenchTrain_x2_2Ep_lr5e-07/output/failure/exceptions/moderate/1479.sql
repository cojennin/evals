-- PROBLEM # 1479
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

-- External Knowledge: The first 4 strings of the values in the table yearmonth can represent year.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which year recorded the most consumption of gas paid in CZK?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT SUBSTR(Date, 1, 4) as Year, SUM(Consumption) as Total_Consumption FROM yearmonth WHERE Currency = 'CZK' GROUP BY Year ORDER BY Total_Consumption DESC LIMIT 1;
----------------------------


-- EXCEPTION
no such column: Currency
----------------------------




