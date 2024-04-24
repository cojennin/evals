-- PROBLEM # 1448
-- Generation # 0
-- Difficulty: challenging
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

-- External Knowledge: name of event refers to event_name; date of event refers to event_date; expenses for pizza refers to expense_description = 'Pizza' where cost > 50 and cost < 100
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Find the name and date of events with expenses for pizza that were more than fifty dollars but less than a hundred dollars.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT event_name, event_date FROM event WHERE event_id IN (SELECT link_to_event FROM budget WHERE budget_id IN (SELECT link_to_budget FROM expense WHERE expense_description = 'Pizza' AND cost > 50 AND cost < 100))
----------------------------






-- ACTUAL RESULTS
[('September Meeting', '2019-09-10T12:00:00'), ('October Speaker', '2019-10-22T12:00:00'), ('November Speaker', '2019-11-19T12:00:00'), ('October Meeting', '2019-10-08T12:00:00')]
----------------------------
