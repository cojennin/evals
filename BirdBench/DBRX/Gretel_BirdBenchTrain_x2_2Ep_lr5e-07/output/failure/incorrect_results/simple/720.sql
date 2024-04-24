-- PROBLEM # 720
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

-- External Knowledge: 15 super powers refers to COUNT(full_name) > 15
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the full names of all the superheroes with over 15 super powers.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT full_name FROM superhero WHERE id IN (SELECT hero_id FROM hero_power GROUP BY hero_id HAVING COUNT(*) > 15)
----------------------------




-- RESULTS FROM PREDICTION
[('Abraham Sapien',), ('Alexander J. Mercer',), ('-',), ('Liam',), ('Liam',), (None,), ('En Sabah Nur',), ('Orin',), ('-',), ('Bruce Wayne',), ('-',), ('Bizarro',), ('-',), ('Michael Jon Carter',), ('Nathan Christopher Charles Summers Dayspring',), ('Nathaniel Christopher Adam',), (None,), (None,), ('-',), (None,), ('Barbara Ann Minerva',), ('Henry Henshaw',), ('Uxas',), ('Anakin Skywalker',), ('-',), (None,), ('Kent Nelson',), ('Stephen Vincent Strange',), ('Doomsday',), ('Jonathan Osterman',), ('-',), ('-',), ('Faora Hu-Ul',), ('Jason Rusch',), ('Franklin Benjamin Richards',), (None,), ('Dru-Zod',), (None,), ('-',), ('Kakarot',), ('-',), ('-',), ('Robert Bruce Banner',), (None,), ('-',), ('Robert Louis Drake',), ("Daniel Thomas Rand-K'ai",), ('Anthony Edward Stark',), ('Jac-jack Parr',), ('-',), ('-',), (None,), ('-',), ('Luke Skywalker',), ('-',), ("J'onn J'onzz",), ('-',), ("M'gann M'orzz",), ('Mr. Mxyzptlk',), ('Dr. Nathaniel Essex',), (None,), ('-',), ('Richard Rider',), ('-',), ('-',), ('Onslaught',), ('Jean Grey-Summers',), ('Kara Zor-L',), ('Yautja',), ('Raymond C. Terrill',), ('Victor Creed',), ('-',), ('Robert Reynolds',), ('-',), ('Norrin Radd',), ('Al Simmons',), ('-',), ('Gwendolyne Stacy',), ('Peter Benjamin Parker',), ('Kal-El',), ('Kara Zor-El',), ('Clark Joseph Kent (Kal-El)',), ('Cyberdyne Systems Series 1000 Terminator',), ('Cyberdyne Systems Series 800 Terminator Model 101',), ('Cyberdyne Systems Series 850 Terminator',), ('Cyberdyne Systems Series X Terminator',), ('Thanos',), ('Thor Odinson',), ('Todd Arliss',), ('Mortimer Toynbee',), (None,), (None,), ('-',), ('-',), (None,), ('Mari Jiwe McCabe',), ('James Rupert Rhodes',), ('Uatu',), ('James Howlett',), ('Diana of Themyscira',), ('Laura Kinney',), ('Yoda',)]
----------------------------



-- ACTUAL RESULTS
[(None,), ('-',), ('Abraham Sapien',), ('Al Simmons',), ('Alexander J. Mercer',), ('Anakin Skywalker',), ('Anthony Edward Stark',), ('Barbara Ann Minerva',), ('Bartholomew Allen II',), ('Bizarro',), ('Bruce Wayne',), ('Clark Joseph Kent (Kal-El)',), ('Cyberdyne Systems Series 1000 Terminator',), ('Cyberdyne Systems Series 800 Terminator Model 101',), ('Cyberdyne Systems Series 850 Terminator',), ('Cyberdyne Systems Series X Terminator',), ("Daniel Thomas Rand-K'ai",), ('Diana of Themyscira',), ('Doomsday',), ('Dr. Nathaniel Essex',), ('Dru-Zod',), ('Edward Charles Allan Brock',), ('En Sabah Nur',), ('Erik Stephan Josten',), ('Faora Hu-Ul',), ('Franklin Benjamin Richards',), ('Gwendolyne Stacy',), ('Henry Henshaw',), ("J'onn J'onzz",), ('Jac-jack Parr',), ('James Howlett',), ('James Rupert Rhodes',), ('Jason Rusch',), ('Jean Grey-Summers',), ('Jonathan Osterman',), ('Kakarot',), ('Kal-El',), ('Kara Zor-El',), ('Kara Zor-L',), ('Kent Nelson',), ('Laura Kinney',), ('Liam',), ('Luke Skywalker',), ("M'gann M'orzz",), ('MacDonald Gargan',), ('Mari Jiwe McCabe',), ('Michael Jon Carter',), ('Mortimer Toynbee',), ('Mr. Mxyzptlk',), ('Nathan Christopher Charles Summers Dayspring',), ('Nathaniel Christopher Adam',), ('Norrin Radd',), ('Onslaught',), ('Orin',), ('Peter Benjamin Parker',), ('Raymond C. Terrill',), ('Richard John Grayson',), ('Richard Rider',), ('Robert Bruce Banner',), ('Robert Louis Drake',), ('Robert Reynolds',), ('Stephen Vincent Strange',), ('Thanos',), ('Thor Odinson',), ('Todd Arliss',), ('Uatu',), ('Uxas',), ('Victor Creed',), ('Wallace Rudolph West',), ('Yautja',), ('Yoda',)]
----------------------------
