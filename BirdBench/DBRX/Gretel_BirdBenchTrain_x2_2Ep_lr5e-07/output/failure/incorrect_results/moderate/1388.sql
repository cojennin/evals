-- PROBLEM # 1388
-- Generation # 0
-- Difficulty: moderate
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

-- External Knowledge: name of students means the full name; full name refers to first_name, last_name; generate the highest income refers to MAX(income.amount);
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which students manage to generate the highest income. State his/her full name along with the income source.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT m.first_name, m.last_name, i.source, MAX(i.amount) FROM member m JOIN income i ON m.member_id = i.link_to_member GROUP BY m.member_id;
----------------------------




-- RESULTS FROM PREDICTION
[('Angela', 'Sanders', 'Dues', 50), ('Grant', 'Gilmour', 'Dues', 50), ('Luisa', 'Guidi', 'Dues', 50), ('Connor', 'Hilton', 'Dues', 50), ('Sacha', 'Harrison', 'Dues', 50), ('Christof', 'Nielson', 'Dues', 50), ('Carlo', 'Jacobs', 'Dues', 50), ('Phillip', 'Cullen', 'Dues', 50), ('Matthew', 'Snay', 'Dues', 50), ('Adele', 'Deleon', 'Dues', 50), ('Casey', 'Mason', 'Dues', 50), ('Trent', 'Smith', 'Dues', 50), ('Rafi', 'Mckee', 'Dues', 50), ('Katy', 'Balentine', 'Dues', 50), ('Dean', "O'Reilly", 'Dues', 50), ('Emily', 'Jaquith', 'Dues', 50), ('Edwardo', 'Ing', 'Dues', 50), ('Amy', 'Firth', 'Dues', 50), ('Mccauley', 'Nash', 'Dues', 50), ('Tyler', 'Hewitt', 'Dues', 50), ('Maya', 'Mclean', 'Dues', 50), ('Brent', 'Thomason', 'Dues', 50), ('Vincent', 'Ratcliffe', 'Dues', 50), ('Adela', "O'Gallagher", 'Dues', 50), ('Garrett', 'Gerke', 'Dues', 50), ('Keaton', 'Mccray', 'Dues', 50), ('Elijah', 'Allen', 'Dues', 50), ('Madelyn', 'Nicholson', 'Dues', 50), ('Annabella', 'Warren', 'Dues', 50), ('Kevin', 'Pierce', 'Dues', 50), ('Sherri', 'Ramsey', 'Dues', 50)]
----------------------------



-- ACTUAL RESULTS
[('Connor', 'Hilton', 'Dues')]
----------------------------
