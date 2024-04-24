-- PROBLEM # 530
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

-- External Knowledge: frame styles refers to frameVersion; cards Allen Williams worked on refers to artist = 'Allen Williams'; banned cards refers to status = 'banned'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List all the frame styles and cards Allen Williams worked on and find any banned cards if there are any.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT DISTINCT cards.frameVersion, cards.artist FROM cards WHERE cards.frameVersion IS NOT NULL AND cards.artist = 'Allen Williams'
----------------------------




-- RESULTS FROM PREDICTION
[('1997', 'Allen Williams'), ('2003', 'Allen Williams'), ('2015', 'Allen Williams'), ('1993', 'Allen Williams')]
----------------------------



-- ACTUAL RESULTS
[('1997', 'Blinking Spirit', 'NO'), ('1997', 'Kjeldoran Royal Guard', 'NO'), ('1997', 'Enervate', 'NO'), ('1997', 'Diminishing Returns', 'NO'), ('2003', 'Blinking Spirit', 'NO'), ('2015', 'Murder', 'NO'), ('2015', 'Tormenting Voice', 'NO'), ('1993', 'Whip Vine', 'NO'), ('1993', 'Diminishing Returns', 'NO'), ('1993', 'Suffocation', 'NO'), ('2003', 'Angelic Wall', 'NO'), ('2003', 'Captain of the Mists', 'NO'), ('2015', 'Opportunity', 'NO'), ('1997', 'Counterspell', 'NO'), ('2003', 'Karmic Guide', 'NO'), ('2003', 'Opportunity', 'NO'), ('2003', 'Hooded Horror', 'NO'), ('2015', 'Sunspear Shikari', 'NO'), ('2015', 'Vela the Night-Clad', 'NO'), ('2003', 'Vela the Night-Clad', 'NO'), ('2015', 'Karmic Guide', 'NO'), ('2003', 'Flowstone Blade', 'NO'), ('2003', 'Revoke Existence', 'NO'), ('2015', 'Captain of the Mists', 'NO'), ('1997', 'Giant Growth', 'NO'), ('2015', 'Searing Barrage', 'NO'), ('2015', 'Merfolk Secretkeeper // Venture Deeper', 'NO'), ('2015', 'Queen of Ice // Rage of Winter', 'NO'), ('1997', 'Crystalline Sliver', 'NO'), ('2003', 'Rhox War Monk', 'NO'), ('2003', 'Metallic Sliver', 'NO'), ('2003', 'Crystalline Sliver', 'NO'), ('1993', 'Blinking Spirit', 'NO'), ('1993', 'Kjeldoran Royal Guard', 'NO'), ('1993', 'Prismatic Ward', 'NO'), ('1993', 'Counterspell', 'NO'), ('1993', 'Enervate', 'NO'), ('1993', 'Updraft', 'NO'), ('1993', 'Minion of Leshrac', 'NO'), ('1993', 'Errantry', 'NO'), ('1993', 'Giant Growth', 'NO'), ('1993', 'Touch of Vitae', 'NO'), ('1993', 'Venomous Breath', 'NO'), ('1993', 'Aegis of the Meek', 'NO'), ('1993', 'Hematite Talisman', 'NO'), ('1993', 'Land Cap', 'NO'), ('2015', 'Illusory Angel', 'NO'), ('2003', 'Returned Reveler', 'NO'), ('2003', 'Tormented Thoughts', 'NO'), ('2003', 'Maritime Guard', 'NO'), ('2003', 'Nether Horror', 'NO'), ('2003', 'Divine Favor', 'NO'), ('2003', 'Dark Favor', 'NO'), ('2003', 'Gladecover Scout', 'NO'), ('2003', 'Murder', 'NO'), ('2015', 'Divine Favor', 'NO'), ('1997', 'Dauthi Mindripper', 'NO'), ('1997', 'Minion of Leshrac', 'NO'), ('2015', 'Indomitable Archangel', 'NO'), ('2015', 'Agent of Masks', 'NO'), ('2015', 'Maritime Guard', 'NO'), ('2015', 'Tormented Thoughts', 'NO'), ('2003', 'Illusory Angel', 'NO'), ('2015', 'Quirion Ranger', 'NO'), ('2003', 'Indomitable Archangel', 'NO'), ('2003', 'Sunspear Shikari', 'NO'), ('2003', 'Relic Putrescence', 'NO'), ('2003', 'Grafted Exoskeleton', 'NO'), ('1997', 'Flowstone Blade', 'NO'), ('1997', 'Disenchant', 'NO'), ('1997', 'Apocalypse', 'NO'), ('1997', 'Chaotic Goo', 'NO'), ('1997', 'Horned Sliver', 'NO'), ('1997', 'Metallic Sliver', 'NO'), ('1997', 'Caldera Lake', 'NO'), ('2015', 'Disenchant', 'NO'), ('2015', 'Flowstone Blade', 'NO'), ('2015', 'Horned Sliver', 'NO'), ('2015', 'Crystalline Sliver', 'NO'), ('2015', 'Metallic Sliver', 'NO'), ('2015', 'Caldera Lake', 'NO'), ('1997', 'Rebuild', 'NO'), ('1997', 'Thran Lens', 'NO')]
----------------------------
