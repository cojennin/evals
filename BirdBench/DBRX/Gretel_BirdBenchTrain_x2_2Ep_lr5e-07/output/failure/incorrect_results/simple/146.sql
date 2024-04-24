-- PROBLEM # 146
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

-- External Knowledge: Female refers to gender = 'F'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Who are the female account holders who own credit cards and also have loans?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT DISTINCT client_id FROM client WHERE gender = 'F' AND client_id IN (SELECT client_id FROM disp WHERE disp_id IN (SELECT disp_id FROM card)) AND client_id IN (SELECT client_id FROM disp WHERE disp_id IN (SELECT account_id FROM loan));
----------------------------




-- RESULTS FROM GENERATED SQL
[(309,), (816,), (1242,), (1583,), (1819,), (2335,), (2762,), (2982,), (3084,), (3230,), (4293,), (4467,), (4660,), (4715,), (4863,), (4937,), (5263,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(127,), (158,), (272,), (370,), (414,), (798,), (810,), (861,), (1020,), (1133,), (1157,), (1197,), (1793,), (2063,), (2235,), (2259,), (2267,), (2489,), (2501,), (2560,), (2592,), (2623,), (2686,), (2698,), (2841,), (3257,), (3414,), (3517,), (3616,), (3763,), (3984,), (4937,), (5232,), (5245,), (5253,), (5333,), (5366,), (5468,), (5521,), (5684,), (5873,), (5978,), (6039,), (6178,), (6255,), (6301,), (6567,), (7186,), (7286,), (7434,), (7796,), (7855,), (7959,), (8366,), (8392,), (8506,), (8636,), (9427,), (9555,), (9569,), (9582,), (9593,), (9717,), (9929,), (10040,), (10095,), (10479,), (10528,), (10543,), (11371,), (11409,), (11497,), (11545,), (11596,), (12079,), (12133,), (12328,), (12378,), (12396,), (12643,), (12750,), (13089,), (13134,), (13694,), (13750,)]
----------------------------
