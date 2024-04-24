-- PROBLEM # 1417
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

-- External Knowledge: remaining budget more than 30 USD refers to remaining > 30
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List out the type of events which have remaining budget more than 30 USD.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT e.event_name, b.remaining FROM event e JOIN budget b ON e.event_id = b.link_to_event WHERE b.remaining > 30;
----------------------------




-- RESULTS FROM PREDICTION
[('February Speaker', 150.0), ('April Meeting', 55.0), ('February Speaker', 75.0), ('March Meeting', 55.0), ('March Meeting', 150.0), ('April Speaker', 150.0), ('March Speaker', 150.0), ('February Meeting', 55.0), ('January Speaker', 75.0), ('January Speaker', 150.0), ('March Speaker', 75.0), ('February Meeting', 150.0), ('January Meeting', 150.0), ('January Meeting', 55.0), ('April Meeting', 150.0), ('April Speaker', 75.0), ('September Meeting', 48.06)]
----------------------------



-- ACTUAL RESULTS
[('Guest Speaker',), ('Meeting',), ('Guest Speaker',), ('Meeting',), ('Meeting',), ('Guest Speaker',), ('Guest Speaker',), ('Meeting',), ('Guest Speaker',), ('Guest Speaker',), ('Guest Speaker',), ('Meeting',), ('Meeting',), ('Meeting',), ('Meeting',), ('Guest Speaker',), ('Meeting',)]
----------------------------
