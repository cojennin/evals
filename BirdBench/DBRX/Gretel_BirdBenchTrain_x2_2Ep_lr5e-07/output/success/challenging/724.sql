-- PROBLEM # 724
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

-- External Knowledge: blue eyes refers to colour = 'Blue' and eye_colour_id = colour.id; blond hair refers to colour = 'Blond' and hair_colour_id = colour.id; super power of "Agility" refers to power_name = 'Agility'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the superhero names of all the superheroes that have blue eyes and blond hair.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.superhero_name FROM superhero s WHERE s.eye_colour_id = (SELECT id FROM colour WHERE colour = 'Blue') AND s.hair_colour_id = (SELECT id FROM colour WHERE colour = 'Blond')
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Adam Monroe',), ('Adam Strange',), ('Agent 13',), ('Alan Scott',), ('Angel',), ('Animal Man',), ('Ant-Man',), ('Ant-Man II',), ('Anti-Venom',), ('Aquababy',), ('Aquaman',), ('Arachne',), ('Archangel',), ('Batgirl VI',), ('Binary',), ('Black Canary',), ('Black Canary II',), ('Black Widow II',), ('Boom-Boom',), ('Booster Gold',), ('Box III',), ('Bullseye',), ('Cannonball',), ('Captain America',), ('Captain Britain',), ('Captain Mar-vell',), ('Captain Marvel',), ('Cat',), ('Claire Bennet',), ('Cypher',), ('Dagger',), ('Dash',), ('Dazzler',), ('Doctor Fate',), ('Elle Bishop',), ('Emma Frost',), ('Enchantress',), ('Flash II',), ('Franklin Richards',), ('Genesis',), ('Green Lantern',), ('Harley Quinn',), ('Havok',), ('Hawkeye',), ('Human Torch',), ('Husk',), ('Invisible Woman',), ('Iron Fist',), ('James Bond',), ('James Bond (Craig)',), ('Jennifer Kale',), ('John Constantine',), ('Kick-Ass',), ('Killer Frost',), ('Longshot',), ('Luke Skywalker',), ('Magog',), ('Meltdown',), ('Mister Zsasz',), ('Mockingbird',), ('Moonstone',), ('Mr Immortal',), ('Mr Incredible',), ('Namora',), ('Namorita',), ('Niki Sanders',), ('Ozymandias',), ('Penance II',), ('Power Girl',), ('Pyro',), ('Question',), ('Rip Hunter',), ('Ronin',), ('Saturn Girl',), ('Scarlet Spider',), ('Sentry',), ('Spider-Gwen',), ('Star-Lord',), ('Stargirl',), ('Supergirl',), ('Thor',), ('Thor Girl',), ('Thunderstrike',), ('Trickster',), ('Ultragirl',), ('Valkyrie',), ('Warbird',), ('White Queen',), ('Wonder Girl',), ('Yellowjacket',)]
----------------------------
