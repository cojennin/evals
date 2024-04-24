-- PROBLEM # 120
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

-- External Knowledge: Accounts holder refers to the person who own this account.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- From Year 1995 to 2000, who are the accounts holders from 'east Bohemia'. State the account ID the frequency of statement issuance.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT account_id, frequency FROM account WHERE date BETWEEN '1995-01-01' AND '2000-12-31' AND district_id IN (SELECT district_id FROM district WHERE A2 = 'east Bohemia')
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(14, 'POPLATEK MESICNE'), (76, 'POPLATEK MESICNE'), (80, 'POPLATEK MESICNE'), (84, 'POPLATEK PO OBRATU'), (103, 'POPLATEK MESICNE'), (131, 'POPLATEK MESICNE'), (149, 'POPLATEK MESICNE'), (171, 'POPLATEK MESICNE'), (174, 'POPLATEK MESICNE'), (182, 'POPLATEK MESICNE'), (194, 'POPLATEK MESICNE'), (210, 'POPLATEK MESICNE'), (232, 'POPLATEK MESICNE'), (253, 'POPLATEK MESICNE'), (283, 'POPLATEK MESICNE'), (292, 'POPLATEK MESICNE'), (296, 'POPLATEK MESICNE'), (311, 'POPLATEK MESICNE'), (315, 'POPLATEK MESICNE'), (319, 'POPLATEK TYDNE'), (320, 'POPLATEK MESICNE'), (323, 'POPLATEK MESICNE'), (330, 'POPLATEK MESICNE'), (338, 'POPLATEK MESICNE'), (339, 'POPLATEK TYDNE'), (350, 'POPLATEK MESICNE'), (351, 'POPLATEK MESICNE'), (390, 'POPLATEK MESICNE'), (393, 'POPLATEK MESICNE'), (410, 'POPLATEK MESICNE'), (463, 'POPLATEK MESICNE'), (464, 'POPLATEK MESICNE'), (468, 'POPLATEK MESICNE'), (471, 'POPLATEK MESICNE'), (490, 'POPLATEK MESICNE'), (491, 'POPLATEK MESICNE'), (507, 'POPLATEK MESICNE'), (590, 'POPLATEK MESICNE'), (593, 'POPLATEK MESICNE'), (600, 'POPLATEK MESICNE'), (602, 'POPLATEK MESICNE'), (611, 'POPLATEK MESICNE'), (621, 'POPLATEK MESICNE'), (637, 'POPLATEK MESICNE'), (646, 'POPLATEK MESICNE'), (674, 'POPLATEK MESICNE'), (684, 'POPLATEK MESICNE'), (706, 'POPLATEK MESICNE'), (733, 'POPLATEK TYDNE'), (745, 'POPLATEK MESICNE'), (758, 'POPLATEK MESICNE'), (782, 'POPLATEK MESICNE'), (791, 'POPLATEK MESICNE'), (810, 'POPLATEK MESICNE'), (826, 'POPLATEK MESICNE'), (831, 'POPLATEK MESICNE'), (832, 'POPLATEK MESICNE'), (836, 'POPLATEK MESICNE'), (858, 'POPLATEK MESICNE'), (878, 'POPLATEK MESICNE'), (889, 'POPLATEK MESICNE'), (894, 'POPLATEK MESICNE'), (937, 'POPLATEK MESICNE'), (972, 'POPLATEK MESICNE'), (996, 'POPLATEK MESICNE'), (1002, 'POPLATEK MESICNE'), (1021, 'POPLATEK MESICNE'), (1058, 'POPLATEK MESICNE'), (1061, 'POPLATEK MESICNE'), (1068, 'POPLATEK MESICNE'), (1083, 'POPLATEK MESICNE'), (1085, 'POPLATEK MESICNE'), (1112, 'POPLATEK MESICNE'), (1140, 'POPLATEK MESICNE'), (1155, 'POPLATEK MESICNE'), (1165, 'POPLATEK MESICNE'), (1190, 'POPLATEK MESICNE'), (1195, 'POPLATEK MESICNE'), (1199, 'POPLATEK MESICNE'), (1211, 'POPLATEK MESICNE'), (1221, 'POPLATEK MESICNE'), (1229, 'POPLATEK MESICNE'), (1232, 'POPLATEK MESICNE'), (1261, 'POPLATEK MESICNE'), (1265, 'POPLATEK MESICNE'), (1267, 'POPLATEK MESICNE'), (1296, 'POPLATEK MESICNE'), (1313, 'POPLATEK MESICNE'), (1316, 'POPLATEK MESICNE'), (1323, 'POPLATEK MESICNE'), (1324, 'POPLATEK MESICNE'), (1326, 'POPLATEK MESICNE'), (1340, 'POPLATEK MESICNE'), (1361, 'POPLATEK MESICNE'), (1365, 'POPLATEK MESICNE'), (1370, 'POPLATEK MESICNE'), (1379, 'POPLATEK MESICNE'), (1396, 'POPLATEK MESICNE'), (1399, 'POPLATEK MESICNE'), (1437, 'POPLATEK MESICNE'), (1452, 'POPLATEK MESICNE'), (1454, 'POPLATEK MESICNE'), (1491, 'POPLATEK MESICNE'), (1500, 'POPLATEK MESICNE'), (1501, 'POPLATEK MESICNE'), (1506, 'POPLATEK MESICNE'), (1520, 'POPLATEK MESICNE'), (1522, 'POPLATEK MESICNE'), (1523, 'POPLATEK PO OBRATU'), (1526, 'POPLATEK MESICNE'), (1528, 'POPLATEK MESICNE'), (1548, 'POPLATEK MESICNE'), (1563, 'POPLATEK MESICNE'), (1564, 'POPLATEK MESICNE'), (1585, 'POPLATEK MESICNE'), (1633, 'POPLATEK MESICNE'), (1641, 'POPLATEK MESICNE'), (1645, 'POPLATEK MESICNE'), (1656, 'POPLATEK MESICNE'), (1659, 'POPLATEK MESICNE'), (1682, 'POPLATEK MESICNE'), (1691, 'POPLATEK MESICNE'), (1696, 'POPLATEK MESICNE'), (1712, 'POPLATEK MESICNE'), (1716, 'POPLATEK MESICNE'), (1724, 'POPLATEK MESICNE'), (1732, 'POPLATEK MESICNE'), (1735, 'POPLATEK MESICNE'), (1754, 'POPLATEK MESICNE'), (1785, 'POPLATEK MESICNE'), (1798, 'POPLATEK MESICNE'), (1800, 'POPLATEK MESICNE'), (1810, 'POPLATEK MESICNE'), (1836, 'POPLATEK MESICNE'), (1845, 'POPLATEK MESICNE'), (1847, 'POPLATEK MESICNE'), (1859, 'POPLATEK MESICNE'), (1867, 'POPLATEK MESICNE'), (1885, 'POPLATEK MESICNE'), (1893, 'POPLATEK MESICNE'), (1913, 'POPLATEK MESICNE'), (1921, 'POPLATEK MESICNE'), (1927, 'POPLATEK MESICNE'), (1946, 'POPLATEK MESICNE'), (1955, 'POPLATEK MESICNE'), (1963, 'POPLATEK MESICNE'), (1974, 'POPLATEK MESICNE'), (1980, 'POPLATEK MESICNE'), (1986, 'POPLATEK MESICNE'), (1992, 'POPLATEK MESICNE'), (1994, 'POPLATEK MESICNE'), (2004, 'POPLATEK MESICNE'), (2007, 'POPLATEK MESICNE'), (2018, 'POPLATEK MESICNE'), (2041, 'POPLATEK MESICNE'), (2043, 'POPLATEK MESICNE'), (2084, 'POPLATEK MESICNE'), (2097, 'POPLATEK MESICNE'), (2103, 'POPLATEK MESICNE'), (2104, 'POPLATEK MESICNE'), (2111, 'POPLATEK TYDNE'), (2112, 'POPLATEK MESICNE'), (2117, 'POPLATEK MESICNE'), (2118, 'POPLATEK MESICNE'), (2125, 'POPLATEK TYDNE'), (2130, 'POPLATEK MESICNE'), (2134, 'POPLATEK MESICNE'), (2135, 'POPLATEK MESICNE'), (2142, 'POPLATEK MESICNE'), (2162, 'POPLATEK MESICNE'), (2165, 'POPLATEK MESICNE'), (2193, 'POPLATEK MESICNE'), (2197, 'POPLATEK MESICNE'), (2203, 'POPLATEK MESICNE'), (2205, 'POPLATEK MESICNE'), (2206, 'POPLATEK MESICNE'), (2214, 'POPLATEK MESICNE'), (2215, 'POPLATEK MESICNE'), (2223, 'POPLATEK MESICNE'), (2224, 'POPLATEK PO OBRATU'), (2233, 'POPLATEK MESICNE'), (2235, 'POPLATEK MESICNE'), (2244, 'POPLATEK MESICNE'), (2255, 'POPLATEK MESICNE'), (2266, 'POPLATEK MESICNE'), (2272, 'POPLATEK MESICNE'), (2291, 'POPLATEK MESICNE'), (2294, 'POPLATEK MESICNE'), (2297, 'POPLATEK MESICNE'), (2304, 'POPLATEK MESICNE'), (2334, 'POPLATEK MESICNE'), (2353, 'POPLATEK MESICNE'), (2369, 'POPLATEK MESICNE'), (2370, 'POPLATEK MESICNE'), (2380, 'POPLATEK MESICNE'), (2441, 'POPLATEK MESICNE'), (2443, 'POPLATEK MESICNE'), (2445, 'POPLATEK MESICNE'), (2450, 'POPLATEK MESICNE'), (2487, 'POPLATEK MESICNE'), (2509, 'POPLATEK MESICNE'), (2525, 'POPLATEK MESICNE'), (2531, 'POPLATEK MESICNE'), (2533, 'POPLATEK MESICNE'), (2556, 'POPLATEK MESICNE'), (2558, 'POPLATEK MESICNE'), (2563, 'POPLATEK MESICNE'), (2590, 'POPLATEK MESICNE'), (2602, 'POPLATEK MESICNE'), (2614, 'POPLATEK MESICNE'), (2625, 'POPLATEK TYDNE'), (2634, 'POPLATEK MESICNE'), (2674, 'POPLATEK MESICNE'), (2680, 'POPLATEK MESICNE'), (2698, 'POPLATEK MESICNE'), (2706, 'POPLATEK MESICNE'), (2715, 'POPLATEK MESICNE'), (2725, 'POPLATEK MESICNE'), (2728, 'POPLATEK TYDNE'), (2743, 'POPLATEK MESICNE'), (2759, 'POPLATEK MESICNE'), (2774, 'POPLATEK MESICNE'), (2783, 'POPLATEK MESICNE'), (2807, 'POPLATEK MESICNE'), (2836, 'POPLATEK MESICNE'), (2837, 'POPLATEK MESICNE'), (2844, 'POPLATEK MESICNE'), (2866, 'POPLATEK MESICNE'), (2871, 'POPLATEK MESICNE'), (2882, 'POPLATEK MESICNE'), (2891, 'POPLATEK MESICNE'), (2897, 'POPLATEK MESICNE'), (2906, 'POPLATEK MESICNE'), (2923, 'POPLATEK MESICNE'), (2929, 'POPLATEK MESICNE'), (2942, 'POPLATEK MESICNE'), (2981, 'POPLATEK MESICNE'), (2983, 'POPLATEK MESICNE'), (2992, 'POPLATEK MESICNE'), (2995, 'POPLATEK MESICNE'), (3005, 'POPLATEK PO OBRATU'), (3010, 'POPLATEK MESICNE'), (3012, 'POPLATEK MESICNE'), (3029, 'POPLATEK MESICNE'), (3031, 'POPLATEK MESICNE'), (3052, 'POPLATEK MESICNE'), (3067, 'POPLATEK MESICNE'), (3092, 'POPLATEK MESICNE'), (3110, 'POPLATEK MESICNE'), (3118, 'POPLATEK MESICNE'), (3121, 'POPLATEK MESICNE'), (3161, 'POPLATEK MESICNE'), (3175, 'POPLATEK MESICNE'), (3185, 'POPLATEK MESICNE'), (3209, 'POPLATEK MESICNE'), (3236, 'POPLATEK MESICNE'), (3238, 'POPLATEK MESICNE'), (3245, 'POPLATEK MESICNE'), (3263, 'POPLATEK MESICNE'), (3265, 'POPLATEK PO OBRATU'), (3285, 'POPLATEK MESICNE'), (3291, 'POPLATEK MESICNE'), (3333, 'POPLATEK MESICNE'), (3349, 'POPLATEK MESICNE'), (3358, 'POPLATEK MESICNE'), (3397, 'POPLATEK MESICNE'), (3398, 'POPLATEK MESICNE'), (3417, 'POPLATEK MESICNE'), (3418, 'POPLATEK PO OBRATU'), (3443, 'POPLATEK MESICNE'), (3451, 'POPLATEK MESICNE'), (3462, 'POPLATEK MESICNE'), (3490, 'POPLATEK MESICNE'), (3491, 'POPLATEK MESICNE'), (3496, 'POPLATEK MESICNE'), (3499, 'POPLATEK MESICNE'), (3508, 'POPLATEK MESICNE'), (3512, 'POPLATEK MESICNE'), (3519, 'POPLATEK MESICNE'), (3527, 'POPLATEK MESICNE'), (3537, 'POPLATEK MESICNE'), (3562, 'POPLATEK MESICNE'), (3615, 'POPLATEK MESICNE'), (3616, 'POPLATEK MESICNE'), (3626, 'POPLATEK MESICNE'), (3638, 'POPLATEK PO OBRATU'), (3661, 'POPLATEK MESICNE'), (3768, 'POPLATEK MESICNE'), (3780, 'POPLATEK MESICNE'), (3802, 'POPLATEK MESICNE'), (3810, 'POPLATEK MESICNE'), (3828, 'POPLATEK MESICNE'), (3832, 'POPLATEK MESICNE'), (3845, 'POPLATEK MESICNE'), (3856, 'POPLATEK MESICNE'), (3865, 'POPLATEK MESICNE'), (3874, 'POPLATEK MESICNE'), (3875, 'POPLATEK MESICNE'), (3885, 'POPLATEK MESICNE'), (3890, 'POPLATEK MESICNE'), (3893, 'POPLATEK MESICNE'), (3894, 'POPLATEK MESICNE'), (3896, 'POPLATEK MESICNE'), (3906, 'POPLATEK MESICNE'), (3945, 'POPLATEK MESICNE'), (3950, 'POPLATEK MESICNE'), (3961, 'POPLATEK MESICNE'), (3966, 'POPLATEK MESICNE'), (3984, 'POPLATEK MESICNE'), (3992, 'POPLATEK MESICNE'), (4047, 'POPLATEK TYDNE'), (4088, 'POPLATEK MESICNE'), (4127, 'POPLATEK MESICNE'), (4156, 'POPLATEK MESICNE'), (4253, 'POPLATEK MESICNE'), (4258, 'POPLATEK MESICNE'), (4286, 'POPLATEK MESICNE'), (4330, 'POPLATEK MESICNE'), (4379, 'POPLATEK MESICNE'), (4386, 'POPLATEK TYDNE'), (4424, 'POPLATEK MESICNE'), (4438, 'POPLATEK MESICNE'), (4445, 'POPLATEK MESICNE'), (4473, 'POPLATEK MESICNE'), (4503, 'POPLATEK MESICNE'), (4784, 'POPLATEK MESICNE'), (4851, 'POPLATEK MESICNE'), (4852, 'POPLATEK MESICNE'), (4948, 'POPLATEK MESICNE'), (5063, 'POPLATEK MESICNE'), (5269, 'POPLATEK MESICNE'), (5305, 'POPLATEK MESICNE'), (5395, 'POPLATEK MESICNE'), (5541, 'POPLATEK MESICNE'), (5735, 'POPLATEK MESICNE'), (5758, 'POPLATEK MESICNE'), (5912, 'POPLATEK MESICNE'), (6064, 'POPLATEK MESICNE'), (6397, 'POPLATEK MESICNE'), (6461, 'POPLATEK MESICNE'), (6856, 'POPLATEK MESICNE'), (7045, 'POPLATEK MESICNE'), (7637, 'POPLATEK MESICNE'), (7713, 'POPLATEK TYDNE'), (7859, 'POPLATEK MESICNE'), (7957, 'POPLATEK MESICNE'), (8038, 'POPLATEK MESICNE'), (8158, 'POPLATEK TYDNE'), (8225, 'POPLATEK MESICNE'), (8320, 'POPLATEK MESICNE'), (8533, 'POPLATEK MESICNE'), (8639, 'POPLATEK MESICNE'), (9031, 'POPLATEK MESICNE'), (9052, 'POPLATEK PO OBRATU'), (9227, 'POPLATEK MESICNE'), (9790, 'POPLATEK MESICNE'), (10220, 'POPLATEK MESICNE'), (10243, 'POPLATEK MESICNE'), (10562, 'POPLATEK MESICNE'), (10607, 'POPLATEK MESICNE'), (10774, 'POPLATEK MESICNE'), (10857, 'POPLATEK MESICNE'), (11053, 'POPLATEK MESICNE'), (11317, 'POPLATEK MESICNE')]
----------------------------
