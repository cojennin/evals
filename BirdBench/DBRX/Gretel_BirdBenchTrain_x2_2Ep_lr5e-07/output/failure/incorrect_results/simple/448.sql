-- PROBLEM # 448
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

-- External Knowledge: 
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Name the foreign name of the card that has abzan watermark? List out the type of this card.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT f.name, c.type FROM cards c INNER JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Abzan' AND f.language = 'Japanese';
----------------------------




-- RESULTS FROM PREDICTION
[]
----------------------------



-- ACTUAL RESULTS
[('Abzan Advantage', 'Instant'), ('Abzan Runemark', 'Enchantment — Aura'), ('Abzan Skycaptain', 'Creature — Bird Soldier'), ('Arashin Cleric', 'Creature — Human Cleric'), ('Daghatar the Adamant', 'Legendary Creature — Human Warrior'), ('Dragonscale General', 'Creature — Human Warrior'), ('Elite Scaleguard', 'Creature — Human Soldier'), ("Honor's Reward", 'Instant'), ('Merciless Executioner', 'Creature — Orc Warrior'), ('Abzan Beastmaster', 'Creature — Dog Shaman'), ('Abzan Kin-Guard', 'Creature — Human Warrior'), ('Arashin War Beast', 'Creature — Beast'), ('Battlefront Krushok', 'Creature — Beast'), ('Cached Defenses', 'Sorcery'), ('Map the Wastes', 'Sorcery'), ('Sandsteppe Mastodon', 'Creature — Elephant'), ('Warden of the First Tree', 'Creature — Human'), ('Abzan Battle Priest', 'Creature — Human Cleric'), ('Abzan Falconer', 'Creature — Human Soldier'), ('Ainok Bond-Kin', 'Creature — Dog Soldier'), ('Dazzling Ramparts', 'Creature — Wall'), ('Herald of Anafenza', 'Creature — Human Soldier'), ('High Sentinels of Arashin', 'Creature — Bird Soldier'), ('Salt Road Patrol', 'Creature — Human Scout'), ('War Behemoth', 'Creature — Beast'), ('Watcher of the Roost', 'Creature — Bird Soldier'), ('Disowned Ancestor', 'Creature — Spirit Warrior'), ('Krumar Bond-Kin', 'Creature — Orc Warrior'), ('Mer-Ek Nightblade', 'Creature — Orc Assassin'), ('Retribution of the Ancients', 'Enchantment'), ('Unyielding Krumar', 'Creature — Orc Warrior'), ("Archers' Parapet", 'Creature — Wall'), ('Hardened Scales', 'Enchantment'), ('Kin-Tree Warden', 'Creature — Human Warrior'), ('Longshot Squad', 'Creature — Dog Archer'), ('Tuskguard Captain', 'Creature — Human Warrior'), ('Abzan Ascendancy', 'Enchantment'), ('Abzan Charm', 'Instant'), ('Abzan Guide', 'Creature — Human Warrior'), ('Anafenza, the Foremost', 'Legendary Creature — Human Soldier'), ('Armament Corps', 'Creature — Human Soldier'), ('Chief of the Scale', 'Creature — Human Warrior'), ('Duneblast', 'Sorcery'), ('Ivorytusk Fortress', 'Creature — Elephant'), ('Siege Rhino', 'Creature — Rhino'), ('Abzan Banner', 'Artifact'), ('Sandsteppe Citadel', 'Land')]
----------------------------
