-- PROBLEM # 839
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

-- External Knowledge: weight less than 100 refers to weight_kg < 100
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- In superheroes with weight less than 100, list the full name of the superheroes with brown eyes.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT full_name FROM superhero WHERE eye_colour_id = (SELECT id FROM colour WHERE colour = 'Brown') AND weight_kg < 100;
----------------------------






-- ACTUAL RESULTS
[('Charles Chandler',), ('Bob',), (None,), ('Angel Salvadore Bohusk',), ('Raymond Palmer',), ('Ryan Choi',), ('Michael Washington Lane',), ('Roberto Velasquez',), ('Dane Whitman',), ('Jefferson Pierce',), ("T'Challa",), ('Eric Brooks',), ('Donald Gill',), ('Jaime Reyes',), ('-',), ('Madison Jeffries',), ('Jericho Drumm',), ('Karen Beecher-Duncan',), ('Leonard Snart',), (None,), ('Jonothon Evan Starsmore',), ('Kevin Sidney',), ('Barbara Ann Minerva',), (None,), ('Tyrone Johnson',), ('Christopher Summers',), ('Burchell Clemens',), ('Scott Summers',), ('Christopher Powell',), ('Laynia Petrovna',), (None,), ('Floyd Lawton',), ('Willis Stryker',), ('Helen Parr',), ('Bonita Juarez',), ('Jason Rusch',), ('-',), (None,), ('-',), ('Dr. James McDonald Hudson',), (None,), ('Han Solo',), ('John Hancock',), ('Howard (Last name unrevealed)',), (None,), ('Robert Louis Drake',), (None,), ('John Wraith',), ('-',), ('Alyosha Kravinoff',), ('Yuriko Oyama',), ('Abner Jenkins',), ('Robert Kirkland Langstrom',), ('John Jameson',), ('John-117',), ('-',), ('Micah Sanders',), ('Reed Richards',), ('Moses Magnum',), ('Quentin Beck',), ('Nicholas Joseph Fury',), ('Richard Rider',), (None,), ('Amon Tomaz',), ('Daisy Louise Johnson',), ('Maxwell Jordan',), (None,), ('Rocket Raccoon',), ('Shang-Chi',), ('Gaveedra Seven',), ('Herman Schultz',), ('-',), ('Maria de Guadalupe Santiago',), ('Martha Franklin',), ('-',), (None,), ('Virgil Ovid Hawkins',), ('Roberto DaCosta',), ('Everett Thomas',), ('-',), ('Angel Salvadore Bohusk',), (None,), ('Phineas Mason',), ('Angelo Fortunato',), ('Francisco Paco Ramon',), ('Adrian Toomes',), ('James Rupert Rhodes',), ('Emil LaSalle',), ('-',), (None,), ('Yoda',)]
----------------------------
