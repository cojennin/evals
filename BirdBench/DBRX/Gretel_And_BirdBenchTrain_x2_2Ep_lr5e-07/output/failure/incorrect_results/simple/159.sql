-- PROBLEM # 159
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

-- External Knowledge: operation = 'VYBER' refers to withdrawal in cash
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List all the withdrawals in cash transactions that the client with the id 3356 makes.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT * FROM trans WHERE account_id = 3356 AND operation = 'VYBER'
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(816173,), (816174,), (816175,), (816181,), (816185,), (816186,), (816187,), (816188,), (816189,), (816190,), (816191,), (816192,), (816193,), (816194,), (816195,), (816196,), (816203,), (816216,), (816217,), (816218,), (816219,), (816220,), (816221,), (816222,), (816223,), (816224,), (816225,), (816226,), (816227,), (816228,), (816229,), (816230,), (816231,), (816232,), (816233,), (816234,), (816235,), (816236,), (816237,), (816238,), (816239,), (816240,), (816241,), (816242,), (816243,), (816244,), (816245,), (816246,), (816247,), (816248,), (816249,), (816250,), (816251,), (816252,), (816253,), (816254,), (816255,), (816256,), (816257,), (816258,), (816259,), (816260,), (816261,), (816262,), (816263,), (816264,), (816265,), (816266,), (816267,), (816268,), (816269,), (816270,), (816271,), (816272,), (816273,), (816274,), (816275,), (816276,), (816278,), (816279,), (816280,), (816281,), (816282,), (816283,), (816284,), (816285,), (816286,), (816288,), (816289,), (816290,), (816291,), (816292,), (816293,), (816294,), (816295,), (816296,), (816297,), (816298,), (816299,), (816300,), (816301,), (816302,), (816303,), (816304,), (816305,), (816306,), (816307,), (816308,), (816309,), (816310,), (816311,), (816312,), (816313,), (816314,), (816315,), (816316,), (816317,), (816318,), (816319,), (816320,), (816321,), (816322,), (816324,), (816325,), (816326,), (816327,), (816328,), (816329,), (816330,), (816331,), (816332,), (816333,), (816334,), (816335,), (816336,), (816337,), (816338,), (816340,), (816341,), (816342,)]
----------------------------
