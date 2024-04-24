-- PROBLEM # 273
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

-- External Knowledge: chlorine refers to element = 'cl'; label = '+' mean molecules are carcinogenic; percentage = DIVIDE(SUM(element = 'pb'); COUNT(molecule_id)) as percentage where label = '+'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the percentage of element chlorine in carcinogenic molecules?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(*) / (SELECT COUNT(*) FROM molecule WHERE label = '+') as percentage FROM atom WHERE element = 'cl' AND molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
----------------------------




-- RESULTS FROM GENERATED SQL
[(76.3157894736842,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(3.1419284940411703,)]
----------------------------
