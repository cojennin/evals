-- PROBLEM # 432
-- Generation # 0
-- Difficulty: moderate
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

-- External Knowledge: Russian refers to language = 'Russian'; contains the most cards overall refers to MAX(baseSetSize)
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which Russian set of cards contains the most cards overall?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.name, MAX(s.baseSetSize) as max_size FROM sets s WHERE s.code IN (SELECT st.setCode FROM set_translations st WHERE st.language = 'Russian') GROUP BY s.name;
----------------------------




-- RESULTS FROM PREDICTION
[('Aether Revolt', 184), ('Alara Reborn', 145), ('Amonkhet', 269), ('Apocalypse', 143), ('Archenemy', 150), ('Battle Royale Box Set', 136), ('Battle for Zendikar', 274), ('Beatdown Box Set', 90), ('Betrayers of Kamigawa', 165), ('Born of the Gods', 165), ('Champions of Kamigawa', 306), ('Chronicles', 125), ('Classic Sixth Edition', 351), ('Coldsnap', 155), ('Commander 2011', 318), ('Commander 2013', 356), ('Commander 2014', 337), ('Commander 2015', 342), ('Commander 2016', 351), ('Commander 2017', 309), ("Commander's Arsenal", 18), ('Conflux', 145), ('Conspiracy', 210), ('Conspiracy: Take the Crown', 221), ('Core Set 2020', 280), ('Core Set 2021', 277), ('Darksteel', 165), ('Deckmasters', 58), ('Dissension', 180), ('Dominaria', 269), ('Dragons of Tarkir', 264), ('Duel Decks: Ajani vs. Nicol Bolas', 80), ('Duel Decks: Blessed vs. Cursed', 80), ('Duel Decks: Divine vs. Demonic', 62), ('Duel Decks: Elspeth vs. Kiora', 67), ('Duel Decks: Elspeth vs. Tezzeret', 79), ('Duel Decks: Elves vs. Goblins', 62), ('Duel Decks: Garruk vs. Liliana', 63), ('Duel Decks: Heroes vs. Monsters', 81), ('Duel Decks: Izzet vs. Golgari', 90), ('Duel Decks: Jace vs. Chandra', 64), ('Duel Decks: Jace vs. Vraska', 88), ('Duel Decks: Knights vs. Dragons', 81), ('Duel Decks: Nissa vs. Ob Nixilis', 76), ('Duel Decks: Phyrexia vs. the Coalition', 71), ('Duel Decks: Sorin vs. Tibalt', 80), ('Duel Decks: Speed vs. Cunning', 82), ('Duel Decks: Venser vs. Koth', 77), ('Duel Decks: Zendikar vs. Eldrazi', 80), ('Eighth Edition', 354), ('Eldritch Moon', 205), ('Eternal Masters', 249), ('Eventide', 180), ('Exodus', 143), ('Fate Reforged', 185), ('Fifth Dawn', 165), ('Fifth Edition', 455), ('Fourth Edition', 378), ('From the Vault: Angels', 15), ('From the Vault: Annihilation', 15), ('From the Vault: Exiled', 15), ('From the Vault: Legends', 15), ('From the Vault: Lore', 16), ('From the Vault: Realms', 15), ('From the Vault: Relics', 15), ('From the Vault: Twenty', 20), ('Future Sight', 180), ('Gatecrash', 249), ('Guildpact', 165), ('Homelands', 140), ('Ice Age', 383), ('Ikoria: Lair of Behemoths', 274), ('Journey into Nyx', 165), ('Judgment', 143), ('Kaladesh', 264), ('Khans of Tarkir', 269), ('Legions', 145), ('Lorwyn', 301), ('Magic 2010', 249), ('Magic 2014', 249), ('Magic 2015', 269), ('Magic Origins', 272), ('Mercadian Masques', 350), ('Mirrodin', 306), ('Mirrodin Besieged', 155), ('Modern Masters', 229), ('Modern Masters 2015', 249), ('Morningtide', 150), ('Ninth Edition', 350), ('Oath of the Gatewatch', 184), ('Odyssey', 350), ('Onslaught', 350), ('Planar Chaos', 165), ('Planechase 2012', 156), ('Planechase Anthology', 156), ('Premium Deck Series: Fire and Lightning', 34), ('Prophecy', 144), ('Ravnica Allegiance', 259), ('Ravnica: City of Guilds', 306), ('Return to Ravnica', 274), ('Rivals of Ixalan', 196), ('Saviors of Kamigawa', 165), ('Scourge', 143), ('Seventh Edition', 354), ('Shadowmoor', 301), ('Shadows over Innistrad', 297), ('Shards of Alara', 249), ('Stronghold', 143), ('Tempest', 350), ('Tempest Remastered', 269), ('Tenth Edition', 383), ('Theros', 249), ('Theros Beyond Death', 254), ('Throne of Eldraine', 269), ('Time Spiral', 301), ('Torment', 143), ("Urza's Destiny", 143), ("Urza's Legacy", 143), ("Urza's Saga", 356), ('War of the Spark', 264), ('Weatherlight', 167)]
----------------------------



-- ACTUAL RESULTS
[(7,)]
----------------------------
