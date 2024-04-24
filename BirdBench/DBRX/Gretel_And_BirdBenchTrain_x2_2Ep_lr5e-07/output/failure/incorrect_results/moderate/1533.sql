-- PROBLEM # 1533
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

-- External Knowledge: August of 2012 means Date contains '201208' in the yearmonth.date of the database; Price per unit of product = Price / Amount
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For all the people who paid more than 29.00 per unit of product id No.5. Give their consumption status in the August of 2012.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT ym.CustomerID, ym.Consumption FROM yearmonth ym JOIN transactions_1k t ON ym.CustomerID = t.CustomerID WHERE t.ProductID = 5 AND t.Price/t.Amount > 29.00 AND ym.Date LIKE '201208%'
----------------------------




-- RESULTS FROM GENERATED SQL
[(18831, 1903.2), (5443, 88265.39), (46933, 1129.2), (6768, 126157.7), (6768, 126157.7), (20447, 58.19), (45868, 1142.95), (23861, 8878.07), (24700, 69331.72), (7626, 45937.22)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(1903.2,), (88265.39,), (1129.2,), (126157.7,), (126157.7,), (58.19,), (1142.95,), (8878.07,), (69331.72,), (45937.22,)]
----------------------------
