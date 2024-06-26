-- PROBLEM # 595
-- Generation # 0
-- Difficulty: moderate
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

-- External Knowledge: having at least 1000 view refers to Views > = 1000; user refers to UserId
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which user have only one post history per post and having at least 1000 views?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT UserId FROM (SELECT UserId, PostId, COUNT(*) as count FROM postHistory GROUP BY UserId, PostId) as subquery WHERE count = 1 GROUP BY UserId HAVING COUNT(DISTINCT PostId) > 1;
----------------------------




-- RESULTS FROM GENERATED SQL
[(None,), (-1,), (5,), (6,), (8,), (11,), (13,), (17,), (22,), (24,), (25,), (26,), (29,), (30,), (33,), (34,), (36,), (39,), (41,), (46,), (55,), (56,), (57,), (59,), (61,), (62,), (68,), (69,), (71,), (72,), (74,), (77,), (79,), (80,), (82,), (87,), (88,), (89,), (90,), (92,), (96,), (98,), (101,), (103,), (110,), (114,), (118,), (123,), (124,), (127,), (128,), (130,), (139,), (142,), (144,), (145,), (158,), (159,), (168,), (170,), (173,), (174,), (179,), (183,), (187,), (188,), (190,), (196,), (198,), (199,), (210,), (211,), (213,), (214,), (215,), (216,), (217,), (218,), (221,), (223,), (226,), (227,), (229,), (230,), (236,), (240,), (247,), (251,), (253,), (256,), (260,), (264,), (266,), (268,), (270,), (273,), (277,), (279,), (287,), (288,), (300,), (302,), (303,), (307,), (315,), (317,), (319,), (333,), (334,), (339,), (352,), (358,), (364,), (368,), (375,), (378,), (380,), (394,), (401,), (419,), (434,), (438,), (439,), (442,), (447,), (449,), (460,), (478,), (482,), (485,), (493,), (495,), (501,), (509,), (511,), (521,), (523,), (530,), (549,), (556,), (557,), (561,), (569,), (572,), (573,), (582,), (597,), (601,), (603,), (609,), (615,), (635,), (638,), (643,), (656,), (660,), (665,), (666,), (686,), (696,), (697,), (702,), (704,), (729,), (732,), (740,), (743,), (749,), (770,), (776,), (778,), (781,), (795,), (805,), (812,), (830,), (845,), (858,), (869,), (873,), (880,), (881,), (887,), (892,), (900,), (913,), (919,), (930,), (942,), (956,), (959,), (961,), (966,), (976,), (979,), (994,), (996,), (1028,), (1033,), (1036,), (1047,), (1048,), (1050,), (1076,), (1080,), (1098,), (1105,), (1106,), (1107,), (1108,), (1112,), (1118,), (1119,), (1122,), (1124,), (1126,), (1146,), (1154,), (1191,), (1195,), (1205,), (1219,), (1229,), (1248,), (1250,), (1265,), (1270,), (1287,), (1291,), (1307,), (1320,), (1329,), (1334,), (1347,), (1349,), (1351,), (1352,), (1355,), (1356,), (1381,), (1390,), (1392,), (1397,), (1434,), (1436,), (1443,), (1445,), (1475,), (1496,), (1499,), (1501,), (1513,), (1537,), (1540,), (1549,), (1569,), (1573,), (1583,), (1614,), (1640,), (1643,), (1657,), (1670,), (1679,), (1689,), (1709,), (1737,), (1739,), (1756,), (1760,), (1763,), (1764,), (1765,), (1766,), (1777,), (1789,), (1795,), (1806,), (1808,), (1815,), (1818,), (1831,), (1834,), (1856,), (1860,), (1873,), (1876,), (1893,), (1909,), (1913,), (1916,), (1934,), (1935,), (1945,), (1966,), (1971,), (1977,), (1979,), (2020,), (2028,), (2030,), (2036,), (2040,), (2044,), (2046,), (2067,), (2072,), (2073,), (2074,), (2077,), (2078,), (2111,), (2116,), (2117,), (2126,), (2129,), (2134,), (2144,), (2148,), (2150,), (2164,), (2166,), (2202,), (2238,), (2247,), (2260,), (2262,), (2280,), (2310,), (2312,), (2325,), (2339,), (2387,), (2392,), (2425,), (2456,), (2472,), (2485,), (2489,), (2498,), (2513,), (2539,), (2546,), (2591,), (2592,), (2617,), (2635,), (2643,), (2644,), (2645,), (2658,), (2660,), (2669,), (2676,), (2714,), (2719,), (2728,), (2739,), (2750,), (2773,), (2775,), (2795,), (2798,), (2817,), (2831,), (2833,), (2849,), (2860,), (2898,), (2902,), (2904,), (2910,), (2916,), (2917,), (2921,), (2958,), (2959,), (2965,), (2970,), (2973,), (2975,), (2981,), (3014,), (3019,), (3036,), (3058,), (3077,), (3084,), (3094,), (3098,), (3140,), (3248,), (3262,), (3264,), (3265,), (3277,), (3280,), (3291,), (3293,), (3305,), (3309,), (3330,), (3331,), (3345,), (3369,), (3376,), (3377,), (3382,), (3396,), (3406,), (3408,), (3411,), (3422,), (3432,), (3437,), (3454,), (3459,), (3467,), (3468,), (3484,), (3485,), (3488,), (3489,), (3501,), (3542,), (3546,), (3567,), (3572,), (3582,), (3591,), (3595,), (3597,), (3601,), (3617,), (3640,), (3651,), (3700,), (3732,), (3748,), (3754,), (3762,), (3770,), (3786,), (3794,), (3799,), (3805,), (3807,), (3816,), (3826,), (3834,), (3835,), (3840,), (3847,), (3867,), (3874,), (3886,), (3903,), (3911,), (3919,), (3929,), (3964,), (4041,), (4045,), (4048,), (4062,), (4084,), (4110,), (4147,), (4160,), (4164,), (4173,), (4226,), (4240,), (4253,), (4257,), (4278,), (4322,), (4325,), (4329,), (4337,), (4344,), (4360,), (4364,), (4376,), (4426,), (4443,), (4454,), (4479,), (4485,), (4495,), (4496,), (4505,), (4531,), (4559,), (4580,), (4581,), (4598,), (4600,), (4607,), (4617,), (4618,), (4637,), (4672,), (4673,), (4691,), (4701,), (4733,), (4737,), (4751,), (4754,), (4763,), (4764,), (4767,), (4797,), (4812,), (4829,), (4843,), (4856,), (4862,), (4864,), (4872,), (4881,), (4884,), (4897,), (4908,), (4912,), (4916,), (4922,), (4942,), (4959,), (4975,), (4978,), (5003,), (5020,), (5025,), (5042,), (5044,), (5055,), (5161,), (5172,), (5174,), (5176,), (5179,), (5191,), (5221,), (5234,), (5240,), (5244,), (5256,), (5264,), (5268,), (5280,), (5289,), (5296,), (5321,), (5339,), (5387,), (5392,), (5404,), (5407,), (5429,), (5443,), (5461,), (5471,), (5480,), (5494,), (5503,), (5505,), (5509,), (5536,), (5539,), (5544,), (5545,), (5555,), (5561,), (5573,), (5594,), (5615,), (5627,), (5638,), (5641,), (5654,), (5691,), (5696,), (5706,), (5729,), (5739,), (5750,), (5764,), (5767,), (5781,), (5792,), (5795,), (5829,), (5832,), (5836,), (5859,), (5862,), (5864,), (5880,), (5892,), (5919,), (5926,), (5927,), (5959,), (6000,), (6015,), (6029,), (6039,), (6043,), (6064,), (6076,), (6082,), (6096,), (6129,), (6138,), (6169,), (6174,), (6189,), (6192,), (6204,), (6206,), (6246,), (6248,), (6300,), (6301,), (6369,), (6378,), (6401,), (6415,), (6432,), (6436,), (6446,), (6476,), (6479,), (6484,), (6489,), (6497,), (6534,), (6547,), (6552,), (6575,), (6577,), (6579,), (6624,), (6633,), (6637,), (6640,), (6648,), (6649,), (6664,), (6666,), (6723,), (6725,), (6750,), (6768,), (6783,), (6793,), (6814,), (6828,), (6829,), (6845,), (6857,), (6861,), (6863,), (6866,), (6869,), (6872,), (6877,), (6884,), (6897,), (6917,), (6920,), (6941,), (6961,), (6973,), (6976,), (6977,), (6993,), (7000,), (7008,), (7025,), (7038,), (7040,), (7045,), (7071,), (7086,), (7099,), (7104,), (7127,), (7135,), (7138,), (7141,), (7159,), (7169,), (7170,), (7172,), (7174,), (7179,), (7188,), (7199,), (7224,), (7244,), (7250,), (7251,), (7282,), (7289,), (7290,), (7291,), (7304,), (7306,), (7336,), (7362,), (7365,), (7386,), (7397,), (7409,), (7411,), (7419,), (7425,), (7432,), (7448,), (7482,), (7486,), (7497,), (7508,), (7515,), (7521,), (7529,), (7539,), (7555,), (7591,), (7603,), (7616,), (7620,), (7644,), (7647,), (7673,), (7690,), (7706,), (7733,), (7741,), (7744,), (7746,), (7787,), (7788,), (7789,), (7795,), (7810,), (7817,), (7819,), (7828,), (7837,), (7877,), (7880,), (7883,), (7884,), (7893,), (7952,), (7958,), (7962,), (7964,), (7972,), (7994,), (8010,), (8013,), (8033,), (8041,), (8053,), (8067,), (8076,), (8077,), (8089,), (8101,), (8111,), (8112,), (8120,), (8137,), (8141,), (8144,), (8165,), (8171,), (8175,), (8177,), (8182,), (8196,), (8200,), (8205,), (8207,), (8209,), (8226,), (8238,), (8242,), (8259,), (8289,), (8293,), (8314,), (8320,), (8336,), (8373,), (8391,), (8402,), (8413,), (8440,), (8447,), (8451,), (8453,), (8485,), (8489,), (8507,), (8511,), (8517,), (8526,), (8528,), (8539,), (8580,), (8588,), (8605,), (8622,), (8637,), (8657,), (8669,), (8676,), (8686,), (8701,), (8724,), (8750,), (8754,), (8762,), (8763,), (8772,), (8797,), (8807,), (8840,), (8844,), (8871,), (8898,), (8926,), (8927,), (8932,), (8960,), (8977,), (8991,), (9004,), (9007,), (9013,), (9042,), (9089,), (9136,), (9142,), (9162,), (9174,), (9187,), (9200,), (9207,), (9233,), (9249,), (9253,), (9330,), (9336,), (9343,), (9394,), (9405,), (9420,), (9426,), (9437,), (9444,), (9456,), (9497,), (9568,), (9572,), (9577,), (9581,), (9583,), (9595,), (9608,), (9610,), (9618,), (9619,), (9651,), (9657,), (9677,), (9683,), (9724,), (9738,), (9782,), (9804,), (9808,), (9812,), (9816,), (9858,), (9866,), (9867,), (9899,), (9918,), (9929,), (9964,), (9975,), (9998,), (10010,), (10026,), (10031,), (10044,), (10054,), (10055,), (10061,), (10064,), (10065,), (10069,), (10088,), (10110,), (10119,), (10123,), (10132,), (10164,), (10172,), (10183,), (10199,), (10205,), (10210,), (10217,), (10229,), (10259,), (10266,), (10268,), (10277,), (10278,), (10295,), (10322,), (10346,), (10354,), (10380,), (10385,), (10389,), (10416,), (10435,), (10441,), (10448,), (10449,), (10464,), (10479,), (10496,), (10500,), (10515,), (10524,), (10530,), (10584,), (10598,), (10601,), (10619,), (10630,), (10659,), (10675,), (10728,), (10736,), (10749,), (10790,), (10823,), (10826,), (10829,), (10849,), (10861,), (10872,), (10875,), (10884,), (10885,), (10891,), (10907,), (10908,), (10914,), (10930,), (10950,), (10961,), (11030,), (11032,), (11052,), (11060,), (11088,), (11090,), (11091,), (11116,), (11137,), (11179,), (11187,), (11195,), (11236,), (11240,), (11242,), (11279,), (11285,), (11342,), (11346,), (11355,), (11449,), (11456,), (11458,), (11476,), (11496,), (11511,), (11522,), (11523,), (11554,), (11557,), (11583,), (11588,), (11601,), (11602,), (11623,), (11639,), (11649,), (11667,), (11697,), (11708,), (11748,), (11756,), (11779,), (11797,), (11805,), (11812,), (11832,), (11843,), (11849,), (11852,), (11867,), (11877,), (11878,), (11887,), (11915,), (11954,), (11969,), (11976,), (11981,), (11984,), (12005,), (12008,), (12013,), (12026,), (12031,), (12046,), (12053,), (12060,), (12090,), (12097,), (12100,), (12147,), (12164,), (12180,), (12233,), (12258,), (12265,), (12318,), (12344,), (12353,), (12359,), (12379,), (12380,), (12429,), (12431,), (12436,), (12446,), (12463,), (12466,), (12486,), (12518,), (12521,), (12540,), (12548,), (12565,), (12566,), (12583,), (12603,), (12605,), (12615,), (12626,), (12630,), (12633,), (12710,), (12719,), (12733,), (12750,), (12752,), (12777,), (12786,), (12793,), (12803,), (12820,), (12833,), (12842,), (12853,), (12858,), (12860,), (12865,), (12895,), (12923,), (12924,), (12931,), (12932,), (12948,), (13010,), (13017,), (13041,), (13047,), (13066,), (13075,), (13091,), (13106,), (13107,), (13122,), (13128,), (13138,), (13158,), (13165,), (13177,), (13184,), (13209,), (13212,), (13214,), (13217,), (13227,), (13254,), (13258,), (13267,), (13280,), (13310,), (13348,), (13362,), (13402,), (13409,), (13413,), (13419,), (13436,), (13516,), (13519,), (13526,), (13533,), (13538,), (13555,), (13562,), (13581,), (13587,), (13598,), (13624,), (13634,), (13636,), (13669,), (13680,), (13684,), (13702,), (13757,), (13804,), (13818,), (13837,), (13902,), (13915,), (13935,), (13950,), (13961,), (14039,), (14054,), (14063,), (14073,), (14104,), (14125,), (14131,), (14138,), (14143,), (14154,), (14156,), (14163,), (14188,), (14203,), (14230,), (14289,), (14323,), (14346,), (14369,), (14411,), (14417,), (14428,), (14434,), (14440,), (14443,), (14454,), (14463,), (14519,), (14525,), (14554,), (14582,), (14589,), (14595,), (14640,), (14655,), (14661,), (14675,), (14699,), (14729,), (14730,), (14741,), (14749,), (14771,), (14803,), (14835,), (14845,), (14857,), (14860,), (14873,), (14888,), (14891,), (15919,), (15964,), (15980,), (15988,), (16026,), (16034,), (16042,), (16049,), (16065,), (16068,), (16069,), (16089,), (16097,), (16134,), (16137,), (16140,), (16175,), (16218,), (16228,), (16235,), (16242,), (16263,), (16286,), (16297,), (16348,), (16365,), (16387,), (16444,), (16446,), (16452,), (16474,), (16534,), (16592,), (16596,), (16612,), (16640,), (16645,), (16663,), (16664,), (16672,), (16705,), (16709,), (16763,), (16765,), (16789,), (16811,), (16837,), (16847,), (16853,), (16859,), (16912,), (16922,), (16939,), (16969,), (16974,), (16987,), (16989,), (17045,), (17072,), (17096,), (17124,), (17125,), (17190,), (17192,), (17197,), (17198,), (17214,), (17230,), (17246,), (17250,), (17269,), (17286,), (17315,), (17318,), (17359,), (17376,), (17383,), (17408,), (17442,), (17455,), (17463,), (17464,), (17475,), (17481,), (17493,), (17521,), (17541,), (17543,), (17578,), (17617,), (17636,), (17653,), (17661,), (17662,), (17672,), (17688,), (17702,), (17812,), (17847,), (17908,), (17915,), (17935,), (17941,), (17987,), (18008,), (18040,), (18076,), (18128,), (18135,), (18152,), (18163,), (18215,), (18256,), (18268,), (18274,), (18281,), (18287,), (18291,), (18334,), (18387,), (18459,), (18464,), (18493,), (18528,), (18531,), (18535,), (18539,), (18563,), (18588,), (18592,), (18612,), (18643,), (19662,), (19667,), (19676,), (19762,), (19788,), (19815,), (19822,), (19879,), (19901,), (19914,), (19990,), (20009,), (20015,), (20047,), (20060,), (20085,), (20112,), (20211,), (20268,), (20307,), (20331,), (20344,), (20363,), (20381,), (20409,), (20434,), (20467,), (20486,), (20492,), (20504,), (20516,), (20538,), (20551,), (20556,), (20587,), (20591,), (20598,), (20603,), (20637,), (20650,), (20657,), (20763,), (20773,), (20775,), (20776,), (20840,), (20875,), (20943,), (20945,), (20980,), (20995,), (21054,), (21062,), (21072,), (21094,), (21125,), (21167,), (21168,), (21240,), (21260,), (21267,), (21305,), (21340,), (21351,), (21360,), (21547,), (21563,), (21599,), (21629,), (21654,), (21674,), (21683,), (21720,), (21745,), (21827,), (21846,), (21853,), (21874,), (21922,), (21934,), (21967,), (21971,), (21972,), (21982,), (21998,), (22041,), (22047,), (22070,), (22088,), (22147,), (22161,), (22163,), (22190,), (22228,), (22236,), (22256,), (22287,), (22307,), (22311,), (22312,), (22314,), (22330,), (22355,), (22356,), (22387,), (22403,), (22407,), (22414,), (22452,), (22468,), (22508,), (22543,), (22586,), (23642,), (23649,), (23665,), (23759,), (23770,), (23790,), (23801,), (23803,), (23840,), (23853,), (23890,), (23972,), (24000,), (24001,), (24028,), (24031,), (24056,), (24073,), (24080,), (24084,), (24088,), (24091,), (24124,), (24128,), (24132,), (24137,), (24143,), (24154,), (24175,), (24341,), (24388,), (24404,), (24430,), (24448,), (24492,), (24498,), (24515,), (24543,), (24617,), (24627,), (24664,), (24669,), (24671,), (24699,), (24721,), (24743,), (24792,), (24808,), (24865,), (24868,), (24905,), (24949,), (24952,), (24982,), (25103,), (25138,), (25166,), (25184,), (25212,), (25224,), (25249,), (25292,), (25325,), (25339,), (25392,), (25433,), (25538,), (25543,), (25592,), (25628,), (25692,), (25706,), (25793,), (25843,), (25936,), (25944,), (25965,), (25969,), (25986,), (25990,), (26008,), (26020,), (26080,), (26087,), (26105,), (26163,), (26173,), (26206,), (26223,), (26226,), (26267,), (26272,), (26338,), (26356,), (26357,), (26398,), (26435,), (26501,), (26564,), (26574,), (26589,), (26613,), (26704,), (26708,), (26743,), (26756,), (26766,), (26776,), (26910,), (26919,), (26959,), (26997,), (27050,), (27088,), (27089,), (27099,), (27102,), (27137,), (27142,), (27190,), (27213,), (27271,), (27276,), (27301,), (27330,), (27342,), (27403,), (27418,), (27433,), (27435,), (27464,), (27493,), (27495,), (27530,), (27556,), (27564,), (27576,), (27581,), (27608,), (27691,), (27693,), (27765,), (27767,), (27812,), (27827,), (27838,), (27840,), (27854,), (27855,), (27861,), (27866,), (27875,), (27915,), (27949,), (27965,), (27971,), (28051,), (28055,), (28077,), (28140,), (28209,), (28217,), (28218,), (28236,), (28257,), (28281,), (28288,), (28309,), (28319,), (28343,), (28380,), (28383,), (28393,), (28420,), (28462,), (28500,), (28504,), (28520,), (28524,), (28541,), (28546,), (28556,), (28566,), (28627,), (28640,), (28644,), (28666,), (28671,), (28705,), (28732,), (28740,), (28746,), (28786,), (28791,), (28825,), (28903,), (28916,), (28923,), (28928,), (28966,), (28988,), (29001,), (29020,), (29062,), (29068,), (29070,), (29087,), (29093,), (29109,), (29137,), (29187,), (29220,), (29325,), (29342,), (29350,), (29374,), (29415,), (29433,), (29447,), (29475,), (29486,), (29507,), (29537,), (29547,), (29568,), (29596,), (29597,), (29600,), (29611,), (29617,), (29652,), (29694,), (29740,), (29758,), (29770,), (29868,), (29884,), (29894,), (29943,), (29987,), (30005,), (30016,), (30121,), (30133,), (30201,), (30202,), (30268,), (30342,), (30351,), (30376,), (30389,), (30395,), (30417,), (30451,), (30454,), (30460,), (30463,), (30473,), (30494,), (30523,), (30577,), (30586,), (30609,), (30621,), (30633,), (30661,), (30682,), (30712,), (30802,), (30815,), (30872,), (30917,), (30951,), (31014,), (31019,), (31052,), (31077,), (31126,), (31135,), (31152,), (31180,), (31188,), (31221,), (31243,), (31256,), (31261,), (31264,), (31334,), (31372,), (31379,), (31400,), (31420,), (31428,), (31475,), (31477,), (31481,), (31505,), (31507,), (31530,), (31536,), (31564,), (31587,), (31605,), (31634,), (31668,), (31774,), (31837,), (31901,), (31980,), (32001,), (32018,), (32036,), (32065,), (32157,), (32180,), (32186,), (32231,), (32299,), (32304,), (32377,), (32379,), (32389,), (32398,), (32554,), (34645,), (34658,), (34768,), (34792,), (34810,), (34826,), (34842,), (34859,), (34872,), (34874,), (34876,), (34889,), (34944,), (34949,), (34953,), (35003,), (35026,), (35099,), (35130,), (35131,), (35189,), (35250,), (35263,), (35265,), (35311,), (35319,), (35347,), (35388,), (35398,), (35413,), (35427,), (35452,), (35544,), (35559,), (35563,), (35572,), (35584,), (35588,), (35639,), (35736,), (35743,), (35753,), (35757,), (35789,), (35842,), (35873,), (35907,), (35917,), (35961,), (35969,), (35973,), (35985,), (35998,), (36004,), (36041,), (36068,), (36115,), (36172,), (36195,), (36229,), (36245,), (36263,), (36273,), (36317,), (36335,), (36381,), (36455,), (36462,), (36465,), (36510,), (36515,), (36539,), (36540,), (36545,), (36581,), (36610,), (36630,), (36661,), (36673,), (36676,), (36680,), (36682,), (36738,), (36755,), (36757,), (36771,), (36773,), (36785,), (36835,), (36854,), (36908,), (36915,), (36985,), (37020,), (37041,), (37044,), (37051,), (37094,), (37148,), (37167,), (37188,), (37263,), (37294,), (37322,), (37382,), (37412,), (37420,), (37448,), (37466,), (37483,), (37540,), (37613,), (37627,), (37640,), (37643,), (37715,), (37736,), (37765,), (37851,), (37863,), (37928,), (37976,), (38075,), (38076,), (38080,), (38082,), (38090,), (38102,), (38160,), (38168,), (38206,), (38237,), (38281,), (38307,), (38358,), (38384,), (38427,), (38457,), (38480,), (39510,), (39517,), (39520,), (39543,), (39544,), (39568,), (39582,), (39588,), (39601,), (39633,), (39663,), (39687,), (39702,), (39745,), (39838,), (39849,), (39953,), (39996,), (40036,), (40077,), (40161,), (40209,), (40215,), (40242,), (40252,), (40261,), (40277,), (40357,), (40383,), (40429,), (40440,), (40464,), (40513,), (40571,), (40582,), (40608,), (40752,), (40861,), (40899,), (40967,), (40976,), (41000,), (41238,), (41260,), (41270,), (41389,), (41429,), (41493,), (41637,), (41696,), (41777,), (41788,), (41810,), (41867,), (41879,), (42002,), (42062,), (42068,), (42077,), (42173,), (42174,), (42353,), (42362,), (42429,), (42434,), (42454,), (42461,), (42543,), (42545,), (42609,), (42628,), (42685,), (42703,), (42728,), (42810,), (42878,), (42884,), (42898,), (42902,), (42925,), (42952,), (42968,), (42977,), (42987,), (43183,), (43228,), (43304,), (43392,), (43634,), (43674,), (43704,), (43805,), (43863,), (43868,), (43889,), (43922,), (43926,), (43944,), (43959,), (44027,), (44063,), (44107,), (44115,), (44142,), (44163,), (44208,), (44262,), (44269,), (44422,), (44451,), (44458,), (44469,), (44496,), (44527,), (44591,), (44603,), (44635,), (44678,), (44712,), (44731,), (44760,), (44764,), (44783,), (44795,), (44816,), (44820,), (44839,), (44847,), (44862,), (44952,), (44965,), (45063,), (45114,), (45192,), (45274,), (45296,), (45326,), (45382,), (45429,), (45498,), (45561,), (45603,), (45605,), (45784,), (45797,), (45823,), (45876,), (45917,), (45942,), (45985,), (46041,), (46059,), (46087,), (46134,), (46170,), (46244,), (46263,), (46268,), (46351,), (46427,), (46482,), (46499,), (46522,), (46638,), (46653,), (46684,), (46694,), (46794,), (46827,), (46850,), (46900,), (48007,), (48088,), (48148,), (48222,), (48257,), (48454,), (48554,), (48579,), (48636,), (48639,), (48661,), (48666,), (48766,), (48785,), (48880,), (48968,), (49008,), (49054,), (49093,), (49130,), (49137,), (49209,), (49229,), (49279,), (49296,), (49311,), (49316,), (49358,), (49397,), (49398,), (49427,), (49647,), (49677,), (51931,), (51935,), (51954,), (52022,), (52092,), (52150,), (52151,), (52220,), (52243,), (52367,), (52432,), (52516,), (52554,), (52568,), (52705,), (52740,), (52756,), (53057,), (53099,), (53142,), (53211,), (53276,), (53391,), (53404,), (53924,), (53926,), (53928,), (54013,), (54024,), (54099,), (54127,), (54163,), (54237,), (54272,), (54300,), (54325,), (54496,), (54631,), (54651,), (54669,), (54736,), (54779,), (54965,), (54974,), (55365,), (55435,), (55599,)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[(57,), (61,), (80,), (124,), (139,), (334,), (486,), (495,), (779,), (1080,), (2436,), (2546,), (2789,), (2910,), (2940,), (3369,), (3382,), (3467,), (4257,), (4376,), (4481,), (4505,), (4570,), (4598,), (4737,), (5176,), (5494,), (6064,), (6300,), (6401,), (6920,), (7170,), (7837,), (8077,), (8205,), (8238,), (8242,), (8254,), (8293,), (8413,), (8451,), (8489,), (8517,), (8588,), (9253,), (9583,), (9975,), (10026,), (10380,), (10524,), (10630,), (10950,), (11456,), (11463,), (11523,), (11633,), (11708,), (11849,), (11867,), (12131,), (12258,), (12359,), (12476,), (12512,), (14072,), (16705,), (16859,), (17406,), (19762,), (19882,), (20381,), (20434,), (20603,), (22356,), (22543,), (24000,), (24091,), (24808,), (24824,), (26226,), (26881,), (28183,), (28541,), (28988,), (31901,), (34826,), (35165,), (36515,), (37412,), (38457,), (43889,), (44451,), (45580,), (53659,)]
----------------------------
