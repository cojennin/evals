-- PROBLEM # 437
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

-- External Knowledge: white card borders refers to borderColor = 'white'; has full artwork refers to isFullArt = 1
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Among black card borders, which card has full artwork?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.name FROM cards c WHERE c.borderColor = 'black' AND c.isFullArt = 1;
----------------------------




-- RESULTS FROM GENERATED SQL
[('Plains',), ('Plains',), ('Island',), ('Island',), ('Swamp',), ('Swamp',), ('Mountain',), ('Mountain',), ('Forest',), ('Forest',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Plains',), ('Plains',), ('Plains',), ('Plains',), ('Plains',), ('Island',), ('Island',), ('Island',), ('Island',), ('Island',), ('Forest',), ('Forest',), ('Forest',), ('Forest',), ('Forest',), ('Swamp',), ('Swamp',), ('Swamp',), ('Swamp',), ('Swamp',), ('Mountain',), ('Mountain',), ('Mountain',), ('Mountain',), ('Mountain',), ('Blade of the Sixth Pride',), ('Blind Phantasm',), ('Mass of Ghouls',), ('Fomori Nomad',), ('Nessian Courser',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Sol, Advocate Eternal',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Snow-Covered Plains',), ('Snow-Covered Island',), ('Snow-Covered Swamp',), ('Snow-Covered Mountain',), ('Snow-Covered Forest',), ('Wastes',), ('Wastes',), ('Terror',), ('Fireball',), ('Oxidize',), ('Mana Leak',), ('Reciprocate',), ('Hinder',), ('Pyroclasm',), ('Giant Growth',), ('Putrefy',), ('Zombify',), ('Lightning Helix',), ('Wrath of God',), ('Condemn',), ('Mortify',), ('Psionic Blast',), ('Cruel Edict',), ('Disenchant',), ('Recollect',), ('Damnation',), ('Tidings',), ('Incinerate',), ('Mana Tithe',), ('Harmonize',), ('Ponder',), ('Corrupt',), ('Cryptic Command',), ('Flame Javelin',), ('Unmake',), ('Nameless Inversion',), ('Remove Soul',), ('Blightning',), ('Rampant Growth',), ('Negate',), ('Terminate',), ('Lightning Bolt',), ('Cancel',), ('Sign in Blood',), ('Infest',), ('Volcanic Fallout',), ('Celestial Purge',), ('Bituminous Blast',), ('Burst Lightning',), ('Harrow',), ('Day of Judgment',), ('Brave the Elements',), ('Doom Blade',), ('Treasure Hunt',), ('Searing Blaze',), ('Trophy Mage',), ("Yahenni's Expertise",), ('Glorybringer',), ('Trueheart Duelist',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Latch Seeker',), ('Killing Wave',), ('Radiant Flames',), ('Stasis Snare',), ("Kiora's Follower",), ('Pain Seer',), ('Electrolyze',), ('Niv-Mizzet, the Firemind',), ('Rakdos Guildmage',), ('Voidslime',), ("Urza's Factory",), ('Serra Avenger',), ('Blood Knight',), ('Groundbreaker',), ('Imperious Perfect',), ('Doran, the Siege Tower',), ('Bramblewood Paragon',), ('Mutavault',), ("Trostani's Summoner",), ('Melek, Izzet Paragon',), ('Strangleroot Geist',), ('Zombie Apocalypse',), ('Llanowar Elves',), ('Steel Leaf Champion',), ('Thunderbreak Regent',), ('Scaleguard Sentinels',), ("Heron's Grace Champion",), ('Unsubstantiate',), ('Lightning Bolt',), ('Path to Exile',), ('Supplant Form',), ('Mardu Shadowspear',), ('Boros Challenger',), ('Emmara, Soul of the Accord',), ('Firemane Avenger',), ('Zameck Guildmage',), ('Adorned Pouncer',), ('Abrade',), ('Elite Inquisitor',), ('Diregraf Ghoul',), ('Dictate of Kruphix',), ('Squelching Leeches',), ('Cultivator of Blades',), ('Essence Extraction',), ('Heir of the Wilds',), ('Utter End',), ('Disenchant',), ('Negate',), ('Doom Blade',), ('Abrade',), ('Burst Lightning',), ('Fomori Nomad',), ('Lightning Bolt',), ('Harmonize',), ('Imperious Perfect',), ('Terminate',), ('Plains',), ('Mycoid Shepherd',), ("Liliana's Specter",), ('Mitotic Slime',), ('Stormblood Berserker',), ('Dungrove Elder',), ('Magmaquake',), ('Mwonvuli Beast Tracker',), ('Goblin Diplomats',), ('Hive Stirrings',), ('Chief Engineer',), ('Reclamation Sage',), ('Guttersnipe',), ('Death Baron',), ('Demon of Catastrophes',), ('Nightpack Ambusher',), ('Treasure Mage',), ("Black Sun's Zenith",), ('Myr Superion',), ('Priest of Urabrask',), ('Immolating Glare',), ('Jori En, Ruin Diver',), ('Languish',), ('Conclave Naturalists',), ('Ghalta, Primal Hunger',), ('Silvergill Adept',), ('Condemn',), ('Disenchant',), ('Imperious Perfect',), ('Doran, the Siege Tower',), ('Damnation',), ('Incinerate',), ('Bramblewood Paragon',), ('Mutavault',), ('Cryptic Command',), ('Mana Leak',), ('Terror',), ('Fireball',), ('Lightning Helix',), ("Urza's Factory",), ('Unmake',), ('Electrolyze',), ('Niv-Mizzet, the Firemind',), ('Rakdos Guildmage',), ('Mortify',), ('Wrath of God',), ('Psionic Blast',), ('Recollect',), ('Cruel Edict',), ('Tidings',), ('Harmonize',), ('Mana Tithe',), ('Ponder',), ('Corrupt',), ('Flame Javelin',), ('Blightning',), ('Nameless Inversion',), ('Rampant Growth',), ('Remove Soul',), ('Terminate',), ('Negate',), ('Oxidize',), ('Reciprocate',), ('Putrefy',), ('Pyroclasm',), ('Zombify',), ('Hinder',), ('Giant Growth',), ('Blood Knight',), ('Groundbreaker',), ("Nissa's Chosen",), ('Emeria Angel',), ('Cancel',), ('Lightning Bolt',), ('Sign in Blood',), ('Voidslime',), ('Serra Avenger',), ('Staggershock',), ('Deathless Angel',), ('Bituminous Blast',), ('Celestial Purge',), ('Mitotic Slime',), ("Liliana's Specter",), ('Burst Lightning',), ('Harrow',), ('Doom Blade',), ('Brave the Elements',), ('Tempered Steel',), ('Memnite',), ('Day of Judgment',), ('Searing Blaze',), ('Treasure Hunt',), ("Black Sun's Zenith",), ('Treasure Mage',), ('Myr Superion',), ('Priest of Urabrask',), ('Dungrove Elder',), ('Elite Inquisitor',), ('Diregraf Ghoul',), ('Strangleroot Geist',), ('Zombie Apocalypse',), ('Kalastria Highborn',), ('Mycoid Shepherd',), ('Hada Freeblade',), ('Infest',), ('Volcanic Fallout',), ('Latch Seeker',), ('Killing Wave',), ('Magmaquake',), ('Mwonvuli Beast Tracker',), ('Dryad Militant',), ('Cryptborn Horror',), ('Zameck Guildmage',), ('Firemane Avenger',), ("Trostani's Summoner",), ('Melek, Izzet Paragon',), ('Hive Stirrings',), ('Goblin Diplomats',), ('Phalanx Leader',), ('Nighthowler',), ('Pain Seer',), ("Kiora's Follower",), ('Dictate of Kruphix',), ('Squelching Leeches',), ('Chief Engineer',), ('Reclamation Sage',), ('Forest',), ('Mountain',), ('Plains',), ('Island',), ('Swamp',), ('Heir of the Wilds',), ('Utter End',), ('Mardu Shadowspear',), ('Supplant Form',), ('Scaleguard Sentinels',), ('Thunderbreak Regent',), ('Languish',), ('Conclave Naturalists',), ('Stasis Snare',), ('Radiant Flames',), ('Immolating Glare',), ('Jori En, Ruin Diver',), ('Anguished Unmaking',), ('Incorrigible Youths',), ('Unsubstantiate',), ("Heron's Grace Champion",), ('Essence Extraction',), ('Cultivator of Blades',), ("Yahenni's Expertise",), ('Trophy Mage',), ('Trueheart Duelist',), ('Glorybringer',), ('Adorned Pouncer',), ('Abrade',), ('Walk the Plank',), ('Silvergill Adept',), ('Llanowar Elves',), ('Steel Leaf Champion',), ('Demon of Catastrophes',), ('Guttersnipe',), ('Death Baron',), ('Emmara, Soul of the Accord',), ('Boros Challenger',), ('Lavinia, Azorius Renegade',), ('Rakdos Firewheeler',), ('Hallowed Fountain',), ('Watery Grave',), ('Blood Crypt',), ('Temple Garden',), ('Godless Shrine',), ('Steam Vents',), ('Sacred Foundry',), ('Breeding Pool',), ('Stomping Ground',), ('Overgrown Tomb',), ('Lavinia, Azorius Renegade',), ('Rakdos Firewheeler',), ('Staggershock',), ('Deathless Angel',), ('Cryptborn Horror',), ('Dryad Militant',), ('Incorrigible Youths',), ('Anguished Unmaking',), ('Tempered Steel',), ('Memnite',), ('Phalanx Leader',), ('Nighthowler',), ('Time Wipe',), ("Liliana's Triumph",), ('Hada Freeblade',), ('Kalastria Highborn',), ('Walk the Plank',), ('Deeproot Champion',), ("Nissa's Chosen",), ('Emeria Angel',), ('Storm Crow',), ('Goblin Snowman',), ('Mudhole',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Heliod, God of the Sun',), ('Karametra, God of Harvests',), ('Iroas, God of Victory',), ('Thassa, God of the Sea',), ('Ephara, God of the Polis',), ('Kruphix, God of Horizons',), ('Erebos, God of the Dead',), ('Phenax, God of Deception',), ('Athreos, God of Passage',), ('Purphoros, God of the Forge',), ('Mogis, God of Slaughter',), ('Keranos, God of Storms',), ('Nylea, God of the Hunt',), ('Xenagos, God of Revels',), ('Pharika, God of Affliction',), ('Swamp',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Plains',), ('Island',), ('Swamp',), ('Mountain',), ('Forest',), ('Plains',), ('Plains',), ('Plains',), ('Plains',), ('Island',), ('Island',), ('Island',), ('Island',), ('Swamp',), ('Swamp',), ('Swamp',), ('Swamp',), ('Mountain',), ('Mountain',), ('Mountain',), ('Mountain',), ('Forest',), ('Forest',), ('Forest',), ('Forest',), ('Plains',), ('Plains',), ('Plains',), ('Island',), ('Island',), ('Island',), ('Swamp',), ('Swamp',), ('Swamp',), ('Mountain',), ('Mountain',), ('Mountain',), ('Forest',), ('Forest',), ('Forest',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(1183,), (1184,), (1185,), (1186,), (1187,), (1188,), (1189,), (1190,), (1191,), (1192,), (5036,), (5037,), (5038,), (5039,), (5040,), (5901,), (5919,), (5921,), (5923,), (5925,), (7411,), (7413,), (7415,), (7417,), (7419,), (7421,), (7423,), (7428,), (7430,), (7432,), (7434,), (7436,), (7440,), (7445,), (7448,), (7543,), (7545,), (7547,), (7549,), (7551,), (7553,), (7554,), (7556,), (7558,), (7561,), (20148,), (20178,), (20217,), (20243,), (20277,), (22214,), (22215,), (22216,), (22217,), (22218,), (22247,), (23993,), (23995,), (23997,), (23999,), (24001,), (33377,), (33378,), (33379,), (33380,), (33381,), (36382,), (36383,), (37399,), (37400,), (37401,), (37402,), (37403,), (37405,), (37406,), (37407,), (37408,), (37409,), (37410,), (37411,), (37412,), (37413,), (37414,), (37415,), (37416,), (37417,), (37418,), (37419,), (37420,), (37421,), (37422,), (37423,), (37424,), (37425,), (37426,), (37427,), (37428,), (37429,), (37430,), (37431,), (37432,), (37433,), (37434,), (37435,), (37436,), (37437,), (37438,), (37439,), (37440,), (37441,), (37442,), (37444,), (37445,), (37446,), (37447,), (37448,), (37498,), (37509,), (37525,), (37587,), (37713,), (37714,), (37715,), (37716,), (37717,), (37743,), (37744,), (37745,), (37746,), (37747,), (37748,), (37749,), (37750,), (37751,), (37752,), (37753,), (37754,), (37755,), (37756,), (37757,), (37788,), (37789,), (37831,), (37886,), (37901,), (37906,), (38237,), (38238,), (38239,), (38240,), (38241,), (38242,), (38243,), (38244,), (38245,), (38246,), (38247,), (38248,), (38462,), (38467,), (38471,), (38474,), (38501,), (38507,), (38617,), (38624,), (38865,), (38895,), (38908,), (38915,), (38947,), (38954,), (39038,), (39039,), (39102,), (39106,), (39166,), (39185,), (39412,), (39417,), (39440,), (39444,), (39669,), (39728,), (39744,), (39779,), (39980,), (40036,), (40060,), (40091,), (40095,), (40099,), (40111,), (40144,), (40147,), (40200,), (40273,), (40475,), (40477,), (40481,), (40483,), (40484,), (40488,), (40489,), (40492,), (40495,), (40499,), (40508,), (40528,), (40596,), (40599,), (40651,), (40892,), (40893,), (41081,), (41083,), (41123,), (41130,), (41406,), (41424,), (41542,), (41611,), (41697,), (41703,), (41709,), (41710,), (41713,), (41714,), (41716,), (41717,), (41728,), (41743,), (41744,), (41745,), (41746,), (41749,), (41813,), (41826,), (41827,), (41830,), (41840,), (41841,), (41846,), (41847,), (41848,), (41855,), (41870,), (41871,), (41876,), (41877,), (41878,), (41879,), (41880,), (41881,), (41882,), (41885,), (41886,), (41898,), (41899,), (41900,), (41901,), (41902,), (41903,), (41909,), (41941,), (41985,), (42057,), (42058,), (42060,), (42061,), (42062,), (42105,), (42107,), (42113,), (42114,), (42116,), (42117,), (42134,), (42135,), (42139,), (42140,), (42146,), (42147,), (42151,), (42154,), (42155,), (42165,), (42166,), (42167,), (42171,), (42197,), (42198,), (42217,), (42231,), (42232,), (42243,), (42244,), (42255,), (42257,), (42258,), (42263,), (42264,), (42306,), (42308,), (42320,), (42322,), (42329,), (42334,), (42380,), (42382,), (42395,), (42397,), (42401,), (42403,), (42416,), (42419,), (42434,), (42439,), (42456,), (42458,), (42468,), (42474,), (42482,), (42483,), (42484,), (42485,), (42486,), (42498,), (42502,), (42515,), (42518,), (42564,), (42569,), (42587,), (42589,), (42614,), (42615,), (42633,), (42638,), (42648,), (42651,), (42672,), (42675,), (42680,), (42684,), (42765,), (42772,), (42776,), (42777,), (42785,), (42789,), (42806,), (42810,), (42814,), (42817,), (42825,), (42826,), (42829,), (42841,), (42842,), (42865,), (42866,), (42907,), (42908,), (42909,), (42910,), (42911,), (42912,), (42913,), (42914,), (42915,), (42916,), (43034,), (43038,), (43080,), (43081,), (43090,), (43091,), (44145,), (44170,), (44220,), (44221,), (44710,), (44716,), (45084,), (45167,), (45215,), (45216,), (45233,), (45256,), (45804,), (45805,), (48270,), (48271,), (48272,), (48273,), (48274,), (48275,), (48276,), (48277,), (48278,), (48279,), (48280,), (48281,), (48282,), (48283,), (48284,), (48285,), (48286,), (48287,), (48288,), (48289,), (48290,), (48291,), (48292,), (48329,), (50242,), (50243,), (50244,), (50245,), (50246,), (52064,), (52065,), (52066,), (52067,), (52068,), (52558,), (52560,), (52562,), (52564,), (52566,), (52731,), (52732,), (52733,), (52734,), (52735,), (56177,), (56179,), (56181,), (56183,), (56185,), (56186,), (56187,), (56188,), (56189,), (56191,), (56193,), (56195,), (56197,), (56199,), (56201,), (56203,), (56205,), (56207,), (56209,), (56211,), (56689,), (56690,), (56691,), (56692,), (56693,), (56694,), (56695,), (56696,), (56697,), (56698,), (56699,), (56700,), (56701,), (56702,), (56703,)]
----------------------------
