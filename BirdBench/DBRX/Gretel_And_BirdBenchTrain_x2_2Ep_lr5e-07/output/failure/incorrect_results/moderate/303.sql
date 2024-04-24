-- PROBLEM # 303
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

-- External Knowledge: label = '+' mean molecules are carcinogenic; label = '-' means molecules are non-carcinogenic; double bond refers to bond_type = ' = ';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- How many double bonds does TR006 have and is it carcinogenic?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT COUNT(bond.bond_id) as num_double_bonds, molecule.label as is_carcinogenic FROM bond INNER JOIN connected ON bond.bond_id = connected.bond_id INNER JOIN atom ON connected.atom_id = atom.atom_id INNER JOIN molecule ON atom.molecule_id = molecule.molecule_id WHERE bond.bond_type = ' = ' AND molecule.molecule_id = 'TR006' GROUP BY molecule.label;
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(6, '+')]
----------------------------
