-- PROBLEM # 306
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

-- External Knowledge: triple bond refers to bond_type = '#'; element = 'cl' means Chlorine; element = 'c' means Carbon; element = 'h' means Hydrogen; element = 'o' means Oxygen, element = 's' means Sulfur; element = 'n' means Nitrogen, element = 'p' means Phosphorus, element = 'na' means Sodium, element = 'br' means Bromine, element = 'f' means Fluorine; element = 'i' means Iodine; element = 'sn' means Tin; element = 'pb' means Lead; element = 'te' means Tellurium; element = 'ca' means Calcium
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which molecules have triple bonds and list all the elements they contain.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT molecule_id, GROUP_CONCAT(DISTINCT element) as elements FROM atom WHERE atom_id IN (SELECT atom_id FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#')) GROUP BY molecule_id;
----------------------------




-- RESULTS FROM GENERATED SQL
[('TR041', 'n,c'), ('TR377', 'c,n'), ('TR447', 'c,n'), ('TR499', 'y,p')]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR041', 'c'), ('TR041', 'cl'), ('TR041', 'n'), ('TR377', 'c'), ('TR377', 'cl'), ('TR377', 'h'), ('TR377', 'n'), ('TR447', 'c'), ('TR447', 'h'), ('TR447', 'n'), ('TR499', 'h'), ('TR499', 'p'), ('TR499', 'y')]
----------------------------
