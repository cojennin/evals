-- PROBLEM # 1437
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

-- External Knowledge: approved from 1/10/2019 to 11/19/2019 refers to approved = 'true' and expense_date BETWEEN '2019-01-10' and '2019-11-19'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which members who were approved from 1/10/2019 to 11/19/2019? Please identify the member who attended the event and the link to their event.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT m.member_id, m.first_name, m.last_name, a.link_to_event FROM member m JOIN attendance a ON m.member_id = a.link_to_member JOIN event e ON a.link_to_event = e.event_id JOIN expense ex ON m.member_id = ex.link_to_member WHERE ex.approved = 'true' AND ex.expense_date BETWEEN '2019-01-10' AND '2019-11-19';
----------------------------




-- RESULTS FROM GENERATED SQL
[('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'rec5XDvJLyxDsGZWc'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recIuIXdbLe5j5vCA'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recIuIXdbLe5j5vCA'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recIuIXdbLe5j5vCA'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recIuIXdbLe5j5vCA'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recIuIXdbLe5j5vCA'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recIuIXdbLe5j5vCA'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recIuIXdbLe5j5vCA'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recIuIXdbLe5j5vCA'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recIuIXdbLe5j5vCA'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLrY8kyOR1PcZeF'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLrY8kyOR1PcZeF'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLrY8kyOR1PcZeF'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLrY8kyOR1PcZeF'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLrY8kyOR1PcZeF'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLrY8kyOR1PcZeF'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLrY8kyOR1PcZeF'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLrY8kyOR1PcZeF'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recykdvf4LgsyA3wZ'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recykdvf4LgsyA3wZ'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recykdvf4LgsyA3wZ'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recykdvf4LgsyA3wZ'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recykdvf4LgsyA3wZ'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recykdvf4LgsyA3wZ'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recykdvf4LgsyA3wZ'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recykdvf4LgsyA3wZ'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'Phillip', 'Cullen', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'Elijah', 'Allen', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P'), ('rec4BLdZHS2Blfp4v', 'Sacha', 'Harrison', 'reczhS8wix6Kzbp9P')]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('rec4BLdZHS2Blfp4v', 'recEVTik3MlqbvLFi'), ('rec4BLdZHS2Blfp4v', 'recGxVCwaLW3mDIa3'), ('rec4BLdZHS2Blfp4v', 'recI43CzsZ0Q625ma'), ('rec4BLdZHS2Blfp4v', 'recLKj8BbTNqxFbTb'), ('rec4BLdZHS2Blfp4v', 'recLrY8kyOR1PcZeF'), ('rec4BLdZHS2Blfp4v', 'recggMW2eyCYceNcy'), ('rec4BLdZHS2Blfp4v', 'reciRZdAqNIKuMC96'), ('rec4BLdZHS2Blfp4v', 'reckYL4xtQWpkTJ8k'), ('rec4BLdZHS2Blfp4v', 'recmbOVHSyzXQZpQr'), ('rec4BLdZHS2Blfp4v', 'recoVo6dFSzG1ypX7'), ('rec4BLdZHS2Blfp4v', 'recsgSUqFCJqekzL5'), ('rec4BLdZHS2Blfp4v', 'recvCUOytx5jPw7kh'), ('rec4BLdZHS2Blfp4v', 'recykdvf4LgsyA3wZ'), ('rec4BLdZHS2Blfp4v', 'reczhS8wix6Kzbp9P'), ('recro8T1MPMwRadVH', 'rec2N69DMcrqN9PJC'), ('recro8T1MPMwRadVH', 'recEVTik3MlqbvLFi'), ('recro8T1MPMwRadVH', 'recGxVCwaLW3mDIa3'), ('recro8T1MPMwRadVH', 'recI43CzsZ0Q625ma'), ('recro8T1MPMwRadVH', 'recIuIXdbLe5j5vCA'), ('recro8T1MPMwRadVH', 'recLKj8BbTNqxFbTb'), ('recro8T1MPMwRadVH', 'recLrY8kyOR1PcZeF'), ('recro8T1MPMwRadVH', 'recggMW2eyCYceNcy'), ('recro8T1MPMwRadVH', 'reciRZdAqNIKuMC96'), ('recro8T1MPMwRadVH', 'reckYL4xtQWpkTJ8k'), ('recro8T1MPMwRadVH', 'recmbOVHSyzXQZpQr'), ('recro8T1MPMwRadVH', 'recoVo6dFSzG1ypX7'), ('recro8T1MPMwRadVH', 'recsgSUqFCJqekzL5'), ('recro8T1MPMwRadVH', 'recvCUOytx5jPw7kh'), ('recro8T1MPMwRadVH', 'recykdvf4LgsyA3wZ'), ('recro8T1MPMwRadVH', 'reczhS8wix6Kzbp9P'), ('recD078PnS3x2doBe', 'rec2N69DMcrqN9PJC'), ('recD078PnS3x2doBe', 'rec5XDvJLyxDsGZWc'), ('recD078PnS3x2doBe', 'recEVTik3MlqbvLFi'), ('recD078PnS3x2doBe', 'recGxVCwaLW3mDIa3'), ('recD078PnS3x2doBe', 'recI43CzsZ0Q625ma'), ('recD078PnS3x2doBe', 'recIuIXdbLe5j5vCA'), ('recD078PnS3x2doBe', 'recLKj8BbTNqxFbTb'), ('recD078PnS3x2doBe', 'recLrY8kyOR1PcZeF'), ('recD078PnS3x2doBe', 'recggMW2eyCYceNcy'), ('recD078PnS3x2doBe', 'reciRZdAqNIKuMC96'), ('recD078PnS3x2doBe', 'reckYL4xtQWpkTJ8k'), ('recD078PnS3x2doBe', 'recmbOVHSyzXQZpQr'), ('recD078PnS3x2doBe', 'recoVo6dFSzG1ypX7'), ('recD078PnS3x2doBe', 'recvCUOytx5jPw7kh'), ('recD078PnS3x2doBe', 'recykdvf4LgsyA3wZ'), ('recD078PnS3x2doBe', 'reczhS8wix6Kzbp9P')]
----------------------------
