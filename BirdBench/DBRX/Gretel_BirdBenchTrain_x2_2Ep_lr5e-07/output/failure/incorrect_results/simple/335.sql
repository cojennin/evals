-- PROBLEM # 335
-- Generation # 0
-- Difficulty: simple
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

-- External Knowledge: oxygen refers to element = 'o'; double bond refers to bond_type = ' = ';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the total number of molecules with double bonded oxygen?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT COUNT(DISTINCT m.molecule_id) as num_molecules
FROM molecule m
JOIN atom a ON m.molecule_id = a.molecule_id
JOIN connected c ON a.atom_id = c.atom_id
JOIN atom a2 ON c.atom_id2 = a2.atom_id
JOIN bond b ON c.bond_id = b.bond_id
WHERE a.element = 'o' AND b.bond_type = ' = ';
----------------------------




-- RESULTS FROM PREDICTION
[(0,)]
----------------------------



-- ACTUAL RESULTS
[(273,)]
----------------------------
