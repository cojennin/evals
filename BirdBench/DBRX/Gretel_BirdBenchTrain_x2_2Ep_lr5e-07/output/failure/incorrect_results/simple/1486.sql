-- PROBLEM # 1486
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

-- External Knowledge: Amount of more SMEs = Total of SMEs uses Czech Koruna - Total of SMEs uses Euro
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Is it true that more SMEs pay in Czech koruna than in euros? If so, how many more?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 1 FROM (SELECT COUNT(*) as total_czk FROM customers WHERE Currency = 'CZK') as total_czk, (SELECT COUNT(*) as total_eur FROM customers WHERE Currency = 'EUR') as total_eur WHERE total_czk > total_eur
----------------------------




-- RESULTS FROM GENERATED SQL
[(1,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(23505,)]
----------------------------
