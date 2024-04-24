-- PROBLEM # 387
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

-- External Knowledge: set OGW refers to setCode = 'OGW';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What are the cards for set OGW? State the colour for these cards.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.name, c.colors FROM cards c WHERE c.setCode = 'OGW';
----------------------------




-- RESULTS FROM PREDICTION
[('Deceiver of Form', None), ('Eldrazi Mimic', None), ('Endbringer', None), ('Kozilek, the Great Distortion', None), ("Kozilek's Pathfinder", None), ('Matter Reshaper', None), ('Reality Smasher', None), ('Spatial Contortion', None), ('Thought-Knot Seer', None), ('Walker of the Wastes', None), ('Warden of Geometries', None), ('Warping Wail', None), ('Eldrazi Displacer', None), ('Affa Protector', 'W'), ('Allied Reinforcements', 'W'), ('Call the Gatewatch', 'W'), ('Dazzling Reflection', 'W'), ('Expedition Raptor', 'W'), ('Wastes', None), ('Wastes', None), ('General Tazri', 'W'), ('Immolating Glare', 'W'), ("Iona's Blessing", 'W'), ('Isolation Zone', 'W'), ('Kor Scythemaster', 'W'), ('Kor Sky Climber', 'W'), ('Linvala, the Preserver', 'W'), ('Make a Stand', 'W'), ('Makindi Aeronaut', 'W'), ('Mighty Leap', 'W'), ("Munda's Vanguard", 'W'), ('Oath of Gideon', 'W'), ('Ondu War Cleric', 'W'), ('Relief Captain', 'W'), ('Searing Light', 'W'), ('Shoulder to Shoulder', 'W'), ('Spawnbinder Mage', 'W'), ('Steppe Glider', 'W'), ('Stone Haven Outfitter', 'W'), ('Stoneforge Acolyte', 'W'), ('Wall of Resurgence', 'W'), ('Abstruse Interference', None), ('Blinding Drone', None), ('Cultivator Drone', None), ('Deepfathom Skulker', None), ('Dimensional Infiltrator', None), ('Gravity Negator', None), ('Prophet of Distortion', None), ('Slip Through Space', None), ('Thought Harvester', None), ('Void Shatter', None), ('Ancient Crab', 'U'), ('Comparative Analysis', 'U'), ('Containment Membrane', 'U'), ('Crush of Tentacles', 'U'), ('Cyclone Sire', 'U'), ('Gift of Tusks', 'U'), ('Grip of the Roil', 'U'), ('Hedron Alignment', 'U'), ('Jwar Isle Avenger', 'U'), ('Negate', 'U'), ('Oath of Jace', 'U'), ('Overwhelming Denial', 'U'), ('Roiling Waters', 'U'), ('Sphinx of the Final Word', 'U'), ('Sweep Away', 'U'), ('Umara Entangler', 'U'), ('Unity of Purpose', 'U'), ('Bearer of Silence', None), ('Dread Defiler', None), ('Essence Depleter', None), ('Flaying Tendrils', None), ('Havoc Sower', None), ('Inverter of Truth', None), ("Kozilek's Shrieker", None), ("Kozilek's Translator", None), ('Oblivion Strike', None), ('Reaver Drone', None), ('Sifter of Skulls', None), ('Sky Scourer', None), ('Slaughter Drone', None), ('Unnatural Endurance', None), ('Visions of Brutality', None), ('Witness the End', None), ('Corpse Churn', 'B'), ("Drana's Chosen", 'B'), ('Grasp of Darkness', 'B'), ('Kalitas, Traitor of Ghet', 'B'), ('Malakir Soothsayer', 'B'), ('Null Caller', 'B'), ('Remorseless Punishment', 'B'), ('Tar Snare', 'B'), ('Untamed Hunger', 'B'), ('Vampire Envoy', 'B'), ('Zulaport Chainmage', 'B'), ('Consuming Sinkhole', None), ('Eldrazi Aggressor', None), ('Eldrazi Obligator', None), ('Immobilizer Eldrazi', None), ("Kozilek's Return", None), ('Maw of Kozilek', None), ('Reality Hemorrhage', None), ('Akoum Flameseeker', 'R'), ('Boulder Salvo', 'R'), ('Brute Strength', 'R'), ('Chandra, Flamecaller', 'R'), ('Cinder Hellion', 'R'), ('Devour in Flames', 'R'), ('Embodiment of Fury', 'R'), ('Expedite', 'R'), ('Fall of the Titans', 'R'), ('Goblin Dark-Dwellers', 'R'), ('Goblin Freerunner', 'R'), ("Kazuul's Toll Collector", 'R'), ('Oath of Chandra', 'R'), ('Press into Service', 'R'), ("Pyromancer's Assault", 'R'), ('Reckless Bushwhacker', 'R'), ("Sparkmage's Gambit", 'R'), ('Tears of Valakut', 'R'), ('Tyrant of Valakut', 'R'), ("Zada's Commando", 'R'), ('Birthing Hulk', None), ('Ruin in Their Wake', None), ('Scion Summoner', None), ('Stalking Drone', None), ('Vile Redeemer', None), ('World Breaker', None), ('Baloth Pup', 'G'), ('Bonds of Mortality', 'G'), ('Canopy Gorger', 'G'), ('Elemental Uprising', 'G'), ('Embodiment of Insight', 'G'), ('Gladehart Cavalry', 'G'), ('Harvester Troll', 'G'), ('Lead by Example', 'G'), ('Loam Larva', 'G'), ('Natural State', 'G'), ('Netcaster Spider', 'G'), ('Nissa, Voice of Zendikar', 'G'), ("Nissa's Judgment", 'G'), ('Oath of Nissa', 'G'), ('Pulse of Murasa', 'G'), ('Saddleback Lagac', 'G'), ('Seed Guardian', 'G'), ('Sylvan Advocate', 'G'), ('Tajuru Pathwarden', 'G'), ('Vines of the Recluse', 'G'), ('Zendikar Resurgent', 'G'), ('Flayer Drone', None), ('Mindmelter', None), ('Void Grafter', None), ('Ayli, Eternal Pilgrim', 'B,W'), ('Baloth Null', 'B,G'), ('Cliffhaven Vampire', 'B,W'), ('Joraga Auxiliary', 'G,W'), ('Jori En, Ruin Diver', 'R,U'), ('Mina and Denn, Wildborn', 'G,R'), ('Reflector Mage', 'U,W'), ('Relentless Hunter', 'G,R'), ('Stormchaser Mage', 'R,U'), ('Weapons Trainer', 'R,W'), ('Bone Saw', None), ("Captain's Claws", None), ("Captain's Claws", None), ('Chitinous Cloak', None), ('Hedron Crawler', None), ("Seer's Lantern", None), ('Stoneforge Masterwork', None), ('Strider Harness', None), ('Cinder Barrens', None), ('Corrupted Crossroads', None), ('Crumbling Vestige', None), ('Hissing Quagmire', None), ('Holdout Settlement', None), ('Meandering River', None), ('Mirrorpool', None), ('Needle Spires', None), ('Ruins of Oran-Rief', None), ('Sea Gate Wreckage', None), ('Submerged Boneyard', None), ('Timber Gorge', None), ('Tranquil Expanse', None), ('Unknown Shores', None), ('Wandering Fumarole', None), ('Wastes', None), ('Wastes', None)]
----------------------------



-- ACTUAL RESULTS
[(851, 'U'), (852, 'U'), (853, 'U'), (854, 'U'), (855, 'U'), (856, 'U'), (857, 'U'), (858, 'U'), (859, 'U'), (860, 'U')]
----------------------------
