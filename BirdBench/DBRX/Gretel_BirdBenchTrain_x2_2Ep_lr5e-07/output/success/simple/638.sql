-- PROBLEM # 638
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

-- External Knowledge: name of users refers to DisplayName; the Organizer Badges refer to badges where Name = 'Organizer';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List all the name of users that obtained the Organizer Badges.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT u.DisplayName FROM users u JOIN badges b ON u.Id = b.UserId WHERE b.Name = 'Organizer'
----------------------------






-- ACTUAL RESULTS
[('Harlan',), ('Jason Punyon',), ('Fabian Steeg',), ('Mehper C. Palavuzlar',), ('Duke of Lizards',), ('A Lion',), ('Sharpie',), ('Rich',), ('radek',), ('mbq',), ('Rob Hyndman',), ('grokus',), ('brotchie',), ('Roman Luštrik',), ('Baltimark',), ('Peter Smit',), ('Shane',), ('rcs',), ('robin girard',), ('Bossykena',), ('kaybenleroll',), ('Matt Parker',), ('Łukasz Lew',), ('jilles de wit',), ('csgillespie',), ('Daniel Vassallo',), ('John L. Taylor',), ('Peter Mortensen',), ('walkytalky',), ('Jeromy Anglim',), ('whuber',), ('mmyers',), ('Aniko',), ('Henrik',), ('chl',), ('shabbychef',), ('Thylacoleo',), ('onestop',), ('Andy W',), ('M. Tibbits',), ('Stephan Kolassa',), ('Brett Magill',), ('conjugateprior',), ('John',), ('RockScience',), ('Chase',), ('Bernd Weiss',), ('Gavin Simpson',), ('fabians',), ('Christopher Aden',), ('mpiktas',), ('Peter Flom',), ('user2779',), ('DWin',), ('steffen',), ('suncoolsu',), ('nico',), ('Queops',), ('EDi',), ('Simon Byrne',), ('bayerj',), ('Ralph Winters',), ('Dmitrij Celov',), ('SheldonCooper',), ('caracal',), ('charles.y.zheng',), ('AndreaZ',), ('GaBorgulya',), ('fmark',), ('Fr.',), ('cardinal',), ('Joris Meys',), ('rolando2',), ('David',), ('JMS',), ('Michael Bishop',), ('Ｊ. Ｍ.',), ('404Dreamer_ML',), ('deps_stats',), ('richiemorrisroe',), ('Aaron',), ('Suresh Venkatasubramanian',), ('Freya Harrison',), ('fgregg',), ('Mike T',), ('Patrick McCann',), ('Thomas Levine',), ('Theta30',), ('ttnphns',), ('wolf.rauch',), ('Macro',), ('Har',), ('Zach',), ('StasK',), ('nzcoops',), ('Derek Ploor',), ('Iterator',), ('Brandon Bertelsen',), ('Seth Rogers',), ('Fomite',), ('Harvey Motulsky',), ('Max Gordon',), ('Greg Snow',), ('Charlie',), ('thias',), ('Mike Wierzbicki',), ('John Colby',), ('Karl',), ('John Doucette',), ('Josh Hemann',), ('Nick Sabbe',), ('JohnRos',), ('Dason',), ('Sam Roberts',), ('Nicolas Kaiser',), ('jthetzel',), ('wcairns',), ('gung',), ('Michael McGowan',), ('Anony-Mousse',), ("Xi'an",), ('Seb',), ('clyfe',), ('jbowman',), ('Dennis Jaheruddin',), ('Elvis',), ('David',), ('Jack Tanner',), ('Peter Ellis',), ('Michelle',), ('Artem Kaznatcheev',), ('Dimitriy V. Masterov',), ('lmsasu',), ('David Robinson',), ('ocram',), ('vinux',), ('Daniel Johnson',), ('Atilla Ozgur',), ('tdc',), ('Jeff',), ('Neil G',), ('smillig',), ('Memming',), ('krlmlr',), ("Martin O'Leary",), ('Firefeather',), ('naught101',), ('b70568b5',), ('Kyle Brandt',), ('Matt Krause',), ('user568458',), ('Owe Jessen',), ('Andrew',), ('Momo',), ('Gschneider',), ('Emre',), ('Tristan',), ('guest',), ('Stat-R',), ('leonbloy',), ('Ken',), ('Alexander',), ('Leo',), ('Feral Oink',), ('MånsT',), ('Brian Diggs',), ('user603',), ('stackovergio',), ('Stéphane Laurent',), ('Jonathan Thiele',), ('Curious',), ('Wolfgang',), ('Bogdanovist',), ('jonsca',), ('gui11aume',), ('slhck',), ('Jonathan',), ('rpierce',), ('Akavall',), ('Etiennebr',), ('atiretoo',), ('Erik',), ('gisol',), ('Ken Williams',), ('Henry',), ('Argha',), ('Michael Chernick',), ('Roland',), ('RioRaider',), ('Manoel Galdino',), ('boscovich',), ('Sven Hohenstein',), ('NaN',), ('Assad Ebrahim',), ('Bill the Lizard',), ('nadya',), ('MannyG',), ('djhurio',), ('fg nu',), ('C. Ross',), ('Glen_b',), ('Stuart',), ('MattBagg',), ('Kyle.',), ('cbeleites',), ('sjm.majewski',), ('Gilbert',), ('memilanuk',), ('Rasmus Bååth',), ('Alex',), ('zbicyclist',), ('James Stanley',), ('Jonathan Christensen',), ('ziyuang',), ('Alpha',), ('Arthur Small',), ('Scortchi',), ('user023472',), ('Deer Hunter',), ('Tumbledown',), ('Cam.Davidson.Pilon',), ('Metrics',), ('entropy',), ('David J. Harris',), ('Davide Giraudo',), ('kamaci',), ('Antoine Vernet',), ('AdamO',), ('Brett Wolfington',), ('Corone',), ('amphibient',), ('Max',), ('Ming-Chih Kao',), ('gregmacfarlane',), ('user695652',), ('Cheatboy2',), ('BGreene',), ('Miguel de Cervantes',), ('gjabel',), ('Wolv',), ('random_user',), ('user22410',), ('dav',), ('Andre Silva',), ('V.C.',), ('curious_cat',), ('wcampbell',), ('usεr11852',), ('Stat',), ('sashkello',), ('gpoo',), ('Robert Long',), ('ACD',), ('Eric Peterson',), ('Vara',), ('Gala',), ('Mark T Patterson',), ('Patrick S. Forscher',), ('Nick Cox',), ('Jeremy Miles',), ('Kiudee',), ('Twitch_City',), ('non-numeric_argument',), ('COOLSerdash',), ('Gilles',), ('TooTone',), ('Nameless',), ('xan',), ('Ed Dean',), ('Chris Ferrie',), ('Paul Hiemstra',), ('Flounderer',), ('Quartz',), ('bjou',), ('QuantIbex',), ('Maarten Buis',), ('Marc in the box',), ('Azeem',), ('atrichornis',), ('juampa',), ('anxoestevez',), ('Jake Westfall',), ('Randel',), ('steadyfish',), ('Waldir Leoncio',), ('Hong Ooi',), ('Joel Reyes Noche',), ('gov',), ('Ret',), ('fredrikhs',), ('BlankUsername',), ('jokel',), ('Andy',), ('Patrick Coulombe',), ('lmjohns3',), ('SRJ',), ('Comp_Warrior',), ('lejlot',), ('Simon Hayward',), ('marshall',), ('Avraham',), ('user777',), ('Adam Bailey',), ('Ben Bolker',), ('Bill',), ('mrgloom',), ('Merovingian',), ('Tal Galili',), ('Zhubarb',), ('Affine',), ('user163',), ('Gregor',), ('tree',), ('dardisco',), ('Richard D',), ('fileunderwater',), ('Mike John',), ('redraiders10',), ('Teco',), ('HFBrowning',), ('Franck Dernoncourt',), ('Matthew Plourde',), ('Tharindu Rusira',), ('mugen',), ('Nabla',), ('dwstu',), ('Hibernating',), ('Alecos Papadopoulos',), ('Nick Stauner',), ('subhash c. davar',), ('dmckee',), ('Eduardo',), ('Ladislav Nado',), ('philchalmers',), ('amoeba',), ('Final Litiu',), ('user12202013',), ('iliasfl',), ('Behacad',), ('tony',), ('Marc Claesen',), ('Karl Ove Hufthammer',), ('RossXV',), ('ChuNan',), ('lennon310',), ('Zen',), ('landroni',), ('Wayne',), ('charles',), ('David Marx',), ('ezbentley',), ('Penguin_Knight',), ('Srishti M',), ('Frank Harrell',), ('Mikkel N. Schmidt',), ('kousu',), ('Christopher Brown',), ('user42615',), ('smci',), ('EnKei',), ('Evgeniy',), ('Nathaniel Payne',), ('Bitwise',), ('Raffael',), ('Csislander',), ('Aksakal',), ('pneumatics',), ('Deathkill14',), ('bartektartanus',), ('Horst Grünbusch',), ('adunaic',), ('feetwet',), ('Alexis',), ('Exclusive92',), ('jsk',), ('Jaap',), ('Meadowlark Bradsher',), ('user45086',), ('rocinante',), ('user41593',), ('user45843',), ('senshin',), ('Gryphoenix',), ('kjetil b halvorsen',), ('jona',), ('eqperes',), ('Graeme Walsh',), ('Lost in transcription',), ('JohnK',), ('micans',), ('user44903',), ('beginneR',), ('Ram Sharma',), ('pavid',), ('John ',), ('user45913',), ('Gilles',), ('niandra82',), ('Gordimer',), ('Steve S',), ('Waterman',), ('BCLC',), ('nsw',), ('Steve',), ('Jeremy Heiler',), ('forecaster',), ('FXQuantTrader',), ('ssdecontrol',), ('vasili111',)]
----------------------------
