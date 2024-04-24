-- PROBLEM # 348
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

-- External Knowledge: Sublime Epiphany' is name of cards; number 74s refers to number = '74s'; information refers to text;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Describe the information about rulings for card named 'Sublime Epiphany' with number 74s.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT r.text FROM rulings r WHERE r.uuid IN (SELECT c.uuid FROM cards c WHERE c.name = 'Sublime Epiphany' AND c.number = '74s')
----------------------------






-- ACTUAL RESULTS
[('You can’t choose any one mode more than once.',), ('If any of the targets become illegal, the remaining targets are affected as appropriate.',), ('If you choose more than one mode, you perform the modes in the order specified. For example, if you choose to counter target spell, return target nonland permanent to its owner’s hand, and have target player draw a card, that permanent will be on the batt',), ('Sublime Epiphany’s second mode counters only activated and triggered abilities already on the stack. It doesn’t prevent abilities from being activated or from triggering later in the turn, and it has no effect on static abilities.',), ('Activated abilities are written in the form “[Cost]: [Effect].” Some keyword abilities (such as equip) are activated abilities and will have colons in their reminder texts.',), ('Triggered abilities use the word “when,” “whenever,” or “at.” They’re often written as “[Trigger condition], [effect].” Some keyword abilities (such as prowess) are triggered abilities and will have “when,” “whenever,” or “at” in their reminder text.',), ('Abilities that create replacement effects, such as a permanent entering the battlefield tapped or with counters on it, can’t be countered. Abilities that apply “as [this creature] enters the battlefield” are also replacement effects and can’t be countered',), ('Sublime Epiphany’s second mode can’t counter an activated or triggered mana ability. An activated mana ability is one that adds mana to a player’s mana pool as it resolves, doesn’t have a target, and isn’t a loyalty ability. A triggered mana ability is on',), ('If you counter a delayed triggered ability that triggered at the beginning of the “next” occurrence of a specified step or phase, that ability won’t trigger again the following time that phase or step occurs.',), ('If you choose the third and fourth modes and target the same creature you control both times, you’ll return it and then create a token that’s a copy of it, using its copiable values as it last appeared on the battlefield. This is because the legality of t',), ('The token copies exactly what is printed on the creature and nothing else (unless that creature is a token or is copying something else; see below). It doesn’t copy whether that creature is tapped or untapped, whether it has any counters on it or Auras an',), ('If the copied creature is itself a token, the token created by Sublime Epiphany copies the original characteristics of that token as stated by the effect that created it.',), ('If the copied creature is copying something else, the token enters the battlefield as whatever that creature is copying.',), ('If the copied creature has {X} in its mana cost, X is 0.',), ('Any enters-the-battlefield abilities of the copied creature will trigger when the token enters the battlefield. Any “As [this creature] enters the battlefield” or “[This creature] enters the battlefield with” abilities of the copied creature will also wor',)]
----------------------------
