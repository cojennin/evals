-- PROBLEM # 1366
-- Generation # 0
-- Difficulty: simple
----------------------------

-- PROMPT
CREATE TABLE event
(
    event_id   TEXT
        constraint event_pk
            primary key,
    event_name TEXT,
    event_date TEXT,
    type       TEXT,
    notes      TEXT,
    location   TEXT,
    status     TEXT
)

CREATE TABLE major
(
    major_id   TEXT
        constraint major_pk
            primary key,
    major_name TEXT,
    department TEXT,
    college    TEXT
)

CREATE TABLE zip_code
(
    zip_code    INTEGER
        constraint zip_code_pk
            primary key,
    type        TEXT,
    city        TEXT,
    county      TEXT,
    state       TEXT,
    short_state TEXT
)

CREATE TABLE "attendance"
(
    link_to_event  TEXT,
    link_to_member TEXT,
    primary key (link_to_event, link_to_member),
    foreign key (link_to_event) references event(event_id),
    foreign key (link_to_member) references member(member_id)
)

CREATE TABLE "budget"
(
    budget_id     TEXT
            primary key,
    category      TEXT,
    spent         REAL,
    remaining     REAL,
    amount        INTEGER,
    event_status  TEXT,
    link_to_event TEXT,
    foreign key (link_to_event) references event(event_id)
)

CREATE TABLE "expense"
(
    expense_id          TEXT
            primary key,
    expense_description TEXT,
    expense_date        TEXT,
    cost                REAL,
    approved            TEXT,
    link_to_member      TEXT,
    link_to_budget      TEXT,
    foreign key (link_to_budget) references budget(budget_id),
    foreign key (link_to_member) references member(member_id)
)

CREATE TABLE "income"
(
    income_id      TEXT
        constraint income_pk
            primary key,
    date_received  TEXT,
    amount         INTEGER,
    source         TEXT,
    notes          TEXT,
    link_to_member TEXT,
    foreign key (link_to_member) references member(member_id)
)

CREATE TABLE "member"
(
    member_id     TEXT
        constraint member_pk
            primary key,
    first_name    TEXT,
    last_name     TEXT,
    email         TEXT,
    position      TEXT,
    t_shirt_size  TEXT,
    phone         TEXT,
    zip           INTEGER,
    link_to_major TEXT,
    foreign key (link_to_major) references major(major_id),
    foreign key (zip) references zip_code(zip_code)
)

-- External Knowledge: 'October Meeting' is an event name;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List all the members who attended the event "October Meeting".
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT m.first_name, m.last_name FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id WHERE e.event_name = 'October Meeting';
----------------------------




-- RESULTS FROM GENERATED SQL
[('Phillip', 'Cullen'), ('Katy', 'Balentine'), ('Matthew', 'Snay'), ('Luisa', 'Guidi'), ('Garrett', 'Gerke'), ('Maya', 'Mclean'), ('Edwardo', 'Ing'), ('Emily', 'Jaquith'), ('Rafi', 'Mckee'), ('Casey', 'Mason'), ('Elijah', 'Allen'), ('Keith', 'Dunlop'), ('Adele', 'Deleon'), ('Madelyn', 'Nicholson'), ('Sacha', 'Harrison'), ('Sherri', 'Ramsey'), ('Amy', 'Firth'), ('Kevin', 'Pierce'), ('Tyler', 'Hewitt'), ('Grant', 'Gilmour'), ('Dean', "O'Reilly"), ('Connor', 'Hilton'), ('Adela', "O'Gallagher")]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('recD078PnS3x2doBe',), ('recP6DJPyi5donvXL',), ('recEFd8s6pkrTt4Pz',), ('rec28ORZgcm1dtqBZ',), ('recf4UKTfipCzgcSA',), ('recZ4PkGERzl9ziHO',), ('recTjHY5xXhvkCdVT',), ('recT92PyyZCGq1R68',), ('recL94zpn6Xh6kQii',), ('recJMazpPVexyFYTc',), ('recro8T1MPMwRadVH',), ('reco0mr8dXTgs5wWA',), ('recEymrwCUKxiiosI',), ('recsTO4OZIF9rbubk',), ('rec4BLdZHS2Blfp4v',), ('recxBj3tjKTGHqucS',), ('recUdRhbhcEO1Hk5r',), ('recuSfhAZIlKba4s2',), ('recWh2lJVOT6HjChK',), ('rec280Sk7o31iG0Tx',), ('recQaxyXBQG5BBtD0',), ('rec3pH4DxMcWHMRB7',), ('reccW7q1KkhSKZsea',)]
----------------------------
