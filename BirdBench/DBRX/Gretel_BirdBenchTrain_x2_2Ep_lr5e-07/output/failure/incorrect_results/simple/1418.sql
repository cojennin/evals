-- PROBLEM # 1418
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

-- External Knowledge: held at MU 215 refers to location = 'MU 215'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Mention the category of events which were held at MU 215.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT event_name FROM event WHERE location = 'MU 215'
----------------------------




-- RESULTS FROM GENERATED SQL
[('March Meeting',), ('Spring Elections',), ('April Speaker',), ('March Speaker',), ('October Speaker',), ('February Speaker',), ('September Speaker',), ('Fall Elections',), ('Officers meeting - September',), ('January Meeting',), ('February Meeting',), ('October Meeting',), ('November Speaker',), ('November Meeting',), ('January Speaker',), ('Yearly Wrap-up',), ('April Meeting',), ('Yearly Kickoff',), ('September Meeting',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Advertisement',), ('Food',), ('Speaker Gifts',), ('Food',), ('Parking',), ('Advertisement',), ('Food',), ('Advertisement',), ('Speaker Gifts',), ('Parking',), ('Speaker Gifts',), ('Advertisement',), ('Advertisement',), ('Advertisement',), ('Advertisement',), ('Parking',), ('Advertisement',), ('Food',), ('Food',), ('Food',), ('Advertisement',), ('Advertisement',), ('Food',), ('Parking',), ('Speaker Gifts',), ('Food',), ('Food',), ('Speaker Gifts',), ('Food',), ('Advertisement',), ('Parking',), ('Parking',), ('Food',), ('Food',), ('Advertisement',), ('Food',), ('Food',), ('Advertisement',), ('Speaker Gifts',), ('Advertisement',), ('Speaker Gifts',), ('Advertisement',), ('Food',), ('Food',), ('Parking',)]
----------------------------
