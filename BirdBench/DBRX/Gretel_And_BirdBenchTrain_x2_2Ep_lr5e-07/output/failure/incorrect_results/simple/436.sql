-- PROBLEM # 436
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
frame effect as extendedart refers to frameEffects = 'extendedart'

-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- How many cards have frame effect as extendedart? List out the id of those cards.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT COUNT(*) FROM cards WHERE frameEffects = 'extendedart';
----------------------------




-- RESULTS FROM GENERATED SQL
[(383,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(13524,), (13525,), (13526,), (13527,), (13528,), (13529,), (13530,), (13531,), (13532,), (13533,), (13534,), (13535,), (13536,), (13537,), (13538,), (13539,), (13540,), (13541,), (13542,), (13543,), (13544,), (13545,), (13546,), (13547,), (13548,), (13549,), (13550,), (13551,), (13552,), (13553,), (13554,), (13555,), (13556,), (13557,), (13558,), (13559,), (13560,), (13561,), (13562,), (13563,), (13564,), (13565,), (13566,), (13567,), (13568,), (13569,), (13570,), (13571,), (13572,), (13573,), (13574,), (13575,), (13576,), (13577,), (13578,), (13579,), (13580,), (13581,), (13582,), (13583,), (13584,), (13585,), (13586,), (13587,), (13588,), (13589,), (13590,), (13591,), (13592,), (13593,), (13594,), (13595,), (13596,), (13597,), (13598,), (13599,), (13600,), (13601,), (13602,), (13603,), (13604,), (13605,), (13606,), (13607,), (13608,), (13609,), (13610,), (13611,), (13612,), (13613,), (13614,), (13615,), (13616,), (13617,), (13618,), (13619,), (13620,), (13621,), (13622,), (13623,), (13624,), (13625,), (18151,), (18152,), (18154,), (18155,), (18156,), (18158,), (18160,), (18163,), (18164,), (18165,), (18166,), (18168,), (18170,), (18171,), (18172,), (18174,), (18175,), (18177,), (18178,), (18179,), (18180,), (18181,), (18182,), (18183,), (18185,), (18186,), (18188,), (18190,), (18191,), (18192,), (18194,), (18195,), (18196,), (18197,), (18198,), (18199,), (18200,), (18201,), (18202,), (18203,), (18204,), (18205,), (18206,), (18207,), (18208,), (22945,), (22946,), (22947,), (22948,), (22949,), (22950,), (22951,), (22952,), (22953,), (22954,), (22955,), (22956,), (22958,), (22960,), (22962,), (22963,), (22964,), (22965,), (22967,), (22968,), (22970,), (22971,), (22972,), (22974,), (22975,), (22976,), (22977,), (22978,), (22979,), (22981,), (22992,), (22994,), (25414,), (25415,), (25416,), (25417,), (25418,), (25419,), (25420,), (25421,), (25422,), (25423,), (25424,), (25425,), (25426,), (25427,), (25428,), (25429,), (25430,), (25431,), (25432,), (25433,), (25434,), (25435,), (25436,), (25437,), (25438,), (25439,), (25440,), (25441,), (25442,), (25443,), (25444,), (25445,), (25446,), (25447,), (25448,), (25449,), (25450,), (25451,), (25452,), (25453,), (25479,), (30216,), (30217,), (30218,), (30220,), (30221,), (30222,), (30223,), (30225,), (30226,), (30227,), (30228,), (30229,), (30230,), (30231,), (30232,), (30233,), (30235,), (30236,), (30237,), (30239,), (30240,), (30241,), (30242,), (30245,), (30246,), (30247,), (30249,), (30250,), (30251,), (30253,), (30254,), (30259,), (30260,), (30261,), (30262,), (30263,), (30264,), (30265,), (30266,), (30267,), (44911,), (44913,), (44915,), (44916,), (44917,), (44918,), (44919,), (44920,), (44921,), (44922,), (44925,), (44926,), (44928,), (44929,), (44930,), (44931,), (44933,), (44934,), (44935,), (44936,), (44937,), (44940,), (44941,), (44942,), (44945,), (44946,), (44947,), (44948,), (44949,), (50290,), (50292,), (50293,), (50294,), (50296,), (50297,), (50298,), (50299,), (50300,), (50304,), (50305,), (50308,), (50309,), (50310,), (50311,), (50312,), (50313,), (50314,), (50315,), (50316,), (50319,), (50320,), (50321,), (50323,), (50324,), (50326,), (50328,), (50329,), (50338,), (50339,), (50340,), (50341,), (50342,), (50343,), (50344,), (56746,), (56747,), (56748,), (56749,), (56750,), (56751,), (56752,), (56753,), (56754,), (56755,), (56756,), (56757,), (56760,), (56761,), (56762,), (56763,), (56764,), (56765,), (56766,), (56767,), (56768,), (56769,), (56770,), (56771,), (56772,), (56773,), (56774,), (56776,), (56777,), (56778,), (56779,), (56780,), (56781,), (56782,), (56783,), (56785,), (56786,), (56787,), (56788,), (56789,), (56790,), (56791,), (56792,), (56793,), (56794,), (56795,), (56796,), (56797,), (56799,), (56800,), (56801,), (56802,), (56803,), (56804,), (56805,), (56817,), (56818,), (56819,), (56820,)]
----------------------------
