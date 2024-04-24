-- PROBLEM # 327
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

-- External Knowledge: label = '-' means molecules are non-carcinogenic; molecules consisted more than 5 atoms refers to COUNT(molecule_id) > 5
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which non-carcinogenic molecules consisted more than 5 atoms?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT molecule_id FROM molecule WHERE label = '-' AND molecule_id IN (SELECT molecule_id FROM atom GROUP BY molecule_id HAVING COUNT(molecule_id) > 5)
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR002',), ('TR004',), ('TR007',), ('TR008',), ('TR009',), ('TR010',), ('TR011',), ('TR012',), ('TR014',), ('TR015',), ('TR017',), ('TR021',), ('TR022',), ('TR023',), ('TR024',), ('TR025',), ('TR030',), ('TR031',), ('TR032',), ('TR033',), ('TR034',), ('TR035',), ('TR036',), ('TR040',), ('TR045',), ('TR046',), ('TR048',), ('TR050',), ('TR051',), ('TR056',), ('TR059',), ('TR060',), ('TR061',), ('TR064',), ('TR066',), ('TR068',), ('TR071',), ('TR073',), ('TR074',), ('TR077',), ('TR078',), ('TR082',), ('TR083',), ('TR090',), ('TR091',), ('TR096',), ('TR098',), ('TR101',), ('TR102',), ('TR103',), ('TR104',), ('TR107',), ('TR109',), ('TR112',), ('TR113',), ('TR114',), ('TR117',), ('TR120',), ('TR121',), ('TR122',), ('TR123',), ('TR124',), ('TR125',), ('TR126',), ('TR129',), ('TR131',), ('TR132',), ('TR133',), ('TR134',), ('TR135',), ('TR136',), ('TR137',), ('TR138',), ('TR139',), ('TR141',), ('TR143',), ('TR145',), ('TR146',), ('TR147',), ('TR148',), ('TR150',), ('TR151',), ('TR156',), ('TR157',), ('TR158',), ('TR159',), ('TR161',), ('TR165',), ('TR166',), ('TR168',), ('TR169',), ('TR171',), ('TR172',), ('TR173',), ('TR174',), ('TR175',), ('TR177',), ('TR178',), ('TR179',), ('TR180',), ('TR183',), ('TR184',), ('TR185',), ('TR187',), ('TR191',), ('TR192',), ('TR195',), ('TR200',), ('TR203',), ('TR204',), ('TR208',), ('TR211',), ('TR212',), ('TR214',), ('TR219',), ('TR220',), ('TR223',), ('TR228',), ('TR233',), ('TR235',), ('TR236',), ('TR247',), ('TR255',), ('TR263',), ('TR272',), ('TR275',), ('TR276',), ('TR281',), ('TR284',), ('TR293',), ('TR305',), ('TR307',), ('TR312',), ('TR314',), ('TR322',), ('TR330',), ('TR333',), ('TR335',), ('TR336',), ('TR343',), ('TR344',), ('TR348',), ('TR352',), ('TR353',), ('TR354',), ('TR357',), ('TR370',), ('TR371',), ('TR373',), ('TR377',), ('TR378',), ('TR379',), ('TR387',), ('TR394',), ('TR395',), ('TR396',), ('TR401',), ('TR403',), ('TR406',), ('TR412',), ('TR424',), ('TR425',), ('TR427',), ('TR431',), ('TR433',), ('TR435',), ('TR437',), ('TR438',), ('TR439',), ('TR442',), ('TR445',), ('TR446',), ('TR455',), ('TR459',), ('TR461',), ('TR464',), ('TR472',), ('TR473',), ('TR477',), ('TR478',), ('TR480',), ('TR481',), ('TR484',), ('TR490',), ('TR493',), ('TR501',)]
----------------------------
