-- PROBLEM # 1370
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

-- External Knowledge: expense refers to expense_description; 'Vice President' is a position of the Student Club
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List all the expenses incurred by the vice president.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT expense.expense_description FROM expense WHERE expense.link_to_member IN (SELECT member.member_id FROM member WHERE member.position = 'Vice President')
----------------------------




-- RESULTS FROM GENERATED SQL
[('Pizza',), ('Pizza',), ('Pizza',), ('Posters',), ('Posters',), ('Water, chips, cookies',), ('Posters',), ('Water, chips, cookies',), ('Pizza',), ('Water, Cookies',), ('Water, cookies, chips',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('rec1oMgNFt7Y0G40x', 'Pizza'), ('recHPdtBtpThSA9lq', 'Pizza'), ('recILV3eykJuWc489', 'Pizza'), ('recIudsuLiDpzK8Io', 'Posters'), ('recJnyr7Z1CjAlHgA', 'Posters'), ('recTUt9QxJ0Sp3H3m', 'Water, chips, cookies'), ('recc708ab2lufAlNR', 'Posters'), ('reccb1HM5bxQG3mLF', 'Water, chips, cookies'), ('receRmFWtS9xJdkL2', 'Pizza'), ('recoMvesC2XeccvpV', 'Water, Cookies'), ('recpalswlVDIbuLLu', 'Water, cookies, chips')]
----------------------------
