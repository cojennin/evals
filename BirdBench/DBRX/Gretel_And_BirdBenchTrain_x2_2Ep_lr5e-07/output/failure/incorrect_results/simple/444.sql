-- PROBLEM # 444
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
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Name the foreign name of the card that has boros watermark? List out the type of this card.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.name, f.name, f.type FROM cards c JOIN foreign_data f ON c.uuid = f.uuid WHERE c.watermark = 'Boros' AND f.language = 'Russian';
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Boros Mastiff', 'Creature — Dog'), ('Blaze Commando', 'Creature — Minotaur Soldier'), ('Boros Battleshaper', 'Creature — Minotaur Soldier'), ('Gleam of Battle', 'Enchantment'), ("Legion's Initiative", 'Enchantment'), ('Tajic, Blade of the Legion', 'Legendary Creature — Human Soldier'), ('Viashino Firstblade', 'Creature — Viashino Soldier'), ("Warleader's Helix", 'Instant'), ('Boros Cluestone', 'Artifact'), ('Boros Guildgate', 'Land — Gate'), ('Hide // Seek', 'Instant'), ('Aurelia, the Warleader', 'Legendary Creature — Angel'), ('Boros Elite', 'Creature — Human Soldier'), ('Daring Skyjek', 'Creature — Human Knight'), ('Bomber Corps', 'Creature — Human Soldier'), ('Legion Loyalist', 'Creature — Goblin Soldier'), ('Agrus Kos, Wojek Veteran', 'Legendary Creature — Human Soldier'), ('Boros Charm', 'Instant'), ('Boros Reckoner', 'Creature — Minotaur Wizard'), ('Boros Swiftblade', 'Creature — Human Soldier'), ('Brightflame', 'Sorcery'), ('Firemane Angel', 'Creature — Angel'), ('Firemane Avenger', 'Creature — Angel'), ('Lightning Helix', 'Instant'), ('Martial Glory', 'Instant'), ('Master Warcraft', 'Instant'), ('Razia, Boros Archangel', 'Legendary Creature — Angel'), ('Spark Trooper', 'Creature — Elemental Soldier'), ('Sunhome Guildmage', 'Creature — Human Wizard'), ('Boros Keyrune', 'Artifact'), ('Boros Signet', 'Artifact'), ('Boros Garrison', 'Land'), ('Sunhome, Fortress of the Legion', 'Land'), ('Blade Instructor', 'Creature — Human Soldier'), ('Light of the Legion', 'Creature — Angel'), ('Parhelion Patrol', 'Creature — Human Knight'), ('Sunhome Stalwart', 'Creature — Human Soldier'), ('Barging Sergeant', 'Creature — Minotaur Soldier'), ('Goblin Banneret', 'Creature — Goblin Soldier'), ('Legion Warboss', 'Creature — Goblin Soldier'), ('Wojek Bodyguard', 'Creature — Human Soldier'), ('Aurelia, Exemplar of Justice', 'Legendary Creature — Angel'), ('Boros Challenger', 'Creature — Human Soldier'), ('Chance for Glory', 'Instant'), ('Deafening Clarion', 'Sorcery'), ('Garrison Sergeant', 'Creature — Viashino Soldier'), ('Hammer Dropper', 'Creature — Giant Soldier'), ('Justice Strike', 'Instant'), ('Legion Guildmage', 'Creature — Human Wizard'), ('Skyknight Legionnaire', 'Creature — Human Knight'), ('Swathcutter Giant', 'Creature — Giant Soldier'), ('Swiftblade Vindicator', 'Creature — Human Soldier'), ("Tajic, Legion's Edge", 'Legendary Creature — Human Soldier'), ('Truefire Captain', 'Creature — Human Knight'), ('Fresh-Faced Recruit', 'Creature — Human Soldier'), ('Integrity // Intervention', 'Instant'), ('Response // Resurgence', 'Instant'), ('Response // Resurgence', 'Sorcery'), ('Boros Locket', 'Artifact'), ('Sacred Foundry', 'Land — Mountain Plains'), ('Frontline Medic', 'Creature — Human Cleric'), ('Nav Squad Commandos', 'Creature — Human Soldier'), ('Firefist Striker', 'Creature — Human Soldier'), ('Towering Thunderfist', 'Creature — Giant Soldier'), ('Warmind Infantry', 'Creature — Elemental Soldier'), ('Assemble the Legion', 'Enchantment'), ("Aurelia's Fury", 'Instant'), ('Fortress Cyclops', 'Creature — Cyclops Soldier'), ('Foundry Champion', 'Creature — Elemental Soldier'), ('Ordruun Veteran', 'Creature — Minotaur Soldier'), ('Truefire Paladin', 'Creature — Human Knight'), ('Wojek Halberdiers', 'Creature — Human Soldier'), ('Arrows of Justice', 'Instant'), ('Shattering Blow', 'Instant'), ('Bathe in Light', 'Instant'), ('Boros Fury-Shield', 'Instant'), ('Leave No Trace', 'Instant'), ('Screeching Griffin', 'Creature — Griffin'), ('Wojek Apothecary', 'Creature — Human Cleric'), ('Wojek Siren', 'Instant'), ('Cleansing Beam', 'Instant'), ('Flash Conscription', 'Instant'), ('Incite Hysteria', 'Sorcery'), ('Ordruun Commando', 'Creature — Minotaur Soldier'), ('Surge of Zeal', 'Instant'), ('Wojek Embermage', 'Creature — Human Wizard'), ('Flame-Kin Zealot', 'Creature — Elemental Berserker'), ('Rally the Righteous', 'Instant'), ("Razia's Purification", 'Sorcery'), ('Searing Meditation', 'Enchantment'), ('Sunhome Enforcer', 'Creature — Giant Soldier'), ('Thundersong Trumpeter', 'Creature — Human Soldier'), ('Boros Guildmage', 'Creature — Human Wizard'), ('Boros Recruit', 'Creature — Goblin Soldier'), ('Sunforger', 'Artifact — Equipment')]
----------------------------
