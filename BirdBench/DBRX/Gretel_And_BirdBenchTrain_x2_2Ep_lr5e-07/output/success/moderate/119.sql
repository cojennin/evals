-- PROBLEM # 119
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

-- External Knowledge: Records about district names could be found in A2; A3 contains the information about regions. 'POPLATEK PO OBRATU' stands for issuance after transaction
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- For accounts in 1993 with statement issued after transaction, list the account ID, district name and district region.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.date BETWEEN '1993-01-01' AND '1993-12-31' AND a.frequency = 'POPLATEK PO OBRATU';
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(66, 'Rychnov nad Kneznou', 'east Bohemia'), (273, 'Karlovy Vary', 'west Bohemia'), (485, 'Kutna Hora', 'central Bohemia'), (539, 'Rakovnik', 'central Bohemia'), (1050, 'Hodonin', 'south Moravia'), (1286, 'Zdar nad Sazavou', 'south Moravia'), (1527, 'Tachov', 'west Bohemia'), (1539, 'Hl.m. Praha', 'Prague'), (1965, 'Hodonin', 'south Moravia'), (2137, 'Kladno', 'central Bohemia'), (2464, 'Decin', 'north Bohemia'), (2705, 'Vyskov', 'south Moravia'), (3837, 'Rychnov nad Kneznou', 'east Bohemia'), (4013, 'Opava', 'north Moravia'), (5228, 'Vsetin', 'north Moravia'), (5256, 'Olomouc', 'north Moravia'), (7123, 'Zlin', 'south Moravia'), (7774, 'Ostrava - mesto', 'north Moravia'), (8073, 'Karlovy Vary', 'west Bohemia'), (8212, 'Usti nad Orlici', 'east Bohemia'), (10227, 'Uherske Hradiste', 'south Moravia')]
----------------------------
