-- PROBLEM # 524
-- Generation # 0
-- Difficulty: simple
----------------------------

-- PROMPT
CREATE TABLE sqlite_sequence(name,seq)

CREATE TABLE "cards"
(
    id                      INTEGER           not null
        primary key autoincrement,
    artist                  TEXT,
    asciiName               TEXT,
    availability            TEXT,
    borderColor             TEXT,
    cardKingdomFoilId       TEXT,
    cardKingdomId           TEXT,
    colorIdentity           TEXT,
    colorIndicator          TEXT,
    colors                  TEXT,
    convertedManaCost       REAL,
    duelDeck                TEXT,
    edhrecRank              INTEGER,
    faceConvertedManaCost   REAL,
    faceName                TEXT,
    flavorName              TEXT,
    flavorText              TEXT,
    frameEffects            TEXT,
    frameVersion            TEXT,
    hand                    TEXT,
    hasAlternativeDeckLimit INTEGER default 0 not null,
    hasContentWarning       INTEGER default 0 not null,
    hasFoil                 INTEGER default 0 not null,
    hasNonFoil              INTEGER default 0 not null,
    isAlternative           INTEGER default 0 not null,
    isFullArt               INTEGER default 0 not null,
    isOnlineOnly            INTEGER default 0 not null,
    isOversized             INTEGER default 0 not null,
    isPromo                 INTEGER default 0 not null,
    isReprint               INTEGER default 0 not null,
    isReserved              INTEGER default 0 not null,
    isStarter               INTEGER default 0 not null,
    isStorySpotlight        INTEGER default 0 not null,
    isTextless              INTEGER default 0 not null,
    isTimeshifted           INTEGER default 0 not null,
    keywords                TEXT,
    layout                  TEXT,
    leadershipSkills        TEXT,
    life                    TEXT,
    loyalty                 TEXT,
    manaCost                TEXT,
    mcmId                   TEXT,
    mcmMetaId               TEXT,
    mtgArenaId              TEXT,
    mtgjsonV4Id             TEXT,
    mtgoFoilId              TEXT,
    mtgoId                  TEXT,
    multiverseId            TEXT,
    name                    TEXT,
    number                  TEXT,
    originalReleaseDate     TEXT,
    originalText            TEXT,
    originalType            TEXT,
    otherFaceIds            TEXT,
    power                   TEXT,
    printings               TEXT,
    promoTypes              TEXT,
    purchaseUrls            TEXT,
    rarity                  TEXT,
    scryfallId              TEXT,
    scryfallIllustrationId  TEXT,
    scryfallOracleId        TEXT,
    setCode                 TEXT,
    side                    TEXT,
    subtypes                TEXT,
    supertypes              TEXT,
    tcgplayerProductId      TEXT,
    text                    TEXT,
    toughness               TEXT,
    type                    TEXT,
    types                   TEXT,
    uuid                    TEXT              not null
        unique,
    variations              TEXT,
    watermark               TEXT
)

CREATE TABLE "foreign_data"
(
    id           INTEGER not null
        primary key autoincrement,
    flavorText   TEXT,
    language     TEXT,
    multiverseid INTEGER,
    name         TEXT,
    text         TEXT,
    type         TEXT,
    uuid         TEXT
        references cards (uuid)
)

CREATE TABLE "legalities"
(
    id     INTEGER not null
        primary key autoincrement,
    format TEXT,
    status TEXT,
    uuid   TEXT
        references cards (uuid)
            on update cascade on delete cascade
)

CREATE TABLE "sets"
(
    id               INTEGER           not null
        primary key autoincrement,
    baseSetSize      INTEGER,
    block            TEXT,
    booster          TEXT,
    code             TEXT              not null
        unique,
    isFoilOnly       INTEGER default 0 not null,
    isForeignOnly    INTEGER default 0 not null,
    isNonFoilOnly    INTEGER default 0 not null,
    isOnlineOnly     INTEGER default 0 not null,
    isPartialPreview INTEGER default 0 not null,
    keyruneCode      TEXT,
    mcmId            INTEGER,
    mcmIdExtras      INTEGER,
    mcmName          TEXT,
    mtgoCode         TEXT,
    name             TEXT,
    parentCode       TEXT,
    releaseDate      DATE,
    tcgplayerGroupId INTEGER,
    totalSetSize     INTEGER,
    type             TEXT
)

CREATE TABLE "set_translations"
(
    id          INTEGER not null
        primary key autoincrement,
    language    TEXT,
    setCode     TEXT
        references sets (code)
            on update cascade on delete cascade,
    translation TEXT
)

CREATE TABLE "rulings"
(
    id   INTEGER not null
        primary key autoincrement,
    date DATE,
    text TEXT,
    uuid TEXT
        references cards (uuid)
            on update cascade on delete cascade
)

-- External Knowledge: black borders refers to BorderColor = 'black'; available only in arena refers to availability = 'arena'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the artists who illustrated cards with black borders which are available only in arena.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT DISTINCT artist FROM cards WHERE bordercolor = 'black' AND availability = 'arena'
----------------------------






