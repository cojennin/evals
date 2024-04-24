-- PROBLEM # 224
-- Generation # 0
-- Difficulty: simple
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

-- External Knowledge: TR000_2 is the atom id; atom ID 2 refers to atom_id2
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What are the bond IDs that have the same atom ID 2 of TR000_2?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT b.bond_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE c.atom_id2 = 'TR000_2'
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR000_1_2',), ('TR000_2_3',), ('TR000_2_4',), ('TR000_2_5',)]
----------------------------
