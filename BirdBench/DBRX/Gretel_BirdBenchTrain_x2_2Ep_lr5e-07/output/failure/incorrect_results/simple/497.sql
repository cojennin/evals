-- PROBLEM # 497
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

-- External Knowledge: the set "Huitième édition" refers to translation = 'Huitième édition'; expansion type refers to type
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the expansion type of the set "Huitième édition".
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT type FROM sets WHERE code = (SELECT code FROM set_translations WHERE translation = 'Huitième édition')
----------------------------




-- RESULTS FROM GENERATED SQL
[('core',), ('core',), ('masters',), ('core',), ('core',), ('core',), ('expansion',), ('core',), ('core',), ('core',), ('core',), ('core',), ('masters',), ('expansion',), ('starter',), ('expansion',), ('masters',), ('expansion',), ('expansion',), ('memorabilia',), ('starter',), ('starter',), ('expansion',), ('expansion',), ('archenemy',), ('expansion',), ('box',), ('expansion',), ('expansion',), ('memorabilia',), ('draft_innovation',), ('expansion',), ('expansion',), ('expansion',), ('box',), ('box',), ('commander',), ('commander',), ('commander',), ('commander',), ('commander',), ('commander',), ('commander',), ('commander',), ('from_the_vault',), ('memorabilia',), ('memorabilia',), ('expansion',), ('masters',), ('commander',), ('commander',), ('commander',), ('funny',), ('commander',), ('draft_innovation',), ('draft_innovation',), ('draft_innovation',), ('expansion',), ('starter',), ('starter',), ('starter',), ('expansion',), ('box',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('duel_deck',), ('expansion',), ('expansion',), ('expansion',), ('box',), ('expansion',), ('box',), ('from_the_vault',), ('expansion',), ('expansion',), ('expansion',), ('duel_deck',), ('archenemy',), ('box',), ('expansion',), ('masters',), ('expansion',), ('expansion',), ('duel_deck',), ('expansion',), ('masterpiece',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('core',), ('expansion',), ('memorabilia',), ('masters',), ('promo',), ('expansion',), ('expansion',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('box',), ('box',), ('promo',), ('box',), ('box',), ('box',), ('box',), ('expansion',), ('expansion',), ('duel_deck',), ('expansion',), ('duel_deck',), ('premium_deck',), ('funny',), ('box',), ('box',), ('box',), ('funny',), ('expansion',), ('planechase',), ('expansion',), ('memorabilia',), ('funny',), ('funny',), ('expansion',), ('expansion',), ('masters',), ('expansion',), ('expansion',), ('starter',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('draft_innovation',), ('expansion',), ('expansion',), ('duel_deck',), ('commander',), ('expansion',), ('expansion',), ('masters',), ('expansion',), ('token',), ('token',), ('token',), ('token',), ('token',), ('token',), ('core',), ('core',), ('expansion',), ('expansion',), ('expansion',), ('core',), ('core',), ('core',), ('core',), ('core',), ('core',), ('core',), ('core',), ('core',), ('masters',), ('expansion',), ('box',), ('masters',), ('masters',), ('masters',), ('masters',), ('masterpiece',), ('box',), ('draft_innovation',), ('expansion',), ('masters',), ('masters',), ('masters',), ('expansion',), ('expansion',), ('masterpiece',), ('promo',), ('masterpiece',), ('expansion',), ('funny',), ('expansion',), ('expansion',), ('starter',), ('archenemy',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('expansion',), ('archenemy',), ('expansion',), ('planechase',), ('memorabilia',), ('expansion',), ('planechase',), ('planechase',), ('core',), ('memorabilia',), ('starter',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('archenemy',), ('promo',), ('box',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('planechase',), ('planechase',), ('memorabilia',), ('promo',), ('memorabilia',), ('promo',), ('promo',), ('promo',), ('promo',), ('expansion',), ('premium_deck',), ('premium_deck',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('box',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('expansion',), ('promo',), ('promo',), ('promo',), ('masters',), ('promo',), ('promo',), ('expansion',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('memorabilia',), ('promo',), ('vanguard',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('starter',), ('promo',), ('memorabilia',), ('promo',), ('promo',), ('promo',), ('starter',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('box',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('box',), ('promo',), ('promo',), ('box',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('memorabilia',), ('funny',), ('promo',), ('promo',), ('starter',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('masterpiece',), ('promo',), ('promo',), ('promo',), ('promo',), ('vanguard',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('promo',), ('treasure_chest',), ('treasure_chest',), ('promo',), ('promo',), ('expansion',), ('masters',), ('masters',), ('expansion',), ('expansion',), ('expansion',), ('box',), ('expansion',), ('starter',), ('starter',), ('expansion',), ('expansion',), ('box',), ('box',), ('expansion',), ('expansion',), ('expansion',), ('spellbook',), ('spellbook',), ('spellbook',), ('expansion',), ('core',), ('token',), ('token',), ('box',), ('duel_deck',), ('token',), ('token',), ('expansion',), ('memorabilia',), ('memorabilia',), ('promo',), ('expansion',), ('expansion',), ('expansion',), ('masters',), ('expansion',), ('expansion',), ('masters',), ('expansion',), ('promo',), ('funny',), ('expansion',), ('masters',), ('funny',), ('funny',), ('expansion',), ('funny',), ('from_the_vault',), ('from_the_vault',), ('from_the_vault',), ('from_the_vault',), ('from_the_vault',), ('from_the_vault',), ('from_the_vault',), ('from_the_vault',), ('from_the_vault',), ('expansion',), ('masters',), ('starter',), ('starter',), ('expansion',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('memorabilia',), ('expansion',), ('expansion',), ('memorabilia',), ('expansion',), ('expansion',), ('commander',), ('masterpiece',), ('expansion',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('core',)]
----------------------------
