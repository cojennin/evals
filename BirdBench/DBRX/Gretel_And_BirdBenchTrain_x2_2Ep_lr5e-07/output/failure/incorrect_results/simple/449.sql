-- PROBLEM # 449
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
-- What is the language of the card that has azorius watermark? List out the type of this card.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.name, c.watermark, f.language, f.type FROM cards c INNER JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Azorius';
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('German', 'Sorcery'), ('Spanish', 'Sorcery'), ('French', 'Sorcery'), ('Italian', 'Sorcery'), ('Japanese', 'Sorcery'), ('Korean', 'Sorcery'), ('Russian', 'Sorcery'), ('Chinese Simplified', 'Sorcery'), ('Chinese Traditional', 'Sorcery'), ('German', 'Creature — Vedalken Wizard'), ('Spanish', 'Creature — Vedalken Wizard'), ('French', 'Creature — Vedalken Wizard'), ('Italian', 'Creature — Vedalken Wizard'), ('Japanese', 'Creature — Vedalken Wizard'), ('Korean', 'Creature — Vedalken Wizard'), ('Russian', 'Creature — Vedalken Wizard'), ('Chinese Simplified', 'Creature — Vedalken Wizard'), ('Chinese Traditional', 'Creature — Vedalken Wizard'), ('German', 'Creature — Human Advisor'), ('Spanish', 'Creature — Human Advisor'), ('French', 'Creature — Human Advisor'), ('Italian', 'Creature — Human Advisor'), ('Japanese', 'Creature — Human Advisor'), ('Korean', 'Creature — Human Advisor'), ('Russian', 'Creature — Human Advisor'), ('Chinese Simplified', 'Creature — Human Advisor'), ('Chinese Traditional', 'Creature — Human Advisor'), ('German', 'Creature — Human Wizard'), ('Spanish', 'Creature — Human Wizard'), ('French', 'Creature — Human Wizard'), ('Italian', 'Creature — Human Wizard'), ('Japanese', 'Creature — Human Wizard'), ('Korean', 'Creature — Human Wizard'), ('Russian', 'Creature — Human Wizard'), ('Chinese Simplified', 'Creature — Human Wizard'), ('Chinese Traditional', 'Creature — Human Wizard'), ('German', 'Creature — Sphinx'), ('Spanish', 'Creature — Sphinx'), ('French', 'Creature — Sphinx'), ('Italian', 'Creature — Sphinx'), ('Japanese', 'Creature — Sphinx'), ('Korean', 'Creature — Sphinx'), ('Russian', 'Creature — Sphinx'), ('Chinese Simplified', 'Creature — Sphinx'), ('Chinese Traditional', 'Creature — Sphinx'), ('German', 'Legendary Creature — Human Soldier'), ('Spanish', 'Legendary Creature — Human Soldier'), ('French', 'Legendary Creature — Human Soldier'), ('Italian', 'Legendary Creature — Human Soldier'), ('Japanese', 'Legendary Creature — Human Soldier'), ('Korean', 'Legendary Creature — Human Soldier'), ('Russian', 'Legendary Creature — Human Soldier'), ('Chinese Simplified', 'Legendary Creature — Human Soldier'), ('Chinese Traditional', 'Legendary Creature — Human Soldier'), ('German', 'Instant'), ('Spanish', 'Instant'), ('French', 'Instant'), ('Italian', 'Instant'), ('Japanese', 'Instant'), ('Korean', 'Instant'), ('Russian', 'Instant'), ('Chinese Simplified', 'Instant'), ('Chinese Traditional', 'Instant'), ('German', 'Artifact'), ('Spanish', 'Artifact'), ('French', 'Artifact'), ('Italian', 'Artifact'), ('Japanese', 'Artifact'), ('Korean', 'Artifact'), ('Russian', 'Artifact'), ('Chinese Simplified', 'Artifact'), ('Chinese Traditional', 'Artifact'), ('German', 'Land — Gate'), ('Spanish', 'Land — Gate'), ('French', 'Land — Gate'), ('Italian', 'Land — Gate'), ('Japanese', 'Land — Gate'), ('Korean', 'Land — Gate'), ('Russian', 'Land — Gate'), ('Chinese Simplified', 'Land — Gate'), ('Chinese Traditional', 'Land — Gate'), ('German', 'Creature — Spirit'), ('Spanish', 'Creature — Spirit'), ('French', 'Creature — Spirit'), ('Italian', 'Creature — Spirit'), ('Japanese', 'Creature — Spirit'), ('Portuguese (Brazil)', 'Creature — Spirit'), ('Russian', 'Creature — Spirit'), ('Chinese Simplified', 'Creature — Spirit'), ('German', 'Creature — Human Knight'), ('Spanish', 'Creature — Human Knight'), ('French', 'Creature — Human Knight'), ('Italian', 'Creature — Human Knight'), ('Japanese', 'Creature — Human Knight'), ('Portuguese (Brazil)', 'Creature — Human Knight'), ('Russian', 'Creature — Human Knight'), ('Chinese Simplified', 'Creature — Human Knight'), ('Portuguese (Brazil)', 'Sorcery'), ('Portuguese (Brazil)', 'Instant'), ('German', 'Creature — Vedalken Knight'), ('Spanish', 'Creature — Vedalken Knight'), ('French', 'Creature — Vedalken Knight'), ('Italian', 'Creature — Vedalken Knight'), ('Japanese', 'Creature — Vedalken Knight'), ('Portuguese (Brazil)', 'Creature — Vedalken Knight'), ('Russian', 'Creature — Vedalken Knight'), ('Chinese Simplified', 'Creature — Vedalken Knight'), ('German', 'Enchantment — Aura'), ('Spanish', 'Enchantment — Aura'), ('French', 'Enchantment — Aura'), ('Italian', 'Enchantment — Aura'), ('Japanese', 'Enchantment — Aura'), ('Portuguese (Brazil)', 'Enchantment — Aura'), ('Russian', 'Enchantment — Aura'), ('Chinese Simplified', 'Enchantment — Aura'), ('Portuguese (Brazil)', 'Creature — Human Wizard'), ('German', 'Creature — Griffin'), ('Spanish', 'Creature — Griffin'), ('French', 'Creature — Griffin'), ('Italian', 'Creature — Griffin'), ('Japanese', 'Creature — Griffin'), ('Portuguese (Brazil)', 'Creature — Griffin'), ('Russian', 'Creature — Griffin'), ('Chinese Simplified', 'Creature — Griffin'), ('German', 'Legendary Creature — Human Advisor'), ('Spanish', 'Legendary Creature — Human Advisor'), ('French', 'Legendary Creature — Human Advisor'), ('Italian', 'Legendary Creature — Human Advisor'), ('Japanese', 'Legendary Creature — Human Advisor'), ('Portuguese (Brazil)', 'Legendary Creature — Human Advisor'), ('Russian', 'Legendary Creature — Human Advisor'), ('Chinese Simplified', 'Legendary Creature — Human Advisor'), ('German', 'Legendary Creature — Sphinx'), ('Spanish', 'Legendary Creature — Sphinx'), ('French', 'Legendary Creature — Sphinx'), ('Italian', 'Legendary Creature — Sphinx'), ('Japanese', 'Legendary Creature — Sphinx'), ('Portuguese (Brazil)', 'Legendary Creature — Sphinx'), ('Russian', 'Legendary Creature — Sphinx'), ('Chinese Simplified', 'Legendary Creature — Sphinx'), ('German', 'Enchantment'), ('Spanish', 'Enchantment'), ('French', 'Enchantment'), ('Italian', 'Enchantment'), ('Japanese', 'Enchantment'), ('Portuguese (Brazil)', 'Enchantment'), ('Russian', 'Enchantment'), ('Chinese Simplified', 'Enchantment'), ('German', 'Creature — Elemental Cat'), ('Spanish', 'Creature — Elemental Cat'), ('French', 'Creature — Elemental Cat'), ('Italian', 'Creature — Elemental Cat'), ('Japanese', 'Creature — Elemental Cat'), ('Portuguese (Brazil)', 'Creature — Elemental Cat'), ('Russian', 'Creature — Elemental Cat'), ('Chinese Simplified', 'Creature — Elemental Cat'), ('German', 'Creature — Elemental'), ('Spanish', 'Creature — Elemental'), ('French', 'Creature — Elemental'), ('Italian', 'Creature — Elemental'), ('Japanese', 'Creature — Elemental'), ('Portuguese (Brazil)', 'Creature — Elemental'), ('Russian', 'Creature — Elemental'), ('Chinese Simplified', 'Creature — Elemental'), ('Portuguese (Brazil)', 'Creature — Vedalken Wizard'), ('Portuguese (Brazil)', 'Creature — Human Advisor'), ('Portuguese (Brazil)', 'Artifact'), ('German', 'Artifact Creature — Golem'), ('Spanish', 'Artifact Creature — Golem'), ('French', 'Artifact Creature — Golem'), ('Italian', 'Artifact Creature — Golem'), ('Japanese', 'Artifact Creature — Golem'), ('Portuguese (Brazil)', 'Artifact Creature — Golem'), ('Russian', 'Artifact Creature — Golem'), ('Chinese Simplified', 'Artifact Creature — Golem'), ('German', 'Land'), ('Spanish', 'Land'), ('French', 'Land'), ('Italian', 'Land'), ('Japanese', 'Land'), ('Portuguese (Brazil)', 'Land'), ('Russian', 'Land'), ('Chinese Simplified', 'Land'), ('German', 'Land — Plains Island'), ('Spanish', 'Land — Plains Island'), ('French', 'Land — Plains Island'), ('Italian', 'Land — Plains Island'), ('Japanese', 'Land — Plains Island'), ('Portuguese (Brazil)', 'Land — Plains Island'), ('Russian', 'Land — Plains Island'), ('Chinese Simplified', 'Land — Plains Island'), ('German', 'Creature — Archon'), ('Spanish', 'Creature — Archon'), ('French', 'Creature — Archon'), ('Italian', 'Creature — Archon'), ('Japanese', 'Creature — Archon'), ('German', 'Creature — Bird'), ('Spanish', 'Creature — Bird'), ('French', 'Creature — Bird'), ('Italian', 'Creature — Bird'), ('Japanese', 'Creature — Bird'), ('Korean', 'Enchantment — Aura'), ('Chinese Traditional', 'Enchantment — Aura'), ('Korean', 'Creature — Bird'), ('Portuguese (Brazil)', 'Creature — Bird'), ('Russian', 'Creature — Bird'), ('Chinese Simplified', 'Creature — Bird'), ('Chinese Traditional', 'Creature — Bird'), ('Korean', 'Creature — Human Knight'), ('Chinese Traditional', 'Creature — Human Knight'), ('Korean', 'Enchantment'), ('Chinese Traditional', 'Enchantment'), ('Portuguese (Brazil)', 'Legendary Creature — Human Soldier'), ('Portuguese (Brazil)', 'Creature — Sphinx'), ('Korean', 'Creature — Griffin'), ('Chinese Traditional', 'Creature — Griffin'), ('Portuguese (Brazil)', 'Land — Gate'), ('Korean', 'Land — Plains Island'), ('Chinese Traditional', 'Land — Plains Island'), ('German', 'Creature — Human Soldier'), ('Spanish', 'Creature — Human Soldier'), ('French', 'Creature — Human Soldier'), ('Italian', 'Creature — Human Soldier'), ('Japanese', 'Creature — Human Soldier'), ('Portuguese (Brazil)', 'Creature — Human Soldier'), ('Russian', 'Creature — Human Soldier'), ('Chinese Simplified', 'Creature — Human Soldier'), ('Korean', 'Creature — Human Soldier'), ('Chinese Traditional', 'Creature — Human Soldier'), ('Korean', 'Creature — Vedalken Knight'), ('Chinese Traditional', 'Creature — Vedalken Knight'), ('Korean', 'Creature — Spirit'), ('Chinese Traditional', 'Creature — Spirit'), ('German', 'Creature — Drake'), ('Spanish', 'Creature — Drake'), ('French', 'Creature — Drake'), ('Italian', 'Creature — Drake'), ('Japanese', 'Creature — Drake'), ('Korean', 'Creature — Drake'), ('Portuguese (Brazil)', 'Creature — Drake'), ('Russian', 'Creature — Drake'), ('Chinese Simplified', 'Creature — Drake'), ('Chinese Traditional', 'Creature — Drake'), ('Korean', 'Creature — Archon'), ('Portuguese (Brazil)', 'Creature — Archon'), ('Russian', 'Creature — Archon'), ('Chinese Simplified', 'Creature — Archon'), ('Chinese Traditional', 'Creature — Archon'), ('Korean', 'Legendary Creature — Sphinx'), ('Chinese Traditional', 'Legendary Creature — Sphinx')]
----------------------------
