-- PROBLEM # 328
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

-- External Knowledge: double bond refers to bond_type = '='; element = 'cl' means Chlorine; element = 'c' means Carbon; element = 'h' means Hydrogen; element = 'o' means Oxygen, element = 's' means Sulfur; element = 'n' means Nitrogen, element = 'p' means Phosphorus, element = 'na' means Sodium, element = 'br' means Bromine, element = 'f' means Fluorine; element = 'i' means Iodine; element = 'sn' means Tin; element = 'pb' means Lead; element = 'te' means Tellurium; element = 'ca' means Calcium
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List all the elements with double bond, consisted in molecule TR024.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT a.element FROM atom a JOIN connected c ON a.atom_id = c.atom_id JOIN bond b ON c.bond_id = b.bond_id WHERE b.bond_type = '=' AND a.molecule_id = 'TR024'
----------------------------




-- RESULTS FROM PREDICTION
[('c',), ('o',), ('o',), ('c',)]
----------------------------



-- ACTUAL RESULTS
[('c',), ('c',), ('o',), ('o',), ('s',), ('s',), ('o',), ('o',), ('o',), ('o',), ('c',), ('c',), ('c',), ('c',), ('c',), ('c',), ('c',), ('c',), ('c',), ('c',), ('c',), ('c',), ('s',), ('s',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('c',), ('c',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('h',), ('c',), ('c',), ('p',), ('p',), ('c',), ('c',), ('o',), ('o',), ('o',), ('o',), ('o',), ('o',)]
----------------------------
