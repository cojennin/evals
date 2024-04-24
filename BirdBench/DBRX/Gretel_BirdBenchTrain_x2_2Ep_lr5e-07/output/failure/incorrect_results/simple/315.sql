-- PROBLEM # 315
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

-- External Knowledge: label = '+' mean molecules are carcinogenic;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Among the molecules which contain "cl" element, which of them are carcinogenic?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT 1 FROM molecule WHERE molecule_id IN (SELECT molecule_id FROM atom WHERE element = 'cl') AND label = '+'
----------------------------




-- RESULTS FROM GENERATED SQL
[(1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,), (1,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR000',), ('TR001',), ('TR019',), ('TR028',), ('TR041',), ('TR055',), ('TR063',), ('TR072',), ('TR085',), ('TR089',), ('TR093',), ('TR095',), ('TR099',), ('TR115',), ('TR130',), ('TR153',), ('TR155',), ('TR206',), ('TR209',), ('TR225',), ('TR248',), ('TR266',), ('TR269',), ('TR285',), ('TR300',), ('TR304',), ('TR306',), ('TR308',), ('TR311',), ('TR313',), ('TR316',), ('TR319',), ('TR321',), ('TR342',), ('TR351',), ('TR358',), ('TR361',), ('TR372',), ('TR384',), ('TR390',), ('TR391',), ('TR414',), ('TR467',), ('TR483',)]
----------------------------
