-- PROBLEM # 1433
-- Generation # 0
-- Difficulty: simple
----------------------------

-- PROMPT
CREATE TABLE event
(
    event_id   TEXT
        constraint event_pk
            primary key,
    event_name TEXT,
    event_date TEXT,
    type       TEXT,
    notes      TEXT,
    location   TEXT,
    status     TEXT
)

CREATE TABLE major
(
    major_id   TEXT
        constraint major_pk
            primary key,
    major_name TEXT,
    department TEXT,
    college    TEXT
)

CREATE TABLE zip_code
(
    zip_code    INTEGER
        constraint zip_code_pk
            primary key,
    type        TEXT,
    city        TEXT,
    county      TEXT,
    state       TEXT,
    short_state TEXT
)

CREATE TABLE "attendance"
(
    link_to_event  TEXT,
    link_to_member TEXT,
    primary key (link_to_event, link_to_member),
    foreign key (link_to_event) references event(event_id),
    foreign key (link_to_member) references member(member_id)
)

CREATE TABLE "budget"
(
    budget_id     TEXT
            primary key,
    category      TEXT,
    spent         REAL,
    remaining     REAL,
    amount        INTEGER,
    event_status  TEXT,
    link_to_event TEXT,
    foreign key (link_to_event) references event(event_id)
)

CREATE TABLE "expense"
(
    expense_id          TEXT
            primary key,
    expense_description TEXT,
    expense_date        TEXT,
    cost                REAL,
    approved            TEXT,
    link_to_member      TEXT,
    link_to_budget      TEXT,
    foreign key (link_to_budget) references budget(budget_id),
    foreign key (link_to_member) references member(member_id)
)

CREATE TABLE "income"
(
    income_id      TEXT
        constraint income_pk
            primary key,
    date_received  TEXT,
    amount         INTEGER,
    source         TEXT,
    notes          TEXT,
    link_to_member TEXT,
    foreign key (link_to_member) references member(member_id)
)

CREATE TABLE "member"
(
    member_id     TEXT
        constraint member_pk
            primary key,
    first_name    TEXT,
    last_name     TEXT,
    email         TEXT,
    position      TEXT,
    t_shirt_size  TEXT,
    phone         TEXT,
    zip           INTEGER,
    link_to_major TEXT,
    foreign key (link_to_major) references major(major_id),
    foreign key (zip) references zip_code(zip_code)
)

-- External Knowledge: zip codes that have post office boxes refers to type = 'PO Box'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Which countries have zip codes with post office boxes?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT DISTINCT zip_code.state FROM zip_code WHERE zip_code.type = 'PO Box';
----------------------------




