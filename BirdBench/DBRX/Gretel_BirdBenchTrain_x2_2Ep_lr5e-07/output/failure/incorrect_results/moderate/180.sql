-- PROBLEM # 180
-- Generation # 0
-- Difficulty: moderate
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
-- Please provide a list of clients who were born between 1983 and 1987 and whose account branch is in East Bohemia, along with their IDs.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT client_id, birth_date FROM client WHERE birth_date BETWEEN '1983-01-01' AND '1987-12-31' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'East Bohemia');
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(379, 56), (379, 237), (379, 311), (379, 351), (379, 446), (379, 562), (379, 590), (379, 757), (379, 1002), (379, 1158), (379, 1199), (379, 1296), (379, 1406), (379, 1437), (379, 1441), (379, 1501), (379, 1528), (379, 1641), (379, 1645), (379, 1810), (379, 1859), (379, 1902), (379, 2162), (379, 2266), (379, 2334), (379, 2584), (379, 2674), (379, 2926), (379, 3175), (379, 3562), (379, 3616), (379, 3661), (379, 3691), (379, 3699), (379, 3835), (379, 3865), (379, 3890), (379, 3945), (379, 4127), (379, 4240), (379, 4503), (379, 5952), (379, 6461), (379, 7713), (379, 8225), (379, 10857), (379, 10940), (379, 11317), (734, 154), (734, 171), (734, 253), (734, 339), (734, 393), (734, 432), (734, 559), (734, 600), (734, 611), (734, 810), (734, 836), (734, 837), (734, 894), (734, 972), (734, 1047), (734, 1229), (734, 1361), (734, 1396), (734, 1454), (734, 1535), (734, 1649), (734, 1659), (734, 1716), (734, 1789), (734, 1798), (734, 1801), (734, 1934), (734, 1946), (734, 1986), (734, 2043), (734, 2097), (734, 2130), (734, 2197), (734, 2224), (734, 2244), (734, 2294), (734, 2297), (734, 2380), (734, 2443), (734, 2556), (734, 2558), (734, 2602), (734, 2680), (734, 2759), (734, 2837), (734, 2981), (734, 3010), (734, 3067), (734, 3092), (734, 3121), (734, 3279), (734, 3505), (734, 3512), (734, 3615), (734, 4784), (734, 7637), (734, 8639), (734, 10774), (734, 11053), (3428, 330), (3428, 744), (3428, 782), (3428, 832), (3428, 1021), (3428, 1085), (3428, 1107), (3428, 1195), (3428, 1316), (3428, 1324), (3428, 1365), (3428, 1585), (3428, 1735), (3428, 1836), (3428, 1921), (3428, 1927), (3428, 1963), (3428, 1974), (3428, 1994), (3428, 2004), (3428, 2018), (3428, 2038), (3428, 2111), (3428, 2118), (3428, 2142), (3428, 2365), (3428, 2487), (3428, 2538), (3428, 2715), (3428, 2770), (3428, 2774), (3428, 2807), (3428, 2836), (3428, 2891), (3428, 2983), (3428, 3005), (3428, 3029), (3428, 3181), (3428, 3352), (3428, 3418), (3428, 3496), (3428, 3508), (3428, 3539), (3428, 3893), (3428, 3966), (3428, 4156), (3428, 4907), (3428, 5700)]
----------------------------
