-- PROBLEM # 464
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

-- External Knowledge: card set "Hauptset Zehnte Edition" refers to translation = 'Hauptset Zehnte Edition'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the names of the cards in the set "Hauptset Zehnte Edition".
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT cards.name FROM cards INNER JOIN sets ON cards.setCode = sets.code WHERE sets.name = 'Hauptset Zehnte Edition';
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Abundance',), ('Academy Researchers',), ('Adarkar Wastes',), ('Afflict',), ('Aggressive Urge',), ('Agonizing Memories',), ('Air Elemental',), ('Ambassador Laquatus',), ('Anaba Bodyguard',), ("Ancestor's Chosen",), ('Angel of Mercy',), ("Angel's Feather",), ('Angelic Blessing',), ('Angelic Chorus',), ('Angelic Wall',), ('Arcane Teachings',), ('Arcanis the Omnipotent',), ('Ascendant Evincar',), ('Assassinate',), ('Aura Graft',), ('Aura of Silence',), ('Avatar of Might',), ('Aven Cloudchaser',), ('Aven Fisher',), ('Aven Windreader',), ('Ballista Squad',), ('Bandage',), ('Battlefield Forge',), ('Beacon of Destruction',), ('Beacon of Immortality',), ('Beacon of Unrest',), ('Benalish Knight',), ('Birds of Paradise',), ('Blanchwood Armor',), ('Blaze',), ('Bloodfire Colossus',), ('Bloodrock Cyclops',), ('Bog Wraith',), ('Bogardan Firefiend',), ('Boomerang',), ('Bottle Gnomes',), ('Brushland',), ('Cancel',), ('Canopy Spider',), ('Caves of Koilos',), ('Cephalid Constable',), ('Chimeric Staff',), ('Cho-Manno, Revolutionary',), ('Chromatic Star',), ('Citanul Flute',), ('Civic Wayfinder',), ('Clone',), ('Cloud Elemental',), ('Cloud Sprite',), ('Coat of Arms',), ('Colossus of Sardia',), ('Commune with Nature',), ('Composite Golem',), ('Condemn',), ('Cone of Flame',), ('Consume Spirit',), ('Contaminated Bond',), ('Counsel of the Soratami',), ('Crafty Pathmage',), ('Craw Wurm',), ('Creeping Mold',), ('Crucible of Worlds',), ('Cruel Edict',), ('Cryoclasm',), ('Deathmark',), ('Dehydration',), ('Deluge',), ('Demolish',), ("Demon's Horn",), ('Demystify',), ('Denizen of the Deep',), ('Diabolic Tutor',), ('Discombobulate',), ('Distress',), ('Doomed Necromancer',), ('Doubling Cube',), ('Dragon Roost',), ("Dragon's Claw",), ('Dreamborn Muse',), ('Dross Crocodile',), ('Drudge Skeletons',), ('Duct Crawler',), ('Dusk Imp',), ('Earth Elemental',), ('Elven Riders',), ('Elvish Berserker',), ('Elvish Champion',), ('Elvish Piper',), ('Enormous Baloth',), ('Essence Drain',), ('Evacuation',), ('Faerie Conclave',), ('Fear',), ('Femeref Archers',), ('Festering Goblin',), ('Field Marshal',), ('Firebreathing',), ('Fists of the Anvil',), ('Flamewave Invoker',), ('Flashfreeze',), ('Flowstone Slide',), ('Fog Elemental',), ('Forbidding Watchtower',), ('Forest',), ('Fountain of Youth',), ('Fugitive Wizard',), ('Furnace Whelp',), ('Furnace of Rath',), ("Gaea's Herald",), ('Ghitu Encampment',), ('Ghost Warden',), ('Giant Growth',), ('Giant Spider',), ('Glorious Anthem',), ('Goblin Elite Infantry',), ('Goblin King',), ('Goblin Lore',), ('Goblin Piker',), ('Goblin Sky Raider',), ('Grave Pact',), ('Graveborn Muse',), ('Gravedigger',), ('Grizzly Bears',), ('Guerrilla Tactics',), ('Hail of Arrows',), ('Hate Weaver',), ('Head Games',), ('Heart of Light',), ('Hidden Horror',), ('High Ground',), ('Highway Robber',), ('Hill Giant',), ('Holy Day',), ('Holy Strength',), ('Honor Guard',), ('Horseshoe Crab',), ('Howling Mine',), ('Hunted Wumpus',), ("Hurkyl's Recall",), ('Hurricane',), ('Hypnotic Specter',), ('Icatian Priest',), ('Icy Manipulator',), ('Incinerate',), ('Island',), ('Jayemdae Tome',), ('Joiner Adept',), ('Juggernaut',), ('Kamahl, Pit Fighter',), ('Karplusan Forest',), ('Karplusan Strider',), ('Kavu Climber',), ('Kjeldoran Royal Guard',), ('Knight of Dusk',), ("Kraken's Eye",), ('Lava Axe',), ('Lavaborn Muse',), ('Legacy Weapon',), ('Leonin Scimitar',), ('Lightning Elemental',), ('Llanowar Elves',), ('Llanowar Sentinel',), ('Llanowar Wastes',), ('Looming Shade',), ('Lord of the Pit',), ('Lord of the Undead',), ('Loxodon Mystic',), ('Loxodon Warhammer',), ('Loyal Sentry',), ('Lumengrid Warden',), ('Luminesce',), ('Lure',), ('Mahamoti Djinn',), ('Manabarbs',), ('Mantis Engine',), ('March of the Machines',), ('Mass of Ghouls',), ('Megrim',), ('Merfolk Looter',), ('Midnight Ritual',), ('Might Weaver',), ('Might of Oaks',), ('Millstone',), ('Mind Bend',), ('Mind Rot',), ('Mind Stone',), ('Mirri, Cat Warrior',), ('Mobilization',), ('Mogg Fanatic',), ('Molimo, Maro-Sorcerer',), ('Mortal Combat',), ('Mortivore',), ('Mountain',), ('Nantuko Husk',), ('Natural Spring',), ('Naturalize',), ('Nekrataal',), ('Nightmare',), ('No Rest for the Wicked',), ('Nomad Mythmaker',), ('Orcish Artillery',), ('Ornithopter',), ('Overgrowth',), ('Overrun',), ('Pacifism',), ('Paladin en-Vec',), ('Pariah',), ('Peek',), ('Persuasion',), ('Phage the Untouchable',), ('Phantom Warrior',), ('Phyrexian Rager',), ('Phyrexian Vault',), ('Pincher Beetles',), ('Pithing Needle',), ('Plagiarize',), ('Plague Beetle',), ('Plague Wind',), ('Plains',), ('Platinum Angel',), ('Primal Rage',), ('Prodigal Pyromancer',), ('Puppeteer',), ('Pyroclasm',), ('Quicksand',), ('Quirion Dryad',), ('Rage Weaver',), ('Raging Goblin',), ('Rain of Tears',), ('Rampant Growth',), ('Ravenous Rats',), ('Razormane Masticore',), ('Recollect',), ('Recover',), ('Regeneration',), ('Relentless Assault',), ('Relentless Rats',), ('Reminisce',), ('Remove Soul',), ('Reviving Dose',), ('Reya Dawnbringer',), ('Rhox',), ('Righteousness',), ('Robe of Mirrors',), ('Rock Badger',), ('Rod of Ruin',), ('Root Maze',), ('Rootwalla',), ('Rootwater Commando',), ('Rootwater Matriarch',), ('Royal Assassin',), ('Rule of Law',), ('Rushwood Dryad',), ('Sage Owl',), ('Samite Healer',), ('Scalpelexis',), ('Scathe Zombies',), ('Scion of the Wild',), ('Scoria Wurm',), ('Sculpting Steel',), ('Sea Monster',), ('Seedborn Muse',), ('Seismic Assault',), ('Sengir Vampire',), ('Serra Angel',), ("Serra's Embrace",), ('Severed Legion',), ('Shatterstorm',), ('Shimmering Wings',), ('Shivan Dragon',), ('Shivan Hellkite',), ('Shivan Reef',), ('Shock',), ('Shunt',), ('Siege-Gang Commander',), ('Sift',), ('Sky Weaver',), ('Skyhunter Patrol',), ('Skyhunter Prowler',), ('Skyhunter Skirmisher',), ('Skyshroud Ranger',), ('Sleeper Agent',), ('Smash',), ('Snapping Drake',), ('Soul Feast',), ('Soul Warden',), ('Soulblast',), ('Spark Elemental',), ('Spawning Pool',), ('Spellbook',), ('Spiketail Hatchling',), ('Spined Wurm',), ('Spineless Thug',), ('Spirit Link',), ('Spirit Weaver',), ('Spitting Earth',), ('Squee, Goblin Nabob',), ('Stalking Tiger',), ('Stampeding Wildebeests',), ('Starlight Invoker',), ('Steadfast Guard',), ('Steel Golem',), ('Story Circle',), ('Stronghold Discipline',), ('Stun',), ('Sudden Impact',), ('Sulfurous Springs',), ('Sunken Hope',), ('Suntail Hawk',), ('Swamp',), ('Sylvan Basilisk',), ('Sylvan Scrying',), ('Tangle Spider',), ('Telepathy',), ('Telling Time',), ('Tempest of Light',), ('Terramorphic Expanse',), ('Terror',), ('The Hive',), ('Thieving Magpie',), ('Threaten',), ('Thrull Surgeon',), ('Thundering Giant',), ('Tidings',), ('Time Stop',), ('Time Stretch',), ('Traumatize',), ('Treasure Hunter',), ('Treetop Bracers',), ('Treetop Village',), ('Troll Ascetic',), ('True Believer',), ('Tundra Wolves',), ('Twincast',), ('Twitch',), ('Uncontrollable Anger',), ('Underground River',), ('Underworld Dreams',), ('Unholy Strength',), ('Unsummon',), ('Upwelling',), ('Vampire Bats',), ('Vedalken Mastermind',), ('Venerable Monk',), ('Verdant Force',), ('Viashino Runner',), ('Viashino Sandscout',), ('Viridian Shaman',), ('Voice of All',), ('Wall of Air',), ('Wall of Fire',), ('Wall of Swords',), ('Wall of Wood',), ('Warp World',), ("Warrior's Honor",), ('Whispersilk Cloak',), ('Wild Griffin',), ('Windborn Muse',), ('Wrath of God',), ("Wurm's Tooth",), ('Yavimaya Coast',), ('Yavimaya Enchantress',), ('Youthful Knight',)]
----------------------------
