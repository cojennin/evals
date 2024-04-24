-- PROBLEM # 1385
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

-- External Knowledge: name of students means the full name; full name refers to first_name, last_name; generate income more than $50 refers to income.amount > 40
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which student was able to generate income more than $40?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT member_id, first_name, last_name, SUM(amount) as total_income FROM member JOIN income ON member.member_id = income.link_to_member GROUP BY member_id HAVING total_income > 40;
----------------------------




-- RESULTS FROM PREDICTION
[('rec1x5zBFIqoOuPW8', 'Angela', 'Sanders', 50), ('rec280Sk7o31iG0Tx', 'Grant', 'Gilmour', 50), ('rec28ORZgcm1dtqBZ', 'Luisa', 'Guidi', 50), ('rec3pH4DxMcWHMRB7', 'Connor', 'Hilton', 100), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 100), ('rec4O9rmGnLx3j8vt', 'Christof', 'Nielson', 50), ('rec75vvFxgYtHmqxY', 'Carlo', 'Jacobs', 50), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 50), ('recEFd8s6pkrTt4Pz', 'Matthew', 'Snay', 50), ('recEymrwCUKxiiosI', 'Adele', 'Deleon', 50), ('recJMazpPVexyFYTc', 'Casey', 'Mason', 50), ('recL4aEZBZoPk9NYx', 'Trent', 'Smith', 50), ('recL94zpn6Xh6kQii', 'Rafi', 'Mckee', 50), ('recP6DJPyi5donvXL', 'Katy', 'Balentine', 50), ('recQaxyXBQG5BBtD0', 'Dean', "O'Reilly", 50), ('recT92PyyZCGq1R68', 'Emily', 'Jaquith', 50), ('recTjHY5xXhvkCdVT', 'Edwardo', 'Ing', 50), ('recUdRhbhcEO1Hk5r', 'Amy', 'Firth', 50), ('recVsoJJHFI8bgtfw', 'Mccauley', 'Nash', 50), ('recWh2lJVOT6HjChK', 'Tyler', 'Hewitt', 50), ('recZ4PkGERzl9ziHO', 'Maya', 'Mclean', 50), ('recZN8afUWlE5fZHG', 'Brent', 'Thomason', 50), ('reccSUPwy30AeZLEb', 'Vincent', 'Ratcliffe', 50), ('reccW7q1KkhSKZsea', 'Adela', "O'Gallagher", 50), ('recf4UKTfipCzgcSA', 'Garrett', 'Gerke', 50), ('recjHj4BS5A541n9v', 'Keaton', 'Mccray', 50), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 50), ('recsTO4OZIF9rbubk', 'Madelyn', 'Nicholson', 50), ('recttfySfQnYb68u3', 'Annabella', 'Warren', 50), ('recuSfhAZIlKba4s2', 'Kevin', 'Pierce', 50), ('recxBj3tjKTGHqucS', 'Sherri', 'Ramsey', 50)]
----------------------------



-- ACTUAL RESULTS
[('Adela', "O'Gallagher"), ('Edwardo', 'Ing'), ('Amy', 'Firth'), ('Connor', 'Hilton'), ('Luisa', 'Guidi'), ('Brent', 'Thomason'), ('Keaton', 'Mccray'), ('Rafi', 'Mckee'), ('Elijah', 'Allen'), ('Dean', "O'Reilly"), ('Garrett', 'Gerke'), ('Matthew', 'Snay'), ('Vincent', 'Ratcliffe'), ('Katy', 'Balentine'), ('Sherri', 'Ramsey'), ('Adele', 'Deleon'), ('Annabella', 'Warren'), ('Kevin', 'Pierce'), ('Casey', 'Mason'), ('Christof', 'Nielson'), ('Mccauley', 'Nash'), ('Sacha', 'Harrison'), ('Carlo', 'Jacobs'), ('Grant', 'Gilmour'), ('Phillip', 'Cullen'), ('Sacha', 'Harrison'), ('Angela', 'Sanders'), ('Tyler', 'Hewitt'), ('Madelyn', 'Nicholson'), ('Trent', 'Smith'), ('Emily', 'Jaquith'), ('Maya', 'Mclean'), ('Connor', 'Hilton')]
----------------------------
