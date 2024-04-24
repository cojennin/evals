-- PROBLEM # 1456
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

-- External Knowledge: full name refers to first_name, last_name; spend the most money refers to MAX(expense.cost)
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the full name of the top five members who spend the most money in the descending order of spending.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT member.first_name, member.last_name, SUM(expense.cost) as total_spent FROM member JOIN expense ON member.member_id = expense.link_to_member GROUP BY member.member_id ORDER BY total_spent DESC LIMIT 5;
----------------------------




-- RESULTS FROM GENERATED SQL
[('Sacha', 'Harrison', 866.25), ('Phillip', 'Cullen', 621.1800000000001), ('Elijah', 'Allen', 598.62)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Elijah', 'Allen'), ('Elijah', 'Allen'), ('Sacha', 'Harrison'), ('Elijah', 'Allen'), ('Sacha', 'Harrison')]
----------------------------
