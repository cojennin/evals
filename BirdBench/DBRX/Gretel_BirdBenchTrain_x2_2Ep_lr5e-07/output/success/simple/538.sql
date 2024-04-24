-- PROBLEM # 538
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
-- Please list the titles of the posts owned by the user csgillespie?
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT Title FROM posts WHERE OwnerUserId = (SELECT Id FROM users WHERE DisplayName = 'csgillespie')
----------------------------






-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('Eliciting priors from experts',), (None,), ('Examples for teaching: Correlation does not mean causation',), (None,), (None,), (None,), ('What statistical blogs would you recommend?',), (None,), (None,), ('Choosing a bandwidth for kernel density estimators',), ('Free statistical textbooks',), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), ('Alternative graphics to "handle bar" plots',), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), ('What type of post-fit analysis of residuals do you use?',), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), ('Metropolis-Hastings algorithms used in practice',), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), ('Reviewing statistics in papers',), (None,), ('Random numbers and the multicore package',), (None,), (None,), ('How to annoy a statistical referee?',), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), ('Removing factors from a 3-way ANOVA table',), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,), (None,)]
----------------------------
