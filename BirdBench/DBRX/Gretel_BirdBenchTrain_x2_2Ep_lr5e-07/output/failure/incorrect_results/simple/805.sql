-- PROBLEM # 805
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

-- External Knowledge: missing weight refers to weight_kg = 0 OR weight_kg = NULL;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the full names of superheroes with missing weight.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT full_name FROM superhero WHERE weight_kg IS NULL OR weight_kg = 0;
----------------------------




-- RESULTS FROM PREDICTION
[('Abraxas',), ('-',), ('Alexander J. Mercer',), ('Alex Woolsly',), (None,), ('Ando Masahashi',), ('Liam',), ('-',), (None,), ('Jason Wynn',), ('Arthur Curry, Jr.',), ('Roy William Harper, Jr.',), (None,), (None,), ('Michael Washington Lane',), ('Aztar',), ('-',), ('Helena Rosa Bertinelli',), (None,), (None,), ('-',), ('Benjamin Kirby Tennyson',), ('-',), ('Damon Macready',), ('-',), (None,), ('Jamie Wells Sommers',), ('-',), (None,), (None,), ('Ray Randal',), (None,), ('-',), (None,), (None,), ('-',), ('Lemuel Krug',), ('Sean Dolan',), ('Daniel Garrett',), ('Jaime Reyes',), ('-',), (None,), ('-',), (None,), (None,), ('Madison Jeffries',), ('Sethaniel Brundle',), (None,), ('Ryuko Orsono',), ('-',), ('Leonard Snart',), ('-',), ('Jack Brolin',), (None,), ('-',), ('-',), (None,), ('Shakti Haddad',), ('Dmitri Anatoly Nikolayevich Smerdyakov',), ('Dmitri Anatoly Nikolayevich Smerdyakov',), (None,), ('Claire Bennet',), ('Clea',), ('Cain',), (None,), (None,), ('Rory Destine',), (None,), ('-',), ('Henry Henshaw',), (None,), ('Daphne Powell',), ('Peyton Westlake',), (None,), ('-',), ('-',), ('Daniel Lawrence Hawkins',), ('-',), ('Dormammu',), ('Jonathan Osterman',), ('Ego',), ('-',), ('-',), (None,), (None,), ('-',), ('Faora Hu-Ul',), (None,), ('Paul Norbert Ebersol',), (None,), ('Richard Ethan Morse',), ('Gary Bell',), ('Dru-Zod',), ('Daniel Ketch',), ('Henry Jonathan Pym',), (None,), ('-',), (None,), ('-',), ('-',), ('Jessica Viviana Cruz',), ('Dr. James McDonald Hudson',), ('John Hancock',), ('-',), ('Sharon Parker',), ('-',), ('Hiro Nakamura',), ('Mindy McCready',), ('Monet St. Croix',), ('-',), ('Adrianna Tomaz',), (None,), (None,), ('James Bond',), ('-',), (None,), ('-',), ('Jessica Belle Chambers',), (None,), (None,), ('Jim Powell',), ('JJ Powell',), (None,), ('John Constantine',), ('Joseph Dredd',), ('-',), ('-',), (None,), ('Kathryn M. Janeway',), ('-',), ('Kevin Ethan Levin',), ('Dave Lizewski',), ('Wallace Rudolph West',), ('Bartholomew Allen II',), ('-',), ('-',), (None,), ('-',), ('-',), ('-',), ('-',), ('-',), ('Elizabeth Anne Sherman',), (None,), ('Luna Maximoff',), ('Lyja',), ('David Reid',), ('-',), ('-',), ('Robert Kirkland Langstrom',), ('John-117',), ('Kent Connor',), ('Matthew Parkman',), ('Maya Herrera',), (None,), ('Micah Sanders',), ('-',), (None,), ('Charlotte Gage-Radcliffe',), ('-',), ('Mr. Mxyzptlk',), ('Mogo',), (None,), ('Edgar William Jacobi',), ('Monica Dawson',), (None,), ('-',), ('Nicole Sanders',), ('-',), ('Daniel Dreiberg',), ("Luke O'Brian",), ('-',), ('Amon Tomaz',), (None,), ('Adrian Alexander Veidt',), ('-',), (None,), (None,), ('Peter Petrelli',), ('Christopher Walker',), (None,), ('-',), ('Nels Van Adder',), ('-',), (None,), ('-',), ('-',), ('Chris Genovese',), (None,), (None,), (None,), ('-',), ('Edward Nigma',), ('-',), ('Carrie Kelley',), ('Alexander James Murphy',), ('-',), ('Kurr',), ('Elaine Coll',), ('Sebastian Hiram Shaw',), ('-',), (None,), ('-',), (None,), ('Laurie Juspeczyk',), (None,), (None,), (None,), ('Yurrd the Unknown',), ('-',), (None,), ('Thea Dearden Queen',), ('Benjamin Reilly',), (None,), (None,), ('-',), ('Stephanie Powell',), ('-',), ('-',), ('Alec Holland',), ('Gabriel Gray',), (None,), ('-',), (None,), (None,), ('Tracy Strauss',), ('-',), ('-',), ('-',), ('Gabriel Summers',), ('Uatu',), ('Weapon XI',), ('-',), ('Drake Burroughs',), (None,), ('Ymir',)]
----------------------------



