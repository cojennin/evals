-- PROBLEM # 113
-- Generation # 0
-- Difficulty: simple
----------------------------

-- PROMPT
CREATE TABLE account
(
    account_id  INTEGER default 0 not null
        primary key,
    district_id INTEGER default 0 not null,
    frequency   TEXT   not null,
    date        DATE          not null,
    foreign key (district_id) references district (district_id)
)

CREATE TABLE card
(
    card_id INTEGER default 0 not null
        primary key,
    disp_id INTEGER           not null,
    type    TEXT    not null,
    issued  DATE          not null,
    foreign key (disp_id) references disp (disp_id)
)

CREATE TABLE client
(
    client_id   INTEGER        not null
        primary key,
    gender      TEXT not null,
    birth_date  DATE       not null,
    district_id INTEGER        not null,
    foreign key (district_id) references district (district_id)
)

CREATE TABLE disp
(
    disp_id    INTEGER        not null
        primary key,
    client_id  INTEGER        not null,
    account_id INTEGER        not null,
    type      TEXT not null,
    foreign key (account_id) references account (account_id),
    foreign key (client_id) references client (client_id)
)

CREATE TABLE district
(
    district_id INTEGER default 0 not null
        primary key,
    A2          TEXT   not null,
    A3          TEXT   not null,
    A4          TEXT       not null,
    A5          TEXT           not null,
    A6          TEXT           not null,
    A7          TEXT           not null,
    A8          INTEGER        not null,
    A9          INTEGER           not null,
    A10         REAL not null,
    A11         INTEGER           not null,
    A12         REAL null,
    A13         REAL not null,
    A14         INTEGER           not null,
    A15         INTEGER        null,
    A16         INTEGER          not null
)

CREATE TABLE loan
(
    loan_id    INTEGER default 0 not null
        primary key,
    account_id INTEGER           not null,
    date       DATE          not null,
    amount     INTEGER           not null,
    duration   INTEGER           not null,
    payments   REAL not null,
    status     TEXT    not null,
    foreign key (account_id) references account (account_id)
)

CREATE TABLE `order`
(
    order_id   INTEGER default 0 not null
        primary key,
    account_id INTEGER           not null,
    bank_to    TEXT    not null,
    account_to INTEGER           not null,
    amount     REAL not null,
    k_symbol   TEXT    not null,
    foreign key (account_id) references account (account_id)
)

CREATE TABLE trans
(
    trans_id   INTEGER default 0    not null
        primary key,
    account_id INTEGER default 0    not null,
    date       DATE             not null,
    type       TEXT       not null,
    operation  TEXT      null,
    amount     INTEGER              not null,
    balance    INTEGER             not null,
    k_symbol   TEXT      null,
    bank       TEXT       null,
    account    INTEGER          null,
    foreign key (account_id) references account (account_id)
)

-- External Knowledge: 
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For the client who applied 98832 USD loan in 1996/1/3, when was his/her birthday?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT birth_date FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE account_id IN (SELECT account_id FROM loan WHERE amount = 98832 AND date = '1996-01-03'))
----------------------------




-- RESULTS FROM GENERATED SQL
[('1970-09-10',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('1920-12-08',), ('1921-10-06',), ('1922-05-24',), ('1926-02-12',), ('1928-04-20',), ('1930-05-05',), ('1930-11-10',), ('1931-12-05',), ('1933-04-18',), ('1937-06-05',), ('1939-12-06',), ('1940-08-16',), ('1943-03-02',), ('1943-04-15',), ('1943-05-02',), ('1943-07-30',), ('1944-03-08',), ('1944-06-19',), ('1945-05-24',), ('1946-05-17',), ('1946-08-21',), ('1947-07-13',), ('1947-07-18',), ('1947-12-13',), ('1950-09-08',), ('1952-11-01',), ('1953-05-02',), ('1953-07-07',), ('1954-06-13',), ('1955-05-13',), ('1957-04-06',), ('1957-05-31',), ('1957-07-09',), ('1960-02-27',), ('1961-09-16',), ('1962-01-17',), ('1962-04-20',), ('1962-10-15',), ('1963-09-23',), ('1963-12-21',), ('1964-10-19',), ('1965-03-22',), ('1966-03-26',), ('1967-04-20',), ('1968-12-30',), ('1969-03-29',), ('1969-07-02',), ('1970-09-10',), ('1971-04-07',), ('1971-06-24',), ('1971-07-29',), ('1973-05-26',), ('1975-07-25',), ('1975-08-07',), ('1977-04-03',), ('1978-04-18',), ('1978-08-30',), ('1980-06-16',), ('1987-09-27',)]
----------------------------
