-- PROBLEM # 232
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

-- External Knowledge: label = '-' means molecules are not carcinogenic; single type bond refers to bond_type = '-'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list top three molecules that have single bonds between two atoms and are not carcinogenic in alphabetical order.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT molecule_id FROM molecule WHERE label = '-' AND molecule_id IN (SELECT molecule_id FROM bond WHERE bond_type = '-') GROUP BY molecule_id HAVING COUNT(DISTINCT bond_id) = 1 ORDER BY molecule_id LIMIT 3;
----------------------------


-- EXCEPTION
no such column: bond_id
----------------------------



-- RESULTS FROM PREDICTION
[]
----------------------------


