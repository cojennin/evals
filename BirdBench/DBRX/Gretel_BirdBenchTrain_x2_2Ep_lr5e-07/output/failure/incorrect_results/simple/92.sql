-- PROBLEM # 92
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

-- External Knowledge: A11 refers to average salary; Female mapps to gender = 'F'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List out the no. of districts that have female average salary is more than 6000 but less than 10000?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT COUNT(DISTINCT district_id) FROM district WHERE A11 > 6000 AND A11 < 10000 AND A2 = 'F';
----------------------------




-- RESULTS FROM PREDICTION
[(0,)]
----------------------------



-- ACTUAL RESULTS
[(18,), (5,), (51,), (57,), (54,), (76,), (21,), (12,), (43,), (30,), (73,), (7,), (36,), (38,), (19,), (72,), (45,), (16,), (50,), (29,), (22,), (64,), (37,), (33,), (44,), (68,), (2,), (55,), (41,), (35,), (63,), (53,), (6,), (31,), (13,), (52,), (40,), (34,), (24,), (46,), (28,), (17,), (4,), (59,), (66,), (60,), (47,), (48,), (69,), (67,), (61,), (27,), (15,), (65,), (71,), (25,), (49,), (42,), (11,), (77,), (32,), (75,), (3,), (58,), (23,), (56,), (62,), (20,), (9,)]
----------------------------
