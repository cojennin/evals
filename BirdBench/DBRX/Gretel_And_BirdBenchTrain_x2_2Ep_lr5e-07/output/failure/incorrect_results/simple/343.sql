-- PROBLEM # 343
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

-- External Knowledge: below 100 on EDHRec refers to EDHRec <100; with 2015 frame style refers to frameVersion = 2015;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Name all cards with 2015 frame style ranking below 100 on EDHRec.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.name FROM cards c WHERE c.frameVersion = '2015' AND c.edhrecRank < 100;
----------------------------




-- RESULTS FROM GENERATED SQL
[('Path to Exile',), ('Brainstorm',), ('Cyclonic Rift',), ('Blasphemous Act',), ('Reclamation Sage',), ('Lightning Greaves',), ('Mana Crypt',), ('Brainstorm',), ('Cyclonic Rift',), ('Lightning Greaves',), ('Mana Crypt',), ('Swords to Plowshares',), ('Arcane Denial',), ('Brainstorm',), ('Counterspell',), ('Cultivate',), ('Swiftfoot Boots',), ('Myriad Landscape',), ('Negate',), ('Heroic Intervention',), ('Evolving Wilds',), ('Evolving Wilds',), ('Evolving Wilds',), ('Swords to Plowshares',), ('Negate',), ('Beast Within',), ('Evolving Wilds',), ("Commander's Sphere",), ('Myriad Landscape',), ('Sun Titan',), ('Cyclonic Rift',), ('Blasphemous Act',), ('Chaos Warp',), ('Elvish Mystic',), ('Llanowar Elves',), ('Reclamation Sage',), ('Burnished Hart',), ('Mind Stone',), ('Skullclamp',), ('Sol Ring',), ('Solemn Simulacrum',), ('Swiftfoot Boots',), ('Thran Dynamo',), ("Wayfarer's Bauble",), ('Bojuka Bog',), ('Evolving Wilds',), ('Reliquary Tower',), ('Temple of the False God',), ('Terramorphic Expanse',), ('Thought Vessel',), ('Sun Titan',), ('Brainstorm',), ('Windfall',), ('Phyrexian Arena',), ('Eternal Witness',), ("Kodama's Reach",), ('Rampant Growth',), ('Sakura-Tribe Elder',), ('Boros Signet',), ('Burnished Hart',), ('Fellwar Stone',), ('Izzet Signet',), ('Lightning Greaves',), ('Mind Stone',), ('Orzhov Signet',), ('Skullclamp',), ('Sol Ring',), ('Solemn Simulacrum',), ('Swiftfoot Boots',), ("Wayfarer's Bauble",), ('Command Tower',), ('Evolving Wilds',), ('Reliquary Tower',), ("Rogue's Passage",), ('Temple of the False God',), ('Terramorphic Expanse',), ('Swords to Plowshares',), ('Arcane Denial',), ('Swan Song',), ('Windfall',), ('Blasphemous Act',), ('Chaos Warp',), ('Beast Within',), ('Cultivate',), ('Farseek',), ("Kodama's Reach",), ('Rampant Growth',), ('Sakura-Tribe Elder',), ('Chromatic Lantern',), ("Commander's Sphere",), ('Fellwar Stone',), ('Lightning Greaves',), ('Orzhov Signet',), ('Rakdos Signet',), ('Skullclamp',), ('Sol Ring',), ('Solemn Simulacrum',), ('Swiftfoot Boots',), ('Command Tower',), ('Evolving Wilds',), ('Exotic Orchard',), ('Myriad Landscape',), ('Reliquary Tower',), ('Temple of the False God',), ('Terramorphic Expanse',), ('Swords to Plowshares',), ('Chaos Warp',), ('Cultivate',), ('Farseek',), ("Kodama's Reach",), ('Boros Signet',), ("Commander's Sphere",), ('Fellwar Stone',), ('Lightning Greaves',), ('Orzhov Signet',), ('Rakdos Signet',), ('Skullclamp',), ('Sol Ring',), ('Swiftfoot Boots',), ("Wayfarer's Bauble",), ('Bojuka Bog',), ('Command Tower',), ('Evolving Wilds',), ('Exotic Orchard',), ('Myriad Landscape',), ("Rogue's Passage",), ('Temple of the False God',), ('Terramorphic Expanse',), ('Brainstorm',), ('Ponder',), ('Blasphemous Act',), ('Chaos Warp',), ('Cultivate',), ('Reclamation Sage',), ('Sakura-Tribe Elder',), ("Commander's Sphere",), ('Dimir Signet',), ('Izzet Signet',), ('Mind Stone',), ('Orzhov Signet',), ('Sol Ring',), ('Swiftfoot Boots',), ('Bojuka Bog',), ('Command Tower',), ('Evolving Wilds',), ('Myriad Landscape',), ('Temple of the False God',), ('Terramorphic Expanse',), ('Sun Titan',), ('Chaos Warp',), ('Beast Within',), ('Cultivate',), ('Farseek',), ('Sakura-Tribe Elder',), ('Burnished Hart',), ("Commander's Sphere",), ('Lightning Greaves',), ('Sol Ring',), ('Solemn Simulacrum',), ('Thran Dynamo',), ('Bojuka Bog',), ('Command Tower',), ('Evolving Wilds',), ('Exotic Orchard',), ('Myriad Landscape',), ('Reliquary Tower',), ("Rogue's Passage",), ('Temple of the False God',), ('Terramorphic Expanse',), ('Sun Titan',), ('Windfall',), ('Chaos Warp',), ('Beast Within',), ('Cultivate',), ("Kodama's Reach",), ('Reclamation Sage',), ('Sakura-Tribe Elder',), ('Arcane Signet',), ('Boros Signet',), ("Commander's Sphere",), ('Izzet Signet',), ('Lightning Greaves',), ('Orzhov Signet',), ('Rakdos Signet',), ('Skullclamp',), ('Sol Ring',), ('Solemn Simulacrum',), ('Swiftfoot Boots',), ('Bojuka Bog',), ('Command Tower',), ('Exotic Orchard',), ('Myriad Landscape',), ('Reliquary Tower',), ("Rogue's Passage",), ('Temple of the False God',), ('Sylvan Library',), ('Sol Ring',), ('Command Tower',), ('Sun Titan',), ('Windfall',), ('Blasphemous Act',), ('Chaos Warp',), ('Cultivate',), ('Eternal Witness',), ('Boros Signet',), ("Commander's Sphere",), ('Dimir Signet',), ('Fellwar Stone',), ('Lightning Greaves',), ('Mind Stone',), ('Orzhov Signet',), ('Sol Ring',), ('Solemn Simulacrum',), ('Solemn Simulacrum',), ('Swiftfoot Boots',), ('Thought Vessel',), ("Wayfarer's Bauble",), ('Command Tower',), ('Evolving Wilds',), ('Exotic Orchard',), ('Reliquary Tower',), ('Temple of the False God',), ('Temple of the False God',), ('Terramorphic Expanse',), ('Path to Exile',), ('Arcane Denial',), ('Elvish Mystic',), ('Eternal Witness',), ('Llanowar Elves',), ('Reclamation Sage',), ('Sakura-Tribe Elder',), ('Boros Signet',), ("Commander's Sphere",), ('Lightning Greaves',), ('Orzhov Signet',), ('Rakdos Signet',), ('Skullclamp',), ('Sol Ring',), ('Swiftfoot Boots',), ('Thought Vessel',), ('Bojuka Bog',), ('Command Tower',), ('Evolving Wilds',), ('Myriad Landscape',), ('Temple of the False God',), ('Terramorphic Expanse',), ('Vampiric Tutor',), ('Blasphemous Act',), ('Reclamation Sage',), ('Arcane Signet',), ('Burnished Hart',), ("Commander's Sphere",), ('Thought Vessel',), ('Command Tower',), ('Terramorphic Expanse',), ('Swords to Plowshares',), ('Arcane Denial',), ('Counterspell',), ('Beast Within',), ('Cultivate',), ('Eternal Witness',), ("Kodama's Reach",), ('Rampant Growth',), ('Reclamation Sage',), ('Boros Signet',), ('Sol Ring',), ('Swiftfoot Boots',), ('Command Tower',), ('Evolving Wilds',), ('Myriad Landscape',), ('Reliquary Tower',), ("Rogue's Passage",), ('Terramorphic Expanse',), ('Swords to Plowshares',), ('Arcane Denial',), ('Counterspell',), ('Vampiric Tutor',), ('Blasphemous Act',), ("Kodama's Reach",), ('Arcane Signet',), ('Burnished Hart',), ("Commander's Sphere",), ('Sol Ring',), ('Swiftfoot Boots',), ('Thought Vessel',), ('Command Tower',), ('Myriad Landscape',), ('Reliquary Tower',), ('Terramorphic Expanse',), ('Mana Confluence',), ('Negate',), ('Phyrexian Arena',), ('Beast Within',), ('Birds of Paradise',), ('Evolving Wilds',), ('Exotic Orchard',), ("Rogue's Passage",), ('Evolving Wilds',), ('Terramorphic Expanse',), ('Evolving Wilds',), ('Temple of the False God',), ('Evolving Wilds',), ('Mind Stone',), ('Rampant Growth',), ('Elvish Mystic',), ('Solemn Simulacrum',), ('Llanowar Elves',), ('Gilded Lotus',), ('Negate',), ('Evolving Wilds',), ('Demonic Tutor',), ('Sun Titan',), ('Cultivate',), ('Drowned Catacomb',), ('Path to Exile',), ('Fabled Passage',), ('Arcane Signet',), ('Command Tower',), ('Fabled Passage',), ('Enlightened Tutor',), ('Swords to Plowshares',), ('Brainstorm',), ('Counterspell',), ('Mystical Tutor',), ('Vampiric Tutor',), ('Llanowar Elves',), ('Sylvan Library',), ("Ashnod's Altar",), ('Mana Crypt',), ("Sensei's Divining Top",), ('Llanowar Elves',), ('Hallowed Fountain',), ('Watery Grave',), ('Blood Crypt',), ('Stomping Ground',), ('Temple Garden',), ('Godless Shrine',), ('Steam Vents',), ('Overgrown Tomb',), ('Sacred Foundry',), ('Breeding Pool',), ('Flooded Strand',), ('Polluted Delta',), ('Bloodstained Mire',), ('Wooded Foothills',), ('Windswept Heath',), ('Marsh Flats',), ('Scalding Tarn',), ('Verdant Catacombs',), ('Arid Mesa',), ('Misty Rainforest',), ('Ancient Tomb',), ('Mana Confluence',), ('Path to Exile',), ('Dimir Signet',), ('Izzet Signet',), ('Boros Signet',), ('Orzhov Signet',), ('Rakdos Signet',), ('Birds of Paradise',), ('Llanowar Elves',), ('Chromatic Lantern',), ('Overgrown Tomb',), ('Sacred Foundry',), ('Steam Vents',), ('Temple Garden',), ('Watery Grave',), ('Phyrexian Arena',), ('Mind Stone',), ('Bojuka Bog',), ('Swan Song',), ('Evolving Wilds',), ('Swords to Plowshares',), ('Windfall',), ('Mind Stone',), ('Thran Dynamo',), ('Evolving Wilds',), ('Vampiric Tutor',), ("Commander's Sphere",), ('Rhystic Study',), ('Enlightened Tutor',), ('Demonic Tutor',), ('Terramorphic Expanse',), ('Path to Exile',), ('Rhystic Study',), ('Mind Stone',), ('Counterspell',), ('Sun Titan',), ('Windfall',), ('Elvish Mystic',), ('Reclamation Sage',), ('Arcane Signet',), ('Burnished Hart',), ("Commander's Sphere",), ('Mind Stone',), ('Sol Ring',), ('Swiftfoot Boots',), ('Command Tower',), ('Myriad Landscape',), ('Heroic Intervention',), ('Bloodstained Mire',), ('Flooded Strand',), ('Polluted Delta',), ('Windswept Heath',), ('Wooded Foothills',), ('Negate',), ('Elvish Mystic',), ('Reclamation Sage',), ('Evolving Wilds',), ('Urborg, Tomb of Yawgmoth',), ('Reclamation Sage',), ('Reliquary Tower',), ('Llanowar Elves',), ('Negate',), ('Evolving Wilds',), ('Cultivate',), ('Heroic Intervention',), ('Solemn Simulacrum',), ('Fabled Passage',), ('Cultivate',), ('Solemn Simulacrum',), ('Heroic Intervention',), ('Fabled Passage',), ('Path to Exile',), ('Swords to Plowshares',), ('Arcane Denial',), ('Brainstorm',), ('Counterspell',), ('Negate',), ('Phyrexian Arena',), ('Chaos Warp',), ('Beast Within',), ('Birds of Paradise',), ('Cultivate',), ('Eternal Witness',), ('Farseek',), ('Llanowar Elves',), ('Rampant Growth',), ('Sakura-Tribe Elder',), ("Ashnod's Altar",), ('Burnished Hart',), ('Chromatic Lantern',), ('Lightning Greaves',), ('Mana Crypt',), ('Mind Stone',), ('Skullclamp',), ('Solemn Simulacrum',), ('Sol Ring',), ('Thought Vessel',), ('Thran Dynamo',), ('Bojuka Bog',), ('Evolving Wilds',), ('Reliquary Tower',), ("Rogue's Passage",), ('Temple of the False God',), ('Prismatic Vista',), ('Rampant Growth',), ("Wayfarer's Bauble",), ('Evolving Wilds',), ('Path to Exile',), ('Cyclonic Rift',), ('Boros Signet',), ('Dimir Signet',), ('Izzet Signet',), ('Orzhov Signet',), ('Rakdos Signet',), ('Arid Mesa',), ('Marsh Flats',), ('Misty Rainforest',), ('Scalding Tarn',), ('Verdant Catacombs',), ('Counterspell',), ('Chromatic Lantern',), ('Lightning Greaves',), ('Mana Crypt',), ('Mana Vault',), ('Sol Ring',), ('Solemn Simulacrum',), ('Negate',), ('Negate',), ('Evolving Wilds',), ("Rogue's Passage",), ('Heroic Intervention',), ('Heroic Intervention',), ('Llanowar Elves',), ('Beast Within',), ('Cultivate',), ('Exotic Orchard',), ('Terramorphic Expanse',), ('Llanowar Elves',), ('Gilded Lotus',), ('Gilded Lotus',), ('Fabled Passage',), ('Fabled Passage',), ('Sol Ring',), ('Path to Exile',), ('Chromatic Lantern',), ('Overgrown Tomb',), ('Sacred Foundry',), ('Steam Vents',), ('Temple Garden',), ('Watery Grave',), ('Reliquary Tower',), ('Brainstorm',), ('Fellwar Stone',), ('Swiftfoot Boots',), ('Thought Vessel',), ('Mystical Tutor',), ('Reclamation Sage',), ('Reliquary Tower',), ('Negate',), ('Heroic Intervention',), ('Heroic Intervention',), ('Solemn Simulacrum',), ('Solemn Simulacrum',), ('Fabled Passage',), ('Fabled Passage',), ('Flooded Strand',), ('Evolving Wilds',), ('Rakdos Signet',), ('Boros Signet',), ('Orzhov Signet',), ('Dimir Signet',), ('Reclamation Sage',), ('Evolving Wilds',), ('Path to Exile',), ('Temple of the False God',), ('Izzet Signet',), ('Windfall',), ('Llanowar Elves',), ('Reliquary Tower',), ('Flooded Strand',), ('Rhystic Study',), ('Brainstorm',), ('Mystical Tutor',), ('Negate',), ('Hallowed Fountain',), ('Watery Grave',), ('Blood Crypt',), ('Temple Garden',), ('Godless Shrine',), ('Steam Vents',), ('Sacred Foundry',), ('Breeding Pool',), ('Stomping Ground',), ('Overgrown Tomb',), ('Path to Exile',), ('Smothering Tithe',), ('Blood Crypt',), ('Breeding Pool',), ('Godless Shrine',), ('Hallowed Fountain',), ('Stomping Ground',), ('Evolving Wilds',), ('Eternal Witness',), ('Mana Vault',), ('Ancient Tomb',), ('Urborg, Tomb of Yawgmoth',), ('Demonic Tutor',), ('Drowned Catacomb',), ('Drowned Catacomb',), ('Brainstorm',), ('Rhystic Study',), ('Chaos Warp',), ('Cultivate',), ('Eternal Witness',), ('Sakura-Tribe Elder',), ('Sylvan Library',), ('Lightning Greaves',), ('Sol Ring',), ('Swiftfoot Boots',), ('Thought Vessel',), ('Thran Dynamo',), ('Bojuka Bog',), ('Command Tower',), ('Temple of the False God',), ('Negate',), ('Evolving Wilds',), ('Smothering Tithe',), ('Blood Crypt',), ('Breeding Pool',), ('Godless Shrine',), ('Hallowed Fountain',), ('Stomping Ground',), ('Eternal Witness',), ('Swan Song',), ('Birds of Paradise',), ('Lightning Greaves',), ('Swords to Plowshares',), ('Arcane Signet',), ('Chromatic Lantern',), ("Commander's Sphere",), ('Gilded Lotus',), ('Ponder',), ('Cultivate',), ('Evolving Wilds',), ('Marsh Flats',), ('Scalding Tarn',), ('Verdant Catacombs',), ('Arid Mesa',), ('Misty Rainforest',), ('Brainstorm',), ('Counterspell',), ('Mystical Tutor',), ('Negate',), ('Path to Exile',), ('Counterspell',), ('Rampant Growth',), ('Demonic Tutor',), ('Eternal Witness',), ("Kodama's Reach",), ('Mana Vault',), ('Ancient Tomb',), ("Rogue's Passage",), ('Terramorphic Expanse',), ('Urborg, Tomb of Yawgmoth',), ('Swords to Plowshares',), ('Brainstorm',), ('Counterspell',), ('Demonic Tutor',), ('Vampiric Tutor',), ('Chaos Warp',), ('Sylvan Library',), ('Mana Crypt',), ('Mana Vault',), ('Skullclamp',), ('Sol Ring',), ('Ancient Tomb',), ('Drowned Catacomb',), ('Sun Titan',), ("Kodama's Reach",), ('Arcane Signet',), ("Commander's Sphere",), ('Dimir Signet',), ('Mind Stone',), ('Sol Ring',), ('Command Tower',), ('Evolving Wilds',), ('Myriad Landscape',), ("Rogue's Passage",), ('Terramorphic Expanse',), ('Flooded Strand',), ('Polluted Delta',), ('Bloodstained Mire',), ('Wooded Foothills',), ('Windswept Heath',), ('Marsh Flats',), ('Scalding Tarn',), ('Verdant Catacombs',), ('Arid Mesa',), ('Misty Rainforest',), ('Ancient Tomb',), ('Prismatic Vista',), ('Negate',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(835,), (854,), (857,), (927,), (988,), (1077,), (1080,), (1148,), (1149,), (1170,), (1171,), (4342,), (4348,), (4353,), (4357,), (4472,), (4541,), (4550,), (4599,), (4668,), (5028,), (5390,), (6036,), (7117,), (7130,), (7197,), (7533,), (8534,), (8541,), (8571,), (8584,), (8652,), (8654,), (8671,), (8684,), (8693,), (8712,), (8730,), (8748,), (8750,), (8751,), (8755,), (8757,), (8761,), (8765,), (8775,), (8788,), (8794,), (8795,), (8872,), (8899,), (8907,), (8928,), (8947,), (9000,), (9005,), (9016,), (9017,), (9064,), (9065,), (9071,), (9073,), (9074,), (9076,), (9079,), (9084,), (9085,), (9086,), (9088,), (9091,), (9098,), (9100,), (9118,), (9119,), (9130,), (9131,), (9237,), (9242,), (9257,), (9263,), (9279,), (9281,), (9300,), (9305,), (9308,), (9314,), (9320,), (9323,), (9408,), (9409,), (9415,), (9421,), (9427,), (9429,), (9432,), (9433,), (9434,), (9437,), (9447,), (9455,), (9456,), (9470,), (9477,), (9492,), (9493,), (9588,), (9643,), (9659,), (9661,), (9666,), (9717,), (9718,), (9722,), (9727,), (9731,), (9733,), (9734,), (9735,), (9738,), (9742,), (9750,), (9754,), (9760,), (9761,), (9774,), (9784,), (9796,), (9797,), (9903,), (9917,), (9941,), (9943,), (9960,), (9981,), (9982,), (10022,), (10025,), (10029,), (10032,), (10035,), (10044,), (10047,), (10060,), (10062,), (10067,), (10091,), (10107,), (10108,), (10206,), (10266,), (10287,), (10289,), (10295,), (10307,), (10343,), (10344,), (10349,), (10353,), (10354,), (10357,), (10364,), (10369,), (10373,), (10374,), (10393,), (10400,), (10402,), (10412,), (10413,), (10535,), (10562,), (10580,), (10602,), (10604,), (10614,), (10620,), (10621,), (10672,), (10674,), (10675,), (10678,), (10680,), (10682,), (10684,), (10686,), (10687,), (10688,), (10689,), (10694,), (10699,), (10708,), (10727,), (10736,), (10738,), (10754,), (10762,), (10764,), (10765,), (11866,), (11884,), (11915,), (11919,), (11965,), (11966,), (12006,), (12012,), (12015,), (12019,), (12026,), (12030,), (12036,), (12047,), (12048,), (12049,), (12053,), (12054,), (12059,), (12072,), (12079,), (12080,), (12092,), (12101,), (12102,), (12103,), (12161,), (12172,), (12245,), (12249,), (12267,), (12282,), (12284,), (12354,), (12355,), (12362,), (12365,), (12368,), (12372,), (12373,), (12375,), (12377,), (12385,), (12387,), (12389,), (12403,), (12419,), (12420,), (13063,), (13069,), (13155,), (13204,), (13209,), (13213,), (13253,), (13257,), (13264,), (13294,), (13300,), (13302,), (13330,), (13331,), (13332,), (13336,), (13339,), (13341,), (13368,), (13381,), (13383,), (13388,), (13391,), (13396,), (13397,), (13398,), (13406,), (13536,), (13539,), (13541,), (13565,), (13570,), (13590,), (13598,), (13600,), (13602,), (13609,), (13611,), (13612,), (13614,), (13615,), (13619,), (13621,), (13626,), (13744,), (13771,), (13801,), (13803,), (13845,), (13846,), (13847,), (15454,), (15496,), (15561,), (15562,), (15599,), (15633,), (15837,), (15924,), (15979,), (16751,), (16798,), (17343,), (17526,), (17591,), (17625,), (17666,), (17698,), (17713,), (18031,), (18148,), (18150,), (18208,), (18223,), (18246,), (18254,), (18257,), (18276,), (18326,), (18389,), (18401,), (18432,), (18439,), (18446,), (18875,), (19077,), (19078,), (19079,), (19080,), (19081,), (19082,), (19083,), (19084,), (19085,), (19086,), (19087,), (19088,), (19089,), (19090,), (19091,), (19092,), (19093,), (19094,), (19095,), (19096,), (19107,), (19113,), (19289,), (20401,), (20426,), (20477,), (20555,), (20583,), (20589,), (20750,), (21180,), (21200,), (21201,), (21204,), (21205,), (21206,), (21625,), (21636,), (21657,), (21671,), (22878,), (23055,), (23096,), (23238,), (23249,), (23254,), (24032,), (24034,), (24037,), (24048,), (24050,), (24140,), (24189,), (24231,), (24888,), (24890,), (24962,), (24974,), (24986,), (25000,), (25024,), (25026,), (25027,), (25030,), (25032,), (25033,), (25036,), (25043,), (25924,), (26295,), (26298,), (26304,), (26313,), (26314,), (29003,), (29105,), (29126,), (29175,), (29180,), (29412,), (29471,), (29531,), (29600,), (29778,), (30053,), (30064,), (30115,), (30122,), (30193,), (30195,), (30251,), (30262,), (30470,), (30527,), (30562,), (30575,), (30610,), (30718,), (31005,), (31161,), (31410,), (31414,), (31452,), (31476,), (31482,), (31538,), (31579,), (31598,), (31825,), (31834,), (31838,), (31879,), (31882,), (31888,), (31909,), (31911,), (31912,), (31918,), (31919,), (31939,), (31944,), (31962,), (31963,), (31970,), (33371,), (33890,), (33967,), (33974,), (33999,), (34017,), (34199,), (34201,), (34205,), (34206,), (34207,), (34211,), (34221,), (34222,), (34226,), (34231,), (34970,), (35023,), (35029,), (35031,), (35032,), (35039,), (35040,), (36257,), (36981,), (37165,), (37169,), (37460,), (37461,), (37704,), (38124,), (38129,), (38184,), (38196,), (38501,), (38540,), (38541,), (38762,), (38763,), (38914,), (38915,), (39064,), (39065,), (39066,), (39067,), (39068,), (39069,), (39966,), (40014,), (40228,), (40244,), (40247,), (40286,), (40508,), (40573,), (40734,), (40802,), (40803,), (40826,), (40827,), (40834,), (40835,), (41078,), (41590,), (42341,), (42344,), (42347,), (42354,), (42474,), (42563,), (42581,), (42625,), (42689,), (42760,), (42814,), (42827,), (42828,), (42837,), (42851,), (42854,), (42856,), (42907,), (42908,), (42909,), (42910,), (42911,), (42912,), (42913,), (42914,), (42915,), (42916,), (42930,), (43051,), (43053,), (43054,), (43055,), (43056,), (43058,), (44900,), (44917,), (44931,), (44934,), (44944,), (44948,), (45304,), (45305,), (45388,), (45401,), (45424,), (45444,), (45445,), (45455,), (45457,), (45492,), (45498,), (45499,), (45500,), (45501,), (45504,), (45506,), (45518,), (46546,), (46695,), (46736,), (46969,), (46970,), (46972,), (46975,), (46983,), (48259,), (48301,), (48302,), (48309,), (48320,), (48362,), (48363,), (48364,), (48366,), (48384,), (48385,), (48425,), (48427,), (48428,), (48429,), (48430,), (48431,), (49208,), (49209,), (49211,), (49212,), (49216,), (51157,), (51301,), (52304,), (52374,), (52382,), (52441,), (52448,), (52462,), (52464,), (52466,), (53735,), (53742,), (53748,), (53800,), (53829,), (53838,), (53919,), (53956,), (53958,), (53965,), (53967,), (53973,), (55908,), (56234,), (56287,), (56321,), (56324,), (56327,), (56329,), (56335,), (56339,), (56344,), (56350,), (56353,), (56357,), (56358,), (56359,), (56360,), (56361,), (56362,), (56363,), (56364,), (56365,), (56366,), (56367,), (56378,), (56384,), (56467,)]
----------------------------
