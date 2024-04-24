-- PROBLEM # 326
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

-- External Knowledge: sulphur refers to element - 's'; double bond refers to bond_type = ' = ';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which molecule consisted of Sulphur atom with double bond?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT molecule_id FROM atom WHERE element = 's' INTERSECT SELECT molecule_id FROM bond WHERE bond_type = ' = ';
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR004',), ('TR015',), ('TR018',), ('TR020',), ('TR024',), ('TR031',), ('TR045',), ('TR046',), ('TR047',), ('TR050',), ('TR051',), ('TR053',), ('TR056',), ('TR057',), ('TR062',), ('TR069',), ('TR070',), ('TR084',), ('TR096',), ('TR101',), ('TR102',), ('TR103',), ('TR113',), ('TR115',), ('TR124',), ('TR126',), ('TR129',), ('TR132',), ('TR135',), ('TR136',), ('TR137',), ('TR138',), ('TR146',), ('TR148',), ('TR149',), ('TR151',), ('TR152',), ('TR157',), ('TR166',), ('TR172',), ('TR192',), ('TR208',), ('TR211',), ('TR220',), ('TR225',), ('TR234',), ('TR238',), ('TR268',), ('TR296',), ('TR307',), ('TR318',), ('TR332',), ('TR335',), ('TR336',), ('TR356',), ('TR357',), ('TR387',), ('TR388',), ('TR395',), ('TR397',), ('TR405',), ('TR412',), ('TR425',), ('TR430',), ('TR435',), ('TR457',), ('TR464',), ('TR501',)]
----------------------------
