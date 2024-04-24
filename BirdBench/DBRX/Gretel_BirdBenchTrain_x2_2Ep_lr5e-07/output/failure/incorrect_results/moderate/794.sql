-- PROBLEM # 794
-- Generation # 0
-- Difficulty: moderate
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

-- External Knowledge: which hero refers to superhero_name; fastest refers to MAX(attribute_value) WHERE attribute_name = 'Speed';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which hero was the fastest?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.superhero_name, ha.attribute_value FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id JOIN attribute a ON ha.attribute_id = a.id WHERE a.attribute_name = 'Speed' AND ha.attribute_value = (SELECT MAX(attribute_value) FROM hero_attribute WHERE attribute_id = ha.attribute_id)
----------------------------




-- RESULTS FROM PREDICTION
[('Air-Walker', 100), ('Angela', 100), ('Ardina', 100), ('Aurora', 100), ('Ben 10', 100), ('Beyonder', 100), ('Binary', 100), ('Bizarro', 100), ('Black Bolt', 100), ('Black Flash', 100), ('Flash', 100), ('Flash II', 100), ('Flash III', 100), ('Flash IV', 100), ('General Zod', 100), ('Gladiator', 100), ('Hyperion', 100), ('Impulse', 100), ('Jack of Hearts', 100), ('Jesse Quick', 100), ('Kid Flash II', 100), ('Krypto', 100), ('Living Tribunal', 100), ('Man of Miracles', 100), ('Mister Mxyzptlk', 100), ('Monarch', 100), ('One-Above-All', 100), ('Peter Petrelli', 100), ('Power Girl', 100), ('Professor Zoom', 100), ('Quicksilver', 100), ('Sentry', 100), ('Silver Surfer', 100), ('Spectre', 100), ('Stardust', 100), ('Superboy-Prime', 100), ('Supergirl', 100), ('Superman', 100), ('The Presence', 100), ('Zoom', 100)]
----------------------------



-- ACTUAL RESULTS
[('Air-Walker',)]
----------------------------
