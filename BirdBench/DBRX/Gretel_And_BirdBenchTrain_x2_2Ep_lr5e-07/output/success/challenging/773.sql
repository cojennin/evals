-- PROBLEM # 773
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

-- External Knowledge: which superhero refers to superhero_name; the same eyes, hair and skin colour refers to hair_colour_id = skin_colour_id AND hair_colour_id = eye_colour_id; publisher refers to publisher_name;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which superhero has the same eyes, hair and skin colour? Indicate the publisher of the superhero.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.superhero_name, p.publisher_name FROM superhero s INNER JOIN publisher p ON s.publisher_id = p.id WHERE s.eye_colour_id = s.hair_colour_id AND s.hair_colour_id = s.skin_colour_id;
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Agent Zero', 'Marvel Comics'), ('Alex Mercer', 'Wildstorm'), ('Alex Woolsly', 'NBC - Heroes'), ('Allan Quatermain', 'Wildstorm'), ('Ando Masahashi', 'NBC - Heroes'), ('Angel', 'Dark Horse Comics'), ('Angela', 'Image Comics'), ('Anti-Spawn', 'Image Comics'), ('Arsenal', 'DC Comics'), ('Aztar', 'DC Comics'), ('Bananaman', ''), ('Bane', 'DC Comics'), ('Batgirl III', 'DC Comics'), ('Batgirl V', 'DC Comics'), ('Beast', 'Marvel Comics'), ('Beast Boy', 'DC Comics'), ('Beetle', 'Marvel Comics'), ('Ben 10', 'DC Comics'), ('Beta Ray Bill', 'Marvel Comics'), ('Beyonder', 'Marvel Comics'), ('Big Daddy', 'Icon Comics'), ('Bill Harken', 'SyFy'), ('Billy Kincaid', 'Image Comics'), ('Bird-Brain', 'Marvel Comics'), ('Bird-Man', 'Marvel Comics'), ('Bird-Man II', 'Marvel Comics'), ('Birdman', 'Hanna-Barbera'), ('Black Flash', 'DC Comics'), ('Black Goliath', 'Marvel Comics'), ('Bling!', 'Marvel Comics'), ('Bolt', 'Marvel Comics'), ('Bomb Queen', 'Image Comics'), ('Boomer', 'Marvel Comics'), ('Box', 'Marvel Comics'), ('Brundlefly', ''), ('Bumbleboy', 'Marvel Comics'), ('Bushido', 'DC Comics'), ('Cameron Hicks', 'SyFy'), ('Captain Midnight', 'Dark Horse Comics'), ('Captain Universe', 'Marvel Comics'), ('Cat II', 'Marvel Comics'), ('Cerebra', 'Marvel Comics'), ('Chameleon', 'DC Comics'), ('Chameleon', 'Marvel Comics'), ('Chuck Norris', ''), ('Cogliostro', 'Image Comics'), ('Colossal Boy', 'DC Comics'), ('Curse', 'Image Comics'), ('Cy-Gor', 'Image Comics'), ('Daphne Powell', 'ABC Studios'), ('Darkman', 'Universal Studios'), ('Darkside', ''), ('Destroyer', 'Marvel Comics'), ('DL Hawkins', 'NBC - Heroes'), ('Ego', 'Marvel Comics'), ('Energy', 'HarperCollins'), ('ERG-1', 'DC Comics'), ('Faora', 'DC Comics'), ('Flash Gordon', ''), ('Flash III', 'DC Comics'), ('Garbage Man', 'DC Comics'), ('Gary Bell', 'SyFy'), ('Ghost Rider II', 'Marvel Comics'), ('Giant-Man', 'Marvel Comics'), ('Giant-Man II', 'Marvel Comics'), ('Godzilla', ''), ('Gog', 'DC Comics'), ('Goku', 'Shueisha'), ('Goliath', 'Marvel Comics'), ('Green Goblin III', 'Marvel Comics'), ('Hawkwoman II', 'DC Comics'), ('Hiro Nakamura', 'NBC - Heroes'), ('Hit-Girl', 'Icon Comics'), ('Hulk', 'Marvel Comics'), ('Indiana Jones', 'George Lucas'), ('Isis', 'DC Comics'), ('Jack Bauer', ''), ('Jason Bourne', ''), ('Jean-Luc Picard', 'Star Trek'), ('Jesse Quick', 'DC Comics'), ('Jessica Sanders', 'NBC - Heroes'), ('Jim Powell', 'ABC Studios'), ('JJ Powell', 'ABC Studios'), ('Johann Krauss', 'Dark Horse Comics'), ('Judge Dredd', 'Rebellion'), ('Junkpile', 'Marvel Comics'), ('Kathryn Janeway', 'Star Trek'), ('Katniss Everdeen', ''), ('Kid Flash II', 'DC Comics'), ('Kratos', 'Wildstorm'), ('Kylo Ren', 'George Lucas'), ('Leech', 'Marvel Comics'), ('Liz Sherman', 'Dark Horse Comics'), ('Luke Campbell', 'NBC - Heroes'), ('Luna', 'Marvel Comics'), ('Matt Parkman', 'NBC - Heroes'), ('Maya Herrera', 'NBC - Heroes'), ('Meteorite', 'Marvel Comics'), ('Minna Murray', 'Wildstorm'), ('Mister Freeze', 'DC Comics'), ('Mister Mxyzptlk', 'DC Comics'), ('Mogo', 'DC Comics'), ('Mohinder Suresh', 'NBC - Heroes'), ('Moloch', 'DC Comics'), ('Monica Dawson', 'NBC - Heroes'), ('Nina Theroux', 'SyFy'), ('Nite Owl II', 'DC Comics'), ('Offspring', 'DC Comics'), ('One Punch Man', 'Shueisha'), ('One-Above-All', 'Marvel Comics'), ('Overtkill', 'Image Comics'), ('Parademon', 'DC Comics'), ('Paul Blart', 'Sony Pictures'), ('Penance', 'Marvel Comics'), ('Penance I', 'Marvel Comics'), ('Peter Petrelli', 'NBC - Heroes'), ('Phantom', 'DC Comics'), ('Plastic Lad', 'DC Comics'), ('Power Man', 'Marvel Comics'), ('Predator', 'Dark Horse Comics'), ('Purple Man', 'Marvel Comics'), ('Q', 'Star Trek'), ('Quantum', 'HarperCollins'), ('Rachel Pirzad', 'SyFy'), ('Red Mist', 'Icon Comics'), ('Redeemer II', 'Image Comics'), ('Redeemer III', 'Image Comics'), ('Renata Soliz', 'HarperCollins'), ('Riddler', 'DC Comics'), ('Robocop', ''), ('Sauron', 'J. R. R. Tolkien'), ('Savage Dragon', 'Image Comics'), ('Sebastian Shaw', 'Marvel Comics'), ('Shrinking Violet', 'DC Comics'), ('Silk Spectre', 'DC Comics'), ('Silk Spectre II', 'DC Comics'), ('Snake-Eyes', 'Marvel Comics'), ('Space Ghost', 'DC Comics'), ('Speedball', 'Marvel Comics'), ('Spider-Carnage', 'Marvel Comics'), ('Spider-Woman II', 'Marvel Comics'), ('Stacy X', 'Marvel Comics'), ('Stardust', 'Marvel Comics'), ('Stormtrooper', 'George Lucas'), ('Sylar', 'NBC - Heroes'), ('The Cape', ''), ('The Presence', 'DC Comics'), ('Thunderbird II', 'Marvel Comics'), ('Titan', 'HarperCollins'), ('Tracy Strauss', 'NBC - Heroes'), ('Two-Face', 'DC Comics'), ('Venompool', 'Marvel Comics'), ('Violator', 'Image Comics'), ('Watcher', 'Marvel Comics'), ('Weapon XI', 'Marvel Comics'), ('Wildfire', 'DC Comics'), ('Wondra', 'Marvel Comics')]
----------------------------
