-- PROBLEM # 546
-- Generation # 0
-- Difficulty: simple
----------------------------

-- PROMPT
CREATE TABLE badges
(
    Id     INTEGER          not null
        primary key,
    UserId INTEGER          null,
    Name   TEXT null,
    Date   DATETIME     null,
        foreign key (UserId) references users (Id)
            on update cascade on delete cascade
)

CREATE TABLE comments
(
    Id              INTEGER          not null
        primary key,
    PostId          INTEGER          null,
    Score           INTEGER          null,
    Text            TEXT     null,
    CreationDate    DATETIME     null,
    UserId          INTEGER          null,
    UserDisplayName TEXT null,
        foreign key (PostId) references posts (Id)
            on update cascade on delete cascade,
        foreign key (UserId) references users (Id)
            on update cascade on delete cascade
)

CREATE TABLE postHistory
(
    Id                INTEGER          not null UNIQUE
        primary key,
    PostHistoryTypeId INTEGER          null,
    PostId            INTEGER          null,
    RevisionGUID      TEXT null,
    CreationDate      DATETIME     null,
    UserId            INTEGER          null,
    Text              TEXT     null,
    Comment           TEXT         null,
    UserDisplayName   TEXT null,
        foreign key (PostId) references posts (Id)
            on update cascade on delete cascade,
        foreign key (UserId) references users (Id)
            on update cascade on delete cascade
)

CREATE TABLE postLinks
(
    Id            INTEGER      not null
        primary key,
    CreationDate  DATETIME null,
    PostId        INTEGER      null,
    RelatedPostId INTEGER      null,
    LinkTypeId    INTEGER      null,
        foreign key (PostId) references posts (Id)
            on update cascade on delete cascade,
        foreign key (RelatedPostId) references posts (Id)
            on update cascade on delete cascade
)

CREATE TABLE posts
(
    Id                    INTEGER          not null UNIQUE
        primary key,
    PostTypeId            INTEGER          null,
    AcceptedAnswerId      INTEGER          null,
    CreaionDate           DATETIME     null,
    Score                 INTEGER          null,
    ViewCount             INTEGER          null,
    Body                  TEXT     null,
    OwnerUserId           INTEGER          null,
    LasActivityDate       DATETIME     null,
    Title                 TEXT null,
    Tags                  TEXT null,
    AnswerCount           INTEGER          null,
    CommentCount          INTEGER          null,
    FavoriteCount         INTEGER          null,
    LastEditorUserId      INTEGER          null,
    LastEditDate          DATETIME     null,
    CommunityOwnedDate    DATETIME    null,
    ParentId              INTEGER          null,
    ClosedDate            DATETIME     null,
    OwnerDisplayName      TEXT null,
    LastEditorDisplayName TEXT null,
        foreign key (LastEditorUserId) references users (Id)
            on update cascade on delete cascade,
        foreign key (OwnerUserId) references users (Id)
            on update cascade on delete cascade,
        foreign key (ParentId) references posts (Id)
            on update cascade on delete cascade
)

CREATE TABLE tags
(
    Id            INTEGER          not null
        primary key,
    TagName       TEXT null,
    Count         INTEGER          null,
    ExcerptPostId INTEGER          null,
    WikiPostId    INTEGER          null,
    foreign key (ExcerptPostId) references posts (Id)
        on update cascade on delete cascade
)

CREATE TABLE users
(
    Id              INTEGER          not null UNIQUE
        primary key,
    Reputation      INTEGER          null,
    CreationDate    DATETIME     null,
    DisplayName     TEXT null,
    LastAccessDate  DATETIME     null,
    WebsiteUrl      TEXT null,
    Location        TEXT null,
    AboutMe         TEXT     null,
    Views           INTEGER          null,
    UpVotes         INTEGER          null,
    DownVotes       INTEGER          null,
    AccountId       INTEGER          null,
    Age             INTEGER          null,
    ProfileImageUrl TEXT null
)

CREATE TABLE votes
(
    Id           INTEGER  not null
        primary key,
    PostId       INTEGER  null,
    VoteTypeId   INTEGER  null,
    CreationDate DATE null,
    UserId       INTEGER  null,
    BountyAmount INTEGER  null,
        foreign key (PostId) references posts (Id)
            on update cascade on delete cascade,
        foreign key (UserId) references users (Id)
            on update cascade on delete cascade
)

-- External Knowledge: the post that is well-finished refers to ClosedDate IS NOT Null
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the display names of all the users who owns a post that is well-finished.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT DISTINCT users.DisplayName FROM users INNER JOIN posts ON users.Id = posts.OwnerUserId WHERE posts.ClosedDate IS NOT NULL;
----------------------------






