-- PROBLEM # 796
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

-- External Knowledge: 3-D Man is the superhero_name. attributes refers to attribute_name; values refers to attribute_value;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- State all of 3-D Man's attributes along with their values.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 3-D Man's attributes along with their values.
SELECT a.attribute_name, ha.attribute_value
FROM superhero s
JOIN hero_attribute ha ON s.id = ha.hero_id
JOIN attribute a ON ha.attribute_id = a.id
WHERE s.superhero_name = '3-D Man';
----------------------------


-- EXCEPTION
near "'s attributes along with their values.
SELECT a.attribute_name, ha.attribute_value
FROM superhero s
JOIN hero_attribute ha ON s.id = ha.hero_id
JOIN attribute a ON ha.attribute_id = a.id
WHERE s.superhero_name = '": syntax error
----------------------------



-- RESULTS FROM PREDICTION
[]
----------------------------


