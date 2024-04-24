-- PROBLEM # 280
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

-- External Knowledge: triple bond refers to bond_type = '#'; label = '+' mean molecules are carcinogenic; label = '-' means molecules are non-carcinogenic
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Enumerate the bond ID of triple bond type molecules and tell me if they are carcinogenic or not.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT b.bond_id, m.label FROM bond b JOIN connected c ON b.bond_id = c.bond_id JOIN atom a ON c.atom_id = a.atom_id JOIN molecule m ON a.molecule_id = m.molecule_id WHERE b.bond_type = '#' AND m.label IN ('+', '-');
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR041_7_10', '+'), ('TR041_8_9', '+'), ('TR377_3_5', '-'), ('TR377_4_6', '-'), ('TR499_1_2', '+')]
----------------------------
