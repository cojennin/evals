-- PROBLEM # 121
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

-- External Knowledge: A2 refers to the names of districts.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List account ID and account opening date for accounts from 'Prachatice'.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT account_id, date FROM account WHERE district_id IN (SELECT district_id FROM district WHERE A2 = 'Prachatice')
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(38, '1997-08-08'), (221, '1996-10-30'), (252, '1996-12-26'), (265, '1996-07-05'), (449, '1994-11-22'), (587, '1996-06-21'), (709, '1994-07-25'), (803, '1995-09-09'), (825, '1996-03-06'), (969, '1994-01-08'), (989, '1994-03-14'), (1024, '1997-05-02'), (1040, '1996-05-18'), (1176, '1996-10-24'), (1236, '1993-05-05'), (1375, '1994-04-27'), (1407, '1997-04-11'), (1470, '1994-02-10'), (1622, '1996-04-12'), (1635, '1993-12-29'), (1862, '1995-04-15'), (1975, '1994-09-07'), (2025, '1994-10-02'), (2027, '1994-11-28'), (2218, '1994-11-21'), (2327, '1993-06-08'), (2357, '1993-01-04'), (2440, '1997-12-18'), (2594, '1997-05-03'), (2608, '1995-08-09'), (2762, '1993-03-20'), (2857, '1997-04-28'), (2875, '1996-12-24'), (2888, '1996-05-23'), (2895, '1993-03-09'), (2960, '1994-09-20'), (2982, '1996-06-04'), (2991, '1993-05-22'), (3015, '1996-06-15'), (3169, '1997-12-19'), (3290, '1996-12-09'), (3411, '1996-12-17'), (3582, '1995-08-26'), (3614, '1996-08-07'), (3775, '1993-06-27'), (3986, '1997-06-20'), (3989, '1995-03-11'), (5602, '1996-07-10'), (6075, '1996-09-15'), (7437, '1997-08-08'), (7733, '1996-07-08'), (7815, '1995-04-09'), (8489, '1993-09-18'), (9528, '1996-11-07'), (10710, '1995-10-30')]
----------------------------
