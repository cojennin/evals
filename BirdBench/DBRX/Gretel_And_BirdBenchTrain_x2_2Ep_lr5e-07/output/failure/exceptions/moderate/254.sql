-- PROBLEM # 254
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

-- External Knowledge: DIVIDE(COUNT(bond_id), COUNT(atom_id where MAX(COUNT(atom_id)) ))
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What percentage of bonds have the most common combination of atoms' elements?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 100.0 * COUNT(bond_id) / (SELECT COUNT(*) FROM (SELECT atom_id, COUNT(*) as count FROM atom GROUP BY atom_id ORDER BY count DESC LIMIT 1)) as percentage FROM bond WHERE atom_id IN (SELECT atom_id FROM (SELECT atom_id, COUNT(*) as count FROM atom GROUP BY atom_id ORDER BY count DESC LIMIT 1)) AND atom_id2 IN (SELECT atom_id FROM (SELECT atom_id, COUNT(*) as count FROM atom GROUP BY atom_id ORDER BY count DESC LIMIT 1))
----------------------------


-- EXCEPTION
no such column: atom_id
----------------------------




