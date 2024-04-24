-- PROBLEM # 143
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
-- What are the accounts that have both gold and junior credit cards?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'gold' INTERSECT SELECT  a.account_id FROM account a JOIN disp d ON a.account_id = d.account_id JOIN card c ON d.disp_id = c.disp_id WHERE c.type = 'junior'
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(7,), (33,), (43,), (51,), (68,), (71,), (128,), (139,), (144,), (181,), (219,), (223,), (270,), (311,), (351,), (371,), (418,), (431,), (441,), (456,), (468,), (486,), (521,), (523,), (539,), (553,), (554,), (577,), (610,), (655,), (689,), (738,), (750,), (756,), (776,), (807,), (828,), (862,), (886,), (904,), (940,), (969,), (978,), (998,), (1007,), (1016,), (1032,), (1039,), (1074,), (1092,), (1149,), (1154,), (1156,), (1194,), (1203,), (1204,), (1243,), (1273,), (1305,), (1345,), (1360,), (1378,), (1397,), (1408,), (1417,), (1431,), (1446,), (1466,), (1485,), (1494,), (1495,), (1500,), (1511,), (1519,), (1547,), (1592,), (1606,), (1649,), (1654,), (1678,), (1695,), (1700,), (1749,), (1750,), (1753,), (1764,), (1779,), (1867,), (1876,), (1885,), (1910,), (1914,), (1963,), (1996,), (2013,), (2039,), (2050,), (2051,), (2059,), (2095,), (2097,), (2143,), (2189,), (2200,), (2219,), (2242,), (2328,), (2332,), (2392,), (2410,), (2441,), (2444,), (2450,), (2466,), (2540,), (2547,), (2552,), (2571,), (2573,), (2592,), (2598,), (2600,), (2637,), (2675,), (2678,), (2681,), (2695,), (2699,), (2726,), (2749,), (2773,), (2796,), (2824,), (2836,), (2854,), (2867,), (2966,), (2982,), (3003,), (3010,), (3014,), (3035,), (3051,), (3103,), (3112,), (3114,), (3127,), (3131,), (3138,), (3153,), (3163,), (3181,), (3255,), (3260,), (3279,), (3290,), (3294,), (3324,), (3359,), (3375,), (3383,), (3386,), (3391,), (3449,), (3476,), (3516,), (3534,), (3586,), (3609,), (3633,), (3654,), (3727,), (3749,), (3757,), (3776,), (3781,), (3788,), (3806,), (3807,), (3848,), (3858,), (3877,), (3883,), (3899,), (3909,), (3931,), (3949,), (3988,), (4000,), (4034,), (4102,), (4105,), (4132,), (4159,), (4245,), (4255,), (4264,), (4361,), (4416,), (4503,), (4863,), (4949,), (5442,), (5622,), (5891,), (6030,), (6363,), (6592,), (6806,), (6910,), (6924,), (7049,), (7637,), (7795,), (7859,), (8173,), (8260,), (8327,), (8759,), (8856,), (9203,), (9265,), (9491,), (9814,), (9869,), (10411,), (10439,), (10520,), (10644,), (10650,), (10906,), (11013,), (11186,)]
----------------------------
