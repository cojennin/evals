-- PROBLEM # 525
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

-- External Knowledge: old school format refers to format = 'oldschool'; restricted or banned refers to status = 'banned' or 'restricted'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Find the uuid of cards in which the old school format is restricted or banned.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT uuid FROM legalities WHERE format = 'oldschool' AND status IN ('banned', 'restricted');
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('59b60f89-e041-57a4-aef1-930d44cb5de5',), ('89470421-c7fa-5cc1-9bce-ccbbb02b5a06',), ('9aa589ba-91e7-5122-a28a-b0b61cab578e',), ('1efe8ae8-d268-54c2-b47a-71f11bd72934',), ('5e1fa5a2-e24d-521c-8f2a-ba506acb8201',), ('60124c14-dc29-5c80-af4e-620dc2020046',), ('6614c4a8-5ae6-502a-af01-6c35568ff5c0',), ('1ad070b0-a4ab-5658-b599-1178c86a379e',), ('56d2fcd7-44c9-5be7-a414-94d854b3d42c',), ('bc839ef4-8aba-5a23-a104-fcc4cb7cf742',), ('5bbffa23-158c-5d91-9558-a3639b15227c',), ('5887c378-5053-58fe-b60a-813773964d8c',), ('869695f6-f327-5599-adfe-dcad1d3c6397',), ('e6c9fe58-bc4f-529d-a387-77d61af87de4',), ('22768213-dec8-5450-89b2-865bd07ccd52',), ('2e215e8c-398c-5209-93c0-7007b286b881',), ('98a56059-ab98-5574-afc9-56d4f47060cc',), ('d7c371a4-bc40-5bd8-a486-220584bf4b84',), ('eaa5126d-835e-5649-952a-8109a5f041ee',), ('afca2e3b-9441-5788-a222-62d9b2e4d44f',), ('fe19ba78-b922-5ce5-8ad9-276a3cfabf57',), ('d8ccffc4-a860-528e-a81a-890a80e63ea6',), ('a8eea8c6-ceff-5bd2-83dc-257ea79e7946',), ('de475120-3152-5382-b29d-c3af4e84c085',), ('c6d961c9-b5d8-5b77-a8f5-075d103fe7d9',), ('0a5ad1ce-bc94-516c-9a59-002211c657b4',), ('0242fe38-00c4-51e3-9f77-0d2407a6e5ab',), ('da8f86f9-f3f4-5ca2-b316-5e6be2acbbea',), ('66a85f82-ac1f-520f-b052-6a1360b2423c',), ('6cb2723e-f6eb-52b2-bc68-b53268ce4cdd',), ('ffd1619a-8b42-5615-83fa-4840d3cccf89',), ('32ca9987-b8ae-5582-9417-ac94889bef7d',), ('1883bedf-2a7e-54b3-9d1d-4bb10ab6a148',), ('63249fc5-9772-5ab6-aae1-6e9310dab473',), ('ad44c9a4-b7f0-5bff-a5cd-dcd576d7c084',), ('1fd6bd7b-a754-5d97-89e3-e84336d848f7',), ('6172d215-b718-5306-b2f9-6cbda5bfbed3',), ('82fd3e6e-9c58-575e-8afe-5f6132d07ec3',), ('f05a01b1-71d1-51b1-98bd-300759e513b0',), ('aa01daf8-4a9d-593d-bb99-58e676862a4a',), ('0440e3de-3b4f-5480-83f8-18576526ebc8',), ('c395c80e-298a-5870-8877-cd0a7e273146',), ('47a60b39-e13f-5741-a332-bab38681d506',), ('1e25ccea-8015-58cb-921b-e273daca28cd',), ('cef4942a-1db6-5961-af91-017afd367bbc',), ('43a2b50a-10e4-5e38-9923-214ff7c869ce',), ('19b442fe-8e7e-5999-b16d-bf6f79cc6b45',), ('352e85ba-b964-524e-8612-9b843684cf9e',), ('0e7e50ba-e06e-5d02-8d2c-2fad1eccd935',), ('c7cbcb30-c3d5-5916-bef7-d243bf6cc7c8',), ('d44e279c-1df8-5903-bf15-f44705e19945',), ('49953d01-cc4a-5549-928b-759cd2320288',), ('92b74a07-fe74-55a2-b810-fcbf5a86444f',), ('384503dc-e467-5027-a41c-2a9727788347',), ('ea29f6b3-77b0-5359-858a-f279ea66cf57',), ('f42be772-5a3f-50ec-98e9-65cbacc3ea88',), ('ecfef046-ee24-54ca-9670-7fc2d09e09dc',), ('d07d3e82-7560-5d33-81a5-ac98ac048f29',), ('67e05e37-4373-5019-9141-b31cf469076a',), ('7ce27226-84fd-56df-b637-933814529987',), ('3ea68549-a2e2-5331-a47c-f993694a5880',), ('32efdb45-e2e4-59eb-8cc7-189fee05b88b',), ('4e4b8e5a-eb6f-5cc8-ad5f-dc90786ce59e',), ('b4ab21b9-6bff-52b0-8d15-97ad3a084d4c',), ('3ce0b3f0-1c72-5d36-a9fb-82fc2b0aca19',), ('e5cc0323-44ee-5cdd-9860-f4d6338dbeee',), ('bd5433da-de71-5248-9c7e-6df13f49659c',), ('fb388ae3-9107-5fde-a6c3-84ae343a42c0',), ('1ef89b62-1763-5499-9d4c-8380fe3845bd',), ('fc1e04db-2186-5eec-b50c-d91b0d3dcf8f',), ('bc829d8c-8e49-5593-9f64-d1d318a6828d',), ('8e109415-8825-5927-85ad-d0df0955d465',), ('1d546e66-6a39-5488-afe5-1b41c6c29ed2',), ('a6a0c16e-6447-5b2f-bd40-aa5a40ae9d45',), ('2755f7a3-5a55-54b0-97c0-ddc7c7027f5d',), ('0fb905a4-2968-55c7-9750-0584055b8fa4',), ('80394b12-a240-5434-86a5-fb3e12a1eeed',), ('dd7dc9be-25c6-50c3-bd57-d48dd024c52c',), ('27580ad8-a961-5c7e-9832-001faaa3455b',), ('5d42ecbc-257e-55b9-b3aa-c9b2299a340f',), ('2773a227-9c92-5aa6-969b-3ef64bdc8c1f',), ('efb40a5c-7874-5435-9a0b-8599fbea8744',), ('bdd4c5e6-84c4-5c19-9e22-360e1af86e15',), ('37f19e38-a9ee-5d30-8d4c-2619a11ebd15',), ('62ea0585-e70a-52b1-ac6b-d158f0b07ff2',), ('37ce3544-c0f8-58c9-b27b-8fe23bc7f749',), ('57cf2518-bb32-5edb-81bb-fc8c55be4ea8',), ('cdd1ed6e-1f27-59e0-9fa2-76ddcc15e44d',), ('f9ec6205-a498-5381-8ebc-aad3033e9b8f',), ('0de59a71-9aef-5996-9670-84bf4605b28c',), ('1736edaa-aab5-5124-89c0-5cffba189423',), ('1f3fe3e1-f4b1-5b42-9f70-3bdf29a543dd',), ('848a10dd-01ad-54d4-a87f-a1476413f169',), ('b4f7affe-ac78-5822-926b-b67c7edff369',), ('f0a9638e-b7ea-59fd-b812-63fce0094264',), ('18517659-bc93-594e-9538-04984bfbd9ef',), ('aeabf547-404c-5b6b-8a82-504e834ee755',), ('a78ca0fa-959b-5783-9dbd-515023519555',), ('2af0c44e-361c-5443-bef5-cafed4f00ec6',), ('712813d4-f8e9-5f17-8b1d-7de0f2c88d41',), ('3b5df324-97e3-5172-b387-e2e485ccd2f7',), ('a1aa90b2-1c25-5c8f-8fed-46c295ef03b2',), ('1c17ce18-bf3e-558b-9389-632588f93851',), ('fdd488e3-cbe3-5684-b7b8-38997728f653',), ('daae9119-9316-538f-b9ae-ba871f5cb185',), ('6306bc8b-629a-5487-828c-b3d757972728',), ('cee140cd-3ed0-536e-9a5e-aeb41cbb2f8c',), ('0bc207f2-a026-5163-b065-cae388c2a7cb',), ('ac4202e5-116b-552f-a03a-c6023db2cfe5',), ('09ba97e8-43f1-5288-8703-b10f7c1afec9',), ('54896cc7-cdfd-578b-9869-777d06d0a8c8',), ('4ae3911d-f48e-5218-adc5-bb79f917c6e2',), ('5519d329-90ca-5fc0-896e-1f17a83a36df',), ('4a102b79-3e73-5505-ada4-8f7038deae5b',), ('d4d8c9f9-31ed-53ed-ab67-eba86e2198fe',), ('249e6587-885e-5fbc-8593-b13114de5e2b',), ('3876cd4c-db88-534e-877c-307fa2e2b160',), ('173fc1fb-c465-5d62-b34e-60d76df02fee',), ('bdbc1b80-5371-5af3-9c7c-6ec166c2cf5c',), ('25292565-ce32-5533-a526-ce41d41c0516',), ('5dd1158c-6210-5a8c-a9bb-63df7f25d10a',), ('075d914c-d9c8-5130-8146-b2a75389d184',), ('1c2ca7fa-61fb-50f3-bbc3-98a87eba487a',), ('fa7907ce-3f80-5075-a9fc-874d8e27b6eb',), ('011dd694-86e0-546e-899e-82bd1f5d240c',), ('c1121a0a-8e38-5dfa-bb54-03adf4cabaf5',), ('6cd228a2-686c-5324-9421-a55c3c221043',), ('4a94a818-169e-56d0-8940-11ba01014a2b',), ('bffdcbd9-13a2-5dcb-a74c-e32ec6c363cd',), ('8a4f09ad-0398-50ba-9bab-55a5bb43f154',), ('da94f103-f91b-5a01-aff0-79f317c5a33c',), ('657d58ca-104f-57a6-9440-88b11a3e2419',), ('a50d26a8-53de-58e2-827d-2b74fdfcd6ea',), ('9abfc13a-e504-5419-84bf-dab7efe86f69',), ('4a69ad5a-4b5b-5775-908b-fe295a3db6b1',), ('1c119481-b437-5dd2-8083-b3f502d82262',), ('7415e72a-f2f7-53e5-bcec-0a8c61ff3a15',), ('f7c254d4-621b-5df2-bb8d-6020749f55be',), ('bc924c9e-b4fc-5a05-9803-59c108546a3e',), ('ff19b91f-c815-558a-897a-4b8c4f3e61db',), ('d43a8822-4241-5a60-897b-f141247a9fb6',), ('75579c49-8efe-5cc4-b645-5fff52736424',), ('8a513c25-1eec-5c18-9cf5-3068a1eb94bf',), ('570b9c70-eb8b-5c23-b952-01797b13164f',), ('472bc7dc-5874-5c8f-9a65-f6c0f28d999f',), ('67d70c16-209e-59df-b744-f439187420db',), ('c748b0a1-b117-5fa0-b233-e0edfa4be6c0',), ('7f277fad-f4b1-5188-b0ad-7a840a0f7001',), ('36bf70e3-9a2d-55d5-8a08-2529058a522f',), ('5dbd709b-188b-5f2f-a43e-73356b67de90',), ('51fa4a97-3e61-53e0-bb10-a0e19f09802e',), ('00460d79-3570-58b8-af87-7b89106eb48c',), ('a9c94227-8f8e-5ea8-983b-23585ede2d54',), ('91b1fc1a-bb11-55ff-bbc4-20fc7ee9c9c3',), ('0b341db1-b11a-547f-a751-bbce37f4e652',), ('2cea6d13-c0a2-56f9-8434-e94408fc2fa5',), ('22c6fe75-0dbb-524e-b2e4-78f748f5b7cb',), ('02ce1982-5993-5b93-b3a6-ece352be4c72',), ('44cff813-717f-5773-b616-62202b4b1d7b',), ('db17db9f-070f-5a2c-803f-5948c860de35',), ('503863ee-8bc9-578e-a806-33a724fc8808',), ('8d38b671-1951-552c-84d2-a38de5c731c7',), ('9cb0236a-3949-5bd0-9aa6-c22b557115d2',), ('c3c2d6d3-2448-5549-a000-be1ff1908357',), ('360627ee-e89d-5ed4-aa07-6e9ab699ef9e',), ('d55ebc7a-b2e7-5a5b-a2fe-56f30b700d00',), ('f2105437-b5f7-5096-8014-ce2b100cd506',), ('7c4cf8cd-39b4-5734-893a-a982ab045d0b',), ('46fede65-32ce-5398-80f4-e784bd7c2083',), ('97d8bc45-cb2f-566b-87e5-3891ae11b30a',), ('5d6b2169-23af-52ec-b5f1-c0ab9b656ea9',), ('d8516c39-4816-5033-8250-281b83a655b4',), ('7fc5399f-5a7d-5502-a716-2da18df1a98e',)]
----------------------------
