-- PROBLEM # 1436
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

-- External Knowledge: have paid more than 50 dollar refers to cost > 50
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please provide links to events for members who have paid more than 50 dollar.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT e.event_id FROM event e JOIN attendance a ON e.event_id = a.link_to_event JOIN member m ON a.link_to_member = m.member_id JOIN expense ex ON m.member_id = ex.link_to_member WHERE ex.cost > 50;
----------------------------






-- ACTUAL RESULTS
[('rec2N69DMcrqN9PJC',), ('rec5XDvJLyxDsGZWc',), ('recEVTik3MlqbvLFi',), ('recGxVCwaLW3mDIa3',), ('recI43CzsZ0Q625ma',), ('recIuIXdbLe5j5vCA',), ('recLKj8BbTNqxFbTb',), ('recLrY8kyOR1PcZeF',), ('recggMW2eyCYceNcy',), ('reciRZdAqNIKuMC96',), ('reckYL4xtQWpkTJ8k',), ('recmbOVHSyzXQZpQr',), ('recoVo6dFSzG1ypX7',), ('recsgSUqFCJqekzL5',), ('recvCUOytx5jPw7kh',), ('recykdvf4LgsyA3wZ',), ('reczhS8wix6Kzbp9P',)]
----------------------------
