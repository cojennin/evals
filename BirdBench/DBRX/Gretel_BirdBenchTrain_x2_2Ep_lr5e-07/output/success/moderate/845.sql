-- PROBLEM # 845
-- Generation # 0
-- Difficulty: moderate
----------------------------

-- PROMPT
CREATE TABLE alignment
(
    id        INTEGER not null
            primary key,
    alignment TEXT default NULL
)

CREATE TABLE attribute
(
    id             INTEGER not null
            primary key,
    attribute_name TEXT default NULL
)

CREATE TABLE colour
(
    id     INTEGER not null
            primary key,
    colour TEXT default NULL
)

CREATE TABLE gender
(
    id     INTEGER not null
            primary key,
    gender TEXT default NULL
)

CREATE TABLE publisher
(
    id             INTEGER not null
            primary key,
    publisher_name TEXT default NULL
)

CREATE TABLE race
(
    id   INTEGER not null
            primary key,
    race TEXT default NULL
)

CREATE TABLE superhero
(
    id             INTEGER not null
            primary key,
    superhero_name TEXT default NULL,
    full_name      TEXT default NULL,
    gender_id      INTEGER          default NULL,
    eye_colour_id  INTEGER          default NULL,
    hair_colour_id INTEGER          default NULL,
    skin_colour_id INTEGER          default NULL,
    race_id        INTEGER          default NULL,
    publisher_id   INTEGER          default NULL,
    alignment_id   INTEGER          default NULL,
    height_cm      INTEGER          default NULL,
    weight_kg      INTEGER          default NULL,
    foreign key (alignment_id) references alignment(id),
    foreign key (eye_colour_id) references colour(id),
    foreign key (gender_id) references gender(id),
    foreign key (hair_colour_id) references colour(id),
    foreign key (publisher_id) references publisher(id),
    foreign key (race_id) references race(id),
    foreign key (skin_colour_id) references colour(id)
)

CREATE TABLE hero_attribute
(
    hero_id         INTEGER default NULL,
    attribute_id    INTEGER default NULL,
    attribute_value INTEGER default NULL,
    foreign key (attribute_id) references attribute(id),
    foreign key (hero_id) references superhero(id)
)

CREATE TABLE superpower
(
    id         INTEGER not null
            primary key,
    power_name TEXT default NULL
)

CREATE TABLE hero_power
(
    hero_id  INTEGER default NULL,
    power_id INTEGER default NULL,
    foreign key (hero_id) references superhero(id),
    foreign key (power_id) references superpower(id)
)

