-- PROBLEM # 584
-- Generation # 0
-- Difficulty: moderate
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

-- External Knowledge: "Why square the difference instead of taking the absolute value in standard deviation?" is the Title of post;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Write all the comments left by users who edited the post titled 'Why square the difference instead of taking the absolute value in standard deviation?'
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.Text FROM comments c JOIN posts p ON c.PostId = p.Id JOIN postHistory ph ON p.Id = ph.PostId WHERE p.Title = 'Why square the difference instead of taking the absolute value in standard deviation?' AND ph.UserId = c.UserId;
----------------------------




-- RESULTS FROM GENERATED SQL
[('In a way, the measurement you proposed is widely used in case of error (model quality) analysis -- then it is called MAE, "mean absolute error".',), ('In a way, the measurement you proposed is widely used in case of error (model quality) analysis -- then it is called MAE, "mean absolute error".',), ('In a way, the measurement you proposed is widely used in case of error (model quality) analysis -- then it is called MAE, "mean absolute error".',), ('Related question: http://stats.stackexchange.com/q/354/919 ("Bias towards natural numbers in the case of least squares.")',), ("Every answer offered so far is circular. They focus on ease of mathematical calculations (which is nice but by no means fundamental) or on properties of the Gaussian (Normal) distribution and OLS. Around 1800 Gauss *started* with least squares and variance and from those *derived* the Normal distribution--there's the circularity. A truly fundamental reason that has not been invoked in any answer yet is the *unique* role played by the variance in the [Central Limit Theorem](http://stats.stackexchange.com/questions/3734). Another is the importance in decision theory of minimizing quadratic loss.",)]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[('',), ('',), ('',), ('edited title',), ('TeXified the formulas.',), ('deleted 5 characters in body; edited title',), ('deleted 5 characters in body; edited title',), ('edited title',)]
----------------------------
