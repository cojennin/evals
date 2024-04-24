-- PROBLEM # 198
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

-- External Knowledge: carcinogenic molecules refers to label = '+'; single-bonded refers to bond_type = '-'; average = DIVIDE(SUM(bond_type = '-'), COUNT(atom_id))
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- On average how many carcinogenic molecules are single bonded?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT AVG(bond_type = '-') FROM connected JOIN atom ON connected.atom_id = atom.atom_id JOIN bond ON connected.bond_id = bond.bond_id WHERE atom.molecule_id IN (SELECT molecule_id FROM molecule WHERE label = '+')
----------------------------




-- RESULTS FROM GENERATED SQL
[(0.8285329744279946,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(732.125,)]
----------------------------
