-- PROBLEM # 235
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

-- External Knowledge: label = '+' mean molecules are carcinogenic; have bromine element refers to element = 'br'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- How many molecules are carcinogenic and have the bromine element?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT COUNT(*) FROM molecule m WHERE m.molecule_id IN (SELECT a.molecule_id FROM atom a WHERE a.element = 'br') AND m.molecule_id IN (SELECT c.atom_id FROM connected c WHERE c.atom_id2 IN (SELECT a2.atom_id FROM atom a2 WHERE a2.element = 'br') AND c.bond_id IN (SELECT b.bond_id FROM bond b WHERE b.bond_type = '+'));
----------------------------




-- RESULTS FROM PREDICTION
[(0,)]
----------------------------



-- ACTUAL RESULTS
[(14,)]
----------------------------
