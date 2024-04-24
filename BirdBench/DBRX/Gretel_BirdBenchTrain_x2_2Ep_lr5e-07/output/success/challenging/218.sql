-- PROBLEM # 218
-- Generation # 0
-- Difficulty: challenging
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

-- External Knowledge: label = '+' mean molecules are carcinogenic; contain fluorine refers to element = 'f'; percentage = DIVIDE(SUM(element = 'f'), COUNT(molecule_id)) as percent where label = '+'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What percentage of carcinogenic-type molecules does not contain fluorine?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(DISTINCT m.molecule_id) / (SELECT COUNT(DISTINCT m.molecule_id) FROM molecule m WHERE m.label = '+') as percentage FROM molecule m WHERE m.label = '+' AND m.molecule_id NOT IN (SELECT c.atom_id FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE a.element = 'f')
----------------------------






-- ACTUAL RESULTS
[(100.0,)]
----------------------------
