-- PROBLEM # 1040
-- Generation # 0
-- Difficulty: moderate
----------------------------

-- PROMPT
CREATE TABLE sqlite_sequence(name,seq)

CREATE TABLE "Player_Attributes" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`player_fifa_api_id`	INTEGER,
	`player_api_id`	INTEGER,
	`date`	TEXT,
	`overall_rating`	INTEGER,
	`potential`	INTEGER,
	`preferred_foot`	TEXT,
	`attacking_work_rate`	TEXT,
	`defensive_work_rate`	TEXT,
	`crossing`	INTEGER,
	`finishing`	INTEGER,
	`heading_accuracy`	INTEGER,
	`short_passing`	INTEGER,
	`volleys`	INTEGER,
	`dribbling`	INTEGER,
	`curve`	INTEGER,
	`free_kick_accuracy`	INTEGER,
	`long_passing`	INTEGER,
	`ball_control`	INTEGER,
	`acceleration`	INTEGER,
	`sprint_speed`	INTEGER,
	`agility`	INTEGER,
	`reactions`	INTEGER,
	`balance`	INTEGER,
	`shot_power`	INTEGER,
	`jumping`	INTEGER,
	`stamina`	INTEGER,
	`strength`	INTEGER,
	`long_shots`	INTEGER,
	`aggression`	INTEGER,
	`interceptions`	INTEGER,
	`positioning`	INTEGER,
	`vision`	INTEGER,
	`penalties`	INTEGER,
	`marking`	INTEGER,
	`standing_tackle`	INTEGER,
	`sliding_tackle`	INTEGER,
	`gk_diving`	INTEGER,
	`gk_handling`	INTEGER,
	`gk_kicking`	INTEGER,
	`gk_positioning`	INTEGER,
	`gk_reflexes`	INTEGER,
	FOREIGN KEY(`player_fifa_api_id`) REFERENCES `Player`(`player_fifa_api_id`),
	FOREIGN KEY(`player_api_id`) REFERENCES `Player`(`player_api_id`)
)

CREATE TABLE `Player` (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`player_api_id`	INTEGER UNIQUE,
	`player_name`	TEXT,
	`player_fifa_api_id`	INTEGER UNIQUE,
	`birthday`	TEXT,
	`height`	INTEGER,
	`weight`	INTEGER
)

CREATE TABLE `League` (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`country_id`	INTEGER,
	`name`	TEXT UNIQUE,
	FOREIGN KEY(`country_id`) REFERENCES `country`(`id`)
)

CREATE TABLE `Country` (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`name`	TEXT UNIQUE
)

CREATE TABLE "Team" (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`team_api_id`	INTEGER UNIQUE,
	`team_fifa_api_id`	INTEGER,
	`team_long_name`	TEXT,
	`team_short_name`	TEXT
)

CREATE TABLE `Team_Attributes` (
	`id`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`team_fifa_api_id`	INTEGER,
	`team_api_id`	INTEGER,
	`date`	TEXT,
	`buildUpPlaySpeed`	INTEGER,
	`buildUpPlaySpeedClass`	TEXT,
	`buildUpPlayDribbling`	INTEGER,
	`buildUpPlayDribblingClass`	TEXT,
	`buildUpPlayPassing`	INTEGER,
	`buildUpPlayPassingClass`	TEXT,
	`buildUpPlayPositioningClass`	TEXT,
	`chanceCreationPassing`	INTEGER,
	`chanceCreationPassingClass`	TEXT,
	`chanceCreationCrossing`	INTEGER,
	`chanceCreationCrossingClass`	TEXT,
	`chanceCreationShooting`	INTEGER,
	`chanceCreationShootingClass`	TEXT,
	`chanceCreationPositioningClass`	TEXT,
	`defencePressure`	INTEGER,
	`defencePressureClass`	TEXT,
	`defenceAggression`	INTEGER,
	`defenceAggressionClass`	TEXT,
	`defenceTeamWidth`	INTEGER,
	`defenceTeamWidthClass`	TEXT,
	`defenceDefenderLineClass`	TEXT,
	FOREIGN KEY(`team_fifa_api_id`) REFERENCES `Team`(`team_fifa_api_id`),
	FOREIGN KEY(`team_api_id`) REFERENCES `Team`(`team_api_id`)
)

