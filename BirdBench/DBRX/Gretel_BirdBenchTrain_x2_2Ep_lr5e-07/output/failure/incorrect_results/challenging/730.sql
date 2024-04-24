-- PROBLEM # 730
-- Generation # 0
-- Difficulty: challenging
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

-- External Knowledge: the superheroes from Marvel Comics refers to publisher_name = 'Marvel Comics'; super power of "Super Strength" refers to power_name = 'Super Strength'; Calculation = MULTIPLY(DIVIDE(SUM(power_name = 'Super Strength'), COUNT(id)), 100)
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Among the superheroes from Marvel Comics, what is the percentage of those who have the super power of "Super Strength"?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(DISTINCT h.id) / (SELECT COUNT(DISTINCT h.id) FROM superhero h WHERE h.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')) as percentage FROM hero_power hp JOIN superpower sp ON hp.power_id = sp.id JOIN superhero h ON hp.hero_id = h.id WHERE sp.power_name = 'Super Strength' AND h.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Marvel Comics')
----------------------------




-- RESULTS FROM GENERATED SQL
[(51.93798449612403,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(6.760847628657921,)]
----------------------------
