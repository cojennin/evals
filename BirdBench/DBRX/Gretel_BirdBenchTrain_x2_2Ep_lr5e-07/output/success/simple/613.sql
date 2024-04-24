-- PROBLEM # 613
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

-- External Knowledge: "Rochester, NY" is the Location of user; user refers to UserId
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List out the dates that users who are located in Rochester, NY obtained their badges?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT badges.Date FROM badges INNER JOIN users ON badges.UserId = users.Id WHERE users.Location = 'Rochester, NY'
----------------------------






-- ACTUAL RESULTS
[('2010-09-13 17:16:24.0',), ('2010-09-15 08:26:00.0',), ('2010-09-23 13:28:22.0',), ('2011-01-15 15:01:19.0',), ('2011-01-15 19:56:20.0',), ('2011-01-15 19:56:20.0',), ('2011-01-16 10:26:24.0',), ('2011-02-01 15:02:28.0',), ('2011-04-16 17:41:11.0',), ('2011-05-07 15:07:29.0',), ('2011-05-07 19:47:30.0',), ('2011-05-07 19:47:30.0',), ('2011-05-09 17:52:47.0',), ('2011-07-15 19:27:50.0',), ('2011-07-18 00:25:12.0',), ('2011-07-20 01:17:13.0',), ('2011-07-22 17:40:38.0',), ('2011-10-16 02:27:36.0',), ('2011-10-16 02:27:36.0',), ('2011-12-14 17:06:05.0',), ('2012-02-03 18:37:22.0',), ('2012-03-01 13:33:09.0',), ('2012-09-20 14:17:42.0',), ('2013-04-16 13:47:00.0',), ('2013-05-28 16:58:56.0',), ('2013-07-25 16:43:16.0',), ('2013-08-26 10:10:00.0',), ('2013-08-28 14:48:46.0',), ('2013-08-28 14:48:46.0',), ('2014-07-14 23:47:45.0',), ('2014-07-15 06:27:05.0',), ('2014-07-15 13:52:53.0',), ('2014-07-15 18:39:30.0',), ('2014-07-31 21:06:45.0',), ('2014-08-20 17:58:39.0',), ('2014-08-21 23:26:10.0',), ('2014-08-27 02:56:52.0',), ('2014-08-27 04:08:32.0',)]
----------------------------
