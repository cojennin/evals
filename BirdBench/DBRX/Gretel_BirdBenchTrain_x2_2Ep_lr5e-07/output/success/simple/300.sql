-- PROBLEM # 300
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

-- External Knowledge: TR186 is a molecule id
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What atoms comprise TR186?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT atom_id FROM atom WHERE molecule_id = 'TR186'
----------------------------






-- ACTUAL RESULTS
[('TR186_1',), ('TR186_10',), ('TR186_11',), ('TR186_12',), ('TR186_13',), ('TR186_14',), ('TR186_15',), ('TR186_16',), ('TR186_17',), ('TR186_18',), ('TR186_19',), ('TR186_2',), ('TR186_20',), ('TR186_21',), ('TR186_22',), ('TR186_23',), ('TR186_24',), ('TR186_25',), ('TR186_26',), ('TR186_27',), ('TR186_28',), ('TR186_29',), ('TR186_3',), ('TR186_30',), ('TR186_31',), ('TR186_32',), ('TR186_33',), ('TR186_34',), ('TR186_35',), ('TR186_36',), ('TR186_37',), ('TR186_38',), ('TR186_39',), ('TR186_4',), ('TR186_40',), ('TR186_41',), ('TR186_5',), ('TR186_6',), ('TR186_7',), ('TR186_8',), ('TR186_9',)]
----------------------------
