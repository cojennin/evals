-- PROBLEM # 255
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

-- External Knowledge: single bond refers to bond_type = '-'; label = '+' mean molecules are carcinogenic; proportion = DIVIDE(SUM(label = '+'), COUNT(bond_id)) where bond_type = '-'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What proportion of single bonds are carcinogenic?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 1.0 * COUNT(*) / (SELECT COUNT(*) FROM bond WHERE bond_type = '-') FROM bond WHERE bond_type = '-' AND EXISTS (SELECT 1 FROM connected c JOIN atom a ON c.atom_id = a.atom_id WHERE c.bond_id = bond.bond_id AND a.label = '+')
----------------------------


-- EXCEPTION
no such column: a.label
----------------------------



-- RESULTS FROM PREDICTION
[]
----------------------------


