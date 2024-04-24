-- PROBLEM # 1447
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

-- External Knowledge: name of event refers to event_name; underspend its budget refers to remaining > 0
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the name and location of events that underspend its budget.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT event_name, location FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE remaining > 0)
----------------------------






-- ACTUAL RESULTS
[('September Speaker', 'MU 215'), ('October Meeting', 'MU 215'), ('February Speaker', 'MU 215'), ('January Speaker', 'MU 215'), ('April Meeting', 'MU 215'), ('April Speaker', 'MU 215'), ('October Speaker', 'MU 215'), ('November Meeting', 'MU 215'), ('Officers meeting - March', None), ('September Meeting', 'MU 215'), ('November Speaker', 'MU 215'), ('March Meeting', 'MU 215'), ('Registration', 'Campus Common'), ('March Speaker', 'MU 215'), ('February Meeting', 'MU 215'), ('Yearly Kickoff', 'MU 215'), ('Officers meeting - January', None), ('Officers meeting - February', None), ('January Meeting', 'MU 215'), ('Officers meeting - April', None)]
----------------------------
