-- PROBLEM # 1444
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

-- External Knowledge: expense refers to expense_description; spend more than fifty dollars on average refers to DIVIDE( SUM(cost), COUNT(expense_id) ) > 50
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the expenses that spend more than fifty dollars on average.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT expense_id, expense_description, expense_date, cost, approved, link_to_member, link_to_budget FROM expense WHERE cost > 50;
----------------------------




-- RESULTS FROM GENERATED SQL
[('rec017x6R3hQqkLAo', 'Post Cards, Posters', '2019-08-20', 122.06, 'true', 'rec4BLdZHS2Blfp4v', 'recvKTAWAFKkVNnXQ'), ('rec1oMgNFt7Y0G40x', 'Pizza', '2019-09-10', 51.81, 'true', 'recD078PnS3x2doBe', 'recwXIiKoBMjXJsGZ'), ('rec4Zg7WEmfiHXcnC', 'Posters', '2019-10-10', 67.81, 'true', 'rec4BLdZHS2Blfp4v', 'recsI0IzpUuxl2bPh'), ('recHPdtBtpThSA9lq', 'Pizza', '2019-10-22', 92.82, 'true', 'recD078PnS3x2doBe', 'recr60T1tLsfdICV8'), ('recILV3eykJuWc489', 'Pizza', '2019-11-19', 62.6, 'true', 'recD078PnS3x2doBe', 'reczf4LoOK6z7oOec'), ('recIudsuLiDpzK8Io', 'Posters', '2019-09-01', 54.25, None, 'recD078PnS3x2doBe', 'recMc8TbR76rmUSHG'), ('recJnyr7Z1CjAlHgA', 'Posters', '2019-10-01', 54.25, 'true', 'recD078PnS3x2doBe', 'recTxecmwIhCdIKvl'), ('recNQk5EsFhOWLl4R', 'Pizza', '2019-09-03', 103.62, 'true', 'recro8T1MPMwRadVH', 'recca5tkvdQgoLKZz'), ('recPjEDS0hBq1saTk', 'Water, chips, cookies', '2019-11-05', 50.13, 'true', 'rec4BLdZHS2Blfp4v', 'recexNBMuCY9emh6y'), ('recS4pFu5y7MIT4ar', 'Posters', '2019-11-04', 74.59, 'true', 'rec4BLdZHS2Blfp4v', 'recN9yY7okNrFps0Y'), ('recSWyiU07aPjfFYa', 'Water, chips, cookies', '2019-09-24', 59.73, 'true', 'rec4BLdZHS2Blfp4v', 'rec5V70sIuIgpOzDT'), ('recTUt9QxJ0Sp3H3m', 'Water, chips, cookies', '2019-10-08', 69.33, 'true', 'recD078PnS3x2doBe', 'rec1bG6HSft7XIvTP'), ('recYO5hxM6fIVQ44n', 'Club shirts', '2019-09-18', 295.12, 'true', 'recro8T1MPMwRadVH', 'recRQdaiKCxFAlPCy'), ('recbzLA8PuklutV4x', 'Pizza', '2019-11-05', 124.12, 'true', 'rec4BLdZHS2Blfp4v', 'recexNBMuCY9emh6y'), ('recc708ab2lufAlNR', 'Posters', '2019-11-04', 54.25, 'true', 'recD078PnS3x2doBe', 'recKjd7dcURsmP0KY'), ('recc9M5QT9BWofBj0', 'Water, chips, cookies', '2019-10-22', 61.52, 'true', 'rec4BLdZHS2Blfp4v', 'recr60T1tLsfdICV8'), ('reccb1HM5bxQG3mLF', 'Water, chips, cookies', '2019-09-10', 50.13, 'true', 'recD078PnS3x2doBe', 'recwXIiKoBMjXJsGZ'), ('receRmFWtS9xJdkL2', 'Pizza', '2019-10-08', 51.81, 'true', 'recD078PnS3x2doBe', 'rec1bG6HSft7XIvTP'), ('reciebm8YBqUOsUW3', 'Posters', '2019-09-04', 67.81, 'true', 'rec4BLdZHS2Blfp4v', 'rec0QmEc3cSQFQ6V2'), ('recnK8dKtLnRpm34U', 'Pizza', '2019-09-24', 113.33, 'true', 'recro8T1MPMwRadVH', 'rec5V70sIuIgpOzDT'), ('recpalswlVDIbuLLu', 'Water, cookies, chips', '2019-11-19', 59.73, 'true', 'recD078PnS3x2doBe', 'reczf4LoOK6z7oOec'), ('recytertXPNtYtkC3', 'Bakery - Donuts, muffins', '2019-09-03', 195.3, 'true', 'rec4BLdZHS2Blfp4v', 'recca5tkvdQgoLKZz')]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Bakery - Donuts, muffins',), ('Club shirts',), ('Pizza',), ('Post Cards, Posters',), ('Posters',), ('Water, chips, cookies',), ('Water, cookies, chips',)]
----------------------------
