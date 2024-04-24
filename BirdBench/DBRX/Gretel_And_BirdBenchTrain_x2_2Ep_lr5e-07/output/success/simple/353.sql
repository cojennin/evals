-- PROBLEM # 353
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

-- External Knowledge: Italian translation refers to language = 'Italian'; total number of card per set refers to totalSetSize;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List all the sets available in Italian translation. State the total number of cards per set.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.name, s.totalSetSize FROM sets s JOIN set_translations st ON s.code = st.setCode WHERE st.language = 'Italian';
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Tenth Edition', 508), ('Fourth Edition', 379), ('Fifth Dawn', 165), ('Fifth Edition', 460), ('Classic Sixth Edition', 351), ('Seventh Edition', 354), ('Eighth Edition', 361), ('Ninth Edition', 359), ('Aether Revolt', 197), ('Amonkhet', 287), ('Shards of Alara', 249), ('Apocalypse', 143), ('Alara Reborn', 145), ('Archenemy', 150), ('Battle for Zendikar', 299), ('Born of the Gods', 165), ('Betrayers of Kamigawa', 165), ('Battle Royale Box Set', 136), ('Beatdown Box Set', 90), ('Commander 2013', 356), ('Commander 2014', 337), ('Commander 2015', 342), ('Commander 2016', 351), ('Commander 2017', 309), ('Champions of Kamigawa', 307), ('Chronicles', 125), ("Commander's Arsenal", 18), ('Commander 2011', 318), ('Conspiracy: Take the Crown', 222), ('Conspiracy', 210), ('Conflux', 145), ('Coldsnap', 155), ('Duel Decks: Elves vs. Goblins', 62), ('Duel Decks: Jace vs. Chandra', 64), ('Duel Decks: Divine vs. Demonic', 62), ('Duel Decks: Garruk vs. Liliana', 63), ('Duel Decks: Phyrexia vs. the Coalition', 71), ('Duel Decks: Elspeth vs. Tezzeret', 79), ('Duel Decks: Knights vs. Dragons', 81), ('Duel Decks: Ajani vs. Nicol Bolas', 80), ('Duel Decks: Venser vs. Koth', 77), ('Duel Decks: Izzet vs. Golgari', 90), ('Duel Decks: Sorin vs. Tibalt', 80), ('Duel Decks: Heroes vs. Monsters', 81), ('Duel Decks: Jace vs. Vraska', 88), ('Duel Decks: Speed vs. Cunning', 82), ('Duel Decks: Elspeth vs. Kiora', 67), ('Duel Decks: Zendikar vs. Eldrazi', 80), ('Duel Decks: Blessed vs. Cursed', 80), ('Duel Decks: Nissa vs. Ob Nixilis', 76), ('Dissension', 180), ('Deckmasters', 58), ('Dominaria', 280), ('Darksteel', 165), ('Dragons of Tarkir', 264), ('Throne of Eldraine', 397), ('Eternal Masters', 249), ('Eldritch Moon', 208), ('Eventide', 180), ('Exodus', 143), ('Fate Reforged', 185), ('Future Sight', 180), ('Guildpact', 165), ('Gatecrash', 249), ('Homelands', 140), ('Ice Age', 383), ('Ikoria: Lair of Behemoths', 388), ('Journey into Nyx', 165), ('Judgment', 143), ('Kaladesh', 278), ('Khans of Tarkir', 269), ('Legions', 145), ('Lorwyn', 301), ('Magic 2010', 249), ('Magic 2014', 249), ('Magic 2015', 284), ('Core Set 2020', 345), ('Core Set 2021', 397), ('Mirrodin Besieged', 155), ('Modern Masters 2015', 249), ('Modern Masters', 229), ('Mercadian Masques', 350), ('Morningtide', 150), ('Mirrodin', 306), ('Odyssey', 352), ('Oath of the Gatewatch', 187), ('Onslaught', 350), ('Magic Origins', 288), ('Planechase 2012', 156), ('Planechase Anthology', 156), ('Prophecy', 144), ('Premium Deck Series: Fire and Lightning', 34), ('Planar Chaos', 165), ('Ravnica: City of Guilds', 306), ('Rivals of Ixalan', 205), ('Ravnica Allegiance', 273), ('Return to Ravnica', 274), ('Scourge', 143), ('Shadowmoor', 302), ('Shadows over Innistrad', 302), ('Saviors of Kamigawa', 165), ('Stronghold', 143), ('Theros Beyond Death', 358), ('Theros', 249), ('Tempest', 350), ('Torment', 143), ('Tempest Remastered', 269), ('Time Spiral', 301), ("Urza's Destiny", 143), ("Urza's Legacy", 143), ("Urza's Saga", 356), ('From the Vault: Exiled', 15), ('From the Vault: Relics', 15), ('From the Vault: Legends', 15), ('From the Vault: Realms', 15), ('From the Vault: Twenty', 20), ('From the Vault: Annihilation', 15), ('From the Vault: Angels', 15), ('From the Vault: Lore', 16), ('War of the Spark', 311), ('Weatherlight', 167)]
----------------------------