-- ACTUAL RESULTS
[('Abraxas',), ('-',), ('Alexander J. Mercer',), ('Alex Woolsly',), ('Ando Masahashi',), ('Liam',), ('Jason Wynn',), ('Arthur Curry, Jr.',), ('Roy William Harper, Jr.',), ('Michael Washington Lane',), ('Aztar',), ('Helena Rosa Bertinelli',), ('Benjamin Kirby Tennyson',), ('Damon Macready',), ('Jamie Wells Sommers',), ('Ray Randal',), ('Lemuel Krug',), ('Sean Dolan',), ('Daniel Garrett',), ('Jaime Reyes',), ('Madison Jeffries',), ('Sethaniel Brundle',), ('Ryuko Orsono',), ('Leonard Snart',), ('Jack Brolin',), ('Shakti Haddad',), ('Dmitri Anatoly Nikolayevich Smerdyakov',), ('Claire Bennet',), ('Clea',), ('Cain',), ('Rory Destine',), ('Henry Henshaw',), ('Daphne Powell',), ('Peyton Westlake',), ('Daniel Lawrence Hawkins',), ('Dormammu',), ('Jonathan Osterman',), ('Ego',), ('Faora Hu-Ul',), ('Paul Norbert Ebersol',), ('Richard Ethan Morse',), ('Gary Bell',), ('Dru-Zod',), ('Daniel Ketch',), ('Henry Jonathan Pym',), ('Jessica Viviana Cruz',), ('Dr. James McDonald Hudson',), ('John Hancock',), ('Sharon Parker',), ('Hiro Nakamura',), ('Mindy McCready',), ('Monet St. Croix',), ('Adrianna Tomaz',), ('James Bond',), ('Jessica Belle Chambers',), ('Jim Powell',), ('JJ Powell',), ('John Constantine',), ('Joseph Dredd',), ('Kathryn M. Janeway',), ('Kevin Ethan Levin',), ('Dave Lizewski',), ('Wallace Rudolph West',), ('Bartholomew Allen II',), ('Elizabeth Anne Sherman',), ('Luna Maximoff',), ('Lyja',), ('David Reid',), ('Robert Kirkland Langstrom',), ('John-117',), ('Kent Connor',), ('Matthew Parkman',), ('Maya Herrera',), ('Micah Sanders',), ('Charlotte Gage-Radcliffe',), ('Mr. Mxyzptlk',), ('Mogo',), ('Edgar William Jacobi',), ('Monica Dawson',), ('Nicole Sanders',), ('Daniel Dreiberg',), ("Luke O'Brian",), ('Amon Tomaz',), ('Adrian Alexander Veidt',), ('Peter Petrelli',), ('Christopher Walker',), ('Nels Van Adder',), ('Chris Genovese',), ('Edward Nigma',), ('Carrie Kelley',), ('Alexander James Murphy',), ('Kurr',), ('Elaine Coll',), ('Sebastian Hiram Shaw',), ('Laurie Juspeczyk',), ('Yurrd the Unknown',), ('Thea Dearden Queen',), ('Benjamin Reilly',), ('Stephanie Powell',), ('Alec Holland',), ('Gabriel Gray',), ('Tracy Strauss',), ('Gabriel Summers',), ('Uatu',), ('Weapon XI',), ('Drake Burroughs',), ('Ymir',)]
----------------------------
