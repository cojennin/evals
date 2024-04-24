-- PROBLEM # 610
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

-- External Knowledge: highest reputation refers to Max(Reputation); user refers to UserId
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What are the names of badges that users who have the highest reputation obtained?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.Reputation = (SELECT MAX(Reputation) FROM users)
----------------------------




-- RESULTS FROM GENERATED SQL
[('Autobiographer',), ('Teacher',), ('Student',), ('Supporter',), ('Editor',), ('Commentator',), ('Organizer',), ('Scholar',), ('Enthusiast',), ('Civic Duty',), ('Tag Editor',), ('Critic',), ('Nice Answer',), ('Mortarboard',), ('Necromancer',), ('Nice Answer',), ('Suffrage',), ('Necromancer',), ('Revival',), ('Revival',), ('Citizen Patrol',), ('Nice Answer',), ('Talkative',), ('Nice Answer',), ('Convention',), ('Quorum',), ('Nice Answer',), ('distributions',), ('Nice Answer',), ('Sportsmanship',), ('Nice Answer',), ('Revival',), ('Revival',), ('Strunk & White',), ('Necromancer',), ('Necromancer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Electorate',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Enlightened',), ('Pundit',), ('Nice Answer',), ('Enlightened',), ('Cleanup',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('regression',), ('Nice Answer',), ('Nice Question',), ('Nice Answer',), ('Nice Answer',), ('probability',), ('Nice Answer',), ('Fanatic',), ('hypothesis-testing',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Good Answer',), ('Nice Answer',), ('Enlightened',), ('Enlightened',), ('Nice Answer',), ('Enlightened',), ('Synonymizer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('r',), ('Nice Answer',), ('Enlightened',), ('Yearling',), ('Necromancer',), ('Excavator',), ('Nice Answer',), ('Revival',), ('Nice Answer',), ('Nice Answer',), ('normal-distribution',), ('Good Answer',), ('time-series',), ('Investor',), ('Nice Answer',), ('Enlightened',), ('Altruist',), ('Analytical',), ('Nice Answer',), ('Enlightened',), ('correlation',), ('Proofreader',), ('Nice Answer',), ('Disciplined',), ('Revival',), ('Nice Answer',), ('Copy Editor',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Enlightened',), ('Good Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('sampling',), ('Nice Answer',), ('Enlightened',), ('Good Answer',), ('Announcer',), ('Nice Answer',), ('Nice Answer',), ('data-visualization',), ('Nice Answer',), ('Taxonomist',), ('Revival',), ('Revival',), ('Guru',), ('Good Answer',), ('Nice Answer',), ('Nice Answer',), ('Guru',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Question',), ('Good Answer',), ('variance',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('binomial',), ('Nice Answer',), ('Good Answer',), ('Good Answer',), ('Nice Answer',), ('Caucus',), ('Constituent',), ('Nice Answer',), ('Nice Answer',), ('Necromancer',), ('confidence-interval',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('estimation',), ('Enlightened',), ('Good Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Enlightened',), ('Enlightened',), ('Enlightened',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Reviewer',), ('Nice Answer',), ('Nice Answer',), ('Good Answer',), ('Nice Answer',), ('Nice Answer',), ('Good Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Yearling',), ('Necromancer',), ('Research Assistant',), ('Revival',), ('Necromancer',), ('Nice Answer',), ('Necromancer',), ('regression',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('data-transformation',), ('Nice Answer',), ('Nice Answer',), ('Revival',), ('Necromancer',), ('Revival',), ('Reviewer',), ('Custodian',), ('Custodian',), ('Custodian',), ('Nice Answer',), ('Necromancer',), ('Custodian',), ('Nice Answer',), ('Good Answer',), ('Nice Answer',), ('Custodian',), ('Custodian',), ('r',), ('Nice Answer',), ('Enlightened',), ('Self-Learner',), ('Nice Answer',), ('Nice Question',), ('Nice Answer',), ('Reviewer',), ('Guru',), ('Nice Answer',), ('Good Answer',), ('Good Answer',), ('Generalist',), ('Guru',), ('Nice Answer',), ('Good Answer',), ('Nice Answer',), ('Necromancer',), ('Necromancer',), ('Nice Answer',), ('Good Question',), ('Nice Answer',), ('Guru',), ('Informed',), ('Nice Answer',), ('Custodian',), ('Nice Answer',), ('distributions',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Popular Question',), ('Nice Question',), ('Nice Answer',), ('Nice Answer',), ('Revival',), ('Necromancer',), ('Good Answer',), ('Good Answer',), ('Good Answer',), ('self-study',), ('mathematical-statistics',), ('probability',), ('Revival',), ('Nice Answer',), ('Good Answer',), ('Guru',), ('Nice Answer',), ('Enlightened',), ('Announcer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Revival',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Nice Answer',), ('Revival',), ('Outspoken',), ('Nice Answer',), ('Nice Answer',), ('Necromancer',), ('Nice Answer',), ('Sheriff',), ('Nice Answer',), ('Nice Answer',), ('Revival',), ('Nice Answer',), ('Nice Answer',), ('Good Answer',), ('Revival',), ('Revival',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Good Answer',), ('Good Answer',), ('Revival',), ('Necromancer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Revival',), ('Guru',), ('Yearling',), ('Announcer',), ('Nice Answer',), ('Revival',), ('Necromancer',), ('standard-deviation',), ('Nice Answer',), ('Enlightened',), ('Necromancer',), ('Steward',), ('Good Answer',), ('Nice Answer',), ('Nice Answer',), ('Caucus',), ('Good Answer',), ('Nice Answer',), ('Nice Answer',), ('Guru',), ('Enlightened',), ('Nice Answer',), ('Nice Answer',), ('Constituent',), ('excel',), ('Nice Answer',), ('Nice Answer',), ('Necromancer',), ('Revival',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Great Answer',), ('Nice Answer',), ('Announcer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Necromancer',), ('random-variable',), ('Revival',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Enlightened',), ('Nice Answer',), ('Good Answer',), ('Revival',), ('Good Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Good Answer',), ('Good Answer',), ('Populist',), ('Good Answer',), ('Nice Answer',), ('Revival',), ('Nice Answer',), ('Necromancer',), ('Necromancer',), ('Nice Answer',), ('Enlightened',), ('Good Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Enlightened',), ('Steward',), ('Guru',), ('Nice Answer',), ('Nice Answer',), ('Revival',), ('Necromancer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Enlightened',), ('Good Answer',), ('Nice Answer',), ('Revival',), ('Nice Answer',), ('Enlightened',), ('Good Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('mean',), ('Nice Answer',), ('logistic',), ('Nice Answer',), ('Guru',), ('Nice Answer',), ('Enlightened',), ('Necromancer',), ('Nice Answer',), ('Enlightened',), ('Revival',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Revival',), ('Necromancer',), ('Nice Answer',), ('Revival',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Necromancer',), ('Nice Answer',), ('Yearling',), ('Nice Answer',), ('Enlightened',), ('statistical-significance',), ('Reviewer',), ('Good Answer',), ('Revival',), ('Nice Answer',), ('Enlightened',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Good Answer',)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Autobiographer',)]
----------------------------
