-- PROBLEM # 219
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

-- External Knowledge: label = '+' mean molecules are carcinogenic; triple bond refers to bond_type = '#'; percentage = DIVIDE(SUM(bond_type = '#'), COUNT(bond_id)) as percent where label = '+'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the percentage of carcinogenic molecules in triple type bonds?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(*) / (SELECT COUNT(*) FROM molecule WHERE label = '+') as percentage FROM connected WHERE bond_id IN (SELECT bond_id FROM bond WHERE bond_type = '#') AND atom_id IN (SELECT atom_id FROM atom WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+'))
----------------------------




-- RESULTS FROM PREDICTION
[(3.9473684210526314,)]
----------------------------



-- ACTUAL RESULTS
[(66.66666666666667,)]
----------------------------
