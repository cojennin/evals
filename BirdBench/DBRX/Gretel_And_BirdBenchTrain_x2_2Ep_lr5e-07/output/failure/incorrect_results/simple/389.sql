-- PROBLEM # 389
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

-- External Knowledge: Creature - Elf is the originalType;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List down the name of cards with original types of Creature - Elf and the date of rulings for these cards.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.name, r.date FROM cards c JOIN rulings r ON c.uuid = r.uuid WHERE c.originalType = 'Creature - Elf';
----------------------------




-- RESULTS FROM GENERATED SQL
[('Elven Riders', '2007-05-01'), ('Elvish Champion', '2004-10-04'), ('Elvish Champion', '2005-08-01'), ("Gaea's Herald", '2004-10-04'), ('Llanowar Sentinel', '2004-10-04'), ('Llanowar Sentinel', '2007-07-15'), ('Skyshroud Ranger', '2007-05-01'), ('Elven Riders', '2007-05-01'), ('Elvish Piper', '2007-05-01'), ('Elvish Piper', '2009-10-01'), ('Seeker of Skybreak', '2004-10-04'), ('Wood Elves', '2004-10-04'), ('Elvish Piper', '2007-05-01'), ('Elvish Piper', '2009-10-01'), ("Gaea's Herald", '2004-10-04'), ('Wood Elves', '2004-10-04'), ('Argothian Elder', '2004-10-04'), ('Argothian Elder', '2004-10-04'), ('Seeker of Skybreak', '2004-10-04'), ('Ambush Commander', '2008-08-01'), ('Gempalm Strider', '2008-10-01'), ('Gempalm Strider', '2008-10-01'), ('Gempalm Strider', '2008-10-01'), ('Gempalm Strider', '2008-10-01'), ('Timberwatch Elf', '2016-06-08'), ('Voice of the Woods', '2004-10-04'), ('Voice of the Woods', '2004-10-04'), ('Quirion Sentinel', '2008-08-01'), ('Quirion Sentinel', '2009-10-01'), ('Quirion Trailblazer', '2004-10-04'), ('Quirion Trailblazer', '2004-10-04'), ('Gempalm Strider', '2008-10-01'), ('Gempalm Strider', '2008-10-01'), ('Gempalm Strider', '2008-10-01'), ('Gempalm Strider', '2008-10-01'), ('Patron of the Wild', '2004-10-04'), ('Timberwatch Elf', '2016-06-08'), ('Birchlore Rangers', '2004-10-04'), ('Birchlore Rangers', '2004-10-04'), ('Elven Riders', '2007-05-01'), ('Elvish Vanguard', '2016-06-08'), ('Everglove Courier', '2004-10-04'), ('Norwood Priestess', '2013-09-20'), ("Gaea's Herald", '2004-10-04'), ('Quirion Explorer', '2008-08-01'), ('Wood Elves', '2004-10-04'), ('Ambush Commander', '2008-08-01'), ('Fierce Empath', '2020-06-23'), ('Treetop Scout', '2007-05-01')]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(240, '2007-05-01'), (242, '2004-10-04'), (242, '2005-08-01'), (247, '2004-10-04'), (258, '2004-10-04'), (258, '2007-07-15'), (434, '2007-05-01'), (3108, '2007-05-01'), (3478, '2007-05-01'), (3478, '2009-10-01'), (3504, '2004-10-04'), (3520, '2004-10-04'), (3835, '2007-05-01'), (3835, '2009-10-01'), (3843, '2004-10-04'), (3880, '2004-10-04'), (7903, '2004-10-04'), (7903, '2004-10-04'), (7965, '2004-10-04'), (14440, '2008-08-01'), (14445, '2008-10-01'), (14445, '2008-10-01'), (14445, '2008-10-01'), (14445, '2008-10-01'), (14452, '2016-06-08'), (14453, '2004-10-04'), (14453, '2004-10-04'), (23473, '2008-08-01'), (23473, '2009-10-01'), (23474, '2004-10-04'), (23474, '2004-10-04'), (27368, '2008-10-01'), (27368, '2008-10-01'), (27368, '2008-10-01'), (27368, '2008-10-01'), (27375, '2004-10-04'), (27381, '2016-06-08'), (36686, '2004-10-04'), (36686, '2004-10-04'), (36692, '2007-05-01'), (36697, '2016-06-08'), (36700, '2004-10-04'), (37367, '2013-09-20'), (40407, '2004-10-04'), (40417, '2008-08-01'), (47757, '2004-10-04'), (47888, '2008-08-01'), (47896, '2020-06-23'), (47907, '2007-05-01')]
----------------------------
