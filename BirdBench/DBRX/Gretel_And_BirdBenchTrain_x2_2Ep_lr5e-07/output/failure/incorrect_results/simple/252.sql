-- PROBLEM # 252
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

-- External Knowledge: atom that has the element lead refers to atom_id where element = 'pb'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What are the atoms that can bond with the atom that has the element lead?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT a1.atom_id FROM atom a1, connected c1, atom a2 WHERE a1.element = 'pb' AND c1.atom_id = a1.atom_id AND c1.atom_id2 = a2.atom_id;
----------------------------




-- RESULTS FROM GENERATED SQL
[('TR151_14',), ('TR151_14',), ('TR151_14',), ('TR151_14',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR151_14', 'TR151_15'), ('TR151_14', 'TR151_16'), ('TR151_14', 'TR151_17'), ('TR151_14', 'TR151_18')]
----------------------------
