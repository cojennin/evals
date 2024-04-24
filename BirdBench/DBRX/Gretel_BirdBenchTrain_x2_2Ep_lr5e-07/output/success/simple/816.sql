-- PROBLEM # 816
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

-- External Knowledge: names of superheroes refers to superhero_name; attribute value between 75 to 80 refers to attribute_value BETWEEN 75 AND 80;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Provide the names of superheroes with attribute value between 75 to 80.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.superhero_name FROM superhero s JOIN hero_attribute ha ON s.id = ha.hero_id WHERE ha.attribute_value BETWEEN 75 AND 80;
----------------------------






-- ACTUAL RESULTS
[('3-D Man',), ('A-Bomb',), ('Abin Sur',), ('Agent 13',), ('Air-Walker',), ('Alex Mercer',), ('Alien',), ('Angel Dust',), ('Angel Salvadore',), ('Animal Man',), ('Anti-Spawn',), ('Arachne',), ('Arclight',), ('Ariel',), ('Armor',), ('Arsenal',), ('Atom Girl',), ('Azazel',), ('Banshee',), ('Batgirl III',), ('Battlestar',), ('Beast Boy',), ('Big Daddy',), ('Bionic Woman',), ('Bizarro',), ('Black Flash',), ('Black Lightning',), ('Blackwing',), ('Blackwulf',), ('Blink',), ('Blizzard',), ('Blizzard II',), ('Bloodhawk',), ('Blue Beetle III',), ('Boom-Boom',), ('Box IV',), ('Bullseye',), ('Bushido',), ('Cameron Hicks',), ('Captain Cold',), ('Captain Planet',), ('Chamber',), ('Cheetah',), ('Cheetah II',), ('Chewbacca',), ('Citizen Steel',), ('Claire Bennet',), ('Copycat',), ('Cottonmouth',), ('Cypher',), ('Daphne Powell',), ('Darkhawk',), ('Darkstar',), ('Darth Maul',), ('Deadman',), ('Deadshot',), ('Demogoblin',), ('Destroyer',), ('Diamondback',), ('DL Hawkins',), ('Drax the Destroyer',), ('Elle Bishop',), ('Energy',), ('Etrigan',), ('Evilhawk',), ('Falcon',), ('Feral',), ('Fin Fang Foom',), ('Firebird',), ('Firelord',), ('Firestar',), ('Firestorm',), ('Firestorm II',), ('Franklin Storm',), ('Frigga',), ('Garbage Man',), ('Genesis',), ('Gladiator',), ('Godzilla',), ('Gog',), ('Goku',), ('Gravity',), ('Greedo',), ('Green Lantern II',), ('Green Lantern III',), ('Green Lantern IV',), ('Green Lantern V',), ('Han Solo',), ('Hawk',), ('Hawkeye',), ('Hawkeye II',), ('Hawkwoman II',), ('Hawkwoman III',), ('Heat Wave',), ('Hellstorm',), ('Hiro Nakamura',), ('Hit-Girl',), ('Howard the Duck',), ('Hydro-Man',), ('Impulse',), ('Ink',), ('Jim Powell',), ('Jubilee',), ('Juggernaut',), ('Junkpile',), ('Justice',), ('Katniss Everdeen',), ('Kick-Ass',), ('King Kong',), ('King Shark',), ('Kratos',), ('Kraven II',), ('Kylo Ren',), ('Light Lass',), ('Lightning Lad',), ('Lightning Lord',), ('Lizard',), ('Longshot',), ('Luke Cage',), ('Luna',), ('Magog',), ('Man-Bat',), ('Man-Thing',), ('Maya Herrera',), ('Meltdown',), ('Mera',), ('Micro Lad',), ('Mogo',), ('Moloch',), ('Molten Man',), ('Monica Dawson',), ('Moon Knight',), ('Moonstone',), ('Mr Immortal',), ('Mr Incredible',), ('Ms Marvel II',), ('Namora',), ('Namorita',), ('Naruto Uzumaki',), ('Negasonic Teenage Warhead',), ('Nightcrawler',), ('Northstar',), ('Offspring',), ('Phantom Girl',), ('Plastic Man',), ('Plastique',), ('Purple Man',), ('Pyro',), ('Quill',), ('Raven',), ('Ray',), ('Red Hulk',), ('Robin VI',), ('Rocket Raccoon',), ('Sabretooth',), ('Sandman',), ('Scorpia',), ('Scorpion',), ('Shriek',), ('Silver Surfer',), ('Silverclaw',), ('Siren',), ('Siryn',), ('Skaar',), ('Snowbird',), ('Sobek',), ('Space Ghost',), ('Speedy',), ('Spider-Woman',), ('Spider-Woman III',), ('Starfire',), ('Tempest',), ('Thunderbird',), ('Thundra',), ('Tiger Shark',), ('Toad',), ('Tracy Strauss',), ('Triton',), ('Ultragirl',), ('Utgard-Loki',), ('Valkyrie',), ('Venom II',), ('Vibe',), ('Violet Parr',), ('Vixen',), ('Walrus',), ('Warp',), ('Warpath',), ('Weapon XI',), ('White Queen',), ('Wildfire',), ('Wolfsbane',), ('Yellowjacket II',), ('Ymir',), ('Zoom',), ('Abomination',), ('Alex Mercer',), ('Annihilus',), ('Atlas',), ('Atlas',), ('Beta Ray Bill',), ('Blizzard',), ('Bloodaxe',), ('Bloodwraith',), ('Blue Beetle',), ('Box IV',), ('Captain Britain',), ('Century',), ('Doc Samson',), ('Doctor Doom II',), ('Drax the Destroyer',), ('Ego',), ('Energy',), ('Firestorm II',), ('Franklin Richards',), ('Frigga',), ('Genesis',), ('Green Lantern',), ('Hawkwoman III',), ('Hollow',), ('Jean Grey',), ('Krypto',), ('Lady Bullseye',), ('Magneto',), ('Master Chief',), ('Molten Man',), ('Namorita',), ('Polaris',), ('Power Man',), ('Rhino',), ('Sandman',), ('Sasquatch',), ('She-Thing',), ('Spawn',), ('Spider-Carnage',), ('Starfire',), ('Stargirl',), ('T-850',), ('Thunderstrike',), ('Tiger Shark',), ('Ultragirl',), ('Utgard-Loki',), ('Venom III',), ('War Machine',), ('Warpath',), ('Watcher',), ('Aquaman',), ('Ares',), ('Atom',), ('Big Barda',), ('Black Widow II',), ('Blue Beetle',), ('Bomb Queen',), ('Captain Epic',), ('Captain Planet',), ('Cat',), ('Cy-Gor',), ('Faora',), ('Firelord',), ('Genesis',), ('Goku',), ('Hollow',), ('Isis',), ('King Kong',), ('Lady Bullseye',), ('Mera',), ('Naruto Uzumaki',), ('Nova',), ('Razor-Fist II',), ('Silk',), ('Siren',), ('Valkyrie',), ('Vanisher',), ('Vulcan',), ('Warlock',), ('Wonder Woman',), ('Aquaman',), ('Ares',), ('Atom',), ('Big Barda',), ('Black Widow II',), ('Blue Beetle',), ('Bomb Queen',), ('Captain Epic',), ('Captain Planet',), ('Cat',), ('Cy-Gor',), ('Faora',), ('Firelord',), ('Genesis',), ('Goku',), ('Hollow',), ('Isis',), ('King Kong',), ('Lady Bullseye',), ('Mera',), ('Naruto Uzumaki',), ('Nova',), ('Razor-Fist II',), ('Silk',), ('Siren',), ('Valkyrie',), ('Vanisher',), ('Vulcan',), ('Warlock',), ('Wonder Woman',), ('Aquaman',), ('Ares',), ('Atom',), ('Big Barda',), ('Black Widow II',), ('Blue Beetle',), ('Bomb Queen',), ('Captain Epic',), ('Captain Planet',), ('Cat',), ('Cy-Gor',), ('Faora',), ('Firelord',), ('Genesis',), ('Goku',), ('Hollow',), ('Isis',), ('King Kong',), ('Lady Bullseye',), ('Mera',), ('Naruto Uzumaki',), ('Nova',), ('Razor-Fist II',), ('Silk',), ('Siren',), ('Valkyrie',), ('Vanisher',), ('Vulcan',), ('Warlock',), ('Wonder Woman',), ('Aquaman',), ('Ares',), ('Atom',), ('Big Barda',), ('Black Widow II',), ('Blue Beetle',), ('Bomb Queen',), ('Captain Epic',), ('Captain Planet',), ('Cat',), ('Cy-Gor',), ('Faora',), ('Firelord',), ('Genesis',), ('Goku',), ('Hollow',), ('Isis',), ('King Kong',), ('Lady Bullseye',), ('Mera',), ('Naruto Uzumaki',), ('Nova',), ('Razor-Fist II',), ('Silk',), ('Siren',), ('Valkyrie',), ('Vanisher',), ('Vulcan',), ('Warlock',), ('Wonder Woman',)]
----------------------------
