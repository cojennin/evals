-- PROBLEM # 151
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

-- External Knowledge: A2 refers to district name; type = 'VYDAJ' stands for withdrawal transactions
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the name of the districts with accounts that made withdrawal transactions.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT DISTINCT d.A2 FROM district d JOIN account a ON d.district_id = a.district_id JOIN trans t ON a.account_id = t.account_id WHERE t.type = 'VYDAJ';
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Pisek',), ('Hl.m. Praha',), ('Kolin',), ('Pribram',), ('Cesky Krumlov',), ('Trutnov',), ('Prostejov',), ('Hodonin',), ('Karvina',), ('Brno - mesto',), ('Sumperk',), ('Tabor',), ('Pardubice',), ('Hradec Kralove',), ('Ostrava - mesto',), ('Sokolov',), ('Frydek - Mistek',), ('Usti nad Orlici',), ('Opava',), ('Melnik',), ('Liberec',), ('Domazlice',), ('Bruntal',), ('Prerov',), ('Strakonice',), ('Prachatice',), ('Zlin',), ('Olomouc',), ('Most',), ('Ceska Lipa',), ('Jicin',), ('Jindrichuv Hradec',), ('Vsetin',), ('Kladno',), ('Svitavy',), ('Rokycany',), ('Rychnov nad Kneznou',), ('Litomerice',), ('Mlada Boleslav',), ('Vyskov',), ('Beroun',), ('Plzen - mesto',), ('Chrudim',), ('Tachov',), ('Pelhrimov',), ('Benesov',), ('Brno - venkov',), ('Usti nad Labem',), ('Jablonec n. Nisou',), ('Praha - zapad',), ('Blansko',), ('Kutna Hora',), ('Plzen - jih',), ('Znojmo',), ('Teplice',), ('Chomutov',), ('Louny',), ('Karlovy Vary',), ('Praha - vychod',), ('Nachod',), ('Jihlava',), ('Cheb',), ('Plzen - sever',), ('Klatovy',), ('Kromeriz',), ('Rakovnik',), ('Zdar nad Sazavou',), ('Novy Jicin',), ('Jesenik',), ('Trebic',), ('Breclav',), ('Semily',), ('Ceske Budejovice',), ('Uherske Hradiste',), ('Havlickuv Brod',), ('Nymburk',), ('Decin',)]
----------------------------
