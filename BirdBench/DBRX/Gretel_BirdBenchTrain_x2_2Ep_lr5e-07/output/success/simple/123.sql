-- PROBLEM # 123
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

-- External Knowledge: A2 contains district names and A3 contains region names.
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Provide the account ID, district and region for loan amount greater than USD300,000.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT a.account_id, d.A2, d.A3 FROM account a JOIN district d ON a.district_id = d.district_id WHERE a.account_id IN (SELECT l.account_id FROM loan l WHERE l.amount > 300000);
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(37, 'Strakonice', 'south Bohemia'), (105, 'Tabor', 'south Bohemia'), (319, 'Pardubice', 'east Bohemia'), (330, 'Havlickuv Brod', 'east Bohemia'), (339, 'Nachod', 'east Bohemia'), (442, 'Brno - mesto', 'south Moravia'), (817, 'Kolin', 'central Bohemia'), (915, 'Olomouc', 'north Moravia'), (1093, 'Brno - mesto', 'south Moravia'), (1374, 'Blansko', 'south Moravia'), (1583, 'Jesenik', 'north Moravia'), (1808, 'Plzen - sever', 'west Bohemia'), (1862, 'Prachatice', 'south Bohemia'), (2245, 'Rokycany', 'west Bohemia'), (2246, 'Hl.m. Praha', 'Prague'), (2279, 'Benesov', 'central Bohemia'), (2335, 'Karvina', 'north Moravia'), (2516, 'Kutna Hora', 'central Bohemia'), (2545, 'Hl.m. Praha', 'Prague'), (2572, 'Zlin', 'south Moravia'), (2754, 'Hodonin', 'south Moravia'), (2910, 'Frydek - Mistek', 'north Moravia'), (2912, 'Ostrava - mesto', 'north Moravia'), (2936, 'Beroun', 'central Bohemia'), (3005, 'Havlickuv Brod', 'east Bohemia'), (3115, 'Ceske Budejovice', 'south Bohemia'), (3678, 'Hl.m. Praha', 'Prague'), (3679, 'Zlin', 'south Moravia'), (3711, 'Beroun', 'central Bohemia'), (3859, 'Blansko', 'south Moravia'), (3906, 'Usti nad Orlici', 'east Bohemia'), (4190, 'Uherske Hradiste', 'south Moravia'), (4354, 'Louny', 'north Bohemia'), (4456, 'Ceske Budejovice', 'south Bohemia'), (4576, 'Plzen - jih', 'west Bohemia'), (4650, 'Kladno', 'central Bohemia'), (4774, 'Zdar nad Sazavou', 'south Moravia'), (4794, 'Olomouc', 'north Moravia'), (4858, 'Bruntal', 'north Moravia'), (4948, 'Hradec Kralove', 'east Bohemia'), (5072, 'Kutna Hora', 'central Bohemia'), (5120, 'Hl.m. Praha', 'Prague'), (5181, 'Prerov', 'north Moravia'), (5213, 'Hl.m. Praha', 'Prague'), (5313, 'Teplice', 'north Bohemia'), (5422, 'Zdar nad Sazavou', 'south Moravia'), (5477, 'Hodonin', 'south Moravia'), (6034, 'Kutna Hora', 'central Bohemia'), (6062, 'Karlovy Vary', 'west Bohemia'), (6075, 'Prachatice', 'south Bohemia'), (6083, 'Kutna Hora', 'central Bohemia'), (6226, 'Ostrava - mesto', 'north Moravia'), (6592, 'Hl.m. Praha', 'Prague'), (6950, 'Liberec', 'north Bohemia'), (7049, 'Jesenik', 'north Moravia'), (7542, 'Brno - mesto', 'south Moravia'), (7562, 'Olomouc', 'north Moravia'), (7614, 'Uherske Hradiste', 'south Moravia'), (7637, 'Nachod', 'east Bohemia'), (7795, 'Zlin', 'south Moravia'), (7966, 'Brno - mesto', 'south Moravia'), (8320, 'Trutnov', 'east Bohemia'), (8377, 'Rokycany', 'west Bohemia'), (8381, 'Ceske Budejovice', 'south Bohemia'), (8926, 'Hl.m. Praha', 'Prague'), (9037, 'Hl.m. Praha', 'Prague'), (9455, 'Opava', 'north Moravia'), (9504, 'Nymburk', 'central Bohemia'), (9859, 'Plzen - jih', 'west Bohemia'), (9869, 'Pribram', 'central Bohemia'), (10065, 'Sumperk', 'north Moravia'), (10202, 'Karvina', 'north Moravia'), (10280, 'Jesenik', 'north Moravia'), (10297, 'Ceske Budejovice', 'south Bohemia'), (10451, 'Hl.m. Praha', 'Prague'), (10520, 'Brno - venkov', 'south Moravia'), (10774, 'Nachod', 'east Bohemia'), (10857, 'Svitavy', 'east Bohemia'), (10942, 'Chrudim', 'east Bohemia'), (11186, 'Pribram', 'central Bohemia'), (11317, 'Svitavy', 'east Bohemia'), (11349, 'Hl.m. Praha', 'Prague')]
----------------------------
