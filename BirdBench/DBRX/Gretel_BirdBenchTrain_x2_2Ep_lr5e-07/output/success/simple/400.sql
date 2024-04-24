-- PROBLEM # 400
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

-- External Knowledge: Spanish refer to language; set code refers to setCode
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Lists the set code of all cards translated into Spanish.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT DISTINCT setCode FROM set_translations WHERE language = 'Spanish';
----------------------------






-- ACTUAL RESULTS
[('10E',), ('4ED',), ('5DN',), ('5ED',), ('6ED',), ('7ED',), ('8ED',), ('9ED',), ('AER',), ('AKH',), ('ALA',), ('APC',), ('ARB',), ('ARC',), ('BFZ',), ('BNG',), ('BOK',), ('BRB',), ('BTD',), ('C13',), ('C14',), ('C15',), ('C16',), ('C17',), ('CHK',), ('CHR',), ('CM1',), ('CMD',), ('CN2',), ('CNS',), ('CON',), ('CSP',), ('DD1',), ('DD2',), ('DDC',), ('DDD',), ('DDE',), ('DDF',), ('DDG',), ('DDH',), ('DDI',), ('DDJ',), ('DDK',), ('DDL',), ('DDM',), ('DDN',), ('DDO',), ('DDP',), ('DDQ',), ('DDR',), ('DIS',), ('DKM',), ('DOM',), ('DST',), ('DTK',), ('ELD',), ('EMA',), ('EMN',), ('EVE',), ('EXO',), ('FRF',), ('FUT',), ('GPT',), ('GTC',), ('HML',), ('ICE',), ('IKO',), ('JOU',), ('JUD',), ('KLD',), ('KTK',), ('LGN',), ('LRW',), ('M10',), ('M14',), ('M15',), ('M20',), ('M21',), ('MBS',), ('MM2',), ('MMA',), ('MMQ',), ('MOR',), ('MRD',), ('ODY',), ('OGW',), ('ONS',), ('ORI',), ('PC2',), ('PCA',), ('PCY',), ('PD2',), ('PLC',), ('RAV',), ('RIX',), ('RNA',), ('RTR',), ('SCG',), ('SHM',), ('SOI',), ('SOK',), ('STH',), ('THB',), ('THS',), ('TMP',), ('TOR',), ('TPR',), ('TSP',), ('UDS',), ('ULG',), ('USG',), ('V09',), ('V10',), ('V11',), ('V12',), ('V13',), ('V14',), ('V15',), ('V16',), ('WAR',), ('WTH',)]
----------------------------
