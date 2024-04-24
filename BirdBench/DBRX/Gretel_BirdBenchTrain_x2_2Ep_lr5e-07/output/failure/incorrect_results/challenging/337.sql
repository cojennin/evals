-- PROBLEM # 337
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

-- External Knowledge: element = 'cl' means Chlorine; element = 'c' means Carbon; element = 'h' means Hydrogen; element = 'o' means Oxygen, element = 's' means Sulfur; element = 'n' means Nitrogen, element = 'p' means Phosphorus, element = 'na' means Sodium, element = 'br' means Bromine, element = 'f' means Fluorine; element = 'i' means Iodine; element = 'sn' means Tin; element = 'pb' means Lead; element = 'te' means Tellurium; element = 'ca' means Calcium; double bond refers to bond_type = ' = '; single bond refers to bond_type = '-'; triple bond refers to bond_type = '#';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the element and bond type included in the molecule with molecule ID of TR016.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT a.element, b.bond_type FROM atom a INNER JOIN connected c ON a.atom_id = c.atom_id INNER JOIN bond b ON c.bond_id = b.bond_id WHERE a.molecule_id = 'TR016';
----------------------------




-- RESULTS FROM PREDICTION
[('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('o', '-'), ('p', '-'), ('p', '-'), ('o', '-'), ('p', '-'), ('o', '-'), ('p', '-'), ('o', '-'), ('o', '-'), ('c', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('o', '-'), ('c', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('c', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('n', '-'), ('n', '-'), ('c', '-'), ('n', '-'), ('c', '-'), ('c', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('h', '-'), ('c', '-'), ('c', '='), ('o', '='), ('c', '-'), ('c', '-'), ('c', '-'), ('cl', '-'), ('c', '='), ('c', '='), ('c', '-'), ('c', '-'), ('o', '-'), ('c', '-')]
----------------------------



-- ACTUAL RESULTS
[('c', '-'), ('c', '='), ('o', '-'), ('o', '='), ('p', '-'), ('p', '='), ('h', '-'), ('h', '='), ('n', '-'), ('n', '='), ('cl', '-'), ('cl', '=')]
----------------------------
