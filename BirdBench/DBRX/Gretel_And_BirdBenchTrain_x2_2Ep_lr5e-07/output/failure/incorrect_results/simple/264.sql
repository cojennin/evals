-- PROBLEM # 264
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

-- External Knowledge: TR000, TR001 and TR002 are molecule id; label = '+' mean molecules are carcinogenic; label = '-' means molecules are non-carcinogenic
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What are the labels for TR000, TR001 and TR002?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT m.label FROM molecule m WHERE m.molecule_id IN ('TR000', 'TR001', 'TR002');
----------------------------




-- RESULTS FROM GENERATED SQL
[('+',), ('+',), ('-',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR000', '+'), ('TR001', '+'), ('TR002', '-')]
----------------------------
