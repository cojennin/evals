-- PROBLEM # 316
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

-- External Knowledge: label = '-' means molecules are non-carcinogenic
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Among the molecules which contain "c" element, which of them are not carcinogenic?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT m.molecule_id FROM molecule m WHERE m.molecule_id IN (SELECT a.molecule_id FROM atom a WHERE a.element = 'c') AND m.label != '-'
----------------------------




-- RESULTS FROM PREDICTION
[('TR000',), ('TR001',), ('TR006',), ('TR019',), ('TR020',), ('TR028',), ('TR029',), ('TR039',), ('TR041',), ('TR047',), ('TR049',), ('TR053',), ('TR054',), ('TR055',), ('TR058',), ('TR063',), ('TR072',), ('TR076',), ('TR080',), ('TR081',), ('TR084',), ('TR085',), ('TR086',), ('TR089',), ('TR092',), ('TR093',), ('TR094',), ('TR095',), ('TR099',), ('TR100',), ('TR105',), ('TR111',), ('TR115',), ('TR118',), ('TR127',), ('TR128',), ('TR130',), ('TR140',), ('TR142',), ('TR144',), ('TR149',), ('TR153',), ('TR154',), ('TR155',), ('TR160',), ('TR162',), ('TR164',), ('TR181',), ('TR186',), ('TR190',), ('TR193',), ('TR196',), ('TR205',), ('TR206',), ('TR207',), ('TR209',), ('TR210',), ('TR216',), ('TR217',), ('TR222',), ('TR225',), ('TR226',), ('TR234',), ('TR238',), ('TR245',), ('TR248',), ('TR253',), ('TR257',), ('TR259',), ('TR266',), ('TR267',), ('TR269',), ('TR278',), ('TR285',), ('TR287',), ('TR289',), ('TR291',), ('TR298',), ('TR299',), ('TR300',), ('TR304',), ('TR306',), ('TR308',), ('TR309',), ('TR311',), ('TR313',), ('TR316',), ('TR319',), ('TR321',), ('TR323',), ('TR328',), ('TR329',), ('TR331',), ('TR332',), ('TR334',), ('TR339',), ('TR341',), ('TR342',), ('TR347',), ('TR350',), ('TR351',), ('TR358',), ('TR359',), ('TR360',), ('TR361',), ('TR362',), ('TR363',), ('TR366',), ('TR368',), ('TR369',), ('TR372',), ('TR374',), ('TR382',), ('TR383',), ('TR384',), ('TR386',), ('TR388',), ('TR390',), ('TR391',), ('TR397',), ('TR398',), ('TR400',), ('TR402',), ('TR405',), ('TR407',), ('TR409',), ('TR414',), ('TR416',), ('TR422',), ('TR423',), ('TR430',), ('TR436',), ('TR448',), ('TR450',), ('TR452',), ('TR456',), ('TR457',), ('TR458',), ('TR463',), ('TR465',), ('TR466',), ('TR467',), ('TR470',), ('TR475',), ('TR482',), ('TR483',), ('TR486',), ('TR487',), ('TR491',), ('TR494',), ('TR496',)]
----------------------------



-- ACTUAL RESULTS
[('TR002',), ('TR004',), ('TR007',), ('TR008',), ('TR009',), ('TR010',), ('TR011',), ('TR012',), ('TR014',), ('TR015',), ('TR017',), ('TR021',), ('TR022',), ('TR023',), ('TR024',), ('TR025',), ('TR030',), ('TR031',), ('TR032',), ('TR033',), ('TR034',), ('TR035',), ('TR036',), ('TR040',), ('TR045',), ('TR046',), ('TR048',), ('TR050',), ('TR051',), ('TR056',), ('TR059',), ('TR060',), ('TR061',), ('TR064',), ('TR066',), ('TR068',), ('TR071',), ('TR073',), ('TR074',), ('TR077',), ('TR078',), ('TR082',), ('TR083',), ('TR090',), ('TR091',), ('TR096',), ('TR098',), ('TR101',), ('TR102',), ('TR103',), ('TR104',), ('TR107',), ('TR109',), ('TR110',), ('TR112',), ('TR113',), ('TR114',), ('TR117',), ('TR120',), ('TR121',), ('TR122',), ('TR123',), ('TR124',), ('TR125',), ('TR126',), ('TR129',), ('TR131',), ('TR132',), ('TR133',), ('TR134',), ('TR135',), ('TR136',), ('TR137',), ('TR138',), ('TR139',), ('TR141',), ('TR143',), ('TR145',), ('TR146',), ('TR147',), ('TR148',), ('TR150',), ('TR151',), ('TR156',), ('TR157',), ('TR158',), ('TR159',), ('TR161',), ('TR163',), ('TR165',), ('TR166',), ('TR168',), ('TR169',), ('TR171',), ('TR172',), ('TR173',), ('TR174',), ('TR175',), ('TR177',), ('TR178',), ('TR179',), ('TR180',), ('TR183',), ('TR184',), ('TR185',), ('TR187',), ('TR191',), ('TR192',), ('TR195',), ('TR200',), ('TR203',), ('TR204',), ('TR208',), ('TR211',), ('TR212',), ('TR214',), ('TR219',), ('TR220',), ('TR223',), ('TR228',), ('TR233',), ('TR235',), ('TR236',), ('TR247',), ('TR255',), ('TR263',), ('TR272',), ('TR275',), ('TR276',), ('TR281',), ('TR282',), ('TR284',), ('TR293',), ('TR305',), ('TR307',), ('TR312',), ('TR314',), ('TR322',), ('TR330',), ('TR333',), ('TR335',), ('TR336',), ('TR343',), ('TR344',), ('TR348',), ('TR352',), ('TR353',), ('TR354',), ('TR357',), ('TR370',), ('TR371',), ('TR373',), ('TR377',), ('TR378',), ('TR379',), ('TR387',), ('TR394',), ('TR395',), ('TR396',), ('TR401',), ('TR403',), ('TR406',), ('TR412',), ('TR424',), ('TR425',), ('TR427',), ('TR431',), ('TR433',), ('TR435',), ('TR437',), ('TR438',), ('TR439',), ('TR442',), ('TR445',), ('TR446',), ('TR455',), ('TR459',), ('TR461',), ('TR464',), ('TR472',), ('TR473',), ('TR477',), ('TR478',), ('TR480',), ('TR481',), ('TR484',), ('TR490',), ('TR493',), ('TR501',)]
----------------------------
