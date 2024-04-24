-- PROBLEM # 1126
-- Generation # 0
-- Difficulty: simple
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

-- External Knowledge: name of players refers to player_name; Belgium is name of country
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- State the name of players who came from Belgium.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Player.player_name FROM Player WHERE Player.player_api_id IN (SELECT Player_Attributes.player_api_id FROM Player_Attributes WHERE Player_Attributes.player_fifa_api_id IN (SELECT Team.team_api_id FROM Team WHERE Team.team_long_name IN (SELECT Country.name FROM Country WHERE Country.name = 'Belgium')))
----------------------------




-- RESULTS FROM PREDICTION
[]
----------------------------



-- ACTUAL RESULTS
[('Mark Volders',), ('Wouter Biebauw',), ('Bertrand Laquait',), ('Boubacar Barry Copa',), ('Stijn Stijnen',), ('Silvio Proto',), ('Cedric Berthelin',), ('Sammy Bossuyt',), ('Bram Verbist',), ('Frederic Herpoel',), ('Davy Schollen',), ('Peter Mollez',), ('Davino Verhulst',), ('Yves De Winter',), ('Jurgen Sierens',), ('Bojan Jorgacevic',), ('Bertrand Laquait',), ('Wouter Biebauw',), ('Silvio Proto',), ('Boubacar Barry Copa',), ('Cedric Berthelin',), ('Stijn Stijnen',), ('Sammy Bossuyt',), ('Sven De Volder',), ('Nicolas Ardouin',), ('Peter Mollez',), ('Bertrand Laquait',), ('Bojan Jorgacevic',), ('Frederic Herpoel',), ('Yves De Winter',), ('Jurgen Sierens',), ('Bram Verbist',), ('Davino Verhulst',), ('Davy Schollen',), ('Boubacar Barry Copa',), ('Sven De Volder',), ('Stijn Stijnen',), ('Sammy Bossuyt',), ('Cedric Berthelin',), ('Nicolas Ardouin',), ('Olivier Renard',), ('Davino Verhulst',), ('Sinan Bolat',), ('Davy Schollen',), ('Jurgen Sierens',), ('Silvio Proto',), ('Sinan Bolat',), ('Peter Mollez',), ('Frederic Herpoel',), ('Bertrand Laquait',), ('Bram Verbist',), ('Yves De Winter',), ('Sven De Volder',), ('Stijn Stijnen',), ('Nicolas Ardouin',), ('Olivier Renard',), ('Thibaut Courtois',), ('Cedric Berthelin',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Silvio Proto',), ('Bram Verbist',), ('Bertrand Laquait',), ('Jurgen Sierens',), ('Davy Schollen',), ('Sinan Bolat',), ('Boubacar Barry Copa',), ('Peter Mollez',), ('Nicolas Ardouin',), ('Sammy Bossuyt',), ('Cedric Berthelin',), ('Olivier Renard',), ('Bojan Jorgacevic',), ('Stijn Stijnen',), ('Yves De Winter',), ('Davino Verhulst',), ('Sven De Volder',), ('Sinan Bolat',), ('Bertrand Laquait',), ('Sven De Volder',), ('Kristof van Hout',), ('Boubacar Barry Copa',), ('Silvio Proto',), ('Davy Schollen',), ('Gregory Delwarte',), ('Jo Coppens',), ('Davino Verhulst',), ('Bojan Jorgacevic',), ('Sammy Bossuyt',), ('Cedric Berthelin',), ('Jurgen Sierens',), ('Olivier Renard',), ('Stijn Stijnen',), ('Yves De Winter',), ('Mario Matos',), ('Sinan Bolat',), ('Sebastien Chabbert',), ('Bram Verbist',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Wouter Biebauw',), ('Jurgen Sierens',), ('Stijn Stijnen',), ('Sinan Bolat',), ('Simon Mignolet',), ('Sebastien Chabbert',), ('Olivier Renard',), ('Jurgen Sierens',), ('Tomislav Pacovski',), ('Stijn Stijnen',), ('Silvio Proto',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Yves De Winter',), ('Kristof van Hout',), ('Simon Mignolet',), ('Sebastien Chabbert',), ('Jo Coppens',), ('Boubacar Barry Copa',), ('Olivier Renard',), ('Jurgen Sierens',), ('Stijn Stijnen',), ('Silvio Proto',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Bojan Jorgacevic',), ('Glenn Verbauwhede',), ('Yves De Winter',), ('Sinan Bolat',), ('Davino Verhulst',), ('Sebastien Chabbert',), ('Jo Coppens',), ('Jugoslav Lazic',), ('Jurgen Sierens',), ('Tomislav Pacovski',), ('Stijn Stijnen',), ('Silvio Proto',), ('Simon Mignolet',), ('Sammy Bossuyt',), ('Bojan Jorgacevic',), ('Glenn Verbauwhede',), ('Yves De Winter',), ('Stijn Stijnen',), ('Silvio Proto',), ('Simon Mignolet',), ('Sammy Bossuyt',), ('Bojan Jorgacevic',), ('Yves De Winter',), ('Tomislav Pacovski',), ('Sinan Bolat',), ('Davino Verhulst',), ('Sebastien Chabbert',), ('Bram Verbist',), ('Jugoslav Lazic',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Stijn Stijnen',), ('Sinan Bolat',), ('Simon Mignolet',), ('Sammy Bossuyt',), ('Bojan Jorgacevic',), ('Yves De Winter',), ('Tomislav Pacovski',), ('Silvio Proto',), ('Davino Verhulst',), ('Cyprien Baguette,23',), ('Jugoslav Lazic',), ('Glenn Verbauwhede',), ('Wouter Biebauw',), ('Jurgen Sierens',), ('Stijn Stijnen',), ('Silvio Proto',), ('Simon Mignolet',), ('Sammy Bossuyt',), ('Bojan Jorgacevic',), ('Yves De Winter',), ('Tomislav Pacovski',), ('Stijn Stijnen',), ('Sinan Bolat',), ('Simon Mignolet',), ('Sammy Bossuyt',), ('Cyprien Baguette,23',), ('Bojan Jorgacevic',), ('Tomislav Pacovski',), ('Silvio Proto',), ('Laszlo Koteles',), ('Bram Verbist',), ('Jugoslav Lazic',), ('Glenn Verbauwhede',), ('Wouter Biebauw',), ('Jurgen Sierens',), ('Stijn Stijnen',), ('Sinan Bolat',), ('Simon Mignolet',), ('Cyprien Baguette,23',), ('Bojan Jorgacevic',), ('Jurgen Sierens',), ('Tomislav Pacovski',), ('Laszlo Koteles',), ('Sammy Bossuyt',), ('Bram Verbist',), ('Jugoslav Lazic',), ('Glenn Verbauwhede',), ('Wouter Biebauw',), ('Yves De Winter',), ('Sinan Bolat',), ('Simon Mignolet',), ('Cyprien Baguette,23',), ('Bojan Jorgacevic',), ('Wouter Biebauw',), ('Jurgen Sierens',), ('Tomislav Pacovski',), ('Silvio Proto',), ('Laszlo Koteles',), ('Sammy Bossuyt',), ('Bram Verbist',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Yves De Winter',), ('Sinan Bolat',), ('Cyprien Baguette,23',), ('Bram Verbist',), ('Bojan Jorgacevic',), ('Wouter Biebauw',), ('Jurgen Sierens',), ('Tomislav Pacovski',), ('Stijn Stijnen',), ('Silvio Proto',), ('Laszlo Koteles',), ('Sammy Bossuyt',), ('Bojan Jorgacevic',), ('Damien Lahaye',), ('Yves De Winter',), ('Simon Mignolet',), ('Cyprien Baguette,23',), ('Bram Verbist',), ('Jugoslav Lazic',), ('Wouter Biebauw',), ('Jurgen Sierens',), ('Tomislav Pacovski',), ('Geert De Vlieger',), ('Silvio Proto',), ('Tom Muyters',), ('Sammy Bossuyt',), ('Bojan Jorgacevic',), ('Glenn Verbauwhede',), ('Yves De Winter',), ('Silvio Proto',), ('Davino Verhulst',), ('Sebastien Chabbert',), ('Jo Coppens',), ('Boubacar Barry Copa',), ('Wouter Biebauw',), ('Jurgen Sierens',), ('Sinan Bolat',), ('Laszlo Koteles',), ('Bram Verbist',), ('Boubacar Barry Copa',), ('Wouter Biebauw',), ('Jurgen Sierens',), ('Tomislav Pacovski',), ('Stijn Stijnen',), ('Sinan Bolat',), ('Simon Mignolet',), ('Sammy Bossuyt',), ('Bojan Jorgacevic',), ('Yves De Winter',), ('Tomislav Pacovski',), ('Silvio Proto',), ('Davino Verhulst',), ('Jo Coppens',), ('Glenn Verbauwhede',), ('Wouter Biebauw',), ('Jurgen Sierens',), ('Yves De Winter',), ('Geert De Vlieger',), ('Sinan Bolat',), ('Simon Mignolet',), ('Sammy Bossuyt',), ('Sebastien Chabbert',), ('Bojan Jorgacevic',), ('Tomislav Pacovski',), ('Silvio Proto',), ('Davino Verhulst',), ('Jo Coppens',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Yves De Winter',), ('Stijn Stijnen',), ('Sinan Bolat',), ('Simon Mignolet',), ('Sebastien Chabbert',), ('Bojan Jorgacevic',), ('Jurgen Sierens',), ('Tomislav Pacovski',), ('Silvio Proto',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Jo Coppens',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Yves De Winter',), ('Mark Volders',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Yves De Winter',), ('Silvio Proto',), ('Sinan Bolat',), ('Bram Verbist',), ('Thibaut Courtois',), ('Colin Coosemans',), ('Sinan Bolat',), ('Sven van der Jeugt',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Eiji Kawashima',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Thomas Kaminski',), ('Sammy Bossuyt',), ('Cyprien Baguette,23',), ('Olivier Werner',), ('Yves De Winter',), ('Bram Verbist',), ('Silvio Proto',), ('Kristof van Hout',), ('Mark Volders',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Vladan Kujovic',), ('Bram Verbist',), ('Geert De Vlieger',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Thomas Kaminski',), ('Sammy Bossuyt',), ('Olivier Werner',), ('Yves De Winter',), ('Silvio Proto',), ('Kristof van Hout',), ('Sven van der Jeugt',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Vladan Kujovic',), ('Yves De Winter',), ('Bram Verbist',), ('Stijn Stijnen',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Thomas Kaminski',), ('Sammy Bossuyt',), ('Cyprien Baguette,23',), ('Jugoslav Lazic',), ('Olivier Werner',), ('Stijn Stijnen',), ('Bojan Jorgacevic',), ('Thomas Kaminski',), ('Sammy Bossuyt',), ('Cyprien Baguette,23',), ('Jugoslav Lazic',), ('Eiji Kawashima',), ('Olivier Werner',), ('Silvio Proto',), ('Srdjan Blazic',), ('Thibaut Courtois',), ('Laurent Henkinet',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Yves De Winter',), ('Bram Verbist',), ('Stijn Stijnen',), ('Thomas Kaminski',), ('Laurent Henkinet',), ('Sammy Bossuyt',), ('Cyprien Baguette,23',), ('Jugoslav Lazic',), ('Eiji Kawashima',), ('Olivier Werner',), ('Silvio Proto',), ('Srdjan Blazic',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Yves De Winter',), ('Bram Verbist',), ('Stijn Stijnen',), ('Bojan Jorgacevic',), ('Tomislav Pacovski',), ('Sammy Bossuyt',), ('Cyprien Baguette,23',), ('Boubacar Barry Copa',), ('Eiji Kawashima',), ('Radek Petr',), ('Stijn Stijnen',), ('Thomas Kaminski',), ('Sven van der Jeugt',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Eiji Kawashima',), ('Olivier Werner',), ('Silvio Proto',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Cyprien Baguette,23',), ('Olivier Renard',), ('Olivier Werner',), ('Yves De Winter',), ('Bram Verbist',), ('Colin Coosemans',), ('Srdjan Blazic',), ('Thomas Kaminski',), ('Sven van der Jeugt',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Eiji Kawashima',), ('Silvio Proto',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Thomas Kaminski',), ('Rudy Riou',), ('Olivier Werner',), ('Yves De Winter',), ('Bram Verbist',), ('Colin Coosemans',), ('Srdjan Blazic',), ('Sven van der Jeugt',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Vladan Kujovic',), ('Silvio Proto',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Thomas Kaminski',), ('Rudy Riou',), ('Olivier Werner',), ('Yves De Winter',), ('Bram Verbist',), ('Colin Coosemans',), ('Silvio Proto',), ('Srdjan Blazic',), ('Sven van der Jeugt',), ('Jugoslav Lazic',), ('Damien Lahaye',), ('Olivier Renard',), ('Eiji Kawashima',), ('Colin Coosemans',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Thomas Kaminski',), ('Sammy Bossuyt',), ('Rudy Riou',), ('Radek Petr',), ('Bart Deelkens',), ('Silvio Proto',), ('Srdjan Blazic',), ('Sven van der Jeugt',), ('Boubacar Barry Copa',), ('Damien Lahaye',), ('Olivier Renard',), ('Eiji Kawashima',), ('Bram Verbist',), ('Colin Coosemans',), ('Frank Boeckx',), ('Thibaut Courtois',), ('Thomas Kaminski',), ('Sammy Bossuyt',), ('Rudy Riou',), ('Boubacar Barry Copa',), ('Radek Petr',), ('Silvio Proto',), ('Sinan Bolat',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Yves De Winter',), ('Bram Verbist',), ('Silvio Proto',), ('Sinan Bolat',), ('Sven van der Jeugt',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Eiji Kawashima',), ('Bart Deelkens',), ('Bram Verbist',), ('Stijn Stijnen',), ('Thomas Kaminski',), ('Sven van der Jeugt',), ('Sammy Bossuyt',), ('Cyprien Baguette,23',), ('Boubacar Barry Copa',), ('Eiji Kawashima',), ('Radek Petr',), ('Silvio Proto',), ('Sinan Bolat',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Cyprien Baguette,23',), ('Olivier Renard',), ('Yves De Winter',), ('Bram Verbist',), ('Stijn Stijnen',), ('Sinan Bolat',), ('Thomas Kaminski',), ('Sven van der Jeugt',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Eiji Kawashima',), ('Silvio Proto',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Cyprien Baguette,23',), ('Olivier Renard',), ('Radek Petr',), ('Bart Deelkens',), ('Bram Verbist',), ('Geert De Vlieger',), ('Sinan Bolat',), ('Sven van der Jeugt',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Glenn Verbauwhede',), ('Olivier Renard',), ('Eiji Kawashima',), ('Silvio Proto',), ('Bojan Jorgacevic',), ('Thibaut Courtois',), ('Thomas Kaminski',), ('Radek Petr',), ('Yves De Winter',), ('Bram Verbist',), ('Yves Lenaerts',), ('Cedric Berthelin',), ('Laszlo Koteles',), ('Frank Boeckx',), ('Boubacar Barry Copa',), ('Kristof van Hout',), ('Olivier Renard',), ('Colin Coosemans',), ('Colin Coosemans',), ('Silvio Proto',), ('Davino Verhulst',), ('Tom Muyters',), ('Thomas Kaminski',), ('Boubacar Barry Copa',), ('Olivier Renard',), ('Cedric Berthelin',), ('Sinan Bolat',), ('Laszlo Koteles',), ('Bojan Jorgacevic',), ('Stijn Stijnen',), ('Kristof van Hout',), ('Eiji Kawashima',), ('Bart Deelkens',), ('Bram Verbist',), ('Colin Coosemans',), ('Silvio Proto',), ('Davino Verhulst',), ('Tom Muyters',), ('Thomas Kaminski',), ('Boubacar Barry Copa',), ('Olivier Renard',), ('Cedric Berthelin',), ('Sinan Bolat',), ('Laszlo Koteles',), ('Frank Boeckx',), ('Tomislav Pacovski',), ('Tom Muyters',), ('Eiji Kawashima',), ('Bart Deelkens',), ('Bram Verbist',), ('Bojan Jorgacevic',), ('Silvio Proto',), ('Laszlo Koteles',), ('Thomas Kaminski',), ('Boubacar Barry Copa',), ('Kristof van Hout',), ('Olivier Renard',), ('Cedric Berthelin',), ('Sinan Bolat',), ('Sergio Padt',), ('Tomislav Pacovski',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Eiji Kawashima',), ('Bart Deelkens',), ('Bram Verbist',), ('Silvio Proto',), ('Sinan Bolat',), ('Tomislav Pacovski',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Eiji Kawashima',), ('Bart Deelkens',), ('Bram Verbist',), ('Bojan Jorgacevic',), ('Laszlo Koteles',), ('Thomas Kaminski',), ('Boubacar Barry Copa',), ('Darren Keet',), ('Olivier Renard',), ('Olivier Werner',), ('Frank Boeckx',), ('Silvio Proto',), ('Sinan Bolat',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Thomas Kaminski',), ('Eiji Kawashima',), ('Bram Verbist',), ('Bojan Jorgacevic',), ('Laszlo Koteles',), ('Frank Boeckx',), ('Tomislav Pacovski',), ('Boubacar Barry Copa',), ('Kristof van Hout',), ('Olivier Renard',), ('Olivier Werner',), ('Silvio Proto',), ('Sinan Bolat',), ('Thomas Kaminski',), ('Bram Castro',), ('Sammy Bossuyt',), ('Eiji Kawashima',), ('Bart Deelkens',), ('Bram Verbist',), ('Silvio Proto',), ('Sinan Bolat',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Thomas Kaminski',), ('Olivier Renard',), ('Eiji Kawashima',), ('Bram Verbist',), ('Bojan Jorgacevic',), ('Laszlo Koteles',), ('Frank Boeckx',), ('Tomislav Pacovski',), ('Jugoslav Lazic',), ('Kristof van Hout',), ('Cedric Berthelin',), ('Glenn Verbauwhede',), ('Bojan Jorgacevic',), ('Silvio Proto',), ('Sinan Bolat',), ('Davino Verhulst',), ('Thomas Kaminski',), ('Olivier Renard',), ('Eiji Kawashima',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Sergio Padt',), ('Tomislav Pacovski',), ('Jugoslav Lazic',), ('Kristof van Hout',), ('Olivier Werner',), ('Glenn Verbauwhede',), ('Jo Coppens',), ('Bojan Jorgacevic',), ('Silvio Proto',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Jugoslav Lazic',), ('Olivier Renard',), ('Eiji Kawashima',), ('Thomas Kaminski',), ('Sinan Bolat',), ('Logan Bailly',), ('Sergio Padt',), ('Stijn Stijnen',), ('Kristof van Hout',), ('Eiji Kawashima',), ('Glenn Verbauwhede',), ('Jo Coppens',), ('Bojan Jorgacevic',), ('Silvio Proto',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Thomas Kaminski',), ('Jugoslav Lazic',), ('Olivier Renard',), ('Olivier Werner',), ('Sinan Bolat',), ('Logan Bailly',), ('Stijn Stijnen',), ('Darren Keet',), ('Eiji Kawashima',), ('Glenn Verbauwhede',), ('Jo Coppens',), ('Sergio Padt',), ('Bojan Jorgacevic',), ('Silvio Proto',), ('Davino Verhulst',), ('Thomas Kaminski',), ('Boubacar Barry Copa',), ('Kristof van Hout',), ('Olivier Renard',), ('Olivier Werner',), ('Sinan Bolat',), ('Sergio Padt',), ('Tomislav Pacovski',), ('Davino Verhulst',), ('Sammy Bossuyt',), ('Eiji Kawashima',), ('Glenn Verbauwhede',), ('Jo Coppens',), ('Colin Coosemans',), ('Laszlo Koteles',), ('Frank Boeckx',), ('Thomas Kaminski',), ('Boubacar Barry Copa',), ('Kristof van Hout',), ('Olivier Renard',), ('Cedric Berthelin',), ('Bojan Jorgacevic',), ('Silvio Proto',), ('Logan Bailly',), ('Yves Lenaerts',), ('Boubacar Barry Copa',), ('Kristof van Hout',), ('Wouter Biebauw',), ('Olivier Werner',), ('Sinan Bolat',), ('Bram Castro',), ('Sammy Bossuyt',), ('Yves Lenaerts',), ('Eiji Kawashima',), ('Bart Deelkens',), ('Bram Verbist',), ('Silvio Proto',), ('Colin Coosemans',), ('Laszlo Koteles',), ('Frank Boeckx',), ('Stijn Stijnen',), ('Boubacar Barry Copa',), ('Kristof van Hout',), ('Cedric Berthelin',), ('Bart Deelkens',), ('Silvio Proto',), ('Sinan Bolat',), ('Hendrik van Crombrugge',), ('Sammy Bossuyt',), ('Yves Lenaerts',), ('Olivier Renard',), ('Bram Verbist',), ('Eiji Kawashima',), ('Laszlo Koteles',), ('Bojan Jorgacevic',), ('Stijn Stijnen',), ('Boubacar Barry Copa',), ('Kristof van Hout',), ('Cedric Berthelin',), ('Bart Deelkens',), ('Bram Verbist',), ('Colin Coosemans',), ('Silvio Proto',), ('Anthony Moris',), ('Bram Castro',), ('Sammy Bossuyt',), ('Yves Lenaerts',), ('Olivier Renard',), ('Eiji Kawashima',), ('Sinan Bolat',), ('Laszlo Koteles',), ('Bojan Jorgacevic',), ('Stijn Stijnen',), ('Kristof van Hout',), ('Cedric Berthelin',), ('Bart Deelkens',), ('Bram Verbist',), ('Kristof van Hout',), ('Stijn Stijnen',), ('Olivier Werner',), ('Eiji Kawashima',), ('Olivier Renard',), ('Vladan Kujovic',), ('Sergio Padt',), ('Laszlo Koteles',), ('Bojan Jorgacevic',), ('Eiji Kawashima',), ('Stijn Stijnen',), ('Parfait Mandanda',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Tomislav Pacovski',), ('Michael Clepkens',), ('Silvio Proto',), ('Kristof van Hout',), ('Sergio Padt',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Matz Sels',), ('Cedric Berthelin',), ('Bram Verbist',), ('Bojan Jorgacevic',), ('Eiji Kawashima',), ('Sergio Padt',), ('Stijn Stijnen',), ('Parfait Mandanda',), ('Darren Keet',), ('Tomislav Pacovski',), ('Michael Clepkens',), ('Silvio Proto',), ('Kristof van Hout',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Boubacar Barry Copa',), ('Matz Sels',), ('Cedric Berthelin',), ('Bram Verbist',), ('Bojan Jorgacevic',), ('Eiji Kawashima',), ('Sergio Padt',), ('Koen Van Langendonck',), ('Parfait Mandanda',), ('Darren Keet',), ('Tomislav Pacovski',), ('Cedric Berthelin',), ('Silvio Proto',), ('Kristof van Hout',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Boubacar Barry Copa',), ('Matz Sels',), ('Colin Coosemans',), ('Bram Verbist',), ('Silvio Proto',), ('Parfait Mandanda',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Boubacar Barry Copa',), ('Matz Sels',), ('Colin Coosemans',), ('Bram Verbist',), ('Vladan Kujovic',), ('Eiji Kawashima',), ('Kristof van Hout',), ('Sergio Padt',), ('Koen Van Langendonck',), ('Darren Keet',), ('Tomislav Pacovski',), ('Cedric Berthelin',), ('Vladan Kujovic',), ('Silvio Proto',), ('Parfait Mandanda',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Boubacar Barry Copa',), ('Matz Sels',), ('Colin Coosemans',), ('Eiji Kawashima',), ('Kristof van Hout',), ('Sergio Padt',), ('Koen Van Langendonck',), ('Darren Keet',), ('Tomislav Pacovski',), ('Cedric Berthelin',), ('Bram Verbist',), ('Silvio Proto',), ('Parfait Mandanda',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Jugoslav Lazic',), ('Matz Sels',), ('Michael Clepkens',), ('Bram Verbist',), ('Vladan Kujovic',), ('Silvio Proto',), ('Parfait Mandanda',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Tomislav Pacovski',), ('Matz Sels',), ('Colin Coosemans',), ('Eiji Kawashima',), ('Kristof van Hout',), ('Sergio Padt',), ('Stijn Stijnen',), ('Logan Bailly',), ('Darren Keet',), ('Cedric Berthelin',), ('Bram Verbist',), ('Vladan Kujovic',), ('Silvio Proto',), ('Eiji Kawashima',), ('Parfait Mandanda',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Tomislav Pacovski',), ('Colin Coosemans',), ('Silvio Proto',), ('Laszlo Koteles',), ('Frank Boeckx',), ('Logan Bailly',), ('Darren Keet',), ('Matz Sels',), ('Cedric Berthelin',), ('Jo Coppens',), ('Vladan Kujovic',), ('Eiji Kawashima',), ('Stijn Stijnen',), ('Michalis Sifakis',), ('Sammy Bossuyt',), ('Jugoslav Lazic',), ('Tomislav Pacovski',), ('Colin Coosemans',), ('Silvio Proto',), ('Laszlo Koteles',), ('Frank Boeckx',), ('Logan Bailly',), ('Darren Keet',), ('Matz Sels',), ('Olivier Werner',), ('Bram Verbist',), ('Vladan Kujovic',), ('Eiji Kawashima',), ('Stijn Stijnen',), ('Michalis Sifakis',), ('Jugoslav Lazic',), ('Darren Keet',), ('Wouter Biebauw',), ('Colin Coosemans',), ('Silvio Proto',), ('Kristof van Hout',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Jugoslav Lazic',), ('Matz Sels',), ('Olivier Werner',), ('Bram Verbist',), ('Vladan Kujovic',), ('Eiji Kawashima',), ('Frank Boeckx',), ('Koen Van Langendonck',), ('Michalis Sifakis',), ('Darren Keet',), ('Tomislav Pacovski',), ('Colin Coosemans',), ('Silvio Proto',), ('Laszlo Koteles',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Jugoslav Lazic',), ('Matz Sels',), ('Colin Coosemans',), ('Jo Coppens',), ('Eiji Kawashima',), ('Laszlo Koteles',), ('Sergio Padt',), ('Stijn Stijnen',), ('Darren Keet',), ('Olivier Renard',), ('Olivier Werner',), ('Bram Verbist',), ('Vladan Kujovic',), ('Eiji Kawashima',), ('Frank Boeckx',), ('Stefan Deloose',), ('Michalis Sifakis',), ('Darren Keet',), ('Tomislav Pacovski',), ('Olivier Werner',), ('Bojan Jorgacevic',), ('Silvio Proto',), ('Parfait Mandanda',), ('Sammy Bossuyt',), ('Logan Bailly',), ('Boubacar Barry Copa',), ('Matz Sels',), ('Michael Clepkens',), ('Eiji Kawashima',), ('Laszlo Koteles',), ('Sergio Padt',), ('Stijn Stijnen',), ('Logan Bailly',), ('Darren Keet',), ('Olivier Werner',), ('Bram Verbist',), ('Bojan Jorgacevic',), ('Silvio Proto',), ('Parfait Mandanda',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Olivier Renard',), ('Matz Sels',), ('Michael Clepkens',), ('Kristof van Hout',), ('Sergio Padt',), ('Stijn Stijnen',), ('Logan Bailly',), ('Darren Keet',), ('Matz Sels',), ('Olivier Werner',), ('Jo Coppens',), ('Bojan Jorgacevic',), ('Eiji Kawashima',), ('Koen Van Langendonck',), ('Parfait Mandanda',), ('Sammy Bossuyt',), ('Boubacar Barry Copa',), ('Tomislav Pacovski',), ('Michael Clepkens',), ('Silvio Proto',), ('Kristof van Hout',), ('Sergio Padt',), ('Logan Bailly',), ('Darren Keet',), ('Matz Sels',), ('Cedric Berthelin',), ('Jo Coppens',), ('Colin Coosemans',), ('Matz Sels',), ('Igor Berezovsky',), ('Didier Ovono',), ('Matz Sels',), ('Didier Ovono',), ('Kenny Steppe',), ('Igor Berezovsky',), ('Igor Berezovsky',), ('Jeremy Dumesnil',), ('Kenny Steppe',), ('Matz Sels',), ('Eiji Kawashima',), ('Colin Coosemans',), ('Olivier Werner',), ('Igor Berezovsky',), ('Koen Van Langendonck',), ('Tomislav Pacovski',), ('Thomas Kaminski',), ('Sammy Bossuyt',), ('Mathew Ryan',), ('Silvio Proto',), ('Nicolas Penneteau',), ('Patrick De Vlamynck',), ('Boubacar Barry Copa',), ('Boban Bajkovic',), ('Koen Van Langendonck',), ('Colin Coosemans',), ('Eiji Kawashima',), ('Laszlo Koteles',), ('Matz Sels',), ('Didier Ovono',), ('Boubacar Barry Copa',), ('Darren Keet',), ('Wouter Biebauw',), ('Olivier Werner',), ('Mathew Ryan',), ('Silvio Proto',), ('Nicolas Penneteau',), ('Sammy Bossuyt',), ('Patrick De Vlamynck',), ('Boban Bajkovic',), ('Koen Van Langendonck',), ('Colin Coosemans',), ('Laszlo Koteles',), ('Matz Sels',), ('Didier Ovono',), ('Patrick De Vlamynck',), ('Boubacar Barry Copa',), ('Darren Keet',), ('Wouter Biebauw',), ('Olivier Werner',), ('Silvio Proto',), ('Yohan Thuram Ulien',), ('Nicolas Penneteau',), ('Sammy Bossuyt',), ('Boban Bajkovic',), ('Koen Van Langendonck',), ('Colin Coosemans',), ('Olivier Werner',), ('Mathew Ryan',), ('Laszlo Koteles',), ('Matz Sels',), ('Didier Ovono',), ('Patrick De Vlamynck',), ('Boubacar Barry Copa',), ('Darren Keet',), ('Wouter Biebauw',), ('Patrick De Vlamynck',), ('Boubacar Barry Copa',), ('Laurent Henkinet',), ('Mathew Ryan',), ('Laszlo Koteles',), ('Matz Sels',), ('Didier Ovono',), ('Nicolas Penneteau',), ('Silvio Proto',), ('Yohan Thuram Ulien',), ('Sammy Bossuyt',), ('Wouter Biebauw',), ('Boban Bajkovic',), ('Koen Van Langendonck',), ('Colin Coosemans',), ('Olivier Werner',), ('Mathew Ryan',), ('Matz Sels',), ('Didier Ovono',), ('Nicolas Penneteau',), ('Patrick De Vlamynck',), ('Boubacar Barry Copa',), ('Darren Keet',), ('Koen Van Langendonck',), ('Silvio Proto',), ('Yohan Thuram Ulien',), ('Laszlo Koteles',), ('Sammy Bossuyt',), ('Wouter Biebauw',), ('Boban Bajkovic',), ('Colin Coosemans',), ('Olivier Werner',), ('Mathew Ryan',), ('Marco Bizot',), ('Matz Sels',), ('Didier Ovono',), ('Parfait Mandanda',), ('Pierrick Cros',), ('Davino Verhulst',), ('Darren Keet',), ('Mathew Ryan',), ('Matz Sels',), ('Didier Ovono',), ('Maxime Vandermeulen',), ('Pierrick Cros',), ('Boubacar Barry Copa',), ('Koen Van Langendonck',), ('Colin Coosemans',), ('Silvio Proto',), ('Yohan Thuram Ulien',), ('Laszlo Koteles',), ('Sammy Bossuyt',), ('Darren Keet',), ('Wouter Biebauw',), ('Boban Bajkovic',), ('Olivier Werner',), ('Vladan Kujovic',), ('Silvio Proto',), ('Jeremy Dumesnil',), ('Nicolas Penneteau',), ('Pierrick Cros',), ('Davino Verhulst',), ('Koen Van Langendonck',), ('Colin Coosemans',), ('Yohan Thuram Ulien',), ('Laszlo Koteles',), ('Matz Sels',), ('Sammy Bossuyt',), ('Laurent Henkinet',), ('Wouter Biebauw',), ('Boban Bajkovic',), ('Olivier Werner',), ('Vladan Kujovic',), ('Silvio Proto',), ('Nicolas Penneteau',), ('Pierrick Cros',), ('Davino Verhulst',), ('Boban Bajkovic',), ('Koen Van Langendonck',), ('Kenny Steppe',), ('Yohan Thuram Ulien',), ('Laszlo Koteles',), ('Matz Sels',), ('Didier Ovono',), ('Sammy Bossuyt',), ('Laurent Henkinet',), ('Wouter Biebauw',), ('Olivier Werner',), ('Silvio Proto',), ('Mathew Ryan',), ('Nicolas Penneteau',), ('Sammy Bossuyt',), ('Pierrick Cros',), ('Boban Bajkovic',), ('Koen Van Langendonck',), ('Kenny Steppe',), ('Yohan Thuram Ulien',), ('Laszlo Koteles',), ('Matz Sels',), ('Didier Ovono',), ('Davino Verhulst',), ('Laurent Henkinet',), ('Wouter Biebauw',), ('Olivier Werner',), ('Mathew Ryan',), ('Silvio Proto',), ('Yohan Thuram Ulien',), ('Nicolas Penneteau',), ('Sammy Bossuyt',), ('Boban Bajkovic',), ('Koen Van Langendonck',), ('Kenny Steppe',), ('Mathew Ryan',), ('Laszlo Koteles',), ('Matz Sels',), ('Didier Ovono',), ('Pierrick Cros',), ('Davino Verhulst',), ('Laurent Henkinet',), ('Wouter Biebauw',), ('Silvio Proto',), ('Eiji Kawashima',), ('Marco Bizot',), ('Sammy Bossuyt',), ('Tomislav Pacovski',), ('Igor Berezovsky',), ('Colin Coosemans',), ('Olivier Werner',), ('Nicolas Penneteau',), ('Silvio Proto',), ('Sammy Bossuyt',), ('Yohan Thuram Ulien',), ('Koen Van Langendonck',), ('Olivier Werner',), ('Kenny Steppe',), ('Boban Bajkovic',), ('Mathew Ryan',), ('Matz Sels',), ('Didier Ovono',), ('Parfait Mandanda',), ('Pierrick Cros',), ('Davino Verhulst',), ('Darren Keet',), ('Koen Van Langendonck',), ('Silvio Proto',), ('Eiji Kawashima',), ('Laszlo Koteles',), ('Sammy Bossuyt',), ('Darren Keet',), ('Wouter Biebauw',), ('Igor Berezovsky',), ('Olivier Werner',), ('Mathew Ryan',), ('Matz Sels',), ('Didier Ovono',), ('Nicolas Penneteau',), ('Pierrick Cros',), ('Boubacar Barry Copa',), ('Koen Van Langendonck',), ('Colin Coosemans',), ('Eiji Kawashima',), ('Laszlo Koteles',), ('Matz Sels',), ('Sammy Bossuyt',), ('Darren Keet',), ('Wouter Biebauw',), ('Igor Berezovsky',), ('Olivier Werner',), ('Mathew Ryan',), ('Silvio Proto',), ('Didier Ovono',), ('Nicolas Penneteau',), ('Pierrick Cros',), ('Boubacar Barry Copa',), ('Koen Van Langendonck',), ('Colin Coosemans',), ('Eiji Kawashima',), ('Laszlo Koteles',), ('Matz Sels',), ('Didier Ovono',), ('Sammy Bossuyt',), ('Darren Keet',), ('Wouter Biebauw',), ('Olivier Werner',), ('William Dutoit',), ('Darren Keet',), ('Laszlo Koteles',), ('Didier Ovono',), ('Sammy Bossuyt',), ('Koen Van Langendonck',), ('Silvio Proto',), ('Nicolas Penneteau',), ('Silvio Proto',), ('Matz Sels',), ('Laszlo Koteles',), ('Didier Ovono',), ('Nicolas Penneteau',), ('Rudy Riou',), ('Koen Van Langendonck',), ('William Dutoit',), ('Sebastien Bruzzese',), ('Yohan Thuram Ulien',), ('Jean-Francois Gillet',), ('Sammy Bossuyt',), ('Vagner',), ('Davino Verhulst',), ('Darren Keet',), ('Merveille Goblet',), ('Silvio Proto',), ('Matz Sels',), ('Laszlo Koteles',), ('Jean-Francois Gillet',), ('Nicolas Penneteau',), ('Rudy Riou',), ('Koen Van Langendonck',), ('William Dutoit',), ('Sebastien Bruzzese',), ('Guillaume Hubert',), ('Didier Ovono',), ('Sammy Bossuyt',), ('Vagner',), ('Davino Verhulst',), ('Darren Keet',), ('Merveille Goblet',), ('Silvio Proto',), ('Laszlo Koteles',), ('Jean-Francois Gillet',), ('Sammy Bossuyt',), ('Parfait Mandanda',), ('Rudy Riou',), ('Koen Van Langendonck',), ('William Dutoit',), ('Sebastien Bruzzese',), ('Guillaume Hubert',), ('Matz Sels',), ('Didier Ovono',), ('Vagner',), ('Davino Verhulst',), ('Darren Keet',), ('Merveille Goblet',), ('Sebastien Bruzzese',), ('Guillaume Hubert',), ('Matz Sels',), ('Jean-Francois Gillet',), ('Vagner',), ('Davino Verhulst',), ('Rudy Riou',), ('Merveille Goblet',), ('Silvio Proto',), ('Laszlo Koteles',), ('Jean-Francois Gillet',), ('Sammy Bossuyt',), ('Darren Keet',), ('Parfait Mandanda',), ('Koen Van Langendonck',), ('William Dutoit',), ('Sebastien Bruzzese',), ('Matz Sels',), ('Marco Bizot',), ('Didier Ovono',), ('Vagner',), ('Davino Verhulst',), ('Rudy Riou',), ('Merveille Goblet',), ('Silvio Proto',), ('Guillaume Hubert',), ('Jean-Francois Gillet',), ('Sammy Bossuyt',), ('Darren Keet',), ('Parfait Mandanda',), ('Koen Van Langendonck',), ('William Dutoit',), ('Matz Sels',), ('Sebastien Bruzzese',), ('Laurent Henkinet',), ('Didier Ovono',), ('Ofir Marciano',), ('Davino Verhulst',), ('Yohan Thuram Ulien',), ('Rudy Riou',), ('Sebastien Bruzzese',), ('Matz Sels',), ('Marco Bizot',), ('Didier Ovono',), ('Vagner',), ('Davino Verhulst',), ('Rudy Riou',), ('Koen Van Langendonck',), ('Silvio Proto',), ('Guillaume Hubert',), ('Jean-Francois Gillet',), ('Sammy Bossuyt',), ('Darren Keet',), ('Nicolas Penneteau',), ('Merveille Goblet',), ('Yves De Winter',), ('Ludovic Butelle',), ('Matz Sels',), ('Marco Bizot',), ('Didier Ovono',), ('Davino Verhulst',), ('Nicolas Penneteau',), ('Rudy Riou',), ('Koen Van Langendonck',), ('Silvio Proto',), ('Guillaume Hubert',), ('Jean-Francois Gillet',), ('Sammy Bossuyt',), ('Vagner',), ('Darren Keet',), ('Laurent Henkinet',), ('William Dutoit',), ('Ludovic Butelle',), ('Matz Sels',), ('Marco Bizot',), ('Didier Ovono',), ('Nicolas Penneteau',), ('Rudy Riou',), ('Koen Van Langendonck',), ('William Dutoit',), ('Ludovic Butelle',), ('Victor Valdes',), ('Jean-Francois Gillet',), ('Kenny Steppe',), ('Vagner',), ('Davino Verhulst',), ('Darren Keet',), ('Laurent Henkinet',), ('Silvio Proto',), ('Matz Sels',), ('Marco Bizot',), ('Wouter Biebauw',), ('Nicolas Penneteau',), ('Rudy Riou',), ('Koen Van Langendonck',), ('William Dutoit',), ('Ludovic Butelle',), ('Guillaume Hubert',), ('Wouter Biebauw',), ('Sammy Bossuyt',), ('Vagner',), ('Davino Verhulst',), ('Darren Keet',), ('Laurent Henkinet',), ('Silvio Proto',), ('Matz Sels',), ('Marco Bizot',), ('Jean-Francois Gillet',), ('Nicolas Penneteau',), ('Rudy Riou',), ('Koen Van Langendonck',), ('William Dutoit',), ('Ludovic Butelle',), ('Victor Valdes',), ('Matz Sels',), ('Wouter Biebauw',), ('Vagner',), ('Davino Verhulst',), ('Darren Keet',), ('Laurent Henkinet',), ('Sammy Bossuyt',), ('Darren Keet',), ('Koen Van Langendonck',), ('William Dutoit',), ('Jean-Francois Gillet',), ('Silvio Proto',), ('Nicolas Penneteau',), ('Yohan Thuram Ulien',), ('Silvio Proto',), ('Marco Bizot',), ('Jean-Francois Gillet',), ('Kenny Steppe',), ('Nicolas Penneteau',), ('Rudy Riou',), ('Kristof van Hout',), ('William Dutoit',), ('Sebastien Bruzzese',), ('Ofir Marciano',), ('Boubacar Barry Copa',), ('Laurent Henkinet',), ('Laszlo Koteles',), ('Didier Ovono',), ('Matz Sels',), ('Rudy Riou',), ('Silvio Proto',), ('Yohan Thuram Ulien',), ('Jean-Francois Gillet',), ('Sammy Bossuyt',), ('Darren Keet',), ('Nicolas Penneteau',), ('Laurent Henkinet',), ('William Dutoit',), ('Sinan Bolat',), ('Laszlo Koteles',), ('Matz Sels',), ('Rudy Riou',), ('Boubacar Barry Copa',), ('Ofir Marciano',), ('Didier Ovono',), ('Koen Van Langendonck',), ('Silvio Proto',), ('Yohan Thuram Ulien',), ('Jean-Francois Gillet',), ('Sammy Bossuyt',), ('Vagner',), ('Darren Keet',), ('Laurent Henkinet',), ('William Dutoit',), ('Sinan Bolat',), ('Matz Sels',), ('Marco Bizot',), ('Didier Ovono',), ('Boubacar Barry Copa',), ('Nicolas Penneteau',), ('Rudy Riou',), ('Koen Van Langendonck',), ('Silvio Proto',), ('Yohan Thuram Ulien',), ('Jean-Francois Gillet',), ('Sammy Bossuyt',), ('Vagner',), ('Boubacar Barry Copa',), ('Darren Keet',), ('Laurent Henkinet',)]
----------------------------
