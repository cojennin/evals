-- PROBLEM # 213
-- Generation # 0
-- Difficulty: moderate
----------------------------

-- PROMPT
CREATE TABLE `atom` (
  `atom_id` TEXT NOT NULL,
  `molecule_id` TEXT DEFAULT NULL,
  `element` TEXT DEFAULT NULL,
  PRIMARY KEY (`atom_id`),
  FOREIGN KEY (`molecule_id`) REFERENCES `molecule` (`molecule_id`)
)

CREATE TABLE `bond` (
  `bond_id` TEXT NOT NULL,
  `molecule_id` TEXT DEFAULT NULL,
  `bond_type` TEXT DEFAULT NULL,
  PRIMARY KEY (`bond_id`),
  FOREIGN KEY (`molecule_id`) REFERENCES `molecule` (`molecule_id`)
)

CREATE TABLE `connected` (
  `atom_id` TEXT NOT NULL,
  `atom_id2` TEXT NOT NULL,
  `bond_id` TEXT DEFAULT NULL,
  PRIMARY KEY (`atom_id`,`atom_id2`),
  FOREIGN KEY (`atom_id`) REFERENCES `atom` (`atom_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`atom_id2`) REFERENCES `atom` (`atom_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`bond_id`) REFERENCES `bond` (`bond_id`) ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE `molecule` (
  `molecule_id` TEXT NOT NULL,
  `label` TEXT DEFAULT NULL,
  PRIMARY KEY (`molecule_id`)
)

-- External Knowledge: type of bond refers to bond_type; between the atoms TR004_8 and TR004_20 refers to atom_id between atom_id = 'TR004_8' and atom_id = 'TR004_20';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What type of bond is there between the atoms TR004_8 and TR004_20?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT bond_type FROM bond WHERE bond_id = (SELECT bond_id FROM connected WHERE atom_id = 'TR004_8' AND atom_id2 = 'TR004_20')
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('-',), ('-',)]
----------------------------