CREATE TABLE "Match"
(
    id               INTEGER
        primary key autoincrement,
    country_id       INTEGER
        references Country,
    league_id        INTEGER
        references League,
    season           TEXT,
    stage            INTEGER,
    date             TEXT,
    match_api_id     INTEGER
        unique,
    home_team_api_id INTEGER
        references Team (team_api_id),
    away_team_api_id INTEGER
        references Team (team_api_id),
    home_team_goal   INTEGER,
    away_team_goal   INTEGER,
    home_player_X1   INTEGER,
    home_player_X2   INTEGER,
    home_player_X3   INTEGER,
    home_player_X4   INTEGER,
    home_player_X5   INTEGER,
    home_player_X6   INTEGER,
    home_player_X7   INTEGER,
    home_player_X8   INTEGER,
    home_player_X9   INTEGER,
    home_player_X10  INTEGER,
    home_player_X11  INTEGER,
    away_player_X1   INTEGER,
    away_player_X2   INTEGER,
    away_player_X3   INTEGER,
    away_player_X4   INTEGER,
    away_player_X5   INTEGER,
    away_player_X6   INTEGER,
    away_player_X7   INTEGER,
    away_player_X8   INTEGER,
    away_player_X9   INTEGER,
    away_player_X10  INTEGER,
    away_player_X11  INTEGER,
    home_player_Y1   INTEGER,
    home_player_Y2   INTEGER,
    home_player_Y3   INTEGER,
    home_player_Y4   INTEGER,
    home_player_Y5   INTEGER,
    home_player_Y6   INTEGER,
    home_player_Y7   INTEGER,
    home_player_Y8   INTEGER,
    home_player_Y9   INTEGER,
    home_player_Y10  INTEGER,
    home_player_Y11  INTEGER,
    away_player_Y1   INTEGER,
    away_player_Y2   INTEGER,
    away_player_Y3   INTEGER,
    away_player_Y4   INTEGER,
    away_player_Y5   INTEGER,
    away_player_Y6   INTEGER,
    away_player_Y7   INTEGER,
    away_player_Y8   INTEGER,
    away_player_Y9   INTEGER,
    away_player_Y10  INTEGER,
    away_player_Y11  INTEGER,
    home_player_1    INTEGER
        references Player (player_api_id),
    home_player_2    INTEGER
        references Player (player_api_id),
    home_player_3    INTEGER
        references Player (player_api_id),
    home_player_4    INTEGER
        references Player (player_api_id),
    home_player_5    INTEGER
        references Player (player_api_id),
    home_player_6    INTEGER
        references Player (player_api_id),
    home_player_7    INTEGER
        references Player (player_api_id),
    home_player_8    INTEGER
        references Player (player_api_id),
    home_player_9    INTEGER
        references Player (player_api_id),
    home_player_10   INTEGER
        references Player (player_api_id),
    home_player_11   INTEGER
        references Player (player_api_id),
    away_player_1    INTEGER
        references Player (player_api_id),
    away_player_2    INTEGER
        references Player (player_api_id),
    away_player_3    INTEGER
        references Player (player_api_id),
    away_player_4    INTEGER
        references Player (player_api_id),
    away_player_5    INTEGER
        references Player (player_api_id),
    away_player_6    INTEGER
        references Player (player_api_id),
    away_player_7    INTEGER
        references Player (player_api_id),
    away_player_8    INTEGER
        references Player (player_api_id),
    away_player_9    INTEGER
        references Player (player_api_id),
    away_player_10   INTEGER
        references Player (player_api_id),
    away_player_11   INTEGER
        references Player (player_api_id),
    goal             TEXT,
    shoton           TEXT,
    shotoff          TEXT,
    foulcommit       TEXT,
    card             TEXT,
    "cross"          TEXT,
    corner           TEXT,
    possession       TEXT,
    B365H            REAL,
    B365D            REAL,
    B365A            REAL,
    BWH              REAL,
    BWD              REAL,
    BWA              REAL,
    IWH              REAL,
    IWD              REAL,
    IWA              REAL,
    LBH              REAL,
    LBD              REAL,
    LBA              REAL,
    PSH              REAL,
    PSD              REAL,
    PSA              REAL,
    WHH              REAL,
    WHD              REAL,
    WHA              REAL,
    SJH              REAL,
    SJD              REAL,
    SJA              REAL,
    VCH              REAL,
    VCD              REAL,
    VCA              REAL,
    GBH              REAL,
    GBD              REAL,
    GBA              REAL,
    BSH              REAL,
    BSD              REAL,
    BSA              REAL
)

-- External Knowledge: height > 180; average heading accuracy = DIVIDE(SUM(heading_accuracy), COUNT(player_fifa_api_id));
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the top 10 players' names whose heights are above 180 in descending order of average heading accuracy.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Player.player_name, AVG(Player_Attributes.heading_accuracy) as avg_heading_accuracy FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player.height > 180 GROUP BY Player.player_name ORDER BY avg_heading_accuracy DESC LIMIT 10;
----------------------------




-- RESULTS FROM PREDICTION
[('Michael Ballack', 91.8), ('Fernando Llorente', 91.52380952380952), ('John Terry', 91.33333333333333), ('Per Mertesacker', 90.26470588235294), ('Luca Toni', 90.26470588235294), ('Didier Drogba', 90.23529411764706), ('Miroslav Klose', 90.17647058823529), ('Daniel van Buyten', 90.17647058823529), ('Fernando Morientes', 89.8), ('Sami Hyypiae', 89.75)]
----------------------------



-- ACTUAL RESULTS
[('Michael Ballack',), ('Fernando Llorente',), ('John Terry',), ('Naldo',), ('Per Mertesacker',), ('Luca Toni',), ('Didier Drogba',), ('Miroslav Klose',), ('Daniel van Buyten',), ('Fernando Morientes',)]
----------------------------