-- External Knowledge: power of superheroes refers to power_name; height greater than 80% of the average height of all superheroes = height_cm > MULTIPLY(AVG(height_cm), 0.8);
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the power of superheroes with height greater than 80% of the average height of all superheroes.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT power_name FROM  superpower WHERE  id IN (SELECT  power_id FROM  hero_power WHERE  hero_id IN (SELECT  id FROM  superhero WHERE  height_cm > (SELECT  AVG(height_cm) * 0.8 FROM  superhero)))
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Agility',), ('Cold Resistance',), ('Durability',), ('Stealth',), ('Super Strength',), ('Super Speed',), ('Enhanced Senses',), ('Jump',), ('Substance Secretion',), ('Natural Armor',), ('Heat Resistance',), ('Natural Weapons',), ('Wallcrawling',), ('Agility',), ('Lantern Power Ring',), ('Durability',), ('Flight',), ('Underwater breathing',), ('Marksmanship',), ('Power Augmentation',), ('Longevity',), ('Intelligence',), ('Super Strength',), ('Cryokinesis',), ('Telepathy',), ('Energy Blasts',), ('Duplication',), ('Size Changing',), ('Stamina',), ('Super Speed',), ('Weapon-based Powers',), ('Teleportation',), ('Enhanced Senses',), ('Jump',), ('Shapeshifting',), ('Camouflage',), ('Phasing',), ('Fire Control',), ('Enhanced Memory',), ('Reflexes',), ('Invulnerability',), ('Energy Constructs',), ('Force Fields',), ('Power Absorption',), ('Enhanced Hearing',), ('Time Travel',), ('Enhanced Smell',), ('Water Control',), ('Vision - Telescopic',), ('Magnetism',), ('Invisibility',), ('Vision - Microscopic',), ('Super Breath',), ('Vision - Night',), ('Accelerated Healing',), ('Durability',), ('Danger Sense',), ('Super Strength',), ('Stamina',), ('Enhanced Senses',), ('Shapeshifting',), ('Camouflage',), ('Reflexes',), ('Elasticity',), ('Toxin and Disease Resistance',), ('Wallcrawling',), ('Agility',), ('Durability',), ('Super Strength',), ('Cryokinesis',), ('Energy Blasts',), ('Stamina',), ('Super Speed',), ('Weapon-based Powers',), ('Teleportation',), ('Fire Control',), ('Reflexes',), ('Invulnerability',), ('Magnetism',), ('Energy Absorption',), ('Weapons Master',), ('Super Strength',), ('Energy Blasts',), ('Weapon-based Powers',), ('Teleportation',), ('Telekinesis',), ('Magic',), ('Invulnerability',), ('Dimensional Awareness',), ('Darkforce Manipulation',), ('Teleportation',), ('Force Fields',), ('Intangibility',), ('Cold Resistance',), ('Durability',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Invulnerability',), ('Self-Sustenance',), ('Natural Armor',), ('Heat Resistance',), ('Agility',), ('Accelerated Healing',), ('Dimensional Awareness',), ('Flight',), ('Marksmanship',), ('Intelligence',), ('Super Strength',), ('Telepathy',), ('Energy Blasts',), ('Size Changing',), ('Stamina',), ('Super Speed',), ('Teleportation',), ('Telekinesis',), ('Energy Beams',), ('Dimensional Travel',), ('Immortality',), ('Astral Projection',), ('Reflexes',), ('Invulnerability',), ('Force Fields',), ('Psionic Powers',), ('Mind Control',), ('Molecular Manipulation',), ('Levitation',), ('Energy Manipulation',), ('Toxin and Disease Resistance',), ('Agility',), ('Accelerated Healing',), ('Cold Resistance',), ('Durability',), ('Energy Absorption',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Jump',), ('Reflexes',), ('Invulnerability',), ('Self-Sustenance',), ('Power Absorption',), ('Natural Armor',), ('Adaptation',), ('Regeneration',), ('Heat Resistance',), ('Natural Weapons',), ('Energy Resistance',), ('Accelerated Healing',), ('Durability',), ('Flight',), ('Longevity',), ('Super Strength',), ('Telepathy',), ('Stamina',), ('Possession',), ('Shapeshifting',), ('Substance Secretion',), ('Accelerated Healing',), ('Dimensional Awareness',), ('Durability',), ('Energy Absorption',), ('Flight',), ('Marksmanship',), ('Longevity',), ('Intelligence',), ('Super Strength',), ('Telepathy',), ('Energy Blasts',), ('Size Changing',), ('Stamina',), ('Super Speed',), ('Teleportation',), ('Telekinesis',), ('Energy Beams',), ('Dimensional Travel',), ('Immortality',), ('Invulnerability',), ('Force Fields',), ('Psionic Powers',), ('Molecular Manipulation',), ('Regeneration',), ('Levitation',), ('Energy Manipulation',), ('Power Cosmic',), ('Toxin and Disease Resistance',), ('Portal Creation',), ('Durability',), ('Intelligence',), ('Super Strength',), ('Size Changing',), ('Agility',), ('Durability',), ('Energy Absorption',), ('Danger Sense',), ('Longevity',), ('Super Strength',), ('Energy Blasts',), ('Stamina',), ('Energy Beams',), ('Immortality',), ('Invulnerability',), ('Enhanced Hearing',), ('Natural Armor',), ('Enhanced Sight',), ('Heat Resistance',), ('Natural Weapons',), ('Enhanced Smell',), ('Sub-Mariner',), ('Durability',), ('Longevity',), ('Intelligence',), ('Super Strength',), ('Duplication',), ('Size Changing',), ('Stamina',), ('Invulnerability',), ('Fire Resistance',), ('Regeneration',), ('Plant Control',), ('Accelerated Healing',), ('Durability',), ('Weapons Master',), ('Longevity',), ('Super Strength',), ('Stamina',), ('Enhanced Senses',), ('Magic',), ('Invulnerability',), ('Fire Resistance',), ('Enhanced Sight',), ('Heat Resistance',), ('Agility',), ('Accelerated Healing',), ('Cold Resistance',), ('Durability',), ('Longevity',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Jump',), ('Reflexes',), ('Invulnerability',), ('Self-Sustenance',), ('Heat Resistance',), ('Radiation Immunity',), ('Toxin and Disease Resistance',), ('Mind Control Resistance',), ('Radiation Absorption',), ('Super Breath',), ('Accelerated Healing',), ('Durability',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Invulnerability',), ('Force Fields',), ('Self-Sustenance',), ('Toxin and Disease Resistance',), ('Agility',), ('Accelerated Healing',), ('Durability',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Enhanced Senses',), ('Reflexes',), ('Enhanced Hearing',), ('Natural Armor',), ('Natural Weapons',), ('Enhanced Smell',), ('Sub-Mariner',), ('Accelerated Healing',), ('Lantern Power Ring',), ('Durability',), ('Underwater breathing',), ('Super Strength',), ('Telepathy',), ('Stamina',), ('Agility',), ('Durability',), ('Stealth',), ('Longevity',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Jump',), ('Reflexes',), ('Enhanced Hearing',), ('Natural Weapons',), ('Enhanced Smell',), ('Durability',), ('Longevity',), ('Intelligence',), ('Super Strength',), ('Duplication',), ('Stamina',), ('Enhanced Senses',), ('Immortality',), ('Invulnerability',), ('Self-Sustenance',), ('Regeneration',), ('Toxin and Disease Resistance',), ('Omnilingualism',), ('Agility',), ('Flight',), ('Weapons Master',), ('Longevity',), ('Intelligence',), ('Telepathy',), ('Energy Blasts',), ('Telekinesis',), ('Force Fields',), ('Empathy',), ('Psionic Powers',), ('Technopath/Cyberpath',), ('Heat Generation',), ('Levitation',), ('Illusions',), ('Dimensional Awareness',), ('Flight',), ('Intelligence',), ('Super Strength',), ('Telepathy',), ('Size Changing',), ('Astral Travel',), ('Telekinesis',), ('Camouflage',), ('Astral Projection',), ('Invulnerability',), ('Force Fields',), ('Psionic Powers',), ('Mind Control',), ('Power Absorption',), ('Intangibility',), ('Mind Blast',), ('Illusions',), ('Telepathy Resistance',), ('Magnetism',), ('Agility',), ('Stamina',), ('Telekinesis',), ('Mind Control',), ('Mind Control Resistance',), ('Agility',), ('Durability',), ('Super Strength',), ('Stamina',), ('Enhanced Senses',), ('Jump',), ('Accelerated Healing',), ('Weapons Master',), ('Longevity',), ('Intelligence',), ('Super Strength',), ('Energy Blasts',), ('Size Changing',), ('Stamina',), ('Super Speed',), ('Darkforce Manipulation',), ('Magic',), ('Shapeshifting',), ('Immortality',), ('Fire Control',), ('Invulnerability',), ('Enhanced Hearing',), ('Enhanced Sight',), ('Heat Generation',), ('Cold Resistance',), ('Durability',), ('Energy Absorption',), ('Super Strength',), ('Stamina',), ('Invulnerability',), ('Self-Sustenance',), ('Fire Resistance',), ('Toxin and Disease Resistance',), ('Agility',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Reflexes',), ('Durability',), ('Longevity',), ('Super Strength',), ('Stamina',), ('Magic',), ('Invulnerability',), ('Agility',), ('Accelerated Healing',), ('Durability',), ('Danger Sense',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Animal Oriented Powers',), ('Camouflage',), ('Reflexes',), ('Natural Weapons',), ('Wallcrawling',), ('Agility',), ('Accelerated Healing',), ('Dimensional Awareness',), ('Durability',), ('Stealth',), ('Danger Sense',), ('Marksmanship',), ('Weapons Master',), ('Longevity',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Weapon-based Powers',), ('Teleportation',), ('Jump',), ('Immortality',), ('Reflexes',), ('Natural Armor',), ('Regeneration',), ('Natural Weapons',), ('Toxin and Disease Resistance',), ('Telepathy Resistance',), ('Mind Control Resistance',), ('Wallcrawling',), ('Agility',), ('Cold Resistance',), ('Durability',), ('Super Strength',), ('Stamina',), ('Super Speed',), ('Reflexes',), ('Enhanced Hearing',), ('Heat Resistance',), ('Vision - Telescopic',), ('Vision - Night',), ('Animal Attributes',), ('Super Strength',), ('Super Speed',), ('Enhanced Senses',), ('Shapeshifting',), ('Reflexes',), ('Natural Weapons',), ('Cold Resistance',), ('Durability',), ('Longevity',), ('Super Strength',), ('Cryokinesis',), ('Immortality',), ('Vision - Thermal',), ('Vision - Heat',), ('Vision - X-Ray',), ('Vision - Thermal',), ('Web Creation',), ('Symbiote Costume',), ('Resurrection',), ('Resurrection',), ('Grim Reaping',), ('Resurrection',), ('Vitakinesis',), ('Matter Absorption',), ('Resurrection',), ('Grim Reaping',), ('Vision - X-Ray',), ('Reality Warping',), ('The Force',), ('Resurrection',), ('Weather Control',), ('Resurrection',), ('Symbiote Costume',), ('Web Creation',), ('Symbiote Costume',), ('Vision - Thermal',)]
----------------------------
