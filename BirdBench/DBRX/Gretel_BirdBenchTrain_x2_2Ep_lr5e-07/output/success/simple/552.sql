-- PROBLEM # 552
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

-- External Knowledge: "csgillespie" is the DisplayName of user
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Please list the names of the badges obtained by csgillespie.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT b.Name FROM badges b JOIN users u ON b.UserId = u.Id WHERE u.DisplayName = 'csgillespie';
----------------------------






-- ACTUAL RESULTS
[('Teacher',), ('Student',), ('Autobiographer',), ('Supporter',), ('Editor',), ('Commentator',), ('Critic',), ('Scholar',), ('Nice Answer',), ('Beta',), ('Organizer',), ('Nice Question',), ('Nice Question',), ('Nice Question',), ('Nice Answer',), ('Nice Answer',), ('Nice Answer',), ('Enlightened',), ('Nice Question',), ('Enthusiast',), ('Nice Answer',), ('Enlightened',), ('Nice Question',), ('Nice Answer',), ('Suffrage',), ('Self-Learner',), ('Nice Question',), ('Civic Duty',), ('Good Question',), ('Nice Question',), ('Nice Answer',), ('Taxonomist',), ('Fanatic',), ('Investor',), ('Nice Question',), ('Precognitive',), ('Talkative',), ('Altruist',), ('Convention',), ('Quorum',), ('Nice Answer',), ('Nice Answer',), ('Popular Question',), ('Strunk & White',), ('Citizen Patrol',), ('Good Answer',), ('Popular Question',), ('Synonymizer',), ('Yearling',), ('Nice Answer',), ('Good Question',), ('Favorite Question',), ('Nice Question',), ('Notable Question',), ('Popular Question',), ('Announcer',), ('Nice Answer',), ('Nice Answer',), ('Notable Question',), ('Favorite Question',), ('Nice Question',), ('r',), ('Nice Answer',), ('Caucus',), ('Constituent',), ('Popular Question',), ('Yearling',), ('Custodian',), ('Nice Answer',), ('Nice Answer',), ('Good Answer',), ('Custodian',), ('Good Question',), ('Nice Answer',), ('Enlightened',), ('Notable Question',), ('Nice Question',), ('Famous Question',), ('Good Answer',), ('Popular Question',), ('Good Question',), ('Nice Answer',), ('Good Answer',), ('Popular Question',), ('Constable',), ('Popular Question',), ('Yearling',), ('Nice Answer',), ('Good Question',), ('Disciplined',), ('Nice Answer',), ('Popular Question',), ('Curious',), ('Yearling',), ('Popular Question',)]
----------------------------