-- ACTUAL RESULTS
[('Matt Stewart',), ('Willian Murai',), ('Colin Boyer',), ('Aleksi Briclot',), ('Eric Deschamps',), ('Lake Hurwitz',), ('Dmitry Burmak',), ('John Avon',), ('John Thacker',), ('David Palumbo',), ('Volkan Baǵa',), ('Eric Velhagen',), ('G-host Lee',), ('Adam Paquette',), ('Greg Opalinski',), ('Magali Villeneuve',), ('Min Yum',), ('Victor Adame Minguez',), ('Kev Walker',), ('James Ryman',), ('Shreya Shetty',), ('Kieran Yanner',), ('Lucas Graciano',), ('Zack Stella',), ('Sara Winters',), ('Gabor Szikszai',), ("Kasia 'Kafis' Zielińska",), ('Anthony Palumbo',), ('Steve Argyle',), ('Izzy',), ('Daarken',), ('Jason Rainville',), ('Raymond Swanland',), ('Nils Hamm',), ('Sidharth Chaturvedi',), ('Chase Stone',), ('Richard Wright',), ('Ryan Alexander Lee',), ('Wesley Burt',), ('Jarel Threat',), ('Zezhou Chen',), ('Aaron Miller',), ('Josu Hernaiz',), ('Raoul Vitale',), ('Daniel Ljunggren',), ('Jason Felix',), ('Deruchenko Alexander',), ('Randy Gallegos',), ('Titus Lunter',), ('James Paick',), ('Tommy Arnold',), ('Jakub Kasper',), ('John Stanko',), ('Even Amundsen',), ('Tyler Jacobson',), ('Lius Lasahido',), ('Christine Choi',), ('John Severin Brassell',), ('Josh Hass',), ('Jung Park',), ('Yeong-Hao Han',), ('Chris Rallis',), ('Darek Zabrocki',), ('Lars Grant-West',), ('Tony Foti',), ('Craig J Spearing',), ('Alayna Danner',), ('Viktor Titov',), ('Adrian Majkrzak',), ('Jeremy Wilson',), ('Ryan Yee',), ('Mathias Kollros',), ('Seb McKinnon',), ('Manuel Castañón',), ('Mark Behm',), ('Grzegorz Rutkowski',), ('Christopher Burdett',), ('Tomasz Jedruszek',), ('Randy Vargas',), ('E. M. Gist',), ('Jason A. Engle',), ('Mike Burns',), ('Clint Cearley',), ('Christopher Moeller',), ('Johann Bodin',), ('Svetlin Velinov',), ('Jonas De Ro',), ('Yigit Koroglu',), ('Dan Scott',), ('Anna Steinbauer',), ('Chris Rahn',), ('Igor Kieryluk',), ('Sam Burley',), ('Simon Dominic',), ('Jesper Ejsing',), ('Jason Kang',), ('Allen Williams',), ('Bram Sels',), ('Winona Nelson',), ('Bastien L. Deharme',), ('Ben Wootten',), ('Steven Belledin',), ('Mark Zug',), ('Jonathan Kuo',), ('David Gaillet',), ('Slawomir Maniak',), ('Filip Burburan',), ('Zoltan Boros',), ('Scott Murphy',), ('Anastasia Ovchinnikova',), ('Howard Lyon',), ('YW Tang',), ('Yongjae Choi',), ('Ryan Pancoast',), ('John Di Giovanni',), ('Florian de Gesincourt',), ('Cliff Childs',), ('Joseph Meehan',), ('Paul Scott Canavan',), ('Mark Poole',), ('Sung Choi',), ('Eric Peterson',), ('Rebecca Guay',), ('Ben Thompson',), ('Mike Ploog',), ('Scott Bailey',), ('Colin MacNeil',), ('Ron Spears',), ('Rob Alexander',), ('Bob Eggleton',), ('Edward P. Beard, Jr.',), ('Heather Hudson',), ('Christopher Rush',), ('Pete Venters',), ('Johannes Voss',), ('Denman Rooke',), ('J.P. Targete',), ('David Rapoza',), ('Kim Sokol',), ('Antonio José Manzanedo',), ('Donato Giancola',), ('Lie Setiawan',), ('Tingting Yeh',), ('Wayne Reynolds',), ('Chris Seaman',), ('Anna Pavleeva',), ('Caio Monteiro',), ('Ralph Horsley',), ('Evan Shipard',), ('Vance Kovacs',), ('Carl Critchlow',), ('Dave Kendall',), ('Jack Wang',), ('Alex Konstad',), ('Suzanne Helmigh',), ('Heonhwa Choe',), ('Greg Staples',), ('Matt Cavotta',), ('Karl Kopinski',), ('Steve Prescott',), ('Nestor Ossandon Leal',), ('Milivoj Ćeran',), ('Rudy Siswanto',), ('Vincent Proce',), ('Uriah Voth',), ('Daren Bader',), ('Omar Rayyan',), ('Adi Granov',), ('Jeff Miracola',), ('D. Alexander Gregory',), ('Scott M. Fischer',), ('Ray Lago',), ('Franz Vohwinkel',), ('Adam Rex',), ('Terese Nielsen',), ('Cyril Van Der Haegen',), ('Jana Schirmer & Johannes Voss',), ('Massimilano Frezzato',), ('Jim Nelson',), ('Michael Komarck',), ('Anthony Francisco',), ('Todd Lockwood',), ('Brom',), ('Tony Szczudlo',), ('Peter Mohrbacher',), ('Anthony S. Waters',), ('Martina Pilcerova',), ('Dany Orizio',), ('Austin Hsu',), ('Luca Zontini',), ('David Martin',), ('Mike Bierek',), ('Jeff Simpson',), ('Efflam Mercier',), ('John Silva',), ('Lindsey Look',), ('Brad Rigney',), ('Jaime Jones',), ('Sean Murray',), ('Valera Lutfullina',), ('Toraji',), ('Eytan Zana',), ('Livia Prima',), ('Robbie Trevino',), ('Lawrence Snelly',), ('Dave Dorman',), ('Noah Bradley',), ('Tom Wänerstrand',), ('Douglas Shuler',), ('Tony Roberts',), ('Véronique Meignaud',), ('Jenn Ravenna Tran',)]
----------------------------
