-- PROBLEM # 1062
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

-- External Knowledge: overall_rating > 80; from 2008 to 2010 refers to strftime('%Y', date) BETWEEN '2008' AND '2010';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which players had an overall rating of over 80 from 2008 to 2010? Please list player names.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Player.player_name FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.overall_rating > 80 AND strftime('%Y', Player_Attributes.date) BETWEEN '2008' AND '2010';
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Aaron Lennon',), ('Abdulkader Keita',), ('Adam Johnson',), ('Adrian Mutu',), ('Adriano',), ('Afonso Alves,24',), ('Aiden McGeady',), ('Aiyegbeni Yakubu',), ('Albert Riera',), ('Albert Streit',), ('Alberto Aquilani',), ('Alberto Gilardino',), ('Aleksandr Hleb',), ('Alessandro Del Piero',), ('Alessandro Gamberini',), ('Alessandro Nesta',), ('Alex Song',), ('Alex',), ('Alexander Frei',), ('Alexandr Kerzhakov',), ('Alexandre Pato',), ('Alou Diarra',), ('Alvaro Arbeloa',), ('Alvaro Negredo',), ('Amauri',), ('Anatoli Tymoschuk',), ('Anderson',), ('Andre-Pierre Gignac',), ('Andrea Barzagli',), ('Andrea Pirlo',), ('Andres Guardado',), ('Andres Iniesta',), ('Andres Palop',), ('Andrey Arshavin',), ('Angel Di Maria',), ('Angelo Palombo',), ('Antonio Cassano',), ('Antonio Di Natale',), ('Antonio Valencia',), ('Arda Turan',), ('Arjen Robben',), ('Arne Friedrich',), ('Artur Boruc',), ('Ashley Cole',), ('Ashley Young',), ('Bacary Sagna',), ('Bafetimbi Gomis',), ('Bastian Schweinsteiger',), ('Bogdan Lobont',), ('Brad Friedel',), ('Branislav Ivanovic',), ('Brede Hangeland',), ('Bruno Alves',), ('Bryan Ruiz',), ('Carles Puyol',), ('Carlos Cuellar',), ('Carlos Henrique',), ('Carlos Kameni',), ('Carlos Marchena',), ('Carlos Salcido',), ('Carlos Tevez',), ('Cedric Carrasso',), ('Cesc Fabregas',), ('Christian Abbiati',), ('Christian Daniel Ledesma',), ('Christian Poulsen',), ('Clarence Seedorf',), ('Claudio Pizarro',), ('Craig Bellamy',), ('Craig Gordon',), ('Cris',), ('Cristian Chivu',), ('Cristian Rodriguez',), ('Cristiano Lucarelli',), ('Cristiano Ronaldo',), ('Cristiano Zanetti',), ('Daniel Agger',), ('Daniel Alves',), ('Daniel Guiza',), ('Daniel van Buyten',), ('Daniele De Rossi',), ('Darren Bent',), ('Darren Fletcher',), ('David Beckham',), ('David Bentley',), ('David Di Michele',), ('David James',), ('David Luiz',), ('David Pizarro',), ('David Silva',), ('David Trezeguet',), ('David Villa',), ('Dean Ashton',), ('Deco',), ('Dejan Stankovic',), ('Didier Drogba',), ('Didier Zokora',), ('Diego Alves',), ('Diego Benaglio',), ('Diego Forlan',), ('Diego Godin',), ('Diego Lopez',), ('Diego Lugano',), ('Diego Milito',), ('Diego',), ('Dimitar Berbatov',), ('Dirk Kuyt',), ('Doni',), ('Eden Hazard',), ('Edin Dzeko',), ('Eduardo',), ('Edwin van der Sar',), ('Elano',), ('Emmanuel Adebayor',), ('Eric Abidal',), ('Esteban Cambiasso',), ('Ever Banega',), ('Ezequiel Garay',), ('Ezequiel Lavezzi',), ('Fabio Cannavaro',), ('Fabio Quagliarella',), ('Fabricio Coloccini',), ('Fabrizio Miccoli',), ('Federico Marchetti',), ('Felipe Melo',), ('Fernando Cavenaghi',), ('Fernando Llorente',), ('Fernando Meira',), ('Fernando Morientes',), ('Fernando Torres',), ('Filipe Luis',), ('Florent Malouda',), ('Francesco Totti',), ('Franck Ribery',), ('Frank Lampard',), ('Frank Rost',), ('Frederic Kanoute',), ('Gabriel Agbonlahor',), ('Gabriel Milito',), ('Gael Clichy',), ("Gaetano D'Agostino",), ('Gareth Bale',), ('Gareth Barry',), ('Gennaro Gattuso',), ('Gerard Pique',), ('Geromel',), ('Giampaolo Pazzini',), ('Gianluca Zambrotta',), ('Gianluigi Buffon',), ('Gilberto',), ('Giorgio Chiellini',), ('Giuseppe Rossi',), ('Glen Johnson',), ('Gokhan Inler',), ('Gonzalo Higuain',), ('Goran Pandev',), ('Gorka Iraizoz Moreno',), ('Grafite',), ('Guillermo Ochoa',), ('Hamit Altintop',), ('Heiko Westermann',), ('Helton',), ('Hernan Crespo',), ('Hernanes',), ('Heurelho Gomes',), ('Hugo Lloris',), ('Hulk',), ('Ibrahim Afellay',), ('Ibson',), ('Iker Casillas',), ('Ireneusz Jelen',), ('Ivan Cordoba',), ('Ivan de la Pena',), ('Ivica Olic',), ('Jaime Gavilan',), ('James Milner',), ('Jamie Carragher',), ('Jaroslav Drobny',), ('Javier Mascherano',), ('Javier Saviola',), ('Javier Zanetti',), ('Jean Makoun',), ('Jefferson Farfan',), ('Jeremy Menez',), ('Jeremy Toulalan',), ('Jermain Defoe',), ('Jerome Rothen',), ('Jesus Navas',), ('Jimmy Briand',), ('Jo',), ('Joao Moutinho',), ('Joaquin',), ('Joe Cole',), ('Joe Hart',), ('John Carew',), ('John Obi Mikel',), ('John Terry',), ('Joleon Lescott',), ('Jonathan Woodgate',), ('Jose Antonio Reyes',), ('Jose Bosingwa',), ('Jose Maria Guti',), ('Joseph Yobo',), ('Josip Simunic',), ('Josue',), ('Juan Mata',), ('Juan Vargas',), ('Juan',), ('Julien Escude',), ('Julio Baptista',), ('Julio Cesar',), ('Kaka',), ('Kakha Kaladze',), ('Karim Benzema',), ('Kevin Kuranyi',), ('Klaas Jan Huntelaar',), ('Kolo Toure',), ('Landon Donovan',), ('Lassana Diarra',), ('Ledley King',), ('Leighton Baines',), ('Liedson',), ('Lionel Messi',), ('Lisandro Lopez',), ('Lorik Cana',), ('Louis Saha',), ('Luca Toni',), ('Lucas Barrios',), ('Lucho Gonzalez',), ('Lucio',), ('Luis Fabiano',), ('Luis Suarez',), ('Luisao',), ('Luka Modric',), ('Lukas Podolski',), ('Maarten Stekelenburg',), ('Mahamadou Diarra',), ('Maicon',), ('Mamadou Niang',), ('Mancini',), ('Maniche',), ('Manuel Almunia',), ('Manuel Neuer',), ('Marc Planus',), ('Marcelo Jose Bordon',), ('Marco Borriello',), ('Marco Materazzi',), ('Marcos Senna',), ('Marek Hamsik',), ('Mario Balotelli',), ('Mario Gomez',), ('Mark van Bommel',), ('Marko Marin',), ('Marko Pantelic',), ('Marouane Chamakh',), ('Marouane Fellaini',), ('Martin Caceres',), ('Martin Demichelis',), ('Martin Laursen',), ('Martin Petrov',), ('Martin Skrtel',), ('Massimo Ambrosini',), ('Mathieu Flamini',), ('Matteo Sereni',), ('Matthew Upson',), ('Mauro Camoranesi',), ('Mauro Zarate',), ('Maxi Rodriguez',), ('Maxwell',), ('Mesut Oezil',), ('Micah Richards',), ('Michael Ballack',), ('Michael Carrick',), ('Michael Essien',), ('Michael Owen',), ('Michel Bastos',), ('Mickael Landreau',), ('Mikel Arteta',), ('Milos Krasic',), ('Mirko Vucinic',), ('Miroslav Klose',), ('Mladen Petric',), ('Mohamed Lamine Sissoko',), ('Mounir El Hamdaoui',), ('Naldo',), ('Nani',), ('Nemanja Vidic',), ('Nery Castillo',), ('Nicola Legrottaglie',), ('Nicolas Anelka',), ('Nihat Kahveci',), ('Niko Kranjcar',), ('Obafemi Martins',), ('Oscar Cardozo',), ('Owen Hargreaves',), ('Pablo Aimar',), ('Pablo Hernandez',), ('Patrice Evra',), ('Patrick Helmes',), ('Patrick Vieira',), ('Paul Scholes',), ('Pavel Nedved',), ('Pavel Pardo',), ('Pavel Pogrebnyak',), ('Pedro Munitis',), ('Pedro Rodriguez',), ('Pepe Reina',), ('Pepe',), ('Per Mertesacker',), ('Petr Cech',), ('Phil Jagielka',), ('Philipp Lahm',), ('Phillippe Mexes',), ('Piotr Trochowski',), ('Radamel Falcao',), ('Rafael Marquez',), ('Rafael van der Vaart',), ('Rafinha',), ('Raul Albiol',), ('Raul Meireles',), ('Raul Tamudo',), ('Raul',), ('Rene Adler',), ('Ricardo Carvalho',), ('Ricardo Quaresma',), ('Riccardo Montolivo',), ('Rio Ferdinand',), ('Robbie Keane',), ('Robert Enke,30',), ('Robert Green',), ('Robert Pires',), ('Roberto Abbondanzieri',), ('Roberto Soldado',), ('Robin van Persie',), ('Robinho',), ('Rodrigo Taddei',), ('Roman Pavlyuchenko',), ('Ronaldinho',), ('Roque Santa Cruz',), ('Roy Makaay',), ('Ruud van Nistelrooy',), ('Ryan Babel',), ('Ryan Giggs',), ('Salomon Kalou',), ('Samir Nasri',), ("Samuel Eto'o",), ('Santi Cazorla',), ('Sebastian Frey',), ('Sebastian Giovinco',), ('Sebastian Meoli',), ('Sebastien Puygrenier',), ('Sebastien Squillaci',), ('Sergio Aguero',), ('Sergio Asenjo',), ('Sergio Busquets',), ('Sergio Floccari',), ('Sergio Ramos',), ('Seydou Keita',), ('Shaun Wright-Phillips',), ('Shay Given',), ('Shunsuke Nakamura',), ('Sidney Govou',), ('Simao',), ('Simon Rolfes',), ('Simone Perrotta',), ('Souleymane Diawara',), ('Stefan Kiessling',), ('Stephane Sessegnon',), ('Stephen Ireland',), ('Steve Mandanda',), ('Steven Gerrard',), ('Steven Naismith',), ('Stewart Downing',), ('Stiliyan Petrov',), ('Stipe Pletikosa',), ('Sulley Ali Muntari',), ('Theo Walcott',), ('Thiago Motta',), ('Thiago Silva',), ('Thierry Henry',), ('Thomas Vermaelen',), ('Tim Cahill',), ('Tim Howard',), ('Tim Wiese',), ('Timo Hildebrand',), ('Tom Huddlestone',), ('Tomas Rosicky',), ('Tomas Ujfalusi',), ('Tommaso Rocchi',), ('Torsten Frings',), ('Vagner Love',), ('Valerien Ismael',), ('Vedran Corluka',), ('Vicente',), ('Victor Valdes',), ('Vincenzo Iaquinta',), ('Walter Samuel',), ('Wayne Rooney',), ('Wendel',), ('Wesley Sneijder',), ('William Gallas',), ('Xabi Alonso',), ('Xavi Hernandez',), ('Yaya Toure',), ('Yoann Gourcuff',), ('Yuri Zhirkov',), ('Ze Roberto',), ('Zlatan Ibrahimovic',), ('Zvjezdan Misimovic',)]
----------------------------
