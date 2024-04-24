-- PROBLEM # 248
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

-- External Knowledge: TR447 is the molecule id; triple bond refers to bond_type = '#';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What are the atoms of the triple bond with the molecule "TR447"?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT a1.atom_id, a2.atom_id FROM connected c1 JOIN connected c2 ON c1.atom_id = c2.atom_id2 AND c1.atom_id2 = c2.atom_id JOIN atom a1 ON c1.atom_id = a1.atom_id JOIN atom a2 ON c2.atom_id = a2.atom_id JOIN bond b ON c1.bond_id = b.bond_id WHERE a1.molecule_id = 'TR447' AND b.bond_type = '#';
----------------------------






-- ACTUAL RESULTS
[('TR447_1', 'TR447_3'), ('TR447_3', 'TR447_1')]
----------------------------
