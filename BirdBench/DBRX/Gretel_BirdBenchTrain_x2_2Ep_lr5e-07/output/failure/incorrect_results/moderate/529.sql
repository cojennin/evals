-- PROBLEM # 529
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

-- External Knowledge: names of sets refers to name; doesn't have Japanese translation refers to language not like '%Japanese%'; have Korean translation refers to language = 'Korean'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Find and list the names of sets which doesn't have Japanese translation but have Korean translation.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT s.name FROM sets s WHERE s.code NOT IN (SELECT st.setCode FROM set_translations st WHERE st.language LIKE '%Japanese%') AND s.code IN (SELECT st.setCode FROM set_translations st WHERE st.language = 'Korean')
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Tenth Edition',), ('Fourth Edition',), ('Fifth Dawn',), ('Fifth Edition',), ('Classic Sixth Edition',), ('Seventh Edition',), ('Eighth Edition',), ('Ninth Edition',), ('Aether Revolt',), ('Amonkhet',), ('Shards of Alara',), ('Apocalypse',), ('Alara Reborn',), ('Archenemy',), ('Battle for Zendikar',), ('Born of the Gods',), ('Betrayers of Kamigawa',), ('Battle Royale Box Set',), ('Beatdown Box Set',), ('Commander 2013',), ('Commander 2014',), ('Commander 2015',), ('Commander 2016',), ('Commander 2017',), ('Champions of Kamigawa',), ('Chronicles',), ("Commander's Arsenal",), ('Commander 2011',), ('Conspiracy: Take the Crown',), ('Conspiracy',), ('Conflux',), ('Coldsnap',), ('Duel Decks: Elves vs. Goblins',), ('Duel Decks: Jace vs. Chandra',), ('Duel Decks: Divine vs. Demonic',), ('Duel Decks: Garruk vs. Liliana',), ('Duel Decks: Phyrexia vs. the Coalition',), ('Duel Decks: Elspeth vs. Tezzeret',), ('Duel Decks: Knights vs. Dragons',), ('Duel Decks: Ajani vs. Nicol Bolas',), ('Duel Decks: Venser vs. Koth',), ('Duel Decks: Izzet vs. Golgari',), ('Duel Decks: Sorin vs. Tibalt',), ('Duel Decks: Heroes vs. Monsters',), ('Duel Decks: Jace vs. Vraska',), ('Duel Decks: Speed vs. Cunning',), ('Duel Decks: Elspeth vs. Kiora',), ('Duel Decks: Zendikar vs. Eldrazi',), ('Duel Decks: Blessed vs. Cursed',), ('Duel Decks: Nissa vs. Ob Nixilis',), ('Dissension',), ('Deckmasters',), ('Dominaria',), ('Darksteel',), ('Dragons of Tarkir',), ('Throne of Eldraine',), ('Eternal Masters',), ('Eldritch Moon',), ('Eventide',), ('Exodus',), ('Fate Reforged',), ('Future Sight',), ('Guildpact',), ('Gatecrash',), ('Homelands',), ('Ice Age',), ('Ikoria: Lair of Behemoths',), ('Journey into Nyx',), ('Judgment',), ('Kaladesh',), ('Khans of Tarkir',), ('Legions',), ('Lorwyn',), ('Magic 2010',), ('Magic 2014',), ('Magic 2015',), ('Core Set 2020',), ('Core Set 2021',), ('Mirrodin Besieged',), ('Modern Masters 2015',), ('Modern Masters',), ('Mercadian Masques',), ('Morningtide',), ('Mirrodin',), ('Odyssey',), ('Oath of the Gatewatch',), ('Onslaught',), ('Magic Origins',), ('Planechase 2012',), ('Planechase Anthology',), ('Prophecy',), ('Premium Deck Series: Fire and Lightning',), ('Planar Chaos',), ('Ravnica: City of Guilds',), ('Rivals of Ixalan',), ('Ravnica Allegiance',), ('Return to Ravnica',), ('Scourge',), ('Shadowmoor',), ('Shadows over Innistrad',), ('Saviors of Kamigawa',), ('Stronghold',), ('Theros Beyond Death',), ('Theros',), ('Tempest',), ('Torment',), ('Tempest Remastered',), ('Time Spiral',), ("Urza's Destiny",), ("Urza's Legacy",), ("Urza's Saga",), ('From the Vault: Exiled',), ('From the Vault: Relics',), ('From the Vault: Legends',), ('From the Vault: Realms',), ('From the Vault: Twenty',), ('From the Vault: Annihilation',), ('From the Vault: Angels',), ('From the Vault: Lore',), ('War of the Spark',), ('Weatherlight',)]
----------------------------