-- ACTUAL RESULTS
[('Menno',), ('Harvey Motulsky',), ('Yahel',), ('miku',), ('Rizwan Kassim',), ('hslc',), ('Tailltu',), ('user531',), ('Christine Forrester',), ('Roy Maclean',), ('Graviton',), ('Tailltu',), ('euki',), ('Robby McKilliam',), ('Hibernating',), ('ninjaPixel',), ('Vass',), ('Andrew V',), ('Tal Galili',), ('Misha',), ('ronaf',), ('Btibert3',), ('Spencer',), ('niko',), ('shadi',), ('Neelam',), ('Skarab',), ('Indolering',), ('sprugman',), ('Saneef',), ('fxnikee',), ('astrofrog',), ('baboonWorksFine',), ('rpierce',), ('steffen',), ('lmsasu',), ('Tom Wright',), ('dassouki',), ('Raskolnikov',), ('vqv',), ('lmsasu',), ('Jana',), ('Beatrice',), ('user3085',), ('DrWho',), ('Tal Galili',), ('sarikan',), ('Omar Kooheji',), ('Maurizio',), ('ExDes',), ('Gaetan Lion',), ('ulidtko',), ('Bunnenberg',), ('bit-question',), ('Matthias Vallentin',), ('dole doug',), ('skybreaker',), ('SUBHABRATA',), ('Martin',), ('asad.taj',), ('vonjd',), ('user4229',), ('user3897',), ('barrycarter',), ('MYaseen208',), ('patrickmdnet',), ('Nyota',), ('Denis Gorodetskiy',), ('Philipp',), ('Son',), ('ayush biyani',), ('Tom Arnold',), ('David Buerer',), ('baz',), ('Luca',), ('user4823',), ('radek',), ('sam',), ('Jeff Hunter',), ('evdstat',), ('Fan Zhang',), ('Jens',), ('benhamner',), ('user5268',), ('s_sherly',), ('Tu.2',), ('scorpion',), ('Michael Bishop',), ('sara',), ('Dail',), ('sprugman',), ('henle',), ('Andy',), ('GuhJY',), ('Michael Barton',), ('cfceric',), ('Arun',), ('David M Kaplan',), ('InquilineKea',), ('user333',), ('vigneswaran',), ('Angelo',), ('Michael Bishop',), ('spadequack',), ('geef',), ('Curious',), ('Sasha',), ('mkk',), ('myruki',), ('Dail',), ('user6339',), ('Milos',), ('Adhesh Josh',), ('Ashok',), ('nclfinance',), ('Thomas Levine',), ('Adhesh Josh',), ('Adhesh Josh',), ('Jacob',), ('chris',), ('jonas',), ('Dail',), ('stan',), ('Developer',), ('Graviton',), ('László',), ('Mimi',), ('Mimi',), ('Mimi',), ('Ujjwal',), ('Jules',), ('Richard Herron',), ('Tizz',), ('Tizz',), ('Dariush',), ('hhh',), ('timm',), ('M.R.Garmsiri',), ('Beatrice',), ('rosser',), ('steffen',), ('Honglang Wang',), ('Cheng',), ('Andrew Robinson',), ('zca0',), ('user3125',), ('Jack Schmidt',), ('Dail',), ('Thomas Clowes',), ('Thomas',), ('James',), ('Dimitar Vouldjeff',), ('tryingtoremovetheuserprofile',), ('Bashayer Turkustani',), ('Dail',), ('Anamika',), ('J M',), ('Szabolcs',), ('Hafsa Hina',), ('Erik',), ('Roji',), ('CodeNoob',), ('Tiffiny',), ('Joel W.',), ('tayf',), ('MisterH',), ('Squ36',), ('Lostsoul',), ('Kaleb',), ('Lostsoul',), ('oDDsKooL',), ('Brett Magill',), ('PhD',), ('Mike Axiak',), ('Lorin Hochstein',), ('Michael.Z',), ('lokheart',), ('Learner',), ('JCWong',), ('AweSIM',), ('statnoob',), ('Learner',), ('lakesh',), ('krammer',), ('Fiona',), ('Beltrame',), ('Ben Coleman',), ('dan12345',), ('Tony James',), ('shn',), ('Tony ejnrjekr',), ('user1061210',), ('andreister',), ('EMS',), ('Hossein',), ('M C',), ('Michael McGowan',), ('Sachin Shekhar',), ('tdc',), ('Noah Watkins',), ('learner',), ('Travis',), ('Cara',), ('Nicola Rosaia',), ('user176105',), ('Ellie',), ('Frank',), ('TaeHeon Kim',), ('Enno Shioji',), ('Stephen',), ('user765195',), ('Luna',), ('John Miner',), ('James',), ('kspacja',), ('Alexa',), ('Stephen',), ('Xalloumokkelos',), ('Ross',), ('Junkie Dolphin',), ('csta',), ('Derp',), ('James Highbright',), ('Ari',), ('Gordon Blue',), ('Barry',), ('Bakaburg',), ('Salman A',), ('sillymoon',), ('Stephanie Vanterpool',), ('glassy',), ('Serge',), ('Luana',), ('krlmlr',), ('Ashal',), ('ikz',), ('User',), ('Hanne',), ('rique',), ('Aslan986',), ('orky',), ('mbaitoff',), ('david',), ('drfloob',), ('Joel W.',), ('Andrew',), ('user3269',), ('Sagar Nikam',), ('Michael',), ('Glenlivet',), ('Stéphane Laurent',), ('Ali',), ('jijo',), ('RWL01',), ('userU',), ('jochem damen',), ('Sagar Nikam',), ('sajni',), ('Anna Varvak',), ('yura',), ('Tom',), ('user9481',), ('Vathom',), ('natorro',), ('rajan sthapit',), ('tobias mguire',), ('snape_ar',), ('rajan sthapit',), ('evren',), ('Chris',), ('rajan sthapit',), ('Bill Cheatham',), ('Giorgio Spedicato',), ('Seb',), ('Tengo Jokhadze',), ('Sami',), ('Trying Hard',), ('Coder',), ('PAS',), ('Maxime',), ('shn',), ('Florian Pilz',), ('Emily',), ('Vÿska',), ('M.A',), ('user4581',), ('user1061210',), ('daniellopez46',), ('Wendy Alfaro',), ('user1873',), ('Angelo',), ('Benoit_Plante',), ('ocram',), ('Abe',), ('act00',), ('act00',), ('lord12',), ('Alex',), ('Sihem',), ('user34790',), ('chtfn',), ('Anthony',), ('Scott Wood',), ('subhash c. davar',), ('Pacific 231',), ('Diego',), ('Eleonora',), ('user969113',), ('Gang Liu',), ('Fabian',), ('Upul',), ('Oliver',), ('TMOD',), ('Lews Therin',), ('mp77',), ('h.l.m',), ('Luna',), ('Cyrus',), ('lokheart',), ('screechOwl',), ('h.l.m',), ('Heather',), ('Jon',), ('too',), ('Alexx Hardt',), ('nth',), ('Jenny',), ('Osman',), ('sjm.majewski',), ('Abe',), ('yud',), ('gaussblurinc',), ('Number Cruncher',), ('Gern Blankston',), ('user2295350',), ('Antonio Tirri',), ('Wiener.Snausage',), ('Behacad',), ('Pr0no',), ('Sidd',), ('Ricky Robinson',), ('Joshua Frank',), ('Vinterwoo',), ('James',), ('Cátia',), ('barrycarter',), ('Kat Burn',), ('Alexander',), ('user13591',), ('garak',), ('Victor Sarramian',), ('Sandeep Kumar',), ('Aliya',), ('user13665',), ('bjoernz',), ('JCWong',), ('maxwell Chaka',), ('SUBHABRATA',), ('Daniel',), ('Ali',), ('niko',), ('user31820',), ('jokel',), ('user1643060',), ('lpryor',), ('adam.888',), ('Wei',), ('kittensatplay',), ('Abinash Adhikari',), ('zer0ne',), ('huda',), ('Ken',), ('mane',), ('I am',), ('data_miner',), ('user1322919',), ('tereško',), ('Skeetch',), ('ViGnEsH',), ('MsSnowy',), ('mac389',), ('jerry',), ('eyaler',), ('user1676226',), ('Peter',), ('Sphinx.hui',), ('sparc_spread',), ('Philena Farmer',), ('user14357',), ('user1172468',), ('kittensatplay',), ('user14403',), ('jsuss',), ('Rebecca Anderson',), ('Sanne',), ('Archaeopteryx',), ('M.A',), ('jokel',), ('Shep',), ('rotating_image',), ('Bill718',), ('Atticus29',), ('naught101',), ('nth',), ('akaphenom',), ('aaaaaa',), ('Erogol',), ('John Doucette',), ('PraneethVepakomma',), ('user1731927',), ('Miroslav Sabo',), ('Kait',), ('Kaish',), ('emanuela.struffolino',), ('Rhubarb Joker',), ('Tim',), ('trideceth12',), ('ashwin',), ('statsnoob',), ('Leo',), ('addy',), ('Piotr Migdal',), ('p.marino',), ('xardox',), ('xardox',), ('Michelle',), ('Saber CN',), ('metdos',), ('Davoud Taghawi-Nejad',), ('Loby',), ('Mahmood',), ('MSKfdaswplwq',), ('Programming Noob',), ('csta',), ('bit-question',), ('James',), ('snow_leopard',), ('FloppyDisk',), ('James',), ('tfarkas',), ('Erel Segal Halevi',), ('KvanTTT',), ('Angel',), ('Ask',), ('caseyr547',), ('Amir Masoud',), ('Patrick Da Silva',), ('GEA',), ('cfceric',), ('Kuds',), ('mahendra',), ('user1775772',), ('Tan Boon Pin',), ('Sree Aurovindh',), ('o.v.',), ('Adele Tommers',), ('Tomas',), ('Siyanda',), ('Franklin De Los Santos',), ('Angelo',), ('dianna',), ('Laura',), ('Adam Ryczkowski',), ('alm',), ('hhh',), ('Fouad',), ('vonjd',), ('GeorgeMcDowd',), ('Norman',), ('Noam Peled',), ('Will Jagy',), ('Jase',), ('Andreas Rybicki',), ('Damian',), ('PascalvKooten',), ('kamaci',), ('Leo',), ('MaoYiyi',), ('dan',), ('Yannick Schindler',), ('KJB',), ('Leo',), ('ttsiodras',), ('Jessica',), ('user6076',), ('act00',), ('Mutlaq Al-Enezi',), ('The_Cthulhu_Kid',), ('Kyle.',), ('B_Miner',), ('Komal',), ('r0u1i',), ('grajlord',), ('Komal',), ('NIH',), ('Komal',), ('O P',), ('Günal',), ('Marie',), ('Susie G.',), ('rpierce',), ('Günal',), ('user1142937',), ('MaoYiyi',), ('dato datuashvili',), ('nachocab',), ('Andrea Cromartie',), ('Leona',), ('KE.',), ('Rico',), ('cfceric',), ('Benjamin',), ('user20053',), ('Karl',), ('Masterminder',), ('JolJols',), ('Bas Lee',), ('Jack Martin',), ('Wendy Alfaro',), ('user4681',), ('ph_singer',), ('shn',), ('amphibient',), ('Berk U.',), ('Daniel C',), ('endamaco',), ('lui14',), ('Srinivasa Reddy Challa',), ('ryan',), ('Guangchun',), ('Aftershock',), ('Larry',), ('kasterma',), ('Tyro',), ('jrand',), ('POTENZA',), ('Osman Khalid',), ('qed',), ('user20971',), ('hejseb',), ('Jim Thio',), ('sam',), ('imallhere',), ('user1474074',), ('Adam Russell',), ('garak',), ('dataznkid1',), ('user21191',), ('Alexander Chervov',), ('ghcvieira',), ('Idin',), ('siegel',), ('MrBenderV',), ('user21580',), ('floripus',), ('Stat',), ('Lolly',), ('nadia',), ('Michael Lew',), ('marian',), ('user21826',), ('Moe',), ('user1375871',), ('user22268',), ('user1172558',), ('Salih Ucan',), ('user34790',), ('datta ram',), ('Peter Demin',), ('Syswizard',), ('Stijn',), ('user22432',), ('user1717544',), ('Emanuelle',), ('user23672',), ('SwimBikeRun',), ('Emilio A',), ('user23849',), ('Will',), ('Komal',), ('forthewinwin',), ('Troetelbiertje',), ('Developer',), ('user1471980',), ('mark mcmurray',), ('Developer',), ('pengsun.thu',), ('user20780',), ('Tommaso',), ('user65713',), ('proustwasneuro',), ('andy',), ('Mat.S',), ('jjepsuomi',), ('AP13',), ('Andy',), ('user2120893',), ('Stat Tistician',), ('Abe',), ('Dazed and Confused',), ('Yas',), ('Blain Waan',), ('Pygmalion',), ('arshad',), ('Vic',), ('Michael Hardy',), ('phil12',), ('rslite',), ('Ashkan',), ('Guess Gucci',), ('Victor',), ('user24955',), ('MustSeeMelons',), ('amaron',), ('fox',), ('Eva',), ('Stat Tistician',), ('user25219',), ('Bunnenberg',), ('Poll',), ('Anna',), ('Berk U.',), ('VGonPa',), ('user2086122',), ('Yasser Al-Qadhi',), ('Xen dat',), ('Remi.b',), ('Remi.b',), ('user25630',), ('Kevin',), ('alexkaz',), ('user1343318',), ('godzilla',), ('Razan Paul',), ('b.raoul',), ('TheAnalyst',), ('CCL',), ('Intensifying Sunrit',), ('PascalvKooten',), ('user2312186',), ('Tim',), ('mafbarth',), ('Victor P',), ('frickskit',), ('Francesco',), ('mreq',), ('Kinh Nguyen',), ('rasole',), ('user26091',), ('user26261',), ('goldisfine',), ('mat',), ('multiphrenic',), ('0x6B6F77616C74',), ('Jonathan',), ('user1925750',), ('Stephen Lien',), ('kjo',), ('tree',), ('Sabba',), ('MathematicalOrchid',), ('John',), ('stephen',), ('Ignacio',), ('Tim',), ('qwer1304',), ('drsnyder',), ('user1140126',), ('Hamman Samuel',), ('act00',), ('jjepsuomi',), ('hello',), ('2scoops',), ('Besct',), ('Amanda',), ('Lucozade',), ('ery',), ('Tim Heinert',), ('quazgar',), ('user423805',), ('thethuthinnang',), ('Business stats',), ('Patrícia Malico Alexandre',), ('shakthydoss',), ('Tim',), ('juba',), ('guest',), ('Sol Lago',), ('CodeGuy',), ('Jammal Fahim',), ('tndoan',), ('varin sacha',), ('Doug',), ('giordano',), ('johan',), ('user27746',), ('M.O. O.',), ('histelheim',), ('Karianjahi Njeri',), ('user27825',), ('rose',), ('user27379',), ('tomasz74',), ('Ahmed',), ('DavideChicco.it',), ('Ronin',), ('yimon',), ('boucekv',), ('gct',), ('user27953',), ('Schaun Rake',), ('george',), ('Mohammad Aliannejadi',), ('B_Miner',), ('Leon palafox',), ('Prifti Ervin',), ('Chris Harrod',), ('Jon',), ('user12331',), ('user196711',), ('user31468',), ('emmet ',), ('JustCurious',), ('POD',), ('user1769197',), ('user22062',), ('Nesma Ibrahim',), ('marty_c',), ('user2611214',), ('user31468',), ('titis',), ('CanCeylan',), ('researcher morr',), ('John',), ('Miroslav Sabo',), ('Tim',), ('DRb',), ('Azeem',), ('Vaaal',), ('Deathkill14',), ('pradeep',), ('luke123',), ('user28681',), ('shilpi',), ('Abbas',), ('Bene',), ('user28861',), ('Peteris',), ('user34790',), ('Toy Molto',), ('user34790',), ('vincitus',), ('user1983395',), ('Brenton Horne',), ('user1586259',), ('rcorty',), ('JustCurious',), ('subhash c. davar',), ('novice',), ('Taal',), ('codingjoe',), ('yoyo',), ('user2543622',), ('ryu576',), ('Nicholas',), ('Mihail Plesa',), ('Tim',), ('Nancy',), ('user2697374',), ('James',), ('Lea',), ('Remi.b',), ('user570593',), ('Piotr Migdal',), ('hong',), ('Grete Birkenes',), ('Christiaan Kruger',), ('forecaster',), ('Bluegrass',), ('user34790',), ('subhash c. davar',), ('mwoua',), ('anaya jain',), ('Remi.b',), ('user1883050',), ('user2673404',), ('user2298382',), ('jjepsuomi',), ('Jan Modus',), ('Sh_sharma',), ('PLS',), ('Miroslav Popov',), ('user30012',), ('user15079',), ('Fiona',), ('user30076',), ('user1769197',), ('Dr. OP Sharma',), ('user1805343',), ('nzh',), ('ADP',), ('Maria',), ('Cesare Camestre',), ('DJ_',), ('Hilary Rose Cook',), ('Aly',), ('Grace Carroll',), ('user163',), ('user2800929',), ('user2432701',), ('Dvir Adler',), ('Tedd Williams',), ('Lmao',), ('leviathan',), ('Tomas Trank',), ('user2805443',), ('Ben Mathews',), ('FullMetalGame',), ('Mahmood',), ('Alex',), ('Tom',), ('Laser-boy',), ('user30800',), ('Alby',), ('Michael',), ('Srishti M',), ('MPPM',), ('RegressionGirl',), ('user1140126',), ('Anonymous',), ('JEN',), ('user2806363',), ('matge',), ('Fernando',), ('norway',), ('LYLA',), ('andrea',), ('mikeLdub',), ('user31351',), ('Aleksandr Blekh',), ('ChangeMyName',), ('user2763361',), ('tom cunningham',), ('Bijoy',), ('user1172468',), ('FullMetalGame',), ('user29309',), ('user570593',), ('Steve',), ('Steve',), ('broiyan',), ('SKY',), ('Jos',), ('rbm',), ('Neodyme',), ('SlutskyFan',), ('user67275',), ('user31696',), ('user34790',), ('indieman',), ('user1172468',), ('Sachin_ruk',), ('Contango',), ('user39430',), ('Gallop',), ('rodms',), ('Gregorian Funk',), ('Will',), ('Aslan986',), ('Amateur Math Guy',), ('Luke',), ('triomphe',), ('user227710',), ('Mustard',), ('mahesh',), ('John',), ('TangoStar',), ('user2690457',), ('thatnewguy',), ('mlo',), ('Charlie',), ('Mateusz Chrzaszcz',), ('Arjun',), ('user73309',), ('leena',), ('leena',), ('Farideh Bagherzadeh',), ('saima',), ('Milan Amrut Joshi',), ('dfife',), ('jack',), ('Dalem',), ('user31315',), ('Cagdas Ozgenc',), ('mreq',), ('jack',), ('Anna',), ('Filipe Ferminiano',), ('Josh',), ('christine',), ('Ilya Scharrenbroich',), ('JoeDanger',), ('tBuLi',), ('Remi.b',), ('user2896468',), ('Kirsty',), ('varin sacha',), ('CharlieK',), ('JDneverSleeps',), ('James Pringle',), ('whathits',), ('Dimitris Rizopoulos',), ('Peak Reconstruction Wavelength',), ('name',), ('Silke',), ('Ben Ishak',), ('user35539',), ('user35577',), ('jay',), ('jjepsuomi',), ('Adam Azarov',), ('BielsNohr',), ('Clementina',), ('user35734',), ('David Z',), ('Maddie',), ('jsoalevel',), ('andr',), ('Johann Franklin',), ('MOnica',), ('user22478',), ('B11b',), ('Manoj',), ('Deamonpog',), ('Johann Franklin',), ('user3125',), ('Willem',), ('Mike Flynn',), ('Edmon',), ('Ben Ishak',), ('user2908485',), ('guew',), ('yak',), ('adi',), ('user36353',), ('user32257',), ('Ari',), ('Hiatus',), ('KutaBeach',), ('gizgok',), ('arahant',), ('Clive',), ('dfrankow',), ('garciaj',), ('amphibient',), ('leily',), ('Henrik',), ('Sahil Chopra',), ('Adex',), ('user1380792',), ('user36801',), ('rajatkhanduja',), ('Alex Twain',), ('rani',), ('Zach',), ('traggatmot',), ('Nancy',), ('user37008',), ('pg_smile',), ('Subhash Chander Paul',), ('Broo',), ('redraiders10',), ('Walrus the Cat',), ('Subhash Chander Paul',), ('Michael',), ('Defershu',), ('Leigh',), ('Heisenberg',), ('C Pritchard',), ('Fraijo',), ('user24484',), ('varin sacha',), ('kanbhold',), ('Arihant',), ('OMG',), ('user37587',), ('user3010273',), ('lucacerone',), ('user2310029',), ('shakthydoss',), ('tucson',), ('user31960',), ('user31960',), ('justin',), ('user3269',), ('Oritteropus',), ('Nicolas Lykke Iversen',), ('Robb',), ('probabwarrior',), ('user37774',), ('Mathmath',), ('user31960',), ('Zhi Zhao',), ('Jim Blum',), ('kamaci',), ('paul',), ('tariq',), ('ssdecontrol',), ('mtm',), ('user13985',), ('tucson',), ('Curious',), ('Erin',), ('Nolan Madson',), ('Vivian',), ('amathew',), ('christopher',), ('user67275',), ('Tim',), ('goldisfine',), ('user1800340',), ('SophieR',), ('Pinocchio',), ('luciano',), ('Madushani',), ('tucson',), ('user3056186',), ('Velizar Hristov',), ('Clare Brown',), ('Brett',), ('Livid',), ('Shimea',), ('user39660',), ('user3037153',), ('umair',), ('bbw',), ('eski',), ('Fred',), ('Alby',), ('afsdf dfsaf',), ('gstar2002',), ('Hislam',), ('JackOfAll',), ('praneet verma',), ('user40124',), ('dole doug',), ('lars',), ('user3269',), ('dykw',), ('RUser',), ('valerie',), ('dissertationhelp',), ('darkage',), ('user40422',), ('zps215',), ('user40494',), ('JoelKuiper',), ('user123276',), ('antecessor',), ('darkage',), ('user3269',), ('user3236592',), ('smile',), ('user40494',), ('Miroslav Sabo',), ('user40494',), ('user40767',), ('user39531',), ('Ahdee',), ('user1800340',), ('user40842',), ('dissertationhelp',), ('Adnan Adil',), ('Cita',), ('Abhishek K Das',), ('Sarah',), ('user1919374',), ('afsdf dfsaf',), ('afsdf dfsaf',), ('Ajanma',), ('uchembaka',), ('Marlene',), ('strom',), ('user40991',), ('user40993',), ('user41005',), ('Harry',), ('Jackmc1047',), ('Anthony2104',), ('user40494',), ('user1566200',), ('Ama',), ('user37008',), ('user41218',), ('user41225',), ('user40124',), ('TheFloyd',), ('Weam',), ('user41324',), ('GreatEyes',), ('Ben G',), ('user3324351',), ('user38326',), ('Marshall',), ('anh.hv',), ('Mahmoud Ismael',), ('Coronita',), ('Morgan',), ('IBRAHIM  HAMAD',), ('Dino Abraham',), ('luciano',), ('afsdf dfsaf',), ('Erel Segal Halevi',), ('user3314570',), ('topguypoland',), ('Draper',), ('heltonbiker',), ('tucson',), ('antecessor',), ('Tim',), ('user41814',), ('tdo123',), ('SamuelNLP',), ('Fawwaz B.',), ('mnmltype',), ('Logon',), ('Ahmad',), ('nikkire',), ('ali',), ('user32330',), ('Geek',), ('user3392464',), ('Amy2014',), ('user3288202',), ('lord12',), ('Kev',), ('user123276',), ('Erdenesuvd',), ('Xitrum',), ('V_ix',), ('Szabolcs',), ('user136510',), ('JayCo',), ('ninon',), ('dailytask',), ('Knox',), ('user3288202',), ('loganecolss',), ('EnKei',), ('user42413',), ('dlaser',), ('Daniel Ryback',), ('Remya',), ('Kingstat',), ('Martin',), ('user131983',), ('Mittenchops',), ('user42615',), ('rhombidodecahedron',), ('user123276',), ('Vaaal',), ('Dorcas',), ('Manuel',), ('user138726',), ('user5054',), ('user3451767',), ('denn333',), ('AFZAL HUSSAIN',), ('bigTree',), ('Salman',), ('Ped',), ('Stu',), ('kay',), ('ido',), ('user42936',), ('Twilight Sparkle',), ('sunita',), ('user43075',), ('Saransh chaudhary',), ('user43107',), ('user2543622',), ('user3154267',), ('Adam SA',), ('Iurie',), ('Julie Moramarco',), ('Marilyn',), ('Ernest',), ('Dimitriy V. Masterov',), ('luciano',), ('Dikran Marsupial',), ('logisticgu',), ('Serenthia',), ('hydra_lk',), ('Fatma Rahma',), ('user43405',), ('C_S',), ('user2380245',), ('user43496',), ('Eric',), ('JCWong',), ('user2350622',), ('user43612',), ('user40311',), ('becko',), ('keisZn',), ('Pulse',), ('Verdier',), ('user42164',), ('user40136',), ('eric',), ('becko',), ('Noah',), ('user40490',), ('Donbeo',), ('user43940',), ('GivenPie',), ('Patty',), ('CJWilkinson',), ('user1275515',), ('furkan',), ('Jason Samuels',), ('Someone',), ('user3378649',), ('Anonymous',), ('avi',), ('user40',), ('user40124',), ('user3567860',), ('Tito Candelli',), ('Datamaniac',), ('stats566',), ('user44491',), ('Pat',), ('user40124',), ('EricLM',), ('shakthydoss',), ('Kate',), ('NonSleeper',), ('Jiew Meng',), ('SAM',), ('Darwin PC',), ('Ryan',), ('David Z',), ('B_Miner',), ('dlaser',), ('Qiang Li',), ('loganecolss',), ('Zach',), ('user44954',), ('user17027',), ('AlejandroLL',), ('silencer',), ('user44741',), ('tariq mohamed',), ('Wish',), ('user45118',), ('user961627',), ('Mittenchops',), ('shen',), ('user45274',), ('user3141071',), ('mporkare',), ('user45370',), ('vessilli',), ('user45420',), ('Nabila Naorin',), ('Pio',), ('saiofjkl',), ('Srishti M',), ('user137425',), ('earthlink',), ("Matt O'Brien",), ('Mahmut',), ('user123965',), ('FihopZz',), ('hoof_hearted',), ('De.rek',), ('Pegah',), ('stats-hb',), ('Bunnenberg',), ('Christian',), ('Jasmine',), ('user112947',), ('satya',), ('Kumar Vaibhav',), ('user2458552',), ('Julian',), ('user1205901',), ('blast00',), ('Michael',), ('pwerth',), ('Jingjings',), ('Fahd',), ('Toyanji Joseph',), ('20826',), ('user46697',), ('satya',), ('user46697',), ('user46697',), ('user46697',), ('zaib',), ('zeren',), ('user40596',), ('user46795',), ('user3528592',), ('Anna',), ('stattheory',), ('user45516',), ('Pasato',), ('JohnK',), ('user48131',), ('Arvinder',), ('thistleknot',), ('Manjunath Prasad',), ('user48361',), ('yue86231',), ('user3242742',), ('indrid',), ('Alexander',), ('Stefan',), ('MartaA',), ('PT83',), ('user3693016',), ('CreamStat',), ('Shoaib Ali',), ('BCLC',), ('priya tibrewal',), ('Mrinmoy Roychoudhury',), ('rapaio',), ('felbo',), ('ceiling cat',), ('user40656',), ('Eric_B',), ('curiousmaple',), ('Jessica',), ('user3646666',), ('Ben',), ('statsguyz',), ('doker',), ('Pasato',), ('Heisenberg',), ('user3783236',), ('A A',), ('Peter Nguyen',), ('Kacu',), ('user49232',), ('user3787792',), ('Lucy',), ('Michael James',), ('user3788767',), ('user43790',), ('Alejandro Pulver',), ('renrenthehamster',), ('user49335',), ('user49274',), ('RInatM',), ('Nisa',), ('avyfain',), ('user49449',), ('alex',), ('David Gutiérrez Rubio',), ('user162037',), ('user3013423',), ('Niamh',), ('user3810441',), ('vasili111',), ('Joe Bloggins',), ('KaliMa',), ('20826',), ('EngrStudent',), ('Nate',), ('user6076',), ('Jen',), ('irwenqiang',), ('jonny coltraine',), ('Andy Blankertz',), ('Yaris',), ('user3797829',), ('svmguy',), ('Laurie',), ('Raff Raff',), ('Ata',), ('user46725',), ('Maggie',), ('Frank49',), ('Anjali',), ('user8264',), ('elchulito88',), ('suneet',), ('Leaf',), ('Ria George',), ('user1205901',), ('user52672',), ('user30314',), ('Stacy',), ('cartpool',), ('Sira RM',), ('Carlsberg',), ('nancy',), ('user3855285',), ('Blair Outhwaite',), ('Hadi',), ('user53243',), ('kaka',), ('Alastair',), ('Chuck N',), ('Sam',), ('Sophia J',), ('user52897',), ('Andrew',), ('Gerenuk',), ('Sid',), ('Anjali',), ('Tim',), ('StatsUser',), ('Bahador Saket',), ('tjm_dbtclr',), ('Simon',), ('Anastasios Ventouris',), ('Misakov',), ('Misery',), ('An old man in the sea.',), ('user3788557',), ('sara',), ('user29836',), ('user3762838',), ('Dmitry',), ('user3762838',), ('BADE',), ('bison2178',), ('Reuben',), ('meerak',), ('Scott',), ('Michael',), ('Tyrone Williams',), ('user46835',), ('Mike',), ('dave',), ('Insu Park',), ('dez93_2000',), ('angersan',), ('hedgedandlevered',), ('Mach',), ('James Schwartz',), ('Saurabh Gupta',), ('alex',), ('kamal',), ('Ahnonym',), ('user48918',), ('lalit',), ('Batool',), ('Andrei Kucharavy',), ('ponadto',), ('Natalie',), ('B_Miner',), ('Mike',), ('nickponline',), ('user3914487',), ('user5054',), ('user2333894',), ('nouse',), ('Novem',), ('Mike',), ('rodms',), ('Jay',), ('Tyrone Williams',), ('114',), ('dez93_2000',), ('Gilly',), ('Dan',), ('precision',), ('Fred',), ('feelfree',), ('adam',), ('allen7u',), ('user1019667',), ('user17426',), ('user54804',), ('Mohr',), ('user54804',), ('Funn Me',), ('user3790338',), ('Ian Stuart',), ('Yvan Mwanafunzi',), ('Yvan Mwanafunzi',), ('HungryA',), ('ankit',), ('Driss',), ('user53740',), ('Apurba Gorai',), ('user3790338',), ('user3731561',), ('guestposter',), ('Abbas',), ('Sandipan Bhattacharyya',), ('artdv',), ('Troy Griffiths',), ('user51972',), ('Thomas',), ('jpcgandre',), ('Sandeep Kumar',), ('Aleksandr Blekh',), ('Deepesh',), ('Hypsi',), ('rorycl',), ('aelwan',), ('anna',), ('Ayalew A.',), ('Qin',), ('Aditya HK',), ('Bindya',), ('Hafsah',), ('Abhi',), ('shalz',), ('Sean',), ('Ken Dunn',), ('PSS',), ('CookieCrusher',), ('Nikhil',), ('hicksi',), ('Francesca',), ('Grasshopper',), ('Yakku',), ('user3288202',), ('user35690',), ('user52134',), ('Oleg',), ('user1507435',), ('Mamba',), ('Brian P',), ('Raza',), ('yinka',), ('anat',), ('Majid alDosari',), ('Mike',), ('Brash Equilibrium',), ('sefi',), ('KYG',), ('ElDuderino',), ('Suresh Gorakala',), ('karl',), ('Leira',), ('Anjali',), ('user2003951',), ('Mr. A',), ('Nancy A.',), ('Fateme',), ('MakuaChukwu Ojide',), ('PennyJ',), ('ROCK',), ('thistleknot',), ('cactuar',), ('Abhishek Das',), ('Onkarabile',), ('hiall',), ('failedstudent',), ('derNincompoop',), ('dean',), ('Amena',), ('Rebecca',)]
----------------------------
