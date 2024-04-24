-- PROBLEM # 771
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

-- External Knowledge: name of superheroes refers to superhero_name; flight power refers to power_name = 'Flight';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the name of superheroes with flight power.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.superhero_name FROM superhero s JOIN hero_power hp ON s.id = hp.hero_id JOIN superpower sp ON hp.power_id = sp.id WHERE sp.power_name = 'Flight'
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Abraxas',), ('Adam Strange',), ('Air-Walker',), ('Alan Scott',), ('Amazo',), ('Angel',), ('Angel',), ('Angel Salvadore',), ('Annihilus',), ('Anti-Monitor',), ('Apocalypse',), ('Archangel',), ('Ardina',), ('Astro Boy',), ('Atom II',), ('Aurora',), ('Aztar',), ('Bananaman',), ('Banshee',), ('Beak',), ('Beast Boy',), ('Beyonder',), ('Big Barda',), ('Binary',), ('Bird-Brain',), ('Bird-Man',), ('Bird-Man II',), ('Birdman',), ('Bizarro',), ('Black Adam',), ('Black Bolt',), ('Black Flash',), ('Black Lightning',), ('Blackwing',), ('Bloodhawk',), ('Blue Beetle',), ('Blue Beetle III',), ('Boba Fett',), ('Booster Gold',), ('Brainiac',), ('Bumblebee',), ('Bumbleboy',), ('Cable',), ('Cannonball',), ('Captain Atom',), ('Captain Britain',), ('Captain Hindsight',), ('Captain Marvel',), ('Captain Marvel',), ('Captain Midnight',), ('Captain Planet',), ('Captain Universe',), ('Crimson Crusader',), ('Crimson Dynamo',), ('Cyborg',), ('Cyborg Superman',), ('Darkhawk',), ('Darkseid',), ('Darkstar',), ('Deadman',), ('Doctor Doom',), ('Doctor Doom II',), ('Doctor Fate',), ('Doctor Strange',), ('Donna Troy',), ('Dr Manhattan',), ('Enchantress',), ('Energy',), ('Evilhawk',), ('Exodus',), ('Falcon',), ('Fallen One II',), ('Faora',), ('Fighting Spirit',), ('Fin Fang Foom',), ('Firebird',), ('Firelord',), ('Firestar',), ('Firestorm',), ('Flash',), ('Flash II',), ('Flash III',), ('Franklin Richards',), ('Galactus',), ('General Zod',), ('Gladiator',), ('Goku',), ('Gravity',), ('Guy Gardner',), ('Hal Jordan',), ('Hancock',), ('Havok',), ('Hawk',), ('Hawkgirl',), ('Hellstorm',), ('Human Torch',), ('Hybrid',), ('Hyperion',), ('Impulse',), ('Indigo',), ('Ink',), ('Iron Man',), ('Iron Monger',), ('Isis',), ('Jack of Hearts',), ('Jack-Jack',), ('Jessica Cruz',), ('Jessica Jones',), ('John Stewart',), ('Justice',), ('Karate Kid',), ('Kevin 11',), ('Krypto',), ('Kyle Rayner',), ('Legion',), ('Lex Luthor',), ('Light Lass',), ('Living Brain',), ('Living Tribunal',), ('Loki',), ('Mach-IV',), ('Machine Man',), ('Magneto',), ('Magus',), ('Man-Bat',), ('Mantis',), ('Martian Manhunter',), ('Marvel Girl',), ('Match',), ('Maxima',), ('Metron',), ('Mimic',), ('Miss Martian',), ('Mister Mxyzptlk',), ('Mister Sinister',), ('MODOK',), ('Monarch',), ('Moonstone',), ('Namor',), ('Namora',), ('Namorita',), ('Nathan Petrelli',), ('Nova',), ('One-Above-All',), ('Onslaught',), ('Osiris',), ('Parademon',), ('Polaris',), ('Power Girl',), ('Raven',), ('Ray',), ('Red Tornado',), ('Redeemer III',), ('Scarlet Witch',), ('Sentry',), ('Shadow Lass',), ('Shriek',), ('Silver Surfer',), ('Silverclaw',), ('Simon Baz',), ('Sinestro',), ('Siryn',), ('Snowbird',), ('Songbird',), ('Space Ghost',), ('Spawn',), ('Spectre',), ('Spider-Woman',), ('Spider-Woman III',), ('Spider-Woman IV',), ('Stardust',), ('Starfire',), ('Static',), ('Steel',), ('Storm',), ('Sunspot',), ('Superboy',), ('Superboy-Prime',), ('Supergirl',), ('Superman',), ('Swamp Thing',), ('Swarm',), ('Tempest',), ('Thanos',), ('Thor',), ('Thunderbird III',), ('Titan',), ('Trickster',), ('Trigon',), ('Triplicate Girl',), ('Ultragirl',), ('Ultron',), ('Vegeta',), ('Vindicator',), ('Vision',), ('Vixen',), ('Vulture',), ('War Machine',), ('Warlock',), ('Warp',), ('Wasp',), ('Watcher',), ('Wildfire',), ('Wonder Girl',), ('Wonder Man',), ('Wonder Woman',), ('X-Man',), ('Yellowjacket II',)]
----------------------------
