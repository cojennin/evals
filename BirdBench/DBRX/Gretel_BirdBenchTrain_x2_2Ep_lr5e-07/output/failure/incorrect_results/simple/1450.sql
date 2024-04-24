-- PROBLEM # 1450
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

-- External Knowledge: more than fifty incomes refers to income > 40
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- In the events with more than forty incomes, list the city and country in which the event is happening.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT e.event_name, z.city, z.county FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN zip_code z ON m.zip = z.zip_code WHERE e.event_id IN (SELECT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN income i ON m.member_id = i.link_to_member GROUP BY e.event_id HAVING COUNT(i.income_id) > 40)
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Avon', 'Hendricks County'), ('Evansville', 'Vanderburgh County'), ('Ellicott City', 'Howard County'), ('Grosse Pointe', 'Wayne County'), ('New York', 'New York County'), ('American Fork', 'Utah County'), ('Mcminnville', 'Warren County'), ('San Angelo', 'Tom Green County'), ('Sykesville', 'Carroll County'), ('Lincolnton', 'Lincoln County'), ('Salisbury', 'Wicomico County'), ('Bayonne', 'Hudson County'), ('Hartselle', 'Morgan County'), ('Albany', 'Albany County'), ('Perth Amboy', 'Middlesex County'), ('Mc Lean', 'Fairfax County'), ('Lake Zurich', 'Lake County'), ('Apple Valley', 'San Bernardino County'), ('Rochester', 'Monroe County'), ('Fargo', 'Cass County'), ('Lafayette', 'Tippecanoe County'), ('South Plainfield', 'Middlesex County'), ('Sunnyside', 'Queens County'), ('Georgetown', 'Georgetown County'), ('Chicopee', 'Hampden County'), ('Saint Paul', 'Ramsey County'), ('Buffalo Grove', 'Lake County'), ('Cary', 'Wake County'), ('Westmont', 'DuPage County'), ('Amarillo', 'Potter County'), ('East Meadow', 'Nassau County')]
----------------------------
