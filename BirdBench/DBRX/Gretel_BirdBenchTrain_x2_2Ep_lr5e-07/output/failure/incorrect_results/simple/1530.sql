-- PROBLEM # 1530
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

-- External Knowledge: Description of products contains full name
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which are the top five best selling products? Please state the full name of them.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT p.Description, SUM(t.Amount) as TotalAmount FROM products p JOIN transactions_1k t ON p.ProductID = t.ProductID GROUP BY p.ProductID ORDER BY TotalAmount DESC LIMIT 5;
----------------------------




-- RESULTS FROM PREDICTION
[('Nafta', 15230), ('Diesel +', 1120), ('Natural', 1045), ('Diesel', 817), ('Nat.Super', 539)]
----------------------------



-- ACTUAL RESULTS
[('Nafta',), ('Diesel +',), ('Nafta',), ('Nafta',), ('Nafta',)]
----------------------------
