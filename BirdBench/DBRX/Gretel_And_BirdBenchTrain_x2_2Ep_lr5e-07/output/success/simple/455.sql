-- PROBLEM # 455
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

-- External Knowledge: are a promotional painting refers to isPromo = 1; have multiple faces on the same card refers to side is not Null
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which of the cards that are a promotional painting have multiple faces on the same card? Please list their names.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.name FROM cards c WHERE c.isPromo = 1 AND c.side IS NOT NULL;
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Life // Death',), ('Fire // Ice',), ('Naughty // Nice',), ('Decorated Knight // Present Arms',), ('Nicol Bolas, the Ravager // Nicol Bolas, the Arisen',), ('Dusk // Dawn',), ('Commit // Memory',), ('Never // Return',), ('Insult // Injury',), ('Mouth // Feed',), ('Prepare // Fight',), ('Failure // Comply',), ('Rags // Riches',), ('Cut // Ribbons',), ('Heaven // Earth',), ('Budoka Pupil // Ichiga, Who Topples Oaks',), ('Breaking // Entering',), ('Ravenous Demon // Archdemon of Greed',), ("Mondronen Shaman // Tovolar's Magehunter",), ('Bonecrusher Giant // Stomp',), ('Giant Killer // Chop Down',), ("Lovestruck Beast // Heart's Desire",), ('Realm-Cloaked Giant // Cast Off',), ('Brazen Borrower // Petty Theft',), ('Fae of Wishes // Granted',), ('Murderous Rider // Swift End',), ('Voldaren Pariah // Abolisher of Bloodlines',), ('Hanweir Garrison // Hanweir, the Writhing Township',), ('Hanweir, the Writhing Township',), ('Bruna, the Fading Light // Brisela, Voice of Nightmares',), ('Brisela, Voice of Nightmares',), ('Ulrich of the Krallenhorde // Ulrich, Uncontested Alpha',), ('Hanweir Battlements // Hanweir, the Writhing Township',), ('Gisela, the Broken Blade // Brisela, Voice of Nightmares',), ('Docent of Perfection // Final Iteration',), ('Connive // Concoct',), ('Expansion // Explosion',), ('Find // Finality',), ('Assure // Assemble',), ('Response // Resurgence',), ('Leave // Chance',), ('Reason // Believe',), ('Grind // Dust',), ('Refuse // Cooperate',), ('Driven // Despair',), ('Mayor of Avabruck // Howlpack Alpha',), ("Ludevic's Test Subject // Ludevic's Abomination",), ("Tergrid, God of Fright // Tergrid's Lantern",), ('Valki, God of Lies // Tibalt, Cosmic Impostor',), ('Birgi, God of Storytelling // Harnfel, Horn of Bounty',), ("Toralf, God of Fury // Toralf's Hammer",), ('Halvar, God of Battle // Sword of the Realms',), ('Esika, God of the Tree // The Prismatic Bridge',), ('Jorn, God of Winter // Kaldring, the Rimestaff',), ('Kolvori, God of Kinship // The Ringhart Crest',), ("Reidane, God of the Worthy // Valkmira, Protector's Shield",), ('Barkchannel Pathway // Tidechannel Pathway',), ('Blightstep Pathway // Searstep Pathway',), ('Darkbore Pathway // Slitherbore Pathway',), ('Hengegate Pathway // Mistgate Pathway',), ('Alrund, God of the Cosmos // Hakka, Whispering Raven',), ('Cosima, God of the Voyage // The Omenkeel',), ('Egon, God of Death // Throne of Death',), ('Hypnotic Sprite // Mesmeric Glare',), ('Tangled Florahedron // Tangled Vale',), ('Liliana, Heretical Healer // Liliana, Defiant Necromancer',), ('Chandra, Fire of Kaladesh // Chandra, Roaring Flame',), ('Nissa, Vastwood Seer // Nissa, Sage Animist',), ('Kytheon, Hero of Akros // Gideon, Battle-Forged',), ("Jace, Vryn's Prodigy // Jace, Telepath Unbound",), ("Hadana's Climb // Winged Temple of Orazca",), ('Journey to Eternity // Atzal, Cave of Eternity',), ('Path of Mettle // Metzali, Tower of Triumph',), ('Profane Procession // Tomb of the Dusk Rose',), ('Storm the Vault // Vault of Catlacan',), ("Azor's Gateway // Sanctum of the Sun",), ('Golden Guardian // Gold-Forge Garrison',), ('Elusive Tormentor // Insidious Mist',), ('Oakhame Ranger // Bring Back',), ('Animating Faerie // Bring to Life',), ('Rimrock Knight // Boulder Rush',), ('Curious Pair // Treats to Share',), ('Lonesome Unicorn // Rider in Need',), ('Queen of Ice // Rage of Winter',), ('Smitten Swordmaster // Curry Favor',), ('Reaper of Night // Harvest Fear',), ('Embereth Shieldbreaker // Battle Display',), ('Merchant of the Vale // Haggle',), ("Garenbrig Carver // Shield's Might",), ('Beanstalk Giant // Fertile Footsteps',), ('Ardenvale Tactician // Dizzying Swoop',), ('Shepherd of the Flock // Usher to Safety',), ('Foulmire Knight // Profane Insight',), ('Flaxen Intruder // Welcome Home',), ('Tuinvale Treefolk // Oaken Boon',), ('Merfolk Secretkeeper // Venture Deeper',), ('Silverflame Squire // On Alert',), ('Order of Midnight // Alter Fate',), ('Rosethorn Acolyte // Seasonal Ritual',), ('Faerie Guidemother // Gift of the Fae',), ('Bedeck // Bedazzle',), ('Geier Reach Bandit // Vildin-Pack Alpha',), ('Hanweir Militia Captain // Westvale Cult Leader',), ('Sage of Ancient Lore // Werewolf of Ancient Hunger',), ('Arlinn Kord // Arlinn, Embraced by the Moon',), ('Westvale Abbey // Ormendahl, Profane Prince',), ('Archangel Avacyn // Avacyn, the Purifier',), ('Startled Awake // Persistent Nightmare',), ('Thing in the Ice // Awoken Horror',), ('Nightmare Moon // Princess Luna',), ("Vance's Blasting Cannons // Spitfire Bastion",), ('Growing Rites of Itlimoc // Itlimoc, Cradle of the Sun',), ("Legion's Landing // Adanto, the First Fort",), ("Conqueror's Galleon // Conqueror's Foothold",), ('Dowsing Dagger // Lost Vale',), ('Primal Amulet // Primal Wellspring',), ('Thaumatic Compass // Spires of Orazca',), ('Treasure Map // Treasure Cove',), ('Search for Azcanta // Azcanta, the Sunken Ruin',), ("Arguel's Blood Fast // Temple of Aclazotz",), ('Hagra Mauling // Hagra Broodpit',), ("Emeria's Call // Emeria, Shattered Skyclave",), ('Shatterskull Smashing // Shatterskull, the Hammer Pass',), ('Valakut Awakening // Valakut Stoneforge',), ('Kazandu Mammoth // Kazandu Valley',), ('Turntimber Symbiosis // Turntimber, Serpentine Wood',), ('Branchloft Pathway // Boulderloft Pathway',), ('Brightclimb Pathway // Grimclimb Pathway',), ('Clearwater Pathway // Murkwater Pathway',), ('Cragcrown Pathway // Timbercrown Pathway',), ('Needleverge Pathway // Pillarverge Pathway',), ('Riverglide Pathway // Lavaglide Pathway',), ('Ondu Inversion // Ondu Skyruins',), ('Glasspool Mimic // Glasspool Shore',), ('Sea Gate Restoration // Sea Gate, Reborn',), ("Agadeem's Awakening // Agadeem, the Undercrypt",)]
----------------------------
