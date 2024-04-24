-- PROBLEM # 217
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

-- External Knowledge: TR181 molecule refers to molecule_id = 'TR181'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Identify all the atoms that are connected to the atoms of the TR181 molecule.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT a1.atom_id FROM atom a1, connected c1 WHERE a1.molecule_id = 'TR181' AND c1.atom_id = a1.atom_id;
----------------------------




-- RESULTS FROM PREDICTION
[('TR181_1',), ('TR181_1',), ('TR181_1',), ('TR181_10',), ('TR181_10',), ('TR181_10',), ('TR181_11',), ('TR181_11',), ('TR181_11',), ('TR181_12',), ('TR181_12',), ('TR181_12',), ('TR181_13',), ('TR181_13',), ('TR181_13',), ('TR181_14',), ('TR181_14',), ('TR181_14',), ('TR181_15',), ('TR181_15',), ('TR181_15',), ('TR181_16',), ('TR181_16',), ('TR181_16',), ('TR181_17',), ('TR181_17',), ('TR181_17',), ('TR181_17',), ('TR181_18',), ('TR181_18',), ('TR181_18',), ('TR181_18',), ('TR181_19',), ('TR181_19',), ('TR181_19',), ('TR181_19',), ('TR181_2',), ('TR181_20',), ('TR181_20',), ('TR181_20',), ('TR181_20',), ('TR181_21',), ('TR181_22',), ('TR181_23',), ('TR181_24',), ('TR181_25',), ('TR181_26',), ('TR181_27',), ('TR181_28',), ('TR181_29',), ('TR181_3',), ('TR181_3',), ('TR181_3',), ('TR181_30',), ('TR181_31',), ('TR181_32',), ('TR181_33',), ('TR181_34',), ('TR181_35',), ('TR181_36',), ('TR181_37',), ('TR181_38',), ('TR181_39',), ('TR181_4',), ('TR181_4',), ('TR181_4',), ('TR181_40',), ('TR181_5',), ('TR181_5',), ('TR181_5',), ('TR181_6',), ('TR181_6',), ('TR181_6',), ('TR181_7',), ('TR181_7',), ('TR181_7',), ('TR181_8',), ('TR181_8',), ('TR181_8',), ('TR181_9',), ('TR181_9',), ('TR181_9',)]
----------------------------



-- ACTUAL RESULTS
[('TR181_1', 'TR181_2'), ('TR181_1', 'TR181_3'), ('TR181_1', 'TR181_4'), ('TR181_10', 'TR181_13'), ('TR181_10', 'TR181_26'), ('TR181_10', 'TR181_6'), ('TR181_11', 'TR181_14'), ('TR181_11', 'TR181_27'), ('TR181_11', 'TR181_7'), ('TR181_12', 'TR181_14'), ('TR181_12', 'TR181_28'), ('TR181_12', 'TR181_8'), ('TR181_13', 'TR181_10'), ('TR181_13', 'TR181_15'), ('TR181_13', 'TR181_9'), ('TR181_14', 'TR181_11'), ('TR181_14', 'TR181_12'), ('TR181_14', 'TR181_16'), ('TR181_15', 'TR181_13'), ('TR181_15', 'TR181_17'), ('TR181_15', 'TR181_18'), ('TR181_16', 'TR181_14'), ('TR181_16', 'TR181_19'), ('TR181_16', 'TR181_20'), ('TR181_17', 'TR181_15'), ('TR181_17', 'TR181_29'), ('TR181_17', 'TR181_30'), ('TR181_17', 'TR181_31'), ('TR181_18', 'TR181_15'), ('TR181_18', 'TR181_32'), ('TR181_18', 'TR181_33'), ('TR181_18', 'TR181_34'), ('TR181_19', 'TR181_16'), ('TR181_19', 'TR181_35'), ('TR181_19', 'TR181_36'), ('TR181_19', 'TR181_37'), ('TR181_2', 'TR181_1'), ('TR181_20', 'TR181_16'), ('TR181_20', 'TR181_38'), ('TR181_20', 'TR181_39'), ('TR181_20', 'TR181_40'), ('TR181_21', 'TR181_5'), ('TR181_22', 'TR181_6'), ('TR181_23', 'TR181_7'), ('TR181_24', 'TR181_8'), ('TR181_25', 'TR181_9'), ('TR181_26', 'TR181_10'), ('TR181_27', 'TR181_11'), ('TR181_28', 'TR181_12'), ('TR181_29', 'TR181_17'), ('TR181_3', 'TR181_1'), ('TR181_3', 'TR181_5'), ('TR181_3', 'TR181_6'), ('TR181_30', 'TR181_17'), ('TR181_31', 'TR181_17'), ('TR181_32', 'TR181_18'), ('TR181_33', 'TR181_18'), ('TR181_34', 'TR181_18'), ('TR181_35', 'TR181_19'), ('TR181_36', 'TR181_19'), ('TR181_37', 'TR181_19'), ('TR181_38', 'TR181_20'), ('TR181_39', 'TR181_20'), ('TR181_4', 'TR181_1'), ('TR181_4', 'TR181_7'), ('TR181_4', 'TR181_8'), ('TR181_40', 'TR181_20'), ('TR181_5', 'TR181_21'), ('TR181_5', 'TR181_3'), ('TR181_5', 'TR181_9'), ('TR181_6', 'TR181_10'), ('TR181_6', 'TR181_22'), ('TR181_6', 'TR181_3'), ('TR181_7', 'TR181_11'), ('TR181_7', 'TR181_23'), ('TR181_7', 'TR181_4'), ('TR181_8', 'TR181_12'), ('TR181_8', 'TR181_24'), ('TR181_8', 'TR181_4'), ('TR181_9', 'TR181_13'), ('TR181_9', 'TR181_25'), ('TR181_9', 'TR181_5')]
----------------------------
