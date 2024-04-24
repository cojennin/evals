-- PROBLEM # 388
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

-- External Knowledge: set 10E refers to setCode = '10E'; converted mana of 5 refers to convertedManaCost = 5;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What are the cards in set 10E with converted mana of 5 have translation and what are the languages?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.name, s.translation FROM cards c JOIN set_translations s ON c.setCode = s.setCode WHERE c.convertedManaCost = 5 AND c.setCode = '10E';
----------------------------




-- RESULTS FROM PREDICTION
[('Angel of Mercy', 'Colección Básica - Décima Edición'), ('Angel of Mercy', 'Coleção Básica Décima Edição'), ('Angel of Mercy', 'Dixième édition'), ('Angel of Mercy', 'Hauptset Zehnte Edition'), ('Angel of Mercy', 'Set Base Decima Edizione'), ('Angel of Mercy', 'Базовый выпуск Десятое Издание'), ('Angel of Mercy', '核心系列第十版'), ('Angel of Mercy', '核心系列第十版'), ('Angel of Mercy', '第10版基本セット'), ('Angel of Mercy', '코어세트 10판'), ('Air Elemental', 'Colección Básica - Décima Edición'), ('Air Elemental', 'Coleção Básica Décima Edição'), ('Air Elemental', 'Dixième édition'), ('Air Elemental', 'Hauptset Zehnte Edition'), ('Air Elemental', 'Set Base Decima Edizione'), ('Air Elemental', 'Базовый выпуск Десятое Издание'), ('Air Elemental', '核心系列第十版'), ('Air Elemental', '核心系列第十版'), ('Air Elemental', '第10版基本セット'), ('Air Elemental', '코어세트 10판'), ('Aven Windreader', 'Colección Básica - Décima Edición'), ('Aven Windreader', 'Coleção Básica Décima Edição'), ('Aven Windreader', 'Dixième édition'), ('Aven Windreader', 'Hauptset Zehnte Edition'), ('Aven Windreader', 'Set Base Decima Edizione'), ('Aven Windreader', 'Базовый выпуск Десятое Издание'), ('Aven Windreader', '核心系列第十版'), ('Aven Windreader', '核心系列第十版'), ('Aven Windreader', '第10版基本セット'), ('Aven Windreader', '코어세트 10판'), ('Evacuation', 'Colección Básica - Décima Edición'), ('Evacuation', 'Coleção Básica Décima Edição'), ('Evacuation', 'Dixième édition'), ('Evacuation', 'Hauptset Zehnte Edition'), ('Evacuation', 'Set Base Decima Edizione'), ('Evacuation', 'Базовый выпуск Десятое Издание'), ('Evacuation', '核心系列第十版'), ('Evacuation', '核心系列第十版'), ('Evacuation', '第10版基本セット'), ('Evacuation', '코어세트 10판'), ('Beacon of Unrest', 'Colección Básica - Décima Edición'), ('Beacon of Unrest', 'Coleção Básica Décima Edição'), ('Beacon of Unrest', 'Dixième édition'), ('Beacon of Unrest', 'Hauptset Zehnte Edition'), ('Beacon of Unrest', 'Set Base Decima Edizione'), ('Beacon of Unrest', 'Базовый выпуск Десятое Издание'), ('Beacon of Unrest', '核心系列第十版'), ('Beacon of Unrest', '核心系列第十版'), ('Beacon of Unrest', '第10版基本セット'), ('Beacon of Unrest', '코어세트 10판'), ('Scalpelexis', 'Colección Básica - Décima Edición'), ('Scalpelexis', 'Coleção Básica Décima Edição'), ('Scalpelexis', 'Dixième édition'), ('Scalpelexis', 'Hauptset Zehnte Edition'), ('Scalpelexis', 'Set Base Decima Edizione'), ('Scalpelexis', 'Базовый выпуск Десятое Издание'), ('Scalpelexis', '核心系列第十版'), ('Scalpelexis', '核心系列第十版'), ('Scalpelexis', '第10版基本セット'), ('Scalpelexis', '코어세트 10판'), ('Scalpelexis', 'Colección Básica - Décima Edición'), ('Scalpelexis', 'Coleção Básica Décima Edição'), ('Scalpelexis', 'Dixième édition'), ('Scalpelexis', 'Hauptset Zehnte Edition'), ('Scalpelexis', 'Set Base Decima Edizione'), ('Scalpelexis', 'Базовый выпуск Десятое Издание'), ('Scalpelexis', '核心系列第十版'), ('Scalpelexis', '核心系列第十版'), ('Scalpelexis', '第10版基本セット'), ('Scalpelexis', '코어세트 10판'), ('Serra Angel', 'Colección Básica - Décima Edición'), ('Serra Angel', 'Coleção Básica Décima Edição'), ('Serra Angel', 'Dixième édition'), ('Serra Angel', 'Hauptset Zehnte Edition'), ('Serra Angel', 'Set Base Decima Edizione'), ('Serra Angel', 'Базовый выпуск Десятое Издание'), ('Serra Angel', '核心系列第十版'), ('Serra Angel', '核心系列第十版'), ('Serra Angel', '第10版基本セット'), ('Serra Angel', '코어세트 10판'), ('Essence Drain', 'Colección Básica - Décima Edición'), ('Essence Drain', 'Coleção Básica Décima Edição'), ('Essence Drain', 'Dixième édition'), ('Essence Drain', 'Hauptset Zehnte Edition'), ('Essence Drain', 'Set Base Decima Edizione'), ('Essence Drain', 'Базовый выпуск Десятое Издание'), ('Essence Drain', '核心系列第十版'), ('Essence Drain', '核心系列第十版'), ('Essence Drain', '第10版基本セット'), ('Essence Drain', '코어세트 10판'), ('Persuasion', 'Colección Básica - Décima Edición'), ('Persuasion', 'Coleção Básica Décima Edição'), ('Persuasion', 'Dixième édition'), ('Persuasion', 'Hauptset Zehnte Edition'), ('Persuasion', 'Set Base Decima Edizione'), ('Persuasion', 'Базовый выпуск Десятое Издание'), ('Persuasion', '核心系列第十版'), ('Persuasion', '核心系列第十版'), ('Persuasion', '第10版基本セット'), ('Persuasion', '코어세트 10판'), ('Sengir Vampire', 'Colección Básica - Décima Edición'), ('Sengir Vampire', 'Coleção Básica Décima Edição'), ('Sengir Vampire', 'Dixième édition'), ('Sengir Vampire', 'Hauptset Zehnte Edition'), ('Sengir Vampire', 'Set Base Decima Edizione'), ('Sengir Vampire', 'Базовый выпуск Десятое Издание'), ('Sengir Vampire', '核心系列第十版'), ('Sengir Vampire', '核心系列第十版'), ('Sengir Vampire', '第10版基本セット'), ('Sengir Vampire', '코어세트 10판'), ('Sengir Vampire', 'Colección Básica - Décima Edición'), ('Sengir Vampire', 'Coleção Básica Décima Edição'), ('Sengir Vampire', 'Dixième édition'), ('Sengir Vampire', 'Hauptset Zehnte Edition'), ('Sengir Vampire', 'Set Base Decima Edizione'), ('Sengir Vampire', 'Базовый выпуск Десятое Издание'), ('Sengir Vampire', '核心系列第十版'), ('Sengir Vampire', '核心系列第十版'), ('Sengir Vampire', '第10版基本セット'), ('Sengir Vampire', '코어세트 10판'), ('Beacon of Destruction', 'Colección Básica - Décima Edición'), ('Beacon of Destruction', 'Coleção Básica Décima Edição'), ('Beacon of Destruction', 'Dixième édition'), ('Beacon of Destruction', 'Hauptset Zehnte Edition'), ('Beacon of Destruction', 'Set Base Decima Edizione'), ('Beacon of Destruction', 'Базовый выпуск Десятое Издание'), ('Beacon of Destruction', '核心系列第十版'), ('Beacon of Destruction', '核心系列第十版'), ('Beacon of Destruction', '第10版基本セット'), ('Beacon of Destruction', '코어세트 10판'), ('Head Games', 'Colección Básica - Décima Edición'), ('Head Games', 'Coleção Básica Décima Edição'), ('Head Games', 'Dixième édition'), ('Head Games', 'Hauptset Zehnte Edition'), ('Head Games', 'Set Base Decima Edizione'), ('Head Games', 'Базовый выпуск Десятое Издание'), ('Head Games', '核心系列第十版'), ('Head Games', '核心系列第十版'), ('Head Games', '第10版基本セット'), ('Head Games', '코어세트 10판'), ('Loxodon Mystic', 'Colección Básica - Décima Edición'), ('Loxodon Mystic', 'Coleção Básica Décima Edição'), ('Loxodon Mystic', 'Dixième édition'), ('Loxodon Mystic', 'Hauptset Zehnte Edition'), ('Loxodon Mystic', 'Set Base Decima Edizione'), ('Loxodon Mystic', 'Базовый выпуск Десятое Издание'), ('Loxodon Mystic', '核心系列第十版'), ('Loxodon Mystic', '核心系列第十版'), ('Loxodon Mystic', '第10版基本セット'), ('Loxodon Mystic', '코어세트 10판'), ('Kjeldoran Royal Guard', 'Colección Básica - Décima Edición'), ('Kjeldoran Royal Guard', 'Coleção Básica Décima Edição'), ('Kjeldoran Royal Guard', 'Dixième édition'), ('Kjeldoran Royal Guard', 'Hauptset Zehnte Edition'), ('Kjeldoran Royal Guard', 'Set Base Decima Edizione'), ('Kjeldoran Royal Guard', 'Базовый выпуск Десятое Издание'), ('Kjeldoran Royal Guard', '核心系列第十版'), ('Kjeldoran Royal Guard', '核心系列第十版'), ('Kjeldoran Royal Guard', '第10版基本セット'), ('Kjeldoran Royal Guard', '코어세트 10판'), ('Lava Axe', 'Colección Básica - Décima Edición'), ('Lava Axe', 'Coleção Básica Décima Edição'), ('Lava Axe', 'Dixième édition'), ('Lava Axe', 'Hauptset Zehnte Edition'), ('Lava Axe', 'Set Base Decima Edizione'), ('Lava Axe', 'Базовый выпуск Десятое Издание'), ('Lava Axe', '核心系列第十版'), ('Lava Axe', '核心系列第十版'), ('Lava Axe', '第10版基本セット'), ('Lava Axe', '코어세트 10판'), ('Mass of Ghouls', 'Colección Básica - Décima Edición'), ('Mass of Ghouls', 'Coleção Básica Décima Edição'), ('Mass of Ghouls', 'Dixième édition'), ('Mass of Ghouls', 'Hauptset Zehnte Edition'), ('Mass of Ghouls', 'Set Base Decima Edizione'), ('Mass of Ghouls', 'Базовый выпуск Десятое Издание'), ('Mass of Ghouls', '核心系列第十版'), ('Mass of Ghouls', '核心系列第十版'), ('Mass of Ghouls', '第10版基本セット'), ('Mass of Ghouls', '코어세트 10판'), ('Angel of Mercy', 'Colección Básica - Décima Edición'), ('Angel of Mercy', 'Coleção Básica Décima Edição'), ('Angel of Mercy', 'Dixième édition'), ('Angel of Mercy', 'Hauptset Zehnte Edition'), ('Angel of Mercy', 'Set Base Decima Edizione'), ('Angel of Mercy', 'Базовый выпуск Десятое Издание'), ('Angel of Mercy', '核心系列第十版'), ('Angel of Mercy', '核心系列第十版'), ('Angel of Mercy', '第10版基本セット'), ('Angel of Mercy', '코어세트 10판'), ('Angelic Chorus', 'Colección Básica - Décima Edición'), ('Angelic Chorus', 'Coleção Básica Décima Edição'), ('Angelic Chorus', 'Dixième édition'), ('Angelic Chorus', 'Hauptset Zehnte Edition'), ('Angelic Chorus', 'Set Base Decima Edizione'), ('Angelic Chorus', 'Базовый выпуск Десятое Издание'), ('Angelic Chorus', '核心系列第十版'), ('Angelic Chorus', '核心系列第十版'), ('Angelic Chorus', '第10版基本セット'), ('Angelic Chorus', '코어세트 10판'), ('Cone of Flame', 'Colección Básica - Décima Edición'), ('Cone of Flame', 'Coleção Básica Décima Edição'), ('Cone of Flame', 'Dixième édition'), ('Cone of Flame', 'Hauptset Zehnte Edition'), ('Cone of Flame', 'Set Base Decima Edizione'), ('Cone of Flame', 'Базовый выпуск Десятое Издание'), ('Cone of Flame', '核心系列第十版'), ('Cone of Flame', '核心系列第十版'), ('Cone of Flame', '第10版基本セット'), ('Cone of Flame', '코어세트 10판'), ('Earth Elemental', 'Colección Básica - Décima Edición'), ('Earth Elemental', 'Coleção Básica Décima Edição'), ('Earth Elemental', 'Dixième édition'), ('Earth Elemental', 'Hauptset Zehnte Edition'), ('Earth Elemental', 'Set Base Decima Edizione'), ('Earth Elemental', 'Базовый выпуск Десятое Издание'), ('Earth Elemental', '核心系列第十版'), ('Earth Elemental', '核心系列第十版'), ('Earth Elemental', '第10版基本セット'), ('Earth Elemental', '코어세트 10판'), ('Rock Badger', 'Colección Básica - Décima Edición'), ('Rock Badger', 'Coleção Básica Décima Edição'), ('Rock Badger', 'Dixième édition'), ('Rock Badger', 'Hauptset Zehnte Edition'), ('Rock Badger', 'Set Base Decima Edizione'), ('Rock Badger', 'Базовый выпуск Десятое Издание'), ('Rock Badger', '核心系列第十版'), ('Rock Badger', '核心系列第十版'), ('Rock Badger', '第10版基本セット'), ('Rock Badger', '코어세트 10판'), ('Rock Badger', 'Colección Básica - Décima Edición'), ('Rock Badger', 'Coleção Básica Décima Edição'), ('Rock Badger', 'Dixième édition'), ('Rock Badger', 'Hauptset Zehnte Edition'), ('Rock Badger', 'Set Base Decima Edizione'), ('Rock Badger', 'Базовый выпуск Десятое Издание'), ('Rock Badger', '核心系列第十版'), ('Rock Badger', '核心系列第十版'), ('Rock Badger', '第10版基本セット'), ('Rock Badger', '코어세트 10판'), ('Scoria Wurm', 'Colección Básica - Décima Edición'), ('Scoria Wurm', 'Coleção Básica Décima Edição'), ('Scoria Wurm', 'Dixième édition'), ('Scoria Wurm', 'Hauptset Zehnte Edition'), ('Scoria Wurm', 'Set Base Decima Edizione'), ('Scoria Wurm', 'Базовый выпуск Десятое Издание'), ('Scoria Wurm', '核心系列第十版'), ('Scoria Wurm', '核心系列第十版'), ('Scoria Wurm', '第10版基本セット'), ('Scoria Wurm', '코어세트 10판'), ('Siege-Gang Commander', 'Colección Básica - Décima Edición'), ('Siege-Gang Commander', 'Coleção Básica Décima Edição'), ('Siege-Gang Commander', 'Dixième édition'), ('Siege-Gang Commander', 'Hauptset Zehnte Edition'), ('Siege-Gang Commander', 'Set Base Decima Edizione'), ('Siege-Gang Commander', 'Базовый выпуск Десятое Издание'), ('Siege-Gang Commander', '核心系列第十版'), ('Siege-Gang Commander', '核心系列第十版'), ('Siege-Gang Commander', '第10版基本セット'), ('Siege-Gang Commander', '코어세트 10판'), ('Elven Riders', 'Colección Básica - Décima Edición'), ('Elven Riders', 'Coleção Básica Décima Edição'), ('Elven Riders', 'Dixième édition'), ('Elven Riders', 'Hauptset Zehnte Edition'), ('Elven Riders', 'Set Base Decima Edizione'), ('Elven Riders', 'Базовый выпуск Десятое Издание'), ('Elven Riders', '核心系列第十版'), ('Elven Riders', '核心系列第十版'), ('Elven Riders', '第10版基本セット'), ('Elven Riders', '코어세트 10판'), ('Kavu Climber', 'Colección Básica - Décima Edición'), ('Kavu Climber', 'Coleção Básica Décima Edição'), ('Kavu Climber', 'Dixième édition'), ('Kavu Climber', 'Hauptset Zehnte Edition'), ('Kavu Climber', 'Set Base Decima Edizione'), ('Kavu Climber', 'Базовый выпуск Десятое Издание'), ('Kavu Climber', '核心系列第十版'), ('Kavu Climber', '核心系列第十版'), ('Kavu Climber', '第10版基本セット'), ('Kavu Climber', '코어세트 10판'), ('Natural Spring', 'Colección Básica - Décima Edición'), ('Natural Spring', 'Coleção Básica Décima Edição'), ('Natural Spring', 'Dixième édition'), ('Natural Spring', 'Hauptset Zehnte Edition'), ('Natural Spring', 'Set Base Decima Edizione'), ('Natural Spring', 'Базовый выпуск Десятое Издание'), ('Natural Spring', '核心系列第十版'), ('Natural Spring', '核心系列第十版'), ('Natural Spring', '第10版基本セット'), ('Natural Spring', '코어세트 10판'), ('Overrun', 'Colección Básica - Décima Edición'), ('Overrun', 'Coleção Básica Décima Edição'), ('Overrun', 'Dixième édition'), ('Overrun', 'Hauptset Zehnte Edition'), ('Overrun', 'Set Base Decima Edizione'), ('Overrun', 'Базовый выпуск Десятое Издание'), ('Overrun', '核心系列第十版'), ('Overrun', '核心系列第十版'), ('Overrun', '第10版基本セット'), ('Overrun', '코어세트 10판'), ('Overrun', 'Colección Básica - Décima Edición'), ('Overrun', 'Coleção Básica Décima Edição'), ('Overrun', 'Dixième édition'), ('Overrun', 'Hauptset Zehnte Edition'), ('Overrun', 'Set Base Decima Edizione'), ('Overrun', 'Базовый выпуск Десятое Издание'), ('Overrun', '核心系列第十版'), ('Overrun', '核心系列第十版'), ('Overrun', '第10版基本セット'), ('Overrun', '코어세트 10판'), ('Seedborn Muse', 'Colección Básica - Décima Edición'), ('Seedborn Muse', 'Coleção Básica Décima Edição'), ('Seedborn Muse', 'Dixième édition'), ('Seedborn Muse', 'Hauptset Zehnte Edition'), ('Seedborn Muse', 'Set Base Decima Edizione'), ('Seedborn Muse', 'Базовый выпуск Десятое Издание'), ('Seedborn Muse', '核心系列第十版'), ('Seedborn Muse', '核心系列第十版'), ('Seedborn Muse', '第10版基本セット'), ('Seedborn Muse', '코어세트 10판'), ('Citanul Flute', 'Colección Básica - Décima Edición'), ('Citanul Flute', 'Coleção Básica Décima Edição'), ('Citanul Flute', 'Dixième édition'), ('Citanul Flute', 'Hauptset Zehnte Edition'), ('Citanul Flute', 'Set Base Decima Edizione'), ('Citanul Flute', 'Базовый выпуск Десятое Издание'), ('Citanul Flute', '核心系列第十版'), ('Citanul Flute', '核心系列第十版'), ('Citanul Flute', '第10版基本セット'), ('Citanul Flute', '코어세트 10판'), ('Coat of Arms', 'Colección Básica - Décima Edición'), ('Coat of Arms', 'Coleção Básica Décima Edição'), ('Coat of Arms', 'Dixième édition'), ('Coat of Arms', 'Hauptset Zehnte Edition'), ('Coat of Arms', 'Set Base Decima Edizione'), ('Coat of Arms', 'Базовый выпуск Десятое Издание'), ('Coat of Arms', '核心系列第十版'), ('Coat of Arms', '核心系列第十版'), ('Coat of Arms', '第10版基本セット'), ('Coat of Arms', '코어세트 10판'), ('Coat of Arms', 'Colección Básica - Décima Edición'), ('Coat of Arms', 'Coleção Básica Décima Edição'), ('Coat of Arms', 'Dixième édition'), ('Coat of Arms', 'Hauptset Zehnte Edition'), ('Coat of Arms', 'Set Base Decima Edizione'), ('Coat of Arms', 'Базовый выпуск Десятое Издание'), ('Coat of Arms', '核心系列第十版'), ('Coat of Arms', '核心系列第十版'), ('Coat of Arms', '第10版基本セット'), ('Coat of Arms', '코어세트 10판'), ('Mantis Engine', 'Colección Básica - Décima Edición'), ('Mantis Engine', 'Coleção Básica Décima Edição'), ('Mantis Engine', 'Dixième édition'), ('Mantis Engine', 'Hauptset Zehnte Edition'), ('Mantis Engine', 'Set Base Decima Edizione'), ('Mantis Engine', 'Базовый выпуск Десятое Издание'), ('Mantis Engine', '核心系列第十版'), ('Mantis Engine', '核心系列第十版'), ('Mantis Engine', '第10版基本セット'), ('Mantis Engine', '코어세트 10판'), ('Mantis Engine', 'Colección Básica - Décima Edición'), ('Mantis Engine', 'Coleção Básica Décima Edição'), ('Mantis Engine', 'Dixième édition'), ('Mantis Engine', 'Hauptset Zehnte Edition'), ('Mantis Engine', 'Set Base Decima Edizione'), ('Mantis Engine', 'Базовый выпуск Десятое Издание'), ('Mantis Engine', '核心系列第十版'), ('Mantis Engine', '核心系列第十版'), ('Mantis Engine', '第10版基本セット'), ('Mantis Engine', '코어세트 10판'), ('Razormane Masticore', 'Colección Básica - Décima Edición'), ('Razormane Masticore', 'Coleção Básica Décima Edição'), ('Razormane Masticore', 'Dixième édition'), ('Razormane Masticore', 'Hauptset Zehnte Edition'), ('Razormane Masticore', 'Set Base Decima Edizione'), ('Razormane Masticore', 'Базовый выпуск Десятое Издание'), ('Razormane Masticore', '核心系列第十版'), ('Razormane Masticore', '核心系列第十版'), ('Razormane Masticore', '第10版基本セット'), ('Razormane Masticore', '코어세트 10판'), ('Razormane Masticore', 'Colección Básica - Décima Edición'), ('Razormane Masticore', 'Coleção Básica Décima Edição'), ('Razormane Masticore', 'Dixième édition'), ('Razormane Masticore', 'Hauptset Zehnte Edition'), ('Razormane Masticore', 'Set Base Decima Edizione'), ('Razormane Masticore', 'Базовый выпуск Десятое Издание'), ('Razormane Masticore', '核心系列第十版'), ('Razormane Masticore', '核心系列第十版'), ('Razormane Masticore', '第10版基本セット'), ('Razormane Masticore', '코어세트 10판'), ('Serra Angel', 'Colección Básica - Décima Edición'), ('Serra Angel', 'Coleção Básica Décima Edição'), ('Serra Angel', 'Dixième édition'), ('Serra Angel', 'Hauptset Zehnte Edition'), ('Serra Angel', 'Set Base Decima Edizione'), ('Serra Angel', 'Базовый выпуск Десятое Издание'), ('Serra Angel', '核心系列第十版'), ('Serra Angel', '核心系列第十版'), ('Serra Angel', '第10版基本セット'), ('Serra Angel', '코어세트 10판'), ('Sunken Hope', 'Colección Básica - Décima Edición'), ('Sunken Hope', 'Coleção Básica Décima Edição'), ('Sunken Hope', 'Dixième édition'), ('Sunken Hope', 'Hauptset Zehnte Edition'), ('Sunken Hope', 'Set Base Decima Edizione'), ('Sunken Hope', 'Базовый выпуск Десятое Издание'), ('Sunken Hope', '核心系列第十版'), ('Sunken Hope', '核心系列第十版'), ('Sunken Hope', '第10版基本セット'), ('Sunken Hope', '코어세트 10판'), ('Tidings', 'Colección Básica - Décima Edición'), ('Tidings', 'Coleção Básica Décima Edição'), ('Tidings', 'Dixième édition'), ('Tidings', 'Hauptset Zehnte Edition'), ('Tidings', 'Set Base Decima Edizione'), ('Tidings', 'Базовый выпуск Десятое Издание'), ('Tidings', '核心系列第十版'), ('Tidings', '核心系列第十版'), ('Tidings', '第10版基本セット'), ('Tidings', '코어세트 10판'), ('Traumatize', 'Colección Básica - Décima Edición'), ('Traumatize', 'Coleção Básica Décima Edição'), ('Traumatize', 'Dixième édition'), ('Traumatize', 'Hauptset Zehnte Edition'), ('Traumatize', 'Set Base Decima Edizione'), ('Traumatize', 'Базовый выпуск Десятое Издание'), ('Traumatize', '核心系列第十版'), ('Traumatize', '核心系列第十版'), ('Traumatize', '第10版基本セット'), ('Traumatize', '코어세트 10판'), ('Soul Feast', 'Colección Básica - Décima Edición'), ('Soul Feast', 'Coleção Básica Décima Edição'), ('Soul Feast', 'Dixième édition'), ('Soul Feast', 'Hauptset Zehnte Edition'), ('Soul Feast', 'Set Base Decima Edizione'), ('Soul Feast', 'Базовый выпуск Десятое Издание'), ('Soul Feast', '核心系列第十版'), ('Soul Feast', '核心系列第十版'), ('Soul Feast', '第10版基本セット'), ('Soul Feast', '코어세트 10판'), ('Thundering Giant', 'Colección Básica - Décima Edición'), ('Thundering Giant', 'Coleção Básica Décima Edição'), ('Thundering Giant', 'Dixième édition'), ('Thundering Giant', 'Hauptset Zehnte Edition'), ('Thundering Giant', 'Set Base Decima Edizione'), ('Thundering Giant', 'Базовый выпуск Десятое Издание'), ('Thundering Giant', '核心系列第十版'), ('Thundering Giant', '核心系列第十版'), ('Thundering Giant', '第10版基本セット'), ('Thundering Giant', '코어세트 10판'), ('Thundering Giant', 'Colección Básica - Décima Edición'), ('Thundering Giant', 'Coleção Básica Décima Edição'), ('Thundering Giant', 'Dixième édition'), ('Thundering Giant', 'Hauptset Zehnte Edition'), ('Thundering Giant', 'Set Base Decima Edizione'), ('Thundering Giant', 'Базовый выпуск Десятое Издание'), ('Thundering Giant', '核心系列第十版'), ('Thundering Giant', '核心系列第十版'), ('Thundering Giant', '第10版基本セット'), ('Thundering Giant', '코어세트 10판'), ('Spined Wurm', 'Colección Básica - Décima Edición'), ('Spined Wurm', 'Coleção Básica Décima Edição'), ('Spined Wurm', 'Dixième édition'), ('Spined Wurm', 'Hauptset Zehnte Edition'), ('Spined Wurm', 'Set Base Decima Edizione'), ('Spined Wurm', 'Базовый выпуск Десятое Издание'), ('Spined Wurm', '核心系列第十版'), ('Spined Wurm', '核心系列第十版'), ('Spined Wurm', '第10版基本セット'), ('Spined Wurm', '코어세트 10판'), ('Sylvan Basilisk', 'Colección Básica - Décima Edición'), ('Sylvan Basilisk', 'Coleção Básica Décima Edição'), ('Sylvan Basilisk', 'Dixième édition'), ('Sylvan Basilisk', 'Hauptset Zehnte Edition'), ('Sylvan Basilisk', 'Set Base Decima Edizione'), ('Sylvan Basilisk', 'Базовый выпуск Десятое Издание'), ('Sylvan Basilisk', '核心系列第十版'), ('Sylvan Basilisk', '核心系列第十版'), ('Sylvan Basilisk', '第10版基本セット'), ('Sylvan Basilisk', '코어세트 10판'), ('The Hive', 'Colección Básica - Décima Edición'), ('The Hive', 'Coleção Básica Décima Edição'), ('The Hive', 'Dixième édition'), ('The Hive', 'Hauptset Zehnte Edition'), ('The Hive', 'Set Base Decima Edizione'), ('The Hive', 'Базовый выпуск Десятое Издание'), ('The Hive', '核心系列第十版'), ('The Hive', '核心系列第十版'), ('The Hive', '第10版基本セット'), ('The Hive', '코어세트 10판'), ('The Hive', 'Colección Básica - Décima Edición'), ('The Hive', 'Coleção Básica Décima Edição'), ('The Hive', 'Dixième édition'), ('The Hive', 'Hauptset Zehnte Edition'), ('The Hive', 'Set Base Decima Edizione'), ('The Hive', 'Базовый выпуск Десятое Издание'), ('The Hive', '核心系列第十版'), ('The Hive', '核心系列第十版'), ('The Hive', '第10版基本セット'), ('The Hive', '코어세트 10판'), ('Air Elemental', 'Colección Básica - Décima Edición'), ('Air Elemental', 'Coleção Básica Décima Edição'), ('Air Elemental', 'Dixième édition'), ('Air Elemental', 'Hauptset Zehnte Edition'), ('Air Elemental', 'Set Base Decima Edizione'), ('Air Elemental', 'Базовый выпуск Десятое Издание'), ('Air Elemental', '核心系列第十版'), ('Air Elemental', '核心系列第十版'), ('Air Elemental', '第10版基本セット'), ('Air Elemental', '코어세트 10판'), ('Aven Windreader', 'Colección Básica - Décima Edición'), ('Aven Windreader', 'Coleção Básica Décima Edição'), ('Aven Windreader', 'Dixième édition'), ('Aven Windreader', 'Hauptset Zehnte Edition'), ('Aven Windreader', 'Set Base Decima Edizione'), ('Aven Windreader', 'Базовый выпуск Десятое Издание'), ('Aven Windreader', '核心系列第十版'), ('Aven Windreader', '核心系列第十版'), ('Aven Windreader', '第10版基本セット'), ('Aven Windreader', '코어세트 10판'), ('Persuasion', 'Colección Básica - Décima Edición'), ('Persuasion', 'Coleção Básica Décima Edição'), ('Persuasion', 'Dixième édition'), ('Persuasion', 'Hauptset Zehnte Edition'), ('Persuasion', 'Set Base Decima Edizione'), ('Persuasion', 'Базовый выпуск Десятое Издание'), ('Persuasion', '核心系列第十版'), ('Persuasion', '核心系列第十版'), ('Persuasion', '第10版基本セット'), ('Persuasion', '코어세트 10판')]
----------------------------



-- ACTUAL RESULTS
[(2, 'Chinese Traditional')]
----------------------------
