-- PROBLEM # 457
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

-- External Knowledge: promotional type of "bundle" refers to promoTypes = 'bundle'; websites refers to purchaseUrls
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the websites where I can purchase the cards that have the promotional type of "bundle".
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT DISTINCT purchaseUrls FROM cards WHERE promoTypes = 'bundle';
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[("{'cardKingdomFoil': 'https://mtgjson.com/links/c7b2529fff20e768', 'cardmarket': 'https://mtgjson.com/links/7e6bf16908b7608c', 'tcgplayer': 'https://mtgjson.com/links/ad765b504a5d53f9'}",), ("{'cardKingdomFoil': 'https://mtgjson.com/links/a38cfe08d940ddb5', 'cardmarket': 'https://mtgjson.com/links/28e6303cf1c21f26', 'tcgplayer': 'https://mtgjson.com/links/a029b7ffac8c8475'}",), ("{'cardKingdom': 'https://mtgjson.com/links/1880b37447ce45de', 'cardKingdomFoil': 'https://mtgjson.com/links/ca7452d85d349e76', 'tcgplayer': 'https://mtgjson.com/links/bde413266737f925'}",), ("{'cardKingdom': 'https://mtgjson.com/links/88bf4baa16ae1e7b', 'cardKingdomFoil': 'https://mtgjson.com/links/417543b3564936ea', 'tcgplayer': 'https://mtgjson.com/links/cc618485bbe5f3ac'}",), ("{'cardKingdom': 'https://mtgjson.com/links/7d3aa1c9dd41b84c', 'cardKingdomFoil': 'https://mtgjson.com/links/0b3787ce471cf48a', 'tcgplayer': 'https://mtgjson.com/links/0e3502e8d1da1fcf'}",), ("{'cardKingdom': 'https://mtgjson.com/links/58bcd4e13d34bc1c', 'cardKingdomFoil': 'https://mtgjson.com/links/7c10979c1403f144', 'tcgplayer': 'https://mtgjson.com/links/1f077a708eef8f24'}",), ("{'cardKingdom': 'https://mtgjson.com/links/aa48503382a6c5ca', 'cardKingdomFoil': 'https://mtgjson.com/links/9e4c48cc55b05f0c', 'tcgplayer': 'https://mtgjson.com/links/c99539677dd3cfb9'}",), ("{'cardKingdomFoil': 'https://mtgjson.com/links/1e38771472f1404c', 'cardmarket': 'https://mtgjson.com/links/63f47ef1e28a88a0', 'tcgplayer': 'https://mtgjson.com/links/2f68a75af1c76daf'}",), ("{'cardKingdomFoil': 'https://mtgjson.com/links/fbac9656bf64fbb9', 'cardmarket': 'https://mtgjson.com/links/258b42ef68e3edd4', 'tcgplayer': 'https://mtgjson.com/links/81f229eb07bb7205'}",), ("{'cardKingdomFoil': 'https://mtgjson.com/links/c38f731d9156a68c', 'tcgplayer': 'https://mtgjson.com/links/ac93de3a61548ef1'}",), ("{'cardKingdomFoil': 'https://mtgjson.com/links/3bae4d1eddb7ee48', 'cardmarket': 'https://mtgjson.com/links/32159e850c5c7051', 'tcgplayer': 'https://mtgjson.com/links/732ad744c63a7047'}",), ("{'cardKingdomFoil': 'https://mtgjson.com/links/6d489473746ddc6c', 'cardmarket': 'https://mtgjson.com/links/e14c5adb10ba8ecd', 'tcgplayer': 'https://mtgjson.com/links/516cae21b508444b'}",)]
----------------------------
