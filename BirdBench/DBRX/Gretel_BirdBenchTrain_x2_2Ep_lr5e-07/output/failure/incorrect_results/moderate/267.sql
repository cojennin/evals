-- PROBLEM # 267
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

-- External Knowledge: double bond refers to bond_type = ' = '; single bond refers to bond_type = '-'; triple bond refers to bond_type = '#';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List down the bond type for molecules from molecule id TR000 to TR050.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT bond_type FROM bond WHERE molecule_id IN (SELECT molecule_id FROM molecule WHERE molecule_id BETWEEN 'TR000' AND 'TR050')
----------------------------




-- RESULTS FROM GENERATED SQL
[('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('=',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('#',), ('#',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('=',), ('=',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('-',), ('-',), ('-',), ('=',), ('-',), ('=',), ('-',), ('=',), ('-',), ('-',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('TR000', '-'), ('TR000', '-'), ('TR000', '-'), ('TR000', '-'), ('TR001', '='), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR001', '-'), ('TR002', '='), ('TR002', '-'), ('TR002', '-'), ('TR002', '-'), ('TR002', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '-'), ('TR004', '='), ('TR006', '-'), ('TR006', '='), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '='), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '='), ('TR006', '-'), ('TR006', '='), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '-'), ('TR006', '='), ('TR006', '-'), ('TR006', '='), ('TR006', '-'), ('TR006', '-'), ('TR007', '-'), ('TR007', '='), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '='), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '='), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '='), ('TR007', '-'), ('TR007', '-'), ('TR007', '='), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR007', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '='), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR008', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '='), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '='), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR009', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '='), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR010', '-'), ('TR011', '='), ('TR011', '-'), ('TR011', '-'), ('TR011', '='), ('TR011', '='), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '-'), ('TR011', '='), ('TR011', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '='), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR012', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR014', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '='), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '-'), ('TR015', '='), ('TR015', '='), ('TR015', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR017', '-'), ('TR019', '='), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '='), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '='), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '='), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR019', '-'), ('TR020', '='), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '='), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '='), ('TR020', '='), ('TR020', '-'), ('TR020', '-'), ('TR020', '='), ('TR020', '-'), ('TR020', '='), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '='), ('TR020', '-'), ('TR020', '-'), ('TR020', '-'), ('TR020', '='), ('TR020', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '='), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '='), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '-'), ('TR021', '='), ('TR021', '-'), ('TR021', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '='), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR022', '-'), ('TR023', '-'), ('TR023', '-'), ('TR023', '-'), ('TR023', '='), ('TR023', '-'), ('TR023', '-'), ('TR023', '-'), ('TR023', '='), ('TR023', '-'), ('TR023', '-'), ('TR023', '-'), ('TR023', '='), ('TR023', '-'), ('TR023', '='), ('TR023', '-'), ('TR023', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '='), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '-'), ('TR024', '='), ('TR024', '-'), ('TR024', '-'), ('TR025', '-'), ('TR025', '-'), ('TR025', '-'), ('TR025', '='), ('TR025', '-'), ('TR025', '-'), ('TR025', '-'), ('TR025', '-'), ('TR025', '='), ('TR025', '-'), ('TR025', '-'), ('TR025', '-'), ('TR025', '='), ('TR025', '-'), ('TR025', '='), ('TR025', '-'), ('TR025', '-'), ('TR028', '-'), ('TR028', '-'), ('TR028', '-'), ('TR028', '-'), ('TR028', '-'), ('TR028', '-'), ('TR028', '-'), ('TR028', '-'), ('TR028', '-'), ('TR028', '-'), ('TR029', '-'), ('TR029', '-'), ('TR029', '='), ('TR029', '-'), ('TR029', '-'), ('TR029', '='), ('TR029', '-'), ('TR029', '-'), ('TR029', '='), ('TR029', '-'), ('TR029', '='), ('TR029', '-'), ('TR029', '-'), ('TR029', '-'), ('TR029', '-'), ('TR029', '='), ('TR029', '-'), ('TR029', '-'), ('TR029', '='), ('TR029', '-'), ('TR029', '-'), ('TR029', '-'), ('TR029', '='), ('TR029', '-'), ('TR029', '-'), ('TR029', '='), ('TR029', '='), ('TR029', '-'), ('TR029', '-'), ('TR029', '-'), ('TR029', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '='), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR030', '-'), ('TR030', '-'), ('TR030', '='), ('TR030', '-'), ('TR031', '='), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '='), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '='), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '='), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '-'), ('TR031', '='), ('TR031', '='), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR032', '-'), ('TR033', '='), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '='), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '='), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '-'), ('TR033', '='), ('TR033', '-'), ('TR033', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '='), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '='), ('TR034', '-'), ('TR034', '-'), ('TR034', '='), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '-'), ('TR034', '='), ('TR034', '-'), ('TR034', '='), ('TR034', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '='), ('TR035', '-'), ('TR035', '='), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '='), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '='), ('TR035', '-'), ('TR035', '='), ('TR035', '-'), ('TR035', '-'), ('TR035', '-'), ('TR035', '='), ('TR035', '-'), ('TR036', '-'), ('TR036', '-'), ('TR036', '-'), ('TR036', '='), ('TR036', '-'), ('TR036', '-'), ('TR036', '-'), ('TR036', '-'), ('TR036', '='), ('TR036', '-'), ('TR036', '-'), ('TR036', '-'), ('TR036', '='), ('TR036', '-'), ('TR036', '-'), ('TR036', '='), ('TR036', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '='), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '='), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '='), ('TR039', '-'), ('TR039', '='), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR039', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '='), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '='), ('TR040', '-'), ('TR040', '='), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '='), ('TR040', '-'), ('TR040', '-'), ('TR040', '-'), ('TR040', '='), ('TR040', '-'), ('TR040', '='), ('TR041', '-'), ('TR041', '='), ('TR041', '-'), ('TR041', '-'), ('TR041', '-'), ('TR041', '-'), ('TR041', '='), ('TR041', '-'), ('TR041', '-'), ('TR041', '-'), ('TR041', '='), ('TR041', '-'), ('TR041', '#'), ('TR041', '#'), ('TR045', '='), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '='), ('TR045', '='), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '='), ('TR045', '-'), ('TR045', '='), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR045', '='), ('TR045', '-'), ('TR045', '-'), ('TR045', '-'), ('TR046', '-'), ('TR046', '-'), ('TR046', '-'), ('TR046', '-'), ('TR046', '='), ('TR046', '-'), ('TR046', '-'), ('TR046', '-'), ('TR046', '='), ('TR046', '-'), ('TR046', '-'), ('TR046', '-'), ('TR046', '-'), ('TR046', '='), ('TR046', '='), ('TR046', '-'), ('TR046', '-'), ('TR046', '-'), ('TR046', '-'), ('TR046', '-'), ('TR046', '-'), ('TR047', '='), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '='), ('TR047', '-'), ('TR047', '='), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR047', '='), ('TR047', '-'), ('TR047', '-'), ('TR047', '='), ('TR047', '-'), ('TR047', '='), ('TR047', '-'), ('TR047', '-'), ('TR047', '-'), ('TR048', '-'), ('TR048', '='), ('TR048', '-'), ('TR048', '-'), ('TR048', '-'), ('TR048', '-'), ('TR048', '='), ('TR048', '-'), ('TR048', '-'), ('TR048', '-'), ('TR048', '='), ('TR048', '-'), ('TR048', '-'), ('TR048', '='), ('TR049', '-'), ('TR049', '-'), ('TR049', '='), ('TR049', '-'), ('TR049', '='), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '='), ('TR049', '-'), ('TR049', '='), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '='), ('TR049', '-'), ('TR049', '-'), ('TR049', '-'), ('TR049', '='), ('TR049', '-'), ('TR049', '-'), ('TR049', '='), ('TR049', '='), ('TR050', '-'), ('TR050', '='), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '='), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '='), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '='), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '-'), ('TR050', '='), ('TR050', '-'), ('TR050', '='), ('TR050', '-'), ('TR050', '='), ('TR050', '-'), ('TR050', '-')]
----------------------------
