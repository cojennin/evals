-- PROBLEM # 125
-- Generation # 0
-- Difficulty: challenging
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

-- External Knowledge: Unemployment increment rate in percentage = [(unemployment rate 2016 - unemployment rate 2015) / unemployment rate 2015] * 100%; unemployment rate 2015 appears in the A12; unemployment rate 2016 appears in the A13; Loan contracts which are still running where client are in debt can be presented as status = 'D'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For loans contracts which are still running where client are in debt, list the district of the and the state the percentage unemployment rate increment from year 1995 to 1996.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * (A13 - A12) / A12 as unemployment_rate_increment, district_id FROM district WHERE A12 IS NOT NULL AND A13 IS NOT NULL AND A12 > 0 AND A13 > 0 AND district_id IN (SELECT district_id FROM client WHERE client_id IN (SELECT client_id FROM disp WHERE disp_id IN (SELECT disp_id FROM loan WHERE status = 'D' AND date < (SELECT MAX(date) FROM loan WHERE status = 'R'))));
----------------------------




-- RESULTS FROM PREDICTION
[]
----------------------------



-- ACTUAL RESULTS
[(40.0,), (39.25925925925924,), (115.0,), (22.49999999999999,), (20.0,), (None,), (11.666666666666677,), (None,), (44.375,), (13.333333333333346,), (17.42424242424243,), (39.25925925925924,), (8.4375,), (-5.593220338983052,), (28.571428571428584,), (115.0,), (16.315789473684216,), (42.4,), (22.49999999999999,), (13.541666666666673,), (16.315789473684216,), (26.052631578947377,), (14.91228070175438,), (40.0,), (115.0,), (9.782608695652177,), (22.5,), (39.60000000000001,), (28.387096774193544,), (38.620689655172406,), (14.91228070175438,), (43.529411764705884,), (35.00000000000001,), (22.49999999999999,), (13.333333333333346,), (13.541666666666673,), (22.14285714285715,), (17.42424242424243,), (47.05882352941177,), (18.846153846153836,), (17.42424242424243,), (15.744680851063835,), (13.636363636363628,), (115.0,), (13.541666666666673,)]
----------------------------
