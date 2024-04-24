-- PROBLEM # 810
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

-- External Knowledge: maximum attribute value refers to MAX(attribute_value);
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the race of the superhero with maximum attribute value?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.superhero_name, s.race_id FROM superhero s JOIN (SELECT hero_id, MAX(attribute_value) as max_value FROM hero_attribute GROUP BY hero_id) ha ON s.id = ha.hero_id WHERE ha.max_value = (SELECT MAX(attribute_value) FROM hero_attribute)
----------------------------




-- RESULTS FROM PREDICTION
[('A-Bomb', 24), ('Abraxas', 12), ('Air-Walker', 1), ('Amazo', 5), ('Angela', 1), ('Ant-Man', 24), ('Apocalypse', 42), ('Ardina', 2), ('Ares', 21), ('Atlas', 21), ('Atlas', 21), ('Aurora', 42), ('Batman', 24), ('Beast', 42), ('Ben 10', 1), ('Beyonder', 21), ('Bi-Beast', 5), ('Big Barda', 44), ('Binary', 1), ('Bizarro', 9), ('Black Adam', 1), ('Black Bolt', 34), ('Black Flash', 21), ('Brainiac', 5), ('Brainiac 5', 1), ('Cheetah III', 24), ('Cy-Gor', 1), ('Darkseid', 44), ('Data', 5), ('Doctor Doom', 24), ('Doctor Octopus', 24), ('Doctor Strange', 24), ('Doomsday', 2), ('Dr Manhattan', 27), ('Flash', 24), ('Flash II', 24), ('Flash III', 24), ('Flash IV', 24), ('General Zod', 37), ('Gladiator', 51), ('Godzilla', None), ('Goku', 49), ('Granny Goodness', 1), ('Hela', 7), ('Hercules', 16), ('Hulk', 28), ('Hyperion', 18), ('Impulse', 24), ('Iron Man', 24), ('Jack of Hearts', 24), ('Jean Grey', 42), ('Jesse Quick', 24), ('Joker', 24), ('Juggernaut', 24), ('Kang', 1), ('Kid Flash II', 1), ('King Kong', 6), ('Krypto', 37), ('Leader', 1), ('Lex Luthor', 24), ('Living Tribunal', 12), ('Lobo', 14), ('Lucifer Morningstar', 21), ('Magus', 1), ('Man of Miracles', 21), ('Mandarin', 24), ('Martian Manhunter', 40), ('Mister Fantastic', 28), ('Mister Mxyzptlk', 21), ('Mister Sinister', 25), ('Mister Zsasz', 24), ('MODOK', 13), ('Molecule Man', 28), ('Monarch', 1), ('Nova', 24), ('Odin', 21), ('One Punch Man', 24), ('One-Above-All', 12), ('Onslaught', 42), ('Ozymandias', 24), ('Peter Petrelli', 1), ('Phantom Stranger', 24), ('Phoenix', 42), ('Power Girl', 37), ('Professor X', 42), ('Professor Zoom', 24), ('Q', 21), ('Quicksilver', 42), ("Ra's Al Ghul", 24), ('Red Hulk', 28), ('Riddler', 1), ('Rip Hunter', 24), ('Scarlet Witch', 42), ('Sentry', 24), ('Shazam', 24), ('She-Hulk', 24), ('Silver Surfer', 2), ('Spectre', 21), ('Spider-Man', 24), ('Stardust', 1), ('Steppenwolf', 44), ('Superboy-Prime', 37), ('Supergirl', 37), ('Superman', 37), ('Surtur', 21), ('Thanos', 18), ('Thanos (Infinity Gauntlet)', 18), ('The Presence', 21), ('Thor', 7), ('Tinkerer', 1), ('Trigon', 21), ('Vegeta', 49), ('Watcher', 1), ('Wonder Man', 1), ('Wonder Woman', 4), ('Ymir', 20), ('Zoom', 1)]
----------------------------



-- ACTUAL RESULTS
[('Cosmic Entity',)]
----------------------------
