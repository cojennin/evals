-- PROBLEM # 275
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

-- External Knowledge: double bond refers to bond_type = ' = ';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Give me the molecule ID of the double bond type.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT molecule_id FROM bond WHERE bond_type = ' = ';
----------------------------




-- RESULTS FROM PREDICTION
[]
----------------------------



-- ACTUAL RESULTS
[('TR001',), ('TR002',), ('TR004',), ('TR005',), ('TR006',), ('TR007',), ('TR008',), ('TR009',), ('TR010',), ('TR011',), ('TR012',), ('TR013',), ('TR015',), ('TR016',), ('TR018',), ('TR019',), ('TR020',), ('TR021',), ('TR022',), ('TR023',), ('TR024',), ('TR025',), ('TR026',), ('TR029',), ('TR030',), ('TR031',), ('TR033',), ('TR034',), ('TR035',), ('TR036',), ('TR039',), ('TR040',), ('TR041',), ('TR042',), ('TR043',), ('TR045',), ('TR046',), ('TR047',), ('TR048',), ('TR049',), ('TR050',), ('TR051',), ('TR052',), ('TR053',), ('TR054',), ('TR056',), ('TR057',), ('TR059',), ('TR060',), ('TR061',), ('TR062',), ('TR063',), ('TR064',), ('TR065',), ('TR067',), ('TR069',), ('TR070',), ('TR071',), ('TR072',), ('TR073',), ('TR075',), ('TR077',), ('TR078',), ('TR082',), ('TR083',), ('TR084',), ('TR085',), ('TR088',), ('TR089',), ('TR090',), ('TR091',), ('TR092',), ('TR093',), ('TR094',), ('TR095',), ('TR096',), ('TR099',), ('TR100',), ('TR101',), ('TR102',), ('TR103',), ('TR104',), ('TR105',), ('TR107',), ('TR109',), ('TR111',), ('TR112',), ('TR113',), ('TR114',), ('TR115',), ('TR116',), ('TR117',), ('TR118',), ('TR120',), ('TR121',), ('TR122',), ('TR123',), ('TR124',), ('TR126',), ('TR127',), ('TR128',), ('TR129',), ('TR130',), ('TR131',), ('TR132',), ('TR133',), ('TR134',), ('TR135',), ('TR136',), ('TR137',), ('TR138',), ('TR139',), ('TR140',), ('TR141',), ('TR142',), ('TR143',), ('TR144',), ('TR145',), ('TR146',), ('TR147',), ('TR148',), ('TR149',), ('TR150',), ('TR151',), ('TR152',), ('TR153',), ('TR154',), ('TR155',), ('TR156',), ('TR157',), ('TR159',), ('TR160',), ('TR161',), ('TR162',), ('TR163',), ('TR164',), ('TR165',), ('TR166',), ('TR168',), ('TR169',), ('TR170',), ('TR171',), ('TR172',), ('TR173',), ('TR174',), ('TR175',), ('TR177',), ('TR178',), ('TR179',), ('TR180',), ('TR181',), ('TR183',), ('TR184',), ('TR185',), ('TR186',), ('TR187',), ('TR189',), ('TR190',), ('TR192',), ('TR193',), ('TR195',), ('TR196',), ('TR198',), ('TR200',), ('TR201',), ('TR202',), ('TR203',), ('TR204',), ('TR205',), ('TR207',), ('TR208',), ('TR209',), ('TR211',), ('TR212',), ('TR213',), ('TR214',), ('TR215',), ('TR216',), ('TR217',), ('TR219',), ('TR220',), ('TR222',), ('TR223',), ('TR225',), ('TR226',), ('TR228',), ('TR233',), ('TR234',), ('TR235',), ('TR238',), ('TR240',), ('TR242',), ('TR243',), ('TR245',), ('TR247',), ('TR248',), ('TR250',), ('TR251',), ('TR252',), ('TR253',), ('TR255',), ('TR257',), ('TR259',), ('TR261',), ('TR265',), ('TR266',), ('TR268',), ('TR269',), ('TR271',), ('TR272',), ('TR273',), ('TR276',), ('TR278',), ('TR281',), ('TR283',), ('TR284',), ('TR285',), ('TR288',), ('TR289',), ('TR291',), ('TR293',), ('TR296',), ('TR297',), ('TR299',), ('TR300',), ('TR301',), ('TR303',), ('TR304',), ('TR307',), ('TR309',), ('TR311',), ('TR314',), ('TR315',), ('TR316',), ('TR317',), ('TR318',), ('TR319',), ('TR320',), ('TR322',), ('TR325',), ('TR327',), ('TR328',), ('TR330',), ('TR331',), ('TR332',), ('TR333',), ('TR334',), ('TR335',), ('TR336',), ('TR337',), ('TR338',), ('TR339',), ('TR341',), ('TR342',), ('TR343',), ('TR344',), ('TR345',), ('TR347',), ('TR348',), ('TR349',), ('TR351',), ('TR352',), ('TR353',), ('TR354',), ('TR355',), ('TR356',), ('TR357',), ('TR358',), ('TR359',), ('TR360',), ('TR364',), ('TR365',), ('TR366',), ('TR367',), ('TR368',), ('TR369',), ('TR370',), ('TR371',), ('TR372',), ('TR373',), ('TR375',), ('TR376',), ('TR377',), ('TR378',), ('TR379',), ('TR380',), ('TR381',), ('TR382',), ('TR383',), ('TR386',), ('TR387',), ('TR388',), ('TR389',), ('TR390',), ('TR394',), ('TR395',), ('TR396',), ('TR397',), ('TR398',), ('TR401',), ('TR402',), ('TR403',), ('TR404',), ('TR405',), ('TR406',), ('TR407',), ('TR409',), ('TR410',), ('TR411',), ('TR412',), ('TR414',), ('TR416',), ('TR417',), ('TR418',), ('TR419',), ('TR420',), ('TR422',), ('TR423',), ('TR424',), ('TR425',), ('TR426',), ('TR427',), ('TR429',), ('TR430',), ('TR431',), ('TR433',), ('TR434',), ('TR435',), ('TR437',), ('TR438',), ('TR439',), ('TR440',), ('TR442',), ('TR443',), ('TR444',), ('TR445',), ('TR446',), ('TR448',), ('TR450',), ('TR455',), ('TR456',), ('TR457',), ('TR458',), ('TR459',), ('TR461',), ('TR463',), ('TR464',), ('TR465',), ('TR466',), ('TR467',), ('TR468',), ('TR469',), ('TR470',), ('TR472',), ('TR473',), ('TR474',), ('TR476',), ('TR481',), ('TR482',), ('TR483',), ('TR485',), ('TR486',), ('TR487',), ('TR490',), ('TR491',), ('TR493',), ('TR494',), ('TR495',), ('TR496',), ('TR501',)]
----------------------------
