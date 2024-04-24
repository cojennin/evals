-- PROBLEM # 246
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

-- External Knowledge: bond ID of atom 45 refers to SUBSTR(atom_id, 7, 2) + 0 = 45; double bond refers to bond_type = ' = '; single bond refers to bond_type = '-'; triple bond refers to bond_type = '#';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the bond type and the bond ID of the atom 45.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 45 AS atom_id, SUBSTR(atom_id, 7, 2) + 0 AS bond_id, bond_type FROM bond WHERE atom_id = 'atom_45'
----------------------------


-- EXCEPTION
no such column: atom_id
----------------------------



-- RESULTS FROM PREDICTION
[]
----------------------------


