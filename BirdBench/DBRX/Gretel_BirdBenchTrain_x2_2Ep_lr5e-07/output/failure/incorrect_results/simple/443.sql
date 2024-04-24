-- PROBLEM # 443
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

-- External Knowledge: code of sets refers to setCode
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Give the code of sets have expansion type of 'expansion'?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT code FROM sets WHERE type = 'expansion'
----------------------------




-- RESULTS FROM GENERATED SQL
[('5DN',), ('AER',), ('AKH',), ('ALA',), ('ALL',), ('APC',), ('ARB',), ('ARN',), ('ATQ',), ('AVR',), ('BFZ',), ('BNG',), ('BOK',), ('CHK',), ('CON',), ('CSP',), ('DGM',), ('DIS',), ('DKA',), ('DOM',), ('DRK',), ('DST',), ('DTK',), ('ELD',), ('EMN',), ('EVE',), ('EXO',), ('FEM',), ('FRF',), ('FUT',), ('GPT',), ('GRN',), ('GTC',), ('HML',), ('HOU',), ('ICE',), ('IKO',), ('INV',), ('ISD',), ('JOU',), ('JUD',), ('KHM',), ('KLD',), ('KTK',), ('LEG',), ('LGN',), ('LRW',), ('MBS',), ('MIR',), ('MMQ',), ('MOR',), ('MRD',), ('NEM',), ('NPH',), ('ODY',), ('OGW',), ('ONS',), ('PCY',), ('PLC',), ('PLS',), ('RAV',), ('RIX',), ('RNA',), ('ROE',), ('RTR',), ('SCG',), ('SHM',), ('SOI',), ('SOK',), ('SOM',), ('STH',), ('THB',), ('THS',), ('TMP',), ('TOR',), ('TSB',), ('TSP',), ('UDS',), ('ULG',), ('USG',), ('VIS',), ('WAR',), ('WTH',), ('WWK',), ('XLN',), ('ZEN',), ('ZNR',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('5DN',), ('AER',), ('AKH',), ('ALA',), ('APC',), ('ARB',), ('BFZ',), ('BNG',), ('BOK',), ('CHK',), ('CON',), ('CSP',), ('DIS',), ('DOM',), ('DST',), ('DTK',), ('ELD',), ('EMN',), ('EVE',), ('EXO',), ('FRF',), ('FUT',), ('GPT',), ('GTC',), ('HML',), ('ICE',), ('IKO',), ('JOU',), ('JUD',), ('KLD',), ('KTK',), ('LGN',), ('LRW',), ('MBS',), ('MMQ',), ('MOR',), ('MRD',), ('ODY',), ('OGW',), ('ONS',), ('PCY',), ('PLC',), ('RAV',), ('RIX',), ('RNA',), ('RTR',), ('SCG',), ('SHM',), ('SOI',), ('SOK',), ('STH',), ('THB',), ('THS',), ('TMP',), ('TOR',), ('TSP',), ('UDS',), ('ULG',), ('USG',), ('WAR',), ('WTH',)]
----------------------------
