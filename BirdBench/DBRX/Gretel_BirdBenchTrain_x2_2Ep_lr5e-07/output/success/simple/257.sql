-- PROBLEM # 257
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

-- External Knowledge: element sulfur refers to element = 's'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List down atom id2 for atoms with element sulfur.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT atom_id2 FROM connected WHERE atom_id IN (SELECT atom_id FROM atom WHERE element = 's')
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR004_2',), ('TR004_8',), ('TR015_2',), ('TR015_3',), ('TR018_13',), ('TR018_15',), ('TR018_16',), ('TR018_17',), ('TR018_1',), ('TR018_4',), ('TR018_5',), ('TR018_6',), ('TR020_2',), ('TR020_3',), ('TR020_4',), ('TR020_5',), ('TR024_5',), ('TR024_1',), ('TR031_10',), ('TR031_11',), ('TR031_12',), ('TR031_4',), ('TR045_2',), ('TR045_3',), ('TR045_4',), ('TR045_5',), ('TR046_1',), ('TR047_2',), ('TR047_3',), ('TR050_10',), ('TR050_3',), ('TR050_8',), ('TR050_9',), ('TR051_2',), ('TR051_3',), ('TR051_4',), ('TR051_5',), ('TR053_4',), ('TR053_7',), ('TR056_2',), ('TR057_21',), ('TR057_6',), ('TR058_1',), ('TR062_10',), ('TR062_13',), ('TR062_9',), ('TR069_2',), ('TR069_19',), ('TR070_2',), ('TR084_22',), ('TR084_23',), ('TR084_24',), ('TR084_25',), ('TR096_14',), ('TR101_11',), ('TR101_13',), ('TR101_14',), ('TR101_15',), ('TR102_1',), ('TR102_3',), ('TR102_4',), ('TR102_5',), ('TR103_2',), ('TR103_11',), ('TR103_16',), ('TR113_17',), ('TR113_19',), ('TR113_20',), ('TR113_21',), ('TR115_2',), ('TR115_9',), ('TR124_2',), ('TR124_8',), ('TR124_9',), ('TR125_9',), ('TR125_10',), ('TR125_5',), ('TR125_4',), ('TR126_21',), ('TR126_22',), ('TR126_23',), ('TR126_24',), ('TR129_1',), ('TR132_3',), ('TR132_4',), ('TR135_1',), ('TR135_5',), ('TR136_1',), ('TR136_7',), ('TR137_2',), ('TR138_2',), ('TR138_3',), ('TR138_4',), ('TR138_5',), ('TR146_3',), ('TR146_5',), ('TR148_2',), ('TR149_1',), ('TR151_21',), ('TR151_25',), ('TR151_13',), ('TR151_4',), ('TR152_1',), ('TR152_23',), ('TR152_31',), ('TR152_9',), ('TR152_42',), ('TR152_50',), ('TR152_61',), ('TR152_69',), ('TR157_2',), ('TR166_10',), ('TR166_2',), ('TR166_9',), ('TR166_5',), ('TR172_2',), ('TR172_9',), ('TR192_5',), ('TR192_1',), ('TR208_17',), ('TR208_21',), ('TR208_22',), ('TR208_23',), ('TR208_25',), ('TR208_26',), ('TR208_27',), ('TR208_7',), ('TR211_15',), ('TR211_21',), ('TR211_22',), ('TR211_23',), ('TR211_17',), ('TR211_25',), ('TR211_26',), ('TR211_27',), ('TR220_18',), ('TR220_25',), ('TR220_26',), ('TR220_27',), ('TR220_1',), ('TR220_29',), ('TR220_30',), ('TR220_31',), ('TR225_19',), ('TR225_23',), ('TR225_24',), ('TR225_25',), ('TR225_56',), ('TR225_60',), ('TR225_61',), ('TR225_62',), ('TR234_5',), ('TR238_17',), ('TR238_21',), ('TR238_4',), ('TR238_13',), ('TR268_13',), ('TR268_15',), ('TR268_16',), ('TR268_17',), ('TR296_2',), ('TR296_3',), ('TR296_4',), ('TR296_5',), ('TR307_29',), ('TR307_30',), ('TR307_31',), ('TR307_32',), ('TR318_13',), ('TR318_15',), ('TR332_11',), ('TR332_2',), ('TR332_6',), ('TR335_13',), ('TR335_24',), ('TR335_25',), ('TR335_26',), ('TR336_10',), ('TR336_8',), ('TR356_15',), ('TR356_16',), ('TR356_17',), ('TR356_9',), ('TR357_11',), ('TR357_15',), ('TR357_16',), ('TR357_17',), ('TR357_1',), ('TR357_3',), ('TR357_4',), ('TR357_5',), ('TR387_2',), ('TR387_3',), ('TR387_4',), ('TR387_5',), ('TR388_4',), ('TR395_2',), ('TR395_3',), ('TR395_4',), ('TR395_5',), ('TR397_17',), ('TR397_18',), ('TR397_19',), ('TR397_8',), ('TR397_15',), ('TR397_23',), ('TR397_24',), ('TR397_25',), ('TR397_42',), ('TR397_48',), ('TR397_49',), ('TR397_50',), ('TR397_56',), ('TR397_58',), ('TR397_59',), ('TR397_60',), ('TR405_40',), ('TR405_45',), ('TR405_46',), ('TR405_47',), ('TR405_42',), ('TR405_49',), ('TR405_50',), ('TR405_51',), ('TR405_11',), ('TR405_12',), ('TR405_5',), ('TR405_9',), ('TR412_16',), ('TR412_17',), ('TR412_18',), ('TR412_7',), ('TR412_20',), ('TR412_21',), ('TR412_22',), ('TR412_5',), ('TR425_10',), ('TR425_12',), ('TR430_50',), ('TR430_51',), ('TR430_52',), ('TR430_9',), ('TR430_4',), ('TR430_47',), ('TR430_48',), ('TR430_49',), ('TR430_32',), ('TR430_53',), ('TR430_54',), ('TR430_55',), ('TR430_27',), ('TR430_56',), ('TR430_57',), ('TR430_58',), ('TR435_13',), ('TR435_8',), ('TR457_2',), ('TR457_3',), ('TR457_4',), ('TR457_5',), ('TR464_10',), ('TR464_5',), ('TR464_8',), ('TR464_9',), ('TR501_2',), ('TR501_3',), ('TR501_4',), ('TR501_5',)]
----------------------------
