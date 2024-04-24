-- PROBLEM # 247
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

-- External Knowledge: element = 'cl' means Chlorine; element = 'c' means Carbon; element = 'h' means Hydrogen; element = 'o' means Oxygen, element = 's' means Sulfur; element = 'n' means Nitrogen, element = 'p' means Phosphorus, element = 'na' means Sodium, element = 'br' means Bromine, element = 'f' means Fluorine; element = 'i' means Iodine; element = 'sn' means Tin; element = 'pb' means Lead; element = 'te' means Tellurium; element = 'ca' means Calcium; atoms cannot bond with other atoms means atom_id NOT in connected table;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List all the elements of atoms that can not bond with any other atoms.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT a.element FROM atom a WHERE a.atom_id NOT IN (SELECT c.atom_id FROM connected c)
----------------------------




-- RESULTS FROM GENERATED SQL
[('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('cl',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('h',), ('zn',), ('h',), ('h',), ('h',), ('na',), ('na',), ('na',), ('cl',), ('h',), ('h',), ('h',), ('cl',), ('na',), ('na',), ('k',), ('cl',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('na',), ('cl',), ('na',), ('na',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('na',), ('zn',), ('k',)]
----------------------------
