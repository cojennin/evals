-- PROBLEM # 1088
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

-- External Knowledge: volley score refers to volleys; volleys > 70; dribbling score refers to dribbling; dribbling > 70;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the names of the players whose volley score and dribbling score are over 70.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Player.player_name FROM Player INNER JOIN Player_Attributes ON Player.player_api_id = Player_Attributes.player_api_id WHERE Player_Attributes.volleys > 70 AND Player_Attributes.dribbling > 70;
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Aaron Hunt',), ('Aaron Ramsey',), ('Aatif Chahechouhe',), ('Abdelkader Ghezzal',), ('Abdoulaye Diallo Sadio,22',), ('Abel Hernandez',), ('Abou Diaby',), ('Abraham Guie Gneki',), ('Achille Emana',), ('Adam Lallana',), ('Adam Maher',), ('Adam Szalai',), ('Adel Taarabt',), ('Adem Ljajic',), ('Admir Mehmedi',), ('Adnane Tighadouini',), ('Adrian Colunga',), ('Adrian Lopez',), ('Adrian Mutu',), ('Adrian Ramos',), ('Adriano Ferreira Pinto',), ('Adriano',), ('Adrien Regattin',), ('Adrien Silva',), ('Adryan',), ('Ahmed El Mohamady',), ('Ahmed Musa',), ('Aiden McGeady',), ('Aiyegbeni Yakubu',), ('Alan Kardec',), ('Alassane Plea',), ('Albert Bunjaku',), ('Albert Meyong Ze',), ('Albert Riera',), ('Alberto Aquilani',), ('Alberto Bueno',), ('Alberto Gilardino',), ('Alberto Luque,21',), ('Alberto Paloschi',), ('Alejandro Alfaro',), ('Alejandro Daro Gomez',), ('Alejandro Dominguez',), ('Aleksandr Hleb',), ('Alessandro Del Piero',), ('Alessandro Diamanti',), ('Alessandro Florenzi',), ('Alessandro Matri',), ('Alessandro Rosina',), ('Alessandro Sgrigna',), ('Alessio Cerci',), ('Alexander Frei',), ('Alexander Gerndt',), ('Alexander Iashvili',), ('Alexander Meier',), ('Alexandr Kerzhakov',), ('Alexandre Lacazette',), ('Alexandre Pato',), ('Alexandru Maxim',), ('Alexis Sanchez',), ('Alfred Finnbogason',), ('Ali Messaoud',), ('Aloys Nong',), ('Alvaro Morata',), ('Alvaro Negredo',), ('Alvaro Vazquez',), ('Amauri',), ('Anass Achahbar',), ('Anderson Talisca',), ('Andre Carrillo',), ('Andre Hahn',), ('Andre Schuerrle',), ('Andre-Pierre Gignac',), ('Andrea Caracciolo',), ('Andrea Cossu',), ('Andrea Dossena',), ('Andrea Gasbarroni',), ('Andrea Lazzari',), ('Andrea Pirlo',), ('Andrej Kramaric',), ('Andres Guardado',), ('Andres Iniesta',), ('Andrew Johnson',), ('Andrey Arshavin',), ('Andrey Voronin',), ('Andy Delort',), ('Andy King',), ('Angel Correa',), ('Angel Di Maria',), ('Angel Lafita',), ('Angelo Palombo',), ('Anis Ben-Hatira',), ('Anthony Le Tallec',), ('Anthony Lurling',), ('Anthony Martial',), ('Anthony Modeste',), ('Anthony Mounier',), ('Anthony Stokes',), ('Antoine Griezmann',), ('Antonio Candreva',), ('Antonio Cassano',), ('Antonio da Silva',), ('Antonio Di Natale',), ('Antonio Floro Flores',), ('Antonio Nocerino',), ('Anwar El-Ghazi',), ('Aras Oezbiliz',), ('Arda Turan',), ('Aritz Aduriz',), ('Arjen Robben',), ('Arkadiusz Milik',), ('Arouna Kone',), ('Arturo Vidal',), ('Asamoah Gyan',), ('Ashkan Dejagah',), ('Ashley Young',), ('Axel Witsel',), ('Ayoze Perez',), ('Baba',), ('Bafetimbi Gomis',), ('Bakary Sako',), ('Balazs Dzsudzsak',), ('Barreto',), ('Barry Bannan',), ('Barry Ferguson',), ('Bartholomew Ogbeche',), ('Bastian Schweinsteiger',), ('Baye Oumar Niasse',), ('Bebe',), ('Benjamin De Ceulaer',), ('Benjamin Moukandjo',), ('Benjani Mwaruwari',), ('Bennedict McCarthy,27',), ('Benoit Assou-Ekotto',), ('Benoit Cheyrou',), ('Bertrand Traore',), ('Blaise Matuidi',), ("Blaise N'Kufo",), ('Blerim Dzemaili',), ('Bobby Zamora',), ('Bojan Krkic',), ('Borja Viguera',), ('Bosko Jankovic',), ('Boubacar Sanogo',), ('Boudewijn Zenden',), ('Braga',), ('Braulio',), ('Brown Ideye',), ('Bruno Cesar',), ('Bruno Peres',), ('Bryan Ruiz',), ('Cacau',), ('Caio',), ('Cameron Jerome',), ('Cani',), ('Carles Gil',), ('Carlos Bacca',), ('Carlos Eduardo',), ('Carlos Mane',), ('Carlos Martins',), ('Carlos Saleiro',), ('Carlos Tevez',), ('Carlos Vela',), ('Cedric Bakambu',), ('Cedric Makiadi',), ('Celso Borges',), ('Cesc Fabregas',), ("Charles N'Zogbia",), ('Charles Takyi',), ('Charles',), ('Charlie Adam',), ('Cheick Diabate',), ('Chinedu Obasi',), ('Chris Eagles',), ('Christian Benteke',), ('Christian Daniel Ledesma',), ('Christian Maggio',), ('Christophe Landrin',), ('Christophe Mandanne',), ('Cicero',), ('Ciprian Marica',), ('Ciro Immobile',), ('Clarence Seedorf',), ('Claudio Beauvue',), ('Claudio Marchisio',), ('Claudio Pizarro',), ('Cleber Santana',), ('Clemens Fritz',), ('Clement Grenier',), ('Clint Dempsey',), ('Corentin Jean',), ('Craig Bellamy',), ('Crislan',), ('Cristian Benitez',), ('Cristian Pasquato',), ('Cristian Rodriguez',), ('Cristiano Doni',), ('Cristiano Lucarelli',), ('Cristiano Ronaldo',), ('Cristiano Zanetti',), ('Cyril Thereau',), ('Daisuke Matsui',), ("Dame N'Doye",), ('Damien Duff',), ('Dan Gosling',), ('Dani Ndi',), ('Daniel Candeias',), ('Daniel Didavi',), ('Daniel Ginczek',), ('Daniel Guiza',), ('Daniel Jensen',), ('Daniel Omoya Braaten',), ('Daniel Parejo',), ('Daniel Sturridge',), ('Daniel Wass',), ('Daniele Baselli',), ('Daniele Cacia',), ('Daniele De Rossi',), ('Danijel Ljuboja',), ('Danijel Milicevic',), ('Danilo Dias',), ('Danilo',), ('Danko Lazovic',), ('Danny Hoesen',), ('Danny Welbeck',), ('Dario Cvitanich',), ('Dario Vidosic',), ('Darius Vassell',), ('Darko Bodul',), ('Darren Bent',), ('Darren Pratley',), ('David Barral',), ('David Beckham',), ('David Bellion',), ('David Bentley',), ('David Di Michele',), ('David Ngog',), ('David Nugent',), ('David Pizarro',), ('David Silva',), ('David Suazo',), ('David Trezeguet',), ('David Villa',), ('Davide Lanzafame',), ('Davide Moscardelli',), ('Davy Klaassen',), ('Davy Proepper',), ('Deco',), ('Dede',), ('Dejan Stankovic',), ('Dele Alli',), ('Demba Ba',), ('Demy de Zeeuw',), ('Denni Avdic',), ('Dennis Rommedahl',), ('Derley',), ('Deyverson',), ('Didier Drogba',), ('Didier Konan Ya',), ('Diego Barcelos',), ('Diego Costa',), ('Diego Forlan',), ('Diego Milito',), ('Diego',), ('Dieumerci Mbokani',), ('Dimitar Berbatov',), ('Dimitar Rangelov',), ('Dimitri Payet',), ('Diniyar Bilyaletdinov',), ('Diogo Salomao',), ('Diomansy Kamara',), ('Dirk Kuyt',), ('Djibril Cisse',), ('Domenico Berardi',), ('Dorge Kouemaha',), ('Dorlan Pabon',), ('Douglas Costa',), ('Dudley Campbell',), ('Dusan Djuric',), ('Dusan Svento',), ('Dusan Tadic',), ('Duvan Zapata',), ('Eden Hazard',), ('Eder Citadin Martins',), ('Eder',), ('Ederson',), ('Edgar Antonio Mendez',), ('Edin Dzeko',), ('Edinson Cavani',), ('Edu',), ('Eduardo Salvio',), ('Eduardo Vargas',), ('Eduardo',), ('Eidur Gudjohnsen',), ('El Hadji Diouf',), ('Elano',), ('Elias',), ('Eliran Atar',), ('Eljero Elia',), ('Elliot Grandin',), ('Elson',), ('Elvis Manu',), ('Elyaniv Barda',), ('Emanuele Calaio',), ('Emanuele Giaccherini',), ('Emile Heskey',), ('Emmanuel Adebayor',), ('Emmanuel Agyemang-Badu',), ('Emmanuel Emenike',), ('Enzo Perez',), ('Eran Zahavi',), ('Eren Derdiyok',), ('Eric Maxim Choupo-Moting',), ('Eric Mouloungui',), ('Erik Huseklepp',), ('Erik Jendrisek',), ('Erik Lamela',), ('Erik Nevland',), ('Esteban Cambiasso',), ('Euzebiusz Smolarek',), ('Evandro Goebel',), ('Everton',), ('Ewerthon',), ('Ezequiel Lavezzi',), ('Ezequiel Scarione',), ('Fabian Delph',), ('Fabien Camus',), ('Fabio Borini',), ('Fabio Coentrao',), ('Fabio Grosso',), ('Fabio Liverani',), ('Fabio Quagliarella',), ('Fabrizio Miccoli',), ('Federico Macheda',), ('Fedor Smolov',), ('Felipe Caicedo',), ('Felipe Gedoz',), ('Felipe Gutierrez',), ('Felipe Melo',), ('Felipe Pardo',), ('Felipe Seymour',), ('Fernandinho',), ('Fernando Belluschi',), ('Fernando Cavenaghi',), ('Fernando Llorente',), ('Fernando Torres',), ('Filip Djuricic',), ('Filippo Inzaghi',), ('Florent Balmont',), ('Florent Malouda',), ('Florent Sinama-Pongolle',), ('Fraizer Campbell',), ('Francelino Matuzalem',), ('Francesco Lodi',), ('Francesco Tavano',), ('Francesco Totti',), ('Francisco Alcacer',), ('Francisco Navarro Yeste',), ('Franck Ribery',), ('Franck Tabanou',), ('Franco Brienza',), ('Franco Daniel Jara',), ('Franco Di Santo',), ('Franco Vazquez',), ('Frank Lampard',), ('Fred',), ('Frederic Kanoute',), ('Frederic Piquionne',), ('Fredy Guarin',), ('Fredy Montero',), ('Gabi',), ('Gabriel Agbonlahor',), ("Gaetano D'Agostino",), ('Garath McCleary',), ('Gareth Bale',), ('Garry Mendes Rodrigues',), ('Gaston Ramirez',), ('Gelson',), ('Geoffrey Dernis',), ('Geoffrey Mujangi Bia',), ("Georges N'Koudou",), ('Georginio Wijnaldum',), ('Geovanni',), ('Gergely Rudolf',), ('German Denis',), ('Gerso Fernandes',), ('Gervinho',), ('Giacomo Bonaventura',), ('Giampaolo Pazzini',), ('Giampiero Pinzi',), ('Giandomenico Mesto',), ('Gianluca Sansone',), ('Gianluca Zambrotta',), ('Gianni Munari',), ('Gil Vermouth',), ('Giovani dos Santos',), ('Giovanni Sio',), ('Giuseppe De Luca',), ('Giuseppe Mascara',), ('Giuseppe Rossi',), ('Giuseppe Sculli',), ('Gokhan Inler',), ('Gokhan Tore',), ('Gonzalo Bergessio',), ('Gonzalo Higuain',), ('Goran Pandev',), ('Grafite',), ('Gregory Pujol',), ('Gregory van der Wiel',), ('Guido Marilungo',), ('Guillaume Gillet',), ('Guillaume Hoarau',), ('Gylfi Sigurdsson',), ('Haavard Nielsen',), ('Hakan Calhanoglu',), ('Hakan Yakin',), ('Hakim Ziyech',), ('Halil Altintop',), ('Hameur Bouazza',), ('Hamit Altintop',), ('Hans Vanaken',), ('Haris Seferovic',), ('Hatem Ben Arfa',), ('Helder Postiga',), ('Henok Goitom',), ('Henrik Mkhitaryan',), ('Hernan Crespo',), ('Hernanes',), ('Heung-Min Son',), ('Hiroshi Kiyotake',), ('Houssine Kharja',), ('Hugo Almeida',), ('Hugo Leal',), ('Hugo Rodallega',), ('Hulk',), ('Humberto Suazo',), ('Iago Aspas',), ('Ibai Gomez',), ('Ibrahim Afellay',), ('Ibson',), ('Ignacio Piatti',), ('Ignazio Abate',), ('Igor Budan',), ('Ikechukwu Uche',), ('Ilan',), ('Ilkay Guendogan',), ('Ilombe Mboyo',), ('Imanol Agirretxe',), ('Imoh Ezekiel',), ('Ioannis Amanatidis',), ('Ireneusz Jelen',), ('Isaac Boakye',), ('Ishak Belfodil',), ('Islam Slimani',), ('Ismael Bangoura',), ('Issiar Dia',), ('Itay Shechter',), ('Ivan Alonso',), ('Ivan Klasnic',), ('Ivan Perisic',), ('Ivan Rakitic',), ('Ivan Sanchez Riki',), ('Ivan Trickovski',), ('Ivica Iliev',), ('Ivica Olic',), ('Ivo Ilicevic',), ('Izet Hajrovic',), ('Ja-Cheol Koo',), ('Jack Wilshere',), ('Jackson Martinez',), ('Jaime Valdes',), ('Jakob Jantscher',), ('Jakub Blaszczykowski',), ('James McFadden',), ('James Milner',), ('James Morrison',), ('James Rodriguez',), ('Jamie Vardy',), ('Jan Moravek',), ('Jan Rosenthal',), ('Jan Schlaudraff',), ('Jan Simak',), ('Jason Puncheon',), ('Javi Guerra',), ('Javi Moreno Marquez',), ('Javier Chevanton',), ('Javier Hernandez',), ('Javier Pastore',), ('Javier Portillo',), ('Javier Saviola',), ('Javier Zanetti',), ('Jay Rodriguez',), ('Jedaias Capucho Neves',), ('Jefferson Farfan',), ('Jefferson Nascimento',), ('Jens Toornstra',), ('Jeremain Lens',), ('Jeremie Aliadiere',), ('Jeremy Menez',), ('Jermain Defoe',), ('Jermaine Jenas',), ('Jerome Leroy',), ('Jesus Navas',), ('Jhon Cordoba',), ('Ji-Sung Park',), ('Jimmy Briand',), ('Jimmy Kebe',), ('Jiri Stajner',), ('Jo',), ('Joao Moutinho',), ('Joao Pedro Galvao',), ('Joe Cole',), ('Joel Campbell',), ('Joffre David Guerron',), ('Johan Audel',), ('Johan Elmander',), ('Johan Vonlanthen',), ('John Arne Riise',), ('John Bostock',), ('John Carew',), ('John Goossens',), ('John Guidetti',), ('John Utaka',), ('Jon Dahl Tomasson',), ('Jonas',), ('Jonathan Biabiany',), ('Jonathan Blondel',), ('Jonathan Cristaldo',), ('Jonathan De Guzman',), ('Jonathan dos Santos',), ('Jonathan Pereira',), ('Jonathan Reis',), ('Jonathan Rodriguez',), ('Jonathan Soriano',), ('Jonathas',), ('Joonas Kolkka',), ('Jordan Ayew',), ('Jordan Henderson',), ('Jordy Clasie',), ('Jorge Martinez',), ('Jorginho',), ('Jose Antonio Reyes',), ('Jose Baxter',), ('Jose Leonardo Ulloa',), ('Jose Manuel Jurado',), ('Jose Mari',), ('Jose Maria Callejon',), ('Jose Maria Guti',), ('Jose Paolo Guerrero',), ('Jose Salomon Rondon',), ('Jose Sosa',), ('Joselu',), ('Joshua King',), ('Josip Drmic',), ('Josip Ilicic',), ('Juan Arango',), ('Juan Carlos Menseguez',), ('Juan Carlos Valeron',), ('Juan Carlos',), ('Juan Cuadrado',), ('Juan Gomez',), ('Juan Mata',), ('Juan Vargas',), ('Juanlu',), ('Julian Draxler',), ('Julian Schieber',), ('Julien Quercia',), ('Julien Sable',), ('Julio Arca',), ('Julio Baptista',), ('Juninho Pernambucano,20',), ('Junya Tanaka',), ('Juraj Kucka',), ('Kaka',), ('Kalu Uche',), ('Kamel Ghilas',), ('Kandia Traore',), ('Karim Bellarabi',), ('Karim Benzema',), ('Karim Matmour',), ('Keirrison',), ('Keisuke Honda',), ('Kelvin',), ('Kenny Miller',), ('Kenwyne Jones',), ('Kerim Frei Koyunlu',), ('Kevin Berigaud',), ('Kevin Constant',), ('Kevin Davies',), ('Kevin de Bruyne',), ('Kevin Doyle',), ('Kevin Gameiro',), ('Kevin Kilbane',), ('Kevin Kuranyi',), ('Kevin Mirallas',), ('Kevin Nolan',), ('Kevin Roelandts',), ('Kevin-Prince Boateng',), ('Kieran Richardson',), ('Kieron Dyer',), ('Kim Kaellstroem',), ('Kingsley Coman',), ('Klaas Jan Huntelaar',), ('Kleber Pinheiro',), ('Konstantinos Mitroglou',), ('Kris Boyd',), ('Krisztian Nemeth',), ('Kwadwo Asamoah',), ('Landon Donovan',), ('Lars Stindl',), ('Lassad Nouioui',), ('Lasse Schoene',), ('Lautaro Acosta',), ('Lazaros Christodoulopoulos',), ('Leandro Bacuna',), ('Leandro Damiao',), ('Leandro Daniel Paredes',), ('Lee Cattermole',), ('Leo Baptistao',), ('Leo Bonatini',), ('Leon Best',), ('Leon Osman',), ('Leonard Kweuke',), ('Liedson',), ('Lima',), ('Lionel Messi',), ('Lior Rafaelov',), ('Lisandro Lopez',), ('Loic Remy',), ('Lorenzo Insigne',), ('Louis Saha',), ('Luc Castaignos',), ('Luca Cigarini',), ('Luca Toni',), ('Lucas Barrios',), ('Lucas Biglia',), ('Lucas Moura',), ('Lucas Perez',), ('Lucas Piazon',), ('Lucas Pratto',), ('Lucho Gonzalez',), ('Luciano Dario Vietto',), ('Lucio',), ('Ludovic Giuly',), ('Ludovic Obraniak',), ('Luigi Pieroni',), ('Luis Boa Morte',), ('Luis Fabiano',), ('Luis Garcia',), ('Luis Jimenez',), ('Luis Muriel',), ('Luis Seijas',), ('Luis Suarez',), ('Luiz Adriano',), ('Luka Modric',), ('Lukas Podolski',), ('Lukasz Gargula',), ('Luuk de Jong',), ('Lynel Kitambala',), ('Magnus Wolff Eikrem',), ('Mahir Saglik',), ('Maicon',), ('Mame Biram Diouf',), ('Mancini',), ('Manolo Gabbiadini',), ('Manu del Moral',), ('Manuel Pucciarelli',), ('Manuel Trigueros',), ('Maor Melikson',), ('Marama Vahirua',), ('Marc Albrighton',), ('Marcelo Estigarribia',), ('Marcelo Moreno',), ('Marcelo Zalayeta',), ('Marcio Mossoro',), ('Marco Borriello',), ('Marco Davide Faraoni',), ('Marco Di Vaio',), ('Marco Donadel',), ('Marco Fabian',), ('Marco Hoeger',), ('Marco Marchionni',), ('Marco Parolo',), ('Marco Reus',), ('Marco Rossi',), ('Marco Ruben',), ('Marco Sau',), ('Marco van Ginkel',), ('Marcus Berg',), ('Marek Hamsik',), ('Marek Jankulovski',), ('Marek Mintal',), ('Mariano Bogliacino',), ('Mariano Pavone',), ('Mario Alberto Santana',), ('Mario Balotelli',), ('Mario Bermejo',), ('Mario Gaspar',), ('Mario Goetze',), ('Mario Gomez',), ('Mario Mandzukic',), ('Mario Raimondi',), ('Mario Rondon',), ('Mario Vrancic',), ('Mark Gonzalez',), ('Mark Uth',), ('Marko Arnautovic',), ('Marko Marin',), ('Marko Pantelic',), ('Markus Rosenberg',), ('Marouane Chamakh',), ('Marouane Fellaini',), ('Marquinho',), ('Martin Braithwaite',), ('Martin Harnik',), ('Martin Joergensen',), ('Martin Petrov',), ('Masoud Shojaei',), ('Massimo Ambrosini',), ('Massimo Maccarone',), ('Mateo Kovacic',), ('Mateus',), ('Matheus Pereira',), ('Mathieu Bodmer',), ('Mathieu Flamini',), ('Mathieu Valbuena',), ('Matias Alustiza',), ('Matias Fernandez',), ('Matias Suarez',), ('Matteo Brighi',), ('Matthew Taylor',), ('Matthias Lepiller',), ('Mattia Destro',), ('Mauricio Pinilla',), ('Mauro Camoranesi',), ('Mauro Icardi',), ('Mauro Zarate',), ('Max Kruse',), ('Maxi Lopez',), ('Maxi Moralez',), ('Maxi Rodriguez',), ('Maximilian Arnold',), ('Maximillian Beister',), ('Mbaye Niang',), ('Mehmet Ekici',), ('Memphis Depay',), ('Mervan Celik',), ('Mesut Oezil',), ('Mevlut Erdinc',), ('Michael Ballack',), ('Michael Bradley',), ('Michael Chopra',), ('Michael Essien',), ('Michael Krohn-Dehli',), ('Michael Owen',), ('Michel Bastos',), ('Michu',), ('Michy Batshuayi',), ('Mickael Isabey',), ('Mido',), ('Mikael Forssell',), ('Mikel Arteta',), ('Mikel San Jose',), ('Mikkel Diskerud',), ('Miku',), ('Milan Jovanovic',), ('Milivoje Novakovic',), ('Milos Jojic',), ('Milos Krasic',), ('Milos Maric',), ('Mimoun Azaouagh',), ('Miralem Pjanic',), ('Miralem Sulejmani',), ('Mirko Antenucci',), ('Mirko Vucinic',), ('Miroslav Klose',), ('Miroslav Stoch',), ('Mladen Petric',), ('Modibo Maiga',), ('Mohamed Zidan',), ('Mohammed Abdellaoue',), ('Mohammed Tchite',), ('Moi Gomez',), ('Morgan Amalfitano',), ('Moritz Leitner',), ('Morten Gamst Pedersen',), ('Mostapha El Kabir',), ('Mounir El Hamdaoui',), ('Moussa Dembele',), ('Moussa Sow',), ('Mu Kanazaki',), ('Munir El Haddadi',), ('Mustapha Riga',), ('Nabil Baha',), ('Nabil Fekir',), ('Nabil Ghilas',), ('Nacer Barazite',), ('Nacer Chadli',), ('Nani',), ('Nelson Haedo Valdez',), ('Nemanja Matic',), ('Nene',), ('Nery Castillo',), ('Nestor Susaeta',), ('Neymar',), ('Nicki Bille Nielsen',), ('Nicklas Bendtner',), ('Nicklas Pedersen',), ('Nicola Amoruso',), ('Nicola Pozzi',), ('Nicolai Joergensen',), ('Nicolas Andres Cordova',), ('Nicolas Anelka',), ('Nicolas De Preville',), ('Nicolas Gaitan',), ('Nicolas Lopez',), ('Nihat Kahveci',), ('Nikica Jelavic',), ('Niko Kranjcar',), ('Nikola Djurdjic',), ('Nikola Kalinic',), ('Nikola Zigic',), ('Nikos Karelis',), ('Nilmar',), ('Nino',), ('Ninos Gouriye',), ('Nolan Roux',), ('Nolito',), ('Nordin Amrabat',), ('Nuno Gomes',), ('Nuri Sahin',), ('Nwankwo Kanu',), ('Obafemi Martins',), ('Odion Ighalo',), ('Ola Toivonen',), ('Olcay Sahan',), ('Oleg Iachtchouk',), ('Oliver Neuville',), ('Olivier Kapo',), ('Olivier Sorlin',), ('Olivier Thomert',), ('Orlando Engelaar',), ('Oscar Cardozo',), ('Oscar Trejo',), ('Oussama Tannane',), ('Pablo Aimar',), ('Pablo Barrientos',), ('Pablo Hernandez',), ('Pablo Osvaldo',), ('Pablo Piatti',), ('Panagiotis Kone',), ('Papiss Cisse',), ('Pascal Feindouno',), ('Pasquale Foggia',), ('Patrick Helmes',), ('Patrick Herrmann',), ('Paul Freier',), ('Paul Pogba',), ('Paul Scholes',), ('Paul-Georges Ntep',), ('Paulinho',), ('Paulo Dybala',), ('Pavel Pogrebnyak',), ('Pawel Brozek',), ('Pedro Leon',), ('Pedro Mendes',), ('Pedro Morales',), ('Pedro Rodriguez',), ('Peguy Luyindula',), ('Per Ciljan Skjelbred',), ('Perparim Hetemaj',), ('Peter Crouch',), ('Peter Loevenkrands',), ('Peter Odemwingie',), ('Peter Whittingham',), ('Philippe Coutinho',), ('Pierre Webo',), ('Pierre-Alain Frau',), ('Pierre-Emerick Aubameyang',), ('Piotr Trochowski',), ('Pizzi',), ('Prince Tagoe',), ('Quincy Owusu-Abeyie',), ('Radamel Falcao',), ('Radja Nainggolan',), ('Rafael Martins',), ('Rafael van der Vaart',), ('Raffael',), ('Raffaele Palladino',), ('Ramires',), ('Raphael Guerreiro',), ('Rasmus Elm',), ('Raul Jimenez',), ('Raul Marcelo Bobadilla',), ('Raul Meireles',), ('Raul Rusescu',), ('Raul Tamudo',), ('Raul',), ('Remy Cabella',), ('Renato Augusto',), ('Renato Steffen',), ('Renato',), ('Ricardo Alvarez',), ('Ricardo Cabanas',), ('Ricardo Fuller',), ('Ricardo Gardner',), ('Ricardo Horta',), ('Ricardo Oliveira',), ('Ricardo Quaresma',), ('Riccardo Meggiorini',), ('Riccardo Montolivo',), ('Ricky van Wolfswinkel',), ('Riyad Mahrez',), ('Robbie Blake',), ('Robbie Fowler',), ('Robbie Keane',), ('Robert Acquafresca',), ('Robert Lewandowski',), ('Robert Vittek',), ('Roberto Firmino',), ('Roberto Pereyra',), ('Roberto Soldado',), ('Robin van Persie',), ('Robinho',), ('Rodolfo Bodipo Diaz',), ('Rodrigo Palacio',), ('Rodrigo Taddei',), ('Rodrigo',), ('Rogelio Funes Mori',), ('Romain Alessandrini',), ('Romain Hamouma',), ('Romain Poyet',), ('Romain Rocchi',), ('Roman Pavlyuchenko',), ('Romelu Lukaku',), ('Ronaldinho',), ('Ronny',), ('Roque Santa Cruz',), ('Roy Beerens',), ('Ruben Castro',), ('Ruben Micael',), ('Ruben Olivera',), ('Ruben Suarez',), ('Rubin Okotie',), ('Rudolf Skacel',), ('Rui Miguel',), ('Ruslan Malinovsky',), ('Ruud van Nistelrooy',), ('Ryad Boudebouz',), ('Ryan Babel',), ('Ryan Giggs',), ('Sabin Merino',), ('Salomon Kalou',), ('Sami Allagui',), ('Sami Khedira',), ('Samir Nasri',), ("Samuel Eto'o",), ('Samuele Longo',), ('Santi Cazorla',), ('Santi Mina',), ('Santiago Leonardo',), ('Saul Berjon',), ('Scott McDonald',), ('Seba',), ('Sebastian Freis',), ('Sebastian Giovinco',), ('Sebastian Larsson',), ('Sebastian Leto',), ('Sebastian Meoli',), ('Sebastien Grax',), ('Sebastien Roudet',), ('Sekou Cisse',), ('Sergio Aguero',), ('Sergio Bernardo Almiron',), ('Sergio Ezequiel Araujo',), ('Sergio Floccari',), ('Sergio Garcia',), ('Sergio Oliveira',), ('Sergio Pellissier',), ('Seydou Doumbia',), ('Shaun Wright-Phillips',), ('Shinji Kagawa',), ('Shinji Okazaki',), ('Sidney Govou',), ('Sidney Sam',), ('Siebe Schrijvers',), ('Siem de Jong',), ('Simao',), ('Simon Davies',), ('Simon Vukcevic',), ('Simon Zoller',), ('Simone Padoin',), ('Simone Pepe',), ('Simone Zaza',), ('Siqueira De Olivera Luciano',), ('Sofiane Feghouli',), ('Sotiris Ninis',), ('Souleymane Camara',), ('Steed Malbranque',), ('Stefan Kiessling',), ('Stefano Guberti',), ('Stefano Mauri',), ('Stefano Sturaro',), ('Stephan El Shaarawy',), ('Stephen Ireland',), ('Stephen Quinn',), ('Stevan Jovetic',), ('Steven Gerrard',), ('Steven Pienaar',), ('Stewart Downing',), ('Stiliyan Petrov',), ('Sulley Ali Muntari',), ('Sylvain Marveaux',), ('Szabolcs Huszti',), ('Tamas Hajnal',), ('Taner Yalcin',), ('Tarik Elyounoussi',), ('Teofilo Gutierrez',), ('Theo Walcott',), ('Theofanis Gekas',), ('Thiago Alcantara',), ('Thiago Motta',), ('Thiago Ribeiro',), ('Thibault Giresse',), ('Thierry Henry',), ('Thomas Enevoldsen',), ('Thomas Kahlenberg',), ('Thomas Mueller',), ('Thorgan Hazard',), ('Thorstein Helstad',), ('Tim Borowski',), ('Tim Cahill',), ('Tim Matavz',), ('Timo Werner',), ('Tobias Werner',), ('Toifilou Maoulida',), ('Tom Huddlestone',), ('Tomas Rosicky',), ('Tommaso Rocchi',), ('Toni Kroos',), ('Tranquillo Barnetta',), ('Tulio de Melo',), ('Tuncay Sanli',), ('Urby Emanuelson',), ('Vaclav Sverkos',), ('Vadis Odjidja-Ofoe',), ('Vagner Love',), ('Valentin Eysseric',), ('Valentin Stocker',), ('Valere Germain',), ('Valeri Bojinov',), ('Valon Behrami',), ('Valter Birsa',), ('Vedad Ibisevic',), ('Vicente Sanchez',), ('Vicente',), ('Victor Anichebe',), ('Victor Camarasa',), ('Victor Casadesus',), ('Victor Ibarbo',), ('Victor Obinna',), ('Viktor Fischer',), ('Vincenzo Iaquinta',), ('Vitali Kutuzov',), ('Vladimir Darida',), ('Vladimir Weiss',), ('Wade Elliott',), ('Walid Mesloub',), ('Walter Pandiani',), ('Walter',), ('Wason Renteria',), ('Wayne Rooney',), ('Wayne Routledge',), ('Weldon',), ('Wendel',), ('Wesley Sneijder',), ('Wesley Verhoek',), ('Wilfried Bony',), ('Wilson Eduardo',), ('Wissam Ben Yedder',), ('Xabi Alonso',), ('Xavier Pentecote',), ('Xherdan Shaqiri',), ('Xisco Nadal',), ('Yacine Abdessadki',), ('Yacine Brahimi',), ('Yannick Djalo',), ('Yoan Gouffran',), ('Yoann Gourcuff',), ('Yohan Cabaye',), ('Yohan Demont',), ('Yoshinori Muto',), ('Youri Tielemans',), ('Youssef El Arabi',), ('Yuri Zhirkov',), ('Yuya Osako',), ('Yves Hadley Desmarets',), ('Zakaria Labyad',), ('Ze Eduardo',), ('Ze Luis',), ('Zhi Zheng',), ('Zlatan Ibrahimovic',), ('Zlatko Junuzovic',), ('Zoltan Gera',), ('Zoltan Stieber',), ('Zvjezdan Misimovic',)]
----------------------------
