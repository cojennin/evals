-- PROBLEM # 772
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

-- External Knowledge: eyes refers to eye_colour_id; hair refers to hair_colour_id; skin colour refers to skin_colour_id; female superheroes refers to gender = 'Female'; published by Dark Horse Comics refers to publisher_name = 'Dark Horse Comics';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the eyes, hair and skin colour of all female superheroes published by Dark Horse Comics.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.superhero_name, c.colour as eye_colour, c2.colour as hair_colour, c3.colour as skin_colour FROM superhero s INNER JOIN gender g ON s.gender_id = g.id INNER JOIN colour c ON s.eye_colour_id = c.id INNER JOIN colour c2 ON s.hair_colour_id = c2.id INNER JOIN colour c3 ON s.skin_colour_id = c3.id WHERE g.gender = 'Female' AND s.publisher_id = (SELECT id FROM publisher WHERE publisher_name = 'Dark Horse Comics');
----------------------------




-- RESULTS FROM GENERATED SQL
[('Buffy', 'Green', 'Blond', 'No Colour'), ('Elastigirl', 'Brown', 'Brown', 'No Colour'), ('Liz Sherman', 'No Colour', 'No Colour', 'No Colour'), ('T-X', 'No Colour', 'No Colour', 'Silver'), ('Violet Parr', 'Violet', 'Black', 'No Colour')]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(14, 6, 1), (9, 9, 1), (1, 1, 1), (1, 1, 28), (30, 4, 1)]
----------------------------
