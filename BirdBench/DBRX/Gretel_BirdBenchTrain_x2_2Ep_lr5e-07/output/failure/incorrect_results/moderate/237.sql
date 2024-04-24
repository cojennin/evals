-- PROBLEM # 237
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

-- External Knowledge: TR001_10 is the atom id; label = '+' mean molecules are carcinogenic
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which molecule does the atom TR001_10 belong to? Please state whether this molecule is carcinogenic or not.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT m.molecule_id, m.label FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN atom a2 ON c.atom_id2 = a2.atom_id JOIN molecule m ON a2.molecule_id = m.molecule_id WHERE a.atom_id = 'TR001_10' AND m.label = '+'
----------------------------




-- RESULTS FROM PREDICTION
[('TR001', '+'), ('TR001', '+'), ('TR001', '+')]
----------------------------



-- ACTUAL RESULTS
[('TR001', 'YES')]
----------------------------
