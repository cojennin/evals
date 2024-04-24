-- PROBLEM # 311
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

-- External Knowledge: double bond refers to bond_type = ' = '; bond_type ! = ' = '; sulphur refers to element = 's'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- How many molecules without sulphur element is not having double bond?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m WHERE m.molecule_id NOT IN (SELECT c.atom_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 's') AND m.molecule_id NOT IN (SELECT c.atom_id FROM connected c JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = ' = ');
----------------------------




-- RESULTS FROM GENERATED SQL
[(343,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(442,)]
----------------------------
