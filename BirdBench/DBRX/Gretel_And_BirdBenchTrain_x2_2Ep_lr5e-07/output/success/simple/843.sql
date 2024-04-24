-- PROBLEM # 843
-- Generation # 0
-- Difficulty: simple
----------------------------

-- PROMPT
CREATE TABLE alignment
(
    id        INTEGER not null
            primary key,
    alignment TEXT default NULL
)

CREATE TABLE attribute
(
    id             INTEGER not null
            primary key,
    attribute_name TEXT default NULL
)

CREATE TABLE colour
(
    id     INTEGER not null
            primary key,
    colour TEXT default NULL
)

CREATE TABLE gender
(
    id     INTEGER not null
            primary key,
    gender TEXT default NULL
)

CREATE TABLE publisher
(
    id             INTEGER not null
            primary key,
    publisher_name TEXT default NULL
)

CREATE TABLE race
(
    id   INTEGER not null
            primary key,
    race TEXT default NULL
)

CREATE TABLE superhero
(
    id             INTEGER not null
            primary key,
    superhero_name TEXT default NULL,
    full_name      TEXT default NULL,
    gender_id      INTEGER          default NULL,
    eye_colour_id  INTEGER          default NULL,
    hair_colour_id INTEGER          default NULL,
    skin_colour_id INTEGER          default NULL,
    race_id        INTEGER          default NULL,
    publisher_id   INTEGER          default NULL,
    alignment_id   INTEGER          default NULL,
    height_cm      INTEGER          default NULL,
    weight_kg      INTEGER          default NULL,
    foreign key (alignment_id) references alignment(id),
    foreign key (eye_colour_id) references colour(id),
    foreign key (gender_id) references gender(id),
    foreign key (hair_colour_id) references colour(id),
    foreign key (publisher_id) references publisher(id),
    foreign key (race_id) references race(id),
    foreign key (skin_colour_id) references colour(id)
)

CREATE TABLE hero_attribute
(
    hero_id         INTEGER default NULL,
    attribute_id    INTEGER default NULL,
    attribute_value INTEGER default NULL,
    foreign key (attribute_id) references attribute(id),
    foreign key (hero_id) references superhero(id)
)

CREATE TABLE superpower
(
    id         INTEGER not null
            primary key,
    power_name TEXT default NULL
)

CREATE TABLE hero_power
(
    hero_id  INTEGER default NULL,
    power_id INTEGER default NULL,
    foreign key (hero_id) references superhero(id),
    foreign key (power_id) references superpower(id)
)

-- External Knowledge: hero ID refers to superhero.id; have intelligence as their power refers to power_name = 'Intelligence';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the hero ID of superheroes have intellegence as their power.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT hero_id FROM hero_power WHERE power_id IN (SELECT id FROM superpower WHERE power_name = 'Intelligence')
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(3,), (5,), (6,), (9,), (15,), (21,), (31,), (32,), (33,), (39,), (50,), (51,), (52,), (53,), (58,), (67,), (73,), (74,), (77,), (79,), (96,), (100,), (102,), (112,), (128,), (130,), (135,), (139,), (140,), (146,), (149,), (160,), (161,), (162,), (163,), (179,), (198,), (202,), (207,), (209,), (210,), (214,), (216,), (221,), (231,), (239,), (244,), (251,), (259,), (274,), (275,), (279,), (281,), (283,), (284,), (290,), (298,), (303,), (304,), (312,), (318,), (319,), (333,), (337,), (348,), (351,), (352,), (354,), (357,), (358,), (360,), (362,), (364,), (366,), (369,), (377,), (380,), (382,), (392,), (393,), (412,), (414,), (415,), (419,), (423,), (424,), (427,), (428,), (433,), (438,), (441,), (445,), (446,), (447,), (463,), (471,), (472,), (473,), (474,), (475,), (478,), (495,), (496,), (497,), (506,), (513,), (516,), (518,), (519,), (520,), (521,), (523,), (529,), (540,), (541,), (543,), (544,), (551,), (554,), (557,), (565,), (568,), (577,), (578,), (580,), (589,), (595,), (604,), (607,), (608,), (612,), (635,), (637,), (642,), (650,), (653,), (657,), (660,), (661,), (665,), (666,), (667,), (669,), (670,), (673,), (676,), (679,), (694,), (711,), (721,), (722,), (733,), (734,), (743,), (745,), (754,)]
----------------------------