-- RESULTS FROM GENERATED SQL
[('Puerto Rico',), ('Massachusetts',), ('Rhode Island',), ('New Hampshire',), ('Maine',), ('Vermont',), ('Connecticut',), ('New York',), ('New Jersey',), ('Pennsylvania',), ('Delaware',), ('District of Columbia',), ('Virginia',), ('Maryland',), ('West Virginia',), ('North Carolina',), ('South Carolina',), ('Georgia',), ('Florida',), ('Alabama',), ('Tennessee',), ('Mississippi',), ('Kentucky',), ('Ohio',), ('Indiana',), ('Michigan',), ('Iowa',), ('Wisconsin',), ('Minnesota',), ('South Dakota',), ('North Dakota',), ('Montana',), ('Illinois',), ('Missouri',), ('Kansas',), ('Nebraska',), ('Louisiana',), ('Arkansas',), ('Oklahoma',), ('Texas',), ('Colorado',), ('Wyoming',), ('Idaho',), ('Utah',), ('Arizona',), ('New Mexico',), ('Nevada',), ('California',), ('Hawaii',), ('Oregon',), ('Washington',), ('Alaska',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Lares Municipio',), ('Vega Baja Municipio',), ('Culebra Municipio',), ('Aibonito Municipio',), ('San Juan Municipio',), ('San Juan',), ('Dorado Municipio',), ('Toa Baja Municipio',), ('Toa Alta',), ('Bayamon',), ('Bayamon Municipio',), ('Catano',), ('Carolina',), ('Hampshire County',), ('Hampden County',), ('Berkshire County',), ('Worcester County',), ('Franklin County',), ('Middlesex County',), ('Essex County',), ('Plymouth County',), ('Norfolk County',), ('Suffolk County',), ('Bristol County',), ('Barnstable County',), ('Dukes County',), ('Nantucket County',), ('Newport County',), ('Providence County',), ('Washington County',), ('Kent County',), ('Rockingham County',), ('Hillsborough County',), ('Grafton County',), ('Merrimack County',), ('Belknap County',), ('Cheshire County',), ('Coos County',), ('Coös County',), ('Sullivan County',), ('Strafford County',), ('Carroll County',), ('York County',), ('Oxford County',), ('Cumberland County',), ('Androscoggin County',), ('Kennebec County',), ('Lincoln County',), ('Penobscot County',), ('Piscataquis County',), ('Hancock County',), ('Sagadahoc County',), ('Knox County',), ('Aroostook County',), ('Waldo County',), ('Somerset County',), ('Windsor County',), ('Caledonia County',), ('Orange County',), ('Windham County',), ('Bennington County',), ('Chittenden County',), ('Addison County',), ('Lamoille County',), ('Rutland County',), ('Orleans County',), ('Hartford County',), ('Litchfield County',), ('Tolland County',), ('New London County',), ('Fairfield County',), ('New Haven County',), ('Passaic County',), ('Union County',), ('Hudson County',), ('Sussex County',), ('Bergen County',), ('Monmouth County',), ('Morris County',), ('Warren County',), ('Hunterdon County',), ('Salem County',), ('Ocean County',), ('Burlington County',), ('Camden County',), ('Gloucester County',), ('Cape May County',), ('Atlantic County',), ('Mercer County',), ('New York County',), ('Richmond County',), ('Westchester County',), ('Putnam County',), ('Rockland County',), ('Queens County',), ('Nassau County',), ('Kings County',), ('Montgomery County',), ('Rensselaer County',), ('Albany County',), ('Columbia County',), ('Schoharie County',), ('Greene County',), ('Schenectady County',), ('Ulster County',), ('Delaware County',), ('Dutchess County',), ('Hamilton County',), ('Saratoga County',), ('St. Lawrence County',), ('Clinton County',), ('Onondaga County',), ('Cayuga County',), ('Madison County',), ('Cortland County',), ('Tompkins County',), ('Seneca County',), ('Oswego County',), ('Oneida County',), ('Wayne County',), ('Lewis County',), ('Otsego County',), ('Herkimer County',), ('Jefferson County',), ('St Lawrence County',), ('Broome County',), ('Chenango County',), ('Tioga County',), ('Erie County',), ('Genesee County',), ('Allegany County',), ('Niagara County',), ('Wyoming County',), ('Cattaraugus County',), ('Chautauqua County',), ('Monroe County',), ('Ontario County',), ('Livingston County',), ('Steuben County',), ('Yates County',), ('Schuyler County',), ('Chemung County',), ('Allegheny County',), ('Westmoreland County',), ('Beaver County',), ('Fayette County',), ('Monongalia County',), ('Armstrong County',), ('Indiana County',), ('Clearfield County',), ('Cambria County',), ('Elk County',), ('Butler County',), ('Clarion County',), ('Lawrence County',), ('Forest County',), ('Crawford County',), ('McKean County',), ('Venango County',), ('Blair County',), ('Bedford County',), ('Huntingdon County',), ('Centre County',), ('Bradford County',), ('Dauphin County',), ('Lebanon County',), ('Mifflin County',), ('Juniata County',), ('Perry County',), ('Adams County',), ('Lancaster County',), ('Lycoming County',), ('Northumberland County',), ('Snyder County',), ('Montour County',), ('Schuylkill County',), ('Lehigh County',), ('Northampton County',), ('Carbon County',), ('Bucks County',), ('Luzerne County',), ('Pike County',), ('Lackawanna County',), ('Susquehanna County',), ('Philadelphia County',), ('Chester County',), ('Berks County',), ('New Castle County',), ('District of Columbia',), ('Manassas City',), ('Fauquier County',), ('Loudoun County',), ('Fairfax County',), ('Prince William County',), ('Charles County',), ('Calvert County',), ("St. Mary's County",), ("St Mary's County",), ("Prince George's County",), ('Anne Arundel County',), ('Harford County',), ('Baltimore County',), ('Howard County',), ('Baltimore City',), ('Mineral County',), ('Caroline County',), ('Talbot County',), ("Queen Anne's County",), ('Dorchester County',), ('Frederick County',), ('Wicomico County',), ('Cecil County',), ('Fairfax City',), ('Falls Church City',), ('Arlington County',), ('Alexandria City',), ('Fredericksburg City',), ('Stafford County',), ('King George County',), ('Spotsylvania County',), ('Winchester City',), ('Rappahannock County',), ('Shenandoah County',), ('Clarke County',), ('Charlottesville City',), ('Albemarle County',), ('Henrico County',), ('Mathews County',), ('Goochland County',), ('James City County',), ('James City',), ('Powhatan County',), ('Amelia County',), ('Charles City',), ('Hanover County',), ('Louisa County',), ('Williamsburg city',), ('Richmond City',), ('Isle of Wight County',), ('Chesapeake City',), ('Accomack County',), ('Suffolk City',), ('Virginia Beach City',), ('Norfolk City',), ('Newport News City',), ('Hampton City',), ('Portsmouth City',), ('Petersburg City',), ('Nottoway County',), ('Brunswick County',), ('Surry County',), ('Appomattox County',), ('Lunenburg County',), ('Prince Edward County',), ('Roanoke City',), ('Roanoke County',), ('Pulaski County',), ('Martinsville City',), ('Radford city',), ('Radford City',), ('Patrick County',), ('Bristol City',), ('Wise County',), ('Lee County',), ('Staunton City',), ('Augusta County',), ('Bath County',), ('Rockbridge County',), ('Botetourt County',), ('Alleghany County',), ('Lynchburg City',), ('Amherst County',), ('Halifax County',), ('Danville City',), ('Campbell County',), ('Tazewell County',), ('Buchanan County',), ('McDowell County',), ('Mingo County',), ('Greenbrier County',), ('Logan County',), ('Kanawha County',), ('Boone County',), ('Clay County',), ('Mason County',), ('Berkeley County',), ('Martin County',), ('Cabell County',), ('Raleigh County',), ('Summers County',), ('Brooke County',), ('Ohio County',), ('Wood County',), ('Pocahontas County',), ('Upshur County',), ('Randolph County',), ('Barbour County',), ('Webster County',), ('Harrison County',), ('Taylor County',), ('Tyler County',), ('Doddridge County',), ('Preston County',), ('Marion County',), ('Nicholas County',), ('Grant County',), ('Pendleton County',), ('Forsyth County',), ('Davie County',), ('Alamance County',), ('Chatham County',), ('Guilford County',), ('Davidson County',), ('Harnett County',), ('Wake County',), ('Johnston County',), ('Granville County',), ('Vance County',), ('Durham County',), ('Nash County',), ('Pitt County',), ('Wilson County',), ('Edgecombe County',), ('Pasquotank County',), ('Dare County',), ('Perquimans County',), ('Hyde County',), ('Bertie County',), ('Gates County',), ('Stanly County',), ('Anson County',), ('Iredell County',), ('Cleveland County',), ('Rutherford County',), ('Cabarrus County',), ('Rowan County',), ('Gaston County',), ('Mecklenburg County',), ('Robeson County',), ('Duplin County',), ('Sampson County',), ('Bladen County',), ('Moore County',), ('Scotland County',), ('New Hanover County',), ('Columbus County',), ('Lenoir County',), ('Pamlico County',), ('Craven County',), ('Jones County',), ('Carteret County',), ('Onslow County',), ('Catawba County',), ('Avery County',), ('Burke County',), ('Caldwell County',), ('Watauga County',), ('Alexander County',), ('Jackson County',), ('Henderson County',), ('Buncombe County',), ('Haywood County',), ('Macon County',), ('Polk County',), ('Yancey County',), ('Mitchell County',), ('Cherokee County',), ('Richland County',), ('Kershaw County',), ('Clarendon County',), ('Sumter County',), ('Lexington County',), ('Darlington County',), ('Orangeburg County',), ('Newberry County',), ('Spartanburg County',), ('Charleston County',), ('Colleton County',), ('Georgetown County',), ('Florence County',), ('Horry County',), ('Dillon County',), ('Marlboro County',), ('Greenville County',), ('Anderson County',), ('Pickens County',), ('Greenwood County',), ('Abbeville County',), ('Oconee County',), ('Aiken County',), ('Barnwell County',), ('McCormick County',), ('Allendale County',), ('Beaufort County',), ('Hampton County',), ('Gwinnett County',), ('Cobb County',), ('Newton County',), ('Walton County',), ('Fulton County',), ('Dekalb County',), ('DeKalb County',), ('Bartow County',), ('Floyd County',), ('Douglas County',), ('Cleburne County',), ('Haralson County',), ('Spalding County',), ('Heard County',), ('Coweta County',), ('Clayton County',), ('Troup County',), ('Evans County',), ('Screven County',), ('Tattnall County',), ('Emanuel County',), ('Candler County',), ('Bulloch County',), ('Toombs County',), ('Hall County',), ('Habersham County',), ('Rabun County',), ('Stephens County',), ('Morgan County',), ('Taliaferro County',), ('Oglethorpe County',), ('Gordon County',), ('Whitfield County',), ('Murray County',), ('Catoosa County',), ('McDuffie County',), ('Wilkinson County',), ('Crisp County',), ('Houston County',), ('Baldwin County',), ('Laurens County',), ('Dooly County',), ('Telfair County',), ('Wilcox County',), ('Bibb County',), ('McIntosh County',), ('Effingham County',), ('Liberty County',), ('Ware County',), ('Appling County',), ('Glynn County',), ('Coffee County',), ('Pierce County',), ('Lowndes County',), ('Clinch County',), ('Cook County',), ('Dougherty County',), ('Thomas County',), ('Colquitt County',), ('Tift County',), ('Irwin County',), ('Stewart County',), ('Muscogee County',), ('Chattahoochee County',), ('St. Johns County',), ('Lafayette County',), ('Baker County',), ('Volusia County',), ('Flagler County',), ('Lake County',), ('Duval County',), ('Leon County',), ('Wakulla County',), ('Gadsden County',), ('Bay County',), ('Holmes County',), ('Gulf County',), ('Escambia County',), ('Santa Rosa County',), ('Okaloosa County',), ('Alachua County',), ('Levy County',), ('Dixie County',), ('Seminole County',), ('Brevard County',), ('Indian River County',), ('Miami-Dade County',), ('Broward County',), ('Palm Beach County',), ('Pasco County',), ('Pinellas County',), ('Highlands County',), ('Osceola County',), ('Charlotte County',), ('Hendry County',), ('Glades County',), ('Collier County',), ('Manatee County',), ('Sarasota County',), ('Desoto County',), ('DeSoto County',), ('Citrus County',), ('Hernando County',), ('St. Lucie County',), ('Okeechobee County',), ('Tallapoosa County',), ('Blount County',), ('Talladega County',), ('Walker County',), ('St. Clair County',), ('Cullman County',), ('Shelby County',), ('St Clair County',), ('Tuscaloosa County',), ('Winston County',), ('Limestone County',), ('Lauderdale County',), ('Colbert County',), ('Etowah County',), ('Marshall County',), ('Autauga County',), ('Covington County',), ('Elmore County',), ('Bullock County',), ('Crenshaw County',), ('Calhoun County',), ('Geneva County',), ('Dale County',), ('Conecuh County',), ('Mobile County',), ('Dallas County',), ('Marengo County',), ('Russell County',), ('Chambers County',), ('Williamson County',), ('Dickson County',), ('Sumner County',), ('Robertson County',), ('Bradley County',), ('Mcminn County',), ('Carter County',), ('Claiborne County',), ('Scott County',), ('Hamblen County',), ('Cocke County',), ('Sevier County',), ('Dyer County',), ('Crockett County',), ('Tipton County',), ('Henry County',), ('Obion County',), ('Gibson County',), ('Hardin County',), ('Hardeman County',), ('McNairy County',), ('Maury County',), ('Giles County',), ('Tate County',), ('Quitman County',), ('Coahoma County',), ('Bolivar County',), ('Issaquena County',), ('Sunflower County',), ('Sharkey County',), ('Pontotoc County',), ('Alcorn County',), ('Chickasaw County',), ('Prentiss County',), ('Grenada County',), ('Leflore County',), ('Tallahatchie County',), ('Rankin County',), ('Hinds County',), ('Simpson County',), ('Copiah County',), ('Attala County',), ('Leake County',), ('Humphreys County',), ('Forrest County',), ('Pearl River County',), ('Jasper County',), ('Oktibbeha County',), ('Decatur County',), ('Grady County',), ('Early County',), ('Terrell County',), ('Nelson County',), ('Bullitt County',), ('Breckinridge County',), ('Jessamine County',), ('Bourbon County',), ('Owen County',), ('Clark County',), ('Garrard County',), ('Boyle County',), ('Rockcastle County',), ('Estill County',), ('Whitley County',), ('Laurel County',), ('Harlan County',), ('Leslie County',), ('Bell County',), ('Kenton County',), ('Fleming County',), ('Bracken County',), ('Boyd County',), ('Johnson County',), ('Wolfe County',), ('Magoffin County',), ('Knott County',), ('Letcher County',), ('Mccracken County',), ('Ballard County',), ('Crittenden County',), ('Graves County',), ('Carlisle County',), ('Barren County',), ('Todd County',), ('Christian County',), ('Daviess County',), ('McLean County',), ('Muhlenberg County',), ('Hopkins County',), ('McCreary County',), ('Adair County',), ('Grayson County',), ('Licking County',), ('Champaign County',), ('Ross County',), ('Hocking County',), ('Pickaway County',), ('Morrow County',), ('Wyandot County',), ('Ottawa County',), ('Lucas County',), ('Williams County',), ('Defiance County',), ('Muskingum County',), ('Noble County',), ('Guernsey County',), ('Belmont County',), ('Coshocton County',), ('Columbiana County',), ('Ashtabula County',), ('Geauga County',), ('Lorain County',), ('Cuyahoga County',), ('Summit County',), ('Portage County',), ('Medina County',), ('Mahoning County',), ('Trumbull County',), ('Stark County',), ('Tuscarawas County',), ('Ashland County',), ('Huron County',), ('Preble County',), ('Highland County',), ('Clermont County',), ('Brown County',), ('Darke County',), ('Miami County',), ('Scioto County',), ('Gallia County',), ('Vinton County',), ('Athens County',), ('Meigs County',), ('Allen County',), ('Van Wert County',), ('Paulding County',), ('Auglaize County',), ('Hendricks County',), ('Rush County',), ('Porter County',), ('LaPorte County',), ('La Porte County',), ('Kosciusko County',), ('Starke County',), ('Elkhart County',), ('St. Joseph County',), ('Huntington County',), ('LaGrange County',), ('Wells County',), ('Lagrange County',), ('Cass County',), ('Wabash County',), ('Switzerland County',), ('Ripley County',), ('Bartholomew County',), ('Jennings County',), ('Spencer County',), ('Dubois County',), ('Warrick County',), ('Vanderburgh County',), ('Vigo County',), ('Parke County',), ('Vermillion County',), ('Tippecanoe County',), ('White County',), ('Fountain County',), ('Benton County',), ('Oakland County',), ('Macomb County',), ('Washtenaw County',), ('Sanilac County',), ('Lapeer County',), ('Shiawassee County',), ('Saginaw County',), ('Midland County',), ('Roscommon County',), ('Clare County',), ('Tuscola County',), ('Iosco County',), ('Isabella County',), ('Ingham County',), ('Montcalm County',), ('Gratiot County',), ('Ionia County',), ('Kalamazoo County',), ('Berrien County',), ('Van Buren County',), ('Barry County',), ('Hillsdale County',), ('Lenawee County',), ('Allegan County',), ('Newaygo County',), ('Mecosta County',), ('Muskegon County',), ('Grand Traverse County',), ('Antrim County',), ('Manistee County',), ('Benzie County',), ('Leelanau County',), ('Charlevoix County',), ('Cheboygan County',), ('Emmet County',), ('Chippewa County',), ('Mackinac County',), ('Marquette County',), ('Alger County',), ('Menominee County',), ('Delta County',), ('Dickinson County',), ('Keweenaw County',), ('Iron County',), ('Houghton County',), ('Ontonagon County',), ('Gogebic County',), ('Audubon County',), ('Story County',), ('Keokuk County',), ('Cerro Gordo County',), ('Winnebago County',), ('Buena Vista County',), ('Black Hawk County',), ('Bremer County',), ('Tama County',), ('Grundy County',), ("O'Brien County",), ('Woodbury County',), ('Lyon County',), ('Sioux County',), ('Pottawattamie County',), ('Mills County',), ('Page County',), ('Dubuque County',), ('Winneshiek County',), ('Iowa County',), ('Linn County',), ('Mahaska County',), ('Dodge County',), ('Waukesha County',), ('Sheboygan County',), ('Calumet County',), ('Kenosha County',), ('Walworth County',), ('Racine County',), ('Milwaukee County',), ('Rock County',), ('Dane County',), ('Fond du Lac County',), ('Green Lake County',), ('Sauk County',), ('Juneau County',), ('Outagamie County',), ('Shawano County',), ('Manitowoc County',), ('Door County',), ('Marathon County',), ('Langlade County',), ('La Crosse County',), ('Eau Claire County',), ('Dunn County',), ('Buffalo County',), ('Trempealeau County',), ('Bayfield County',), ('Barron County',), ('Sawyer County',), ('Waupaca County',), ('Waushara County',), ('Chisago County',), ('Dakota County',), ('Isanti County',), ('Pine County',), ('Ramsey County',), ('Hennepin County',), ('Wright County',), ('Sibley County',), ('Sherburne County',), ('Carver County',), ('St. Louis County',), ('Itasca County',), ('Koochiching County',), ('St Louis County',), ('Olmsted County',), ('Winona County',), ('Mower County',), ('Blue Earth County',), ('Freeborn County',), ('Watonwan County',), ('Steele County',), ('Faribault County',), ('Pipestone County',), ('Nobles County',), ('Big Stone County',), ('Redwood County',), ('Stearns County',), ('Mille Lacs County',), ('Morrison County',), ('Hubbard County',), ('Crow Wing County',), ('Becker County',), ('Otter Tail County',), ('Norman County',), ('Beltrami County',), ('Lake of the Woods County',), ('Kittson County',), ('Minnehaha County',), ('Brookings County',), ('Kingsbury County',), ('Codington County',), ('Hutchinson County',), ('Jerauld County',), ('Charles Mix County',), ('Spink County',), ('Corson County',), ('Ziebach County',), ('Dewey County',), ('Pennington County',), ('Meade County',), ('Shannon County',), ('Custer County',), ('Harding County',), ('Fall River County',), ('Grand Forks County',), ('Benson County',), ('Cavalier County',), ('Stutsman County',), ('Burleigh County',), ('Ward County',), ('Park County',), ('Big Horn County',), ('Wheatland County',), ('Rosebud County',), ('Musselshell County',), ('Yellowstone County',), ('Valley County',), ('Sheridan County',), ('Fallon County',), ('Cascade County',), ('Lewis and Clark County',), ('Glacier County',), ('Pondera County',), ('Toole County',), ('Blaine County',), ('Meagher County',), ('Broadwater County',), ('Silver Bow County',), ('Powell County',), ('Gallatin County',), ('Beaverhead County',), ('Deer Lodge County',), ('Missoula County',), ('Ravalli County',), ('Sanders County',), ('Flathead County',), ('McHenry County',), ('Mchenry County',), ('Kane County',), ('Ogle County',), ('Dupage County',), ('Will County',), ('DuPage County',), ('Kendall County',), ('LaSalle County',), ('Kankakee County',), ('Iroquois County',), ('Vermilion County',), ('Ford County',), ('Stephenson County',), ('Whiteside County',), ('Jo Daviess County',), ('Rock Island County',), ('Bureau County',), ('La Salle County',), ('McDonough County',), ('Peoria County',), ('Mclean County',), ('De Witt County',), ('Piatt County',), ('Edgar County',), ('Macoupin County',), ('Jersey County',), ('Bond County',), ('Coles County',), ('Sangamon County',), ('Massac County',), ('Saline County',), ('St. Louis City',), ('St. Charles County',), ('Ralls County',), ('St Francois County',), ('Reynolds County',), ('Cape Girardeau County',), ('Stoddard County',), ('Mississippi County',), ('Pemiscot County',), ('New Madrid County',), ('Dunklin County',), ('Platte County',), ('Worth County',), ('Vernon County',), ('Barton County',), ('McDonald County',), ('Gasconade County',), ('Moniteau County',), ('Cole County',), ('Pettis County',), ('Phelps County',), ('Dent County',), ('Cedar County',), ('Taney County',), ('Stone County',), ('Howell County',), ('Ozark County',), ('Doniphan County',), ('Atchison County',), ('Wyandotte County',), ('Shawnee County',), ('Pottawatomie County',), ('Wabaunsee County',), ('Riley County',), ('Republic County',), ('Sedgwick County',), ('McPherson County',), ('Reno County',), ('Ellis County',), ('Seward County',), ('Thayer County',), ('Scotts Bluff County',), ('Jefferson Parish',), ('Plaquemines Parish',), ('St Bernard Parish',), ('St. John the Baptist Parish',), ('St. Charles Parish',), ('Orleans Parish',), ('Lafourche Parish',), ('St Mary Parish',), ('Terrebonne Parish',), ('St. Mary Parish',), ('Assumption Parish',), ('Tangipahoa Parish',), ('Washington Parish',), ('St. Tammany Parish',), ('St Tammany Parish',), ('Lafayette Parish',), ('Vermilion Parish',), ('Iberia Parish',), ('St. Martin Parish',), ('St Martin Parish',), ('Evangeline Parish',), ('Acadia Parish',), ('St. Landry Parish',), ('St Landry Parish',), ('Calcasieu Parish',), ('Allen Parish',), ('Jefferson Davis Parish',), ('Vernon Parish',), ('East Baton Rouge Parish',), ('Ascension Parish',), ('West Feliciana Parish',), ('Livingston Parish',), ('St. James Parish',), ('Pointe Coupee Parish',), ('Iberville Parish',), ('St James Parish',), ('Caddo Parish',), ('Webster Parish',), ('De Soto Parish',), ('Natchitoches Parish',), ('Bienville Parish',), ('Bossier Parish',), ('Ouachita Parish',), ('Richland Parish',), ('Morehouse Parish',), ('Franklin Parish',), ('Madison Parish',), ('West Carroll Parish',), ('Jackson Parish',), ('Lincoln Parish',), ('Rapides Parish',), ('Avoyelles Parish',), ('Catahoula Parish',), ('Concordia Parish',), ('Winn Parish',), ('Caldwell Parish',), ('Sabine Parish',), ('La Salle Parish',), ('Desha County',), ('Drew County',), ('Hempstead County',), ('Little River County',), ('Nevada County',), ('Miller County',), ('Garland County',), ('Hot Spring County',), ('Faulkner County',), ('Lonoke County',), ('Woodruff County',), ('Prairie County',), ('Conway County',), ('Phillips County',), ('St. Francis County',), ('Poinsett County',), ('Cross County',), ('Craighead County',), ('Independence County',), ('Searcy County',), ('Baxter County',), ('Pope County',), ('Yell County',), ('Sebastian County',), ('Caddo County',), ('Canadian County',), ('McClain County',), ('Oklahoma County',), ('Comanche County',), ('Tillman County',), ('Washita County',), ('Beckham County',), ('Garfield County',), ('Woods County',), ('Woodward County',), ('Texas County',), ('Sherman County',), ('Osage County',), ('Wagoner County',), ('Rogers County',), ('Pawnee County',), ('Tulsa County',), ('Creek County',), ('Payne County',), ('Mayes County',), ('Craig County',), ('Muskogee County',), ('Pittsburg County',), ('Okmulgee County',), ('Haskell County',), ('Pushmataha County',), ('Coal County',), ('Latimer County',), ('Kay County',), ('Bryan County',), ('McCurtain County',), ('Choctaw County',), ('Le Flore County',), ('Sequoyah County',), ('Collin County',), ('Denton County',), ('Kaufman County',), ('Rockwall County',), ('Navarro County',), ('Tarrant County',), ('Hunt County',), ('Fannin County',), ('Lamar County',), ('Titus County',), ('Bowie County',), ('Gregg County',), ('Panola County',), ('Rusk County',), ('Smith County',), ('Nacogdoches County',), ('Freestone County',), ('Trinity County',), ('Angelina County',), ('Parker County',), ('Cooke County',), ('Wichita County',), ('Archer County',), ('Wilbarger County',), ('Erath County',), ('Eastland County',), ('Hood County',), ('Callahan County',), ('Milam County',), ('Coryell County',), ('Hill County',), ('Bosque County',), ('McLennan County',), ('Falls County',), ('Mclennan County',), ('San Saba County',), ('Concho County',), ('Tom Green County',), ('Coke County',), ('Harris County',), ('Matagorda County',), ('Colorado County',), ('Brazoria County',), ('Wharton County',), ('Waller County',), ('Fort Bend County',), ('Austin County',), ('Galveston County',), ('Brazos County',), ('Burleson County',), ('Grimes County',), ('Victoria County',), ('Refugio County',), ('Goliad County',), ('Lavaca County',), ('Kerr County',), ('Webb County',), ('Atascosa County',), ('Bexar County',), ('Bee County',), ('Guadalupe County',), ('Comal County',), ('Karnes County',), ('Jim Wells County',), ('Nueces County',), ('Kenedy County',), ('Live Oak County',), ('San Patricio County',), ('Aransas County',), ('Kleberg County',), ('Hidalgo County',), ('Cameron County',), ('Starr County',), ('Willacy County',), ('Gonzales County',), ('Hays County',), ('Travis County',), ('Uvalde County',), ('Dimmit County',), ('Val Verde County',), ('Maverick County',), ('Zavala County',), ('Gray County',), ('Wheeler County',), ('Oldham County',), ('Potter County',), ('Hale County',), ('Lipscomb County',), ('Deaf Smith County',), ('Ochiltree County',), ('Dallam County',), ('Parmer County',), ('Collingsworth County',), ('Randall County',), ('King County',), ('Cochran County',), ('Hockley County',), ('Lubbock County',), ('Lamb County',), ('Terry County',), ('Lynn County',), ('Scurry County',), ('Pecos County',), ('Loving County',), ('Ector County',), ('Reeves County',), ('Upton County',), ('Winkler County',), ('Brewster County',), ('Hudspeth County',), ('El Paso County',), ('Presidio County',), ('Culberson County',), ('Boulder County',), ('Broomfield County',), ('Arapahoe County',), ('Denver County',), ('Eagle County',), ('Gilpin County',), ('Clear Creek County',), ('Grand County',), ('Routt County',), ('Larimer County',), ('Weld County',), ('Teller County',), ('Cheyenne County',), ('Pueblo County',), ('Las Animas County',), ('Otero County',), ('Crowley County',), ('Bent County',), ('Prowers County',), ('Baca County',), ('Archuleta County',), ('Conejos County',), ('Costilla County',), ('Saguache County',), ('Rio Grande County',), ('Fremont County',), ('Gunnison County',), ('Chaffee County',), ('La Plata County',), ('Montezuma County',), ('Dolores County',), ('Montrose County',), ('San Miguel County',), ('Ouray County',), ('San Juan County',), ('Mesa County',), ('Pitkin County',), ('Moffat County',), ('Laramie County',), ('Goshen County',), ('Sweetwater County',), ('Hot Springs County',), ('Natrona County',), ('Uinta County',), ('Teton County',), ('Bannock County',), ('Bingham County',), ('Bear Lake County',), ('Twin Falls County',), ('Cassia County',), ('Camas County',), ('Minidoka County',), ('Bonneville County',), ('Lemhi County',), ('Idaho County',), ('Canyon County',), ('Gem County',), ('Ada County',), ('Latah County',), ('Kootenai County',), ('Bonner County',), ('Boundary County',), ('Clearwater County',), ('Shoshone County',), ('Benewah County',), ('Davis County',), ('Duchesne County',), ('Utah County',), ('Uintah County',), ('Salt Lake County',), ('Box Elder County',), ('Cache County',), ('Weber County',), ('Emery County',), ('Sanpete County',), ('Juab County',), ('Millard County',), ('Piute County',), ('Maricopa County',), ('Pinal County',), ('Gila County',), ('La Paz County',), ('Yavapai County',), ('Yuma County',), ('Pima County',), ('Mohave County',), ('Graham County',), ('Cochise County',), ('Santa Cruz County',), ('Navajo County',), ('Apache County',), ('Coconino County',), ('McKinley County',), ('Cibola County',), ('Bernalillo County',), ('Torrance County',), ('Valencia County',), ('Sandoval County',), ('Santa Fe County',), ('Rio Arriba County',), ('Taos County',), ('Colfax County',), ('Mora County',), ('Catron County',), ('Sierra County',), ('Do�a Ana County',), ('Doña Ana County',), ('Luna County',), ('Dona Ana County',), ('Curry County',), ('Roosevelt County',), ('Chaves County',), ('Eddy County',), ('Lea County',), ('Nye County',), ('Esmeralda County',), ('White Pine County',), ('Washoe County',), ('Humboldt County',), ('Churchill County',), ('Storey County',), ('Carson City',), ('Elko County',), ('Los Angeles County',), ('Ventura County',), ('San Bernardino County',), ('San Diego County',), ('Riverside County',), ('Imperial County',), ('Inyo County',), ('Santa Barbara County',), ('Tulare County',), ('Kern County',), ('San Luis Obispo County',), ('Mono County',), ('Fresno County',), ('Madera County',), ('Merced County',), ('Monterey County',), ('San Mateo County',), ('Santa Clara County',), ('San Francisco County',), ('Sacramento County',), ('Contra Costa County',), ('Alameda County',), ('Napa County',), ('Marin County',), ('Sonoma County',), ('San Benito County',), ('San Joaquin County',), ('Calaveras County',), ('Tuolumne County',), ('Mariposa County',), ('Stanislaus County',), ('Mendocino County',), ('Del Norte County',), ('Amador County',), ('Placer County',), ('El Dorado County',), ('Yolo County',), ('Solano County',), ('Alpine County',), ('Sutter County',), ('Glenn County',), ('Plumas County',), ('Butte County',), ('Colusa County',), ('Lassen County',), ('Shasta County',), ('Siskiyou County',), ('Modoc County',), ('Tehama County',), ('Kauai County',), ('Honolulu County',), ('Hawaii County',), ('Maui County',), ('Kalawao County',), ('Multnomah County',), ('Clackamas County',), ('Hood River County',), ('Wasco County',), ('Clatsop County',), ('Tillamook County',), ('Lane County',), ('Klamath County',), ('Josephine County',), ('Deschutes County',), ('Harney County',), ('Umatilla County',), ('Malheur County',), ('Snohomish County',), ('Kitsap County',), ('Kittitas County',), ('Whatcom County',), ('Skagit County',), ('Clallam County',), ('Thurston County',), ('Pacific County',), ('Grays Harbor County',), ('Klickitat County',), ('Skamania County',), ('Chelan County',), ('Okanogan County',), ('Yakima County',), ('Spokane County',), ('Whitman County',), ('Ferry County',), ('Stevens County',), ('Pend Oreille County',), ('Walla Walla County',), ('Municipality of Anchorage',), ('North Slope Borough',), ('Bethel Census Area',), ('Aleutians West Census Area',), ('Lake and Peninsula Borough',), ('Kodiak Island Borough',), ('Aleutians East Borough',), ('Wade Hampton Census Area',), ('Dillingham Census Area',), ('Yukon-Koyukuk Census Area',), ('Valdez-Cordova Census Area',), ('Anchorage Municipality',), ('Bristol Bay Borough',), ('Matanuska-Susitna Borough',), ('Kenai Peninsula Borough',), ('Nome Census Area',), ('Yakutat City and Borough',), ('Southeast Fairbanks Census Area',), ('Fairbanks North Star Borough',), ('Northwest Arctic Borough',), ('Denali Borough',), ('City and Borough of Juneau',), ('Hoonah-Angoon Census Area',), ('Petersburg Census Area',), ('Skagway Municipality',), ('Wrangell City and Borough',), ('Prince of Wales-Hyder Census Area',), ('Prince of Wales-Outer Ketchikan Borough',), ('Ketchikan Gateway Borough',)]
----------------------------
