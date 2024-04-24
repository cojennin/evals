-- PROBLEM # 1449
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

-- External Knowledge: full name refers to first_name, last_name; major of members refers to major_name; spend more than a hundred dollars on an expense refers to cost > 100
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the name and major of members who had to spend more than a hundred dollars on an expense?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT m.first_name, m.last_name, m.link_to_major FROM member m JOIN expense e ON m.member_id = e.link_to_member WHERE e.cost > 100;
----------------------------




-- RESULTS FROM GENERATED SQL
[('Sacha', 'Harrison', 'recCk8lCDOTRp6rKN'), ('Elijah', 'Allen', 'recObV24Ass2ouQHK'), ('Elijah', 'Allen', 'recObV24Ass2ouQHK'), ('Sacha', 'Harrison', 'recCk8lCDOTRp6rKN'), ('Elijah', 'Allen', 'recObV24Ass2ouQHK'), ('Sacha', 'Harrison', 'recCk8lCDOTRp6rKN')]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Sacha', 'Harrison', 'Liberal Arts'), ('Elijah', 'Allen', 'Elementary Education')]
----------------------------
