-- PROBLEM # 617
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

-- External Knowledge: detailed content of the comment refers to Text; created on 7/19/2010 7:37:33 PM CreationDate = 2010-07-19 19:37:33.0'
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- What is the detailed content of the comment of the post which was created on 7/19/2010 7:37:33 PM?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Text FROM comments WHERE CreationDate = '2010-07-19 19:37:33.0'
----------------------------






-- ACTUAL RESULTS
[("That's just an example - it might have a median that is much smaller, on the order of 200 (it depends on how I partition the data). That would preclude using a normal distribution, right?",)]
----------------------------
