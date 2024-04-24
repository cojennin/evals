-- PROBLEM # 1443
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

-- External Knowledge: event_date BETWEEN '2019-11-01' and '2020-03-31'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Give the event ID, location, and status of events conducted from November 2019 to March 2020.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT event_id, location, status FROM event WHERE event_date BETWEEN '2019-11-01' and '2020-03-31'
----------------------------






-- ACTUAL RESULTS
[('rec0Si5cQ4rJRVzd6', 'MU 215', 'Open'), ('rec0akZnLLpGUloLH', None, 'Open'), ('rec0dZPcWXF0QjNnE', 'MU 215', 'Open'), ('rec180D2MI4EpckHy', None, 'Planning'), ('recAlAwtBZ0Fqbr5K', 'MU 215', 'Open'), ('recHaMmaKyfktt5fW', 'MU 215', 'Open'), ('recJ4Witp9tpjaugn', None, 'Closed'), ('recQym2V7XkIEFFnr', 'Campus Soccer/Lacrosse stadium', 'Planning'), ('recSdU7jGu57676tT', '258 S. Maple St.', 'Planning'), ('recWJFyajeK4jCNYz', None, 'Planning'), ('recY3Yesu24bRK7tr', 'MU 215', 'Open'), ('receBpqENOUMQYsIP', 'Campus Soccer/Lacrosse stadium', 'Planning'), ('recerGvehRmgO0obW', 'MU 215', 'Open'), ('reciRZdAqNIKuMC96', 'MU 215', 'Closed'), ('recmbOVHSyzXQZpQr', 'MU 215', 'Open'), ('recmvq6ZguK4MVmvx', 'Various locations', 'Open'), ('recqh5zxHuDpKUu0i', '100 W. Main Street', 'Planning'), ('recs4x1BYWAsU2SKg', 'MU 215', 'Open'), ('recsgSUqFCJqekzL5', '1308 106th Ave.', 'Closed'), ('rectsBOijA23838qh', 'Conference Room BA 452', 'Open'), ('recyYo8ZxGg9oJGys', 'Campus Baseball Stadium', 'Open')]
----------------------------
