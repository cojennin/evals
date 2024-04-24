-- PROBLEM # 347
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

-- External Knowledge: cards have missing or degraded properties and value refers to hasContentWarning = 1; 'Stephen Daniele' is artist;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Find all cards illustrated by Stephen Daniel and describe the text of the ruling of these cards. State if these cards have missing or degraded properties and values.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.name, r.text FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.artist = 'Stephen Daniele' AND c.hasContentWarning = 1;
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(29, 'You can’t put an Aura card from your hand onto the battlefield this way if that Aura can’t legally enchant Academy Researchers. For example, you can’t put an Aura with “enchant land” or “enchant green creature” onto the battlefield attached to Academy Res', 0), (3872, 'This card now has Enchant Swamp, which works exactly like any other Enchant ability. This means it can only be cast targeting a Swamp, and it will be put into its owner’s graveyard if the permanent it’s attached to ever stops being a Swamp.', 0), (6651, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (6652, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (7950, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (7970, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (8107, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (8109, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (8448, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (8787, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (8791, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (9117, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (9124, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (12407, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (12417, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (14653, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (14686, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (19041, 'The lands are put onto the battlefield during the resolution of the ability.', 0), (19041, 'You discard all the cards still in your hand after you put the lands onto the battlefield.', 0), (19041, 'Putting a land onto the battlefield does not count as playing a land.', 0), (21535, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (21568, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0), (38456, 'Cycling is an activated ability. Effects that interact with activated abilities (such as Stifle or Rings of Brighthearth) will interact with cycling. Effects that interact with spells (such as Remove Soul or Faerie Tauntings) will not.', 0)]
----------------------------
