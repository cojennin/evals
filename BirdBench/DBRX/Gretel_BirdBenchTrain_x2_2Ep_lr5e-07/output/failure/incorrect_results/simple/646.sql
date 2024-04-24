-- PROBLEM # 646
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

-- External Knowledge: positive comments refer to Score > 60;
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- Describe the post title which got positive comments and display names of the users who posted those comments.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT p.Title, c.UserDisplayName FROM posts p JOIN comments c ON p.Id = c.PostId WHERE c.Score > 60;
----------------------------




-- RESULTS FROM PREDICTION
[('Detecting a given face in a database of facial images', 'Hans Westerbeek')]
----------------------------



-- ACTUAL RESULTS
[(None, None), (None, None), ('The Two Cultures: statistics vs. machine learning?', None), ('The Two Cultures: statistics vs. machine learning?', None), ('Locating freely available data samples', None), ('Locating freely available data samples', None), ('Bayesian and frequentist reasoning in plain English', None), ('Bayesian and frequentist reasoning in plain English', None), ('What is the meaning of p values and t values in statistical tests?', None), ('What is the meaning of p values and t values in statistical tests?', None), ('Why square the difference instead of taking the absolute value in standard deviation?', None), ('Why square the difference instead of taking the absolute value in standard deviation?', None), (None, None), (None, None), ('What is the best introductory Bayesian statistics textbook?', None), ('What is the best introductory Bayesian statistics textbook?', None), ('Resources for learning R', None), ('Resources for learning R', None), ('What is your favorite "data analysis" cartoon?', None), ('What is your favorite "data analysis" cartoon?', None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), ('Is there any reason to prefer the AIC or BIC over the other?', None), ('Is there any reason to prefer the AIC or BIC over the other?', None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), ('Famous statistician quotes', None), ('Famous statistician quotes', None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), ('Statistics Jokes', None), ('Statistics Jokes', None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), ('How should I transform non-negative data including zeros?', None), ('How should I transform non-negative data including zeros?', None), ('What are the differences between Factor Analysis and Principal Component Analysis', None), ('What are the differences between Factor Analysis and Principal Component Analysis', None), ('Python as a statistics workbench', None), ('Python as a statistics workbench', None), (None, None), (None, None), (None, None), (None, None), ("What's the difference between a confidence interval and a credible interval?", None), ("What's the difference between a confidence interval and a credible interval?", None), (None, None), (None, None), ("Is normality testing 'essentially useless'?", None), ("Is normality testing 'essentially useless'?", None), (None, None), (None, None), (None, None), (None, None), ('What is the difference between "likelihood" and "probability"?', None), ('What is the difference between "likelihood" and "probability"?', None), ('Making sense of principal component analysis, eigenvectors & eigenvalues', None), ('Making sense of principal component analysis, eigenvectors & eigenvalues', None), (None, None), (None, None), ('How to efficiently manage a statistical analysis project?', None), ('How to efficiently manage a statistical analysis project?', None), (None, None), (None, None), (None, None), (None, None), ('How to annoy a statistical referee?', None), ('How to annoy a statistical referee?', None), (None, None), (None, None), ('What are common statistical sins?', None), ('What are common statistical sins?', None), (None, None), (None, None), ('What is the difference between data mining, statistics, machine learning and AI?', None), ('What is the difference between data mining, statistics, machine learning and AI?', None), (None, None), (None, None), ("Interpretation of R's lm() output", None), ("Interpretation of R's lm() output", None), (None, None), (None, None), (None, None), (None, None), ('Detecting a given face in a database of facial images', None), ('Detecting a given face in a database of facial images', None), (None, None), (None, None), ('What skills are required to perform large scale statistical analyses?', None), ('What skills are required to perform large scale statistical analyses?', None), (None, None), (None, None), ('How to summarize data by group in R?', None), ('How to summarize data by group in R?', None), (None, None), (None, None), (None, None), (None, None), ('Essential data checking tests', None), ('Essential data checking tests', None), (None, None), (None, None), (None, None), (None, None), ('Is $R^2$ useful or dangerous?', None), ('Is $R^2$ useful or dangerous?', None), (None, None), (None, None), (None, None), (None, None), ('How to understand degrees of freedom?', None), ('How to understand degrees of freedom?', None), (None, None), (None, None), (None, None), (None, None), (None, None), (None, None), ('Difference between logit and probit models', None), ('Difference between logit and probit models', None), (None, None), (None, None), ('Which "mean" to use and when?', None), ('Which "mean" to use and when?', None), (None, None), (None, None), (None, None), (None, None), ('Does Julia have any hope of sticking in the statistical community?', None), ('Does Julia have any hope of sticking in the statistical community?', None), (None, None), (None, None), ('Explaining to laypeople why bootstrapping works ', None), ('Explaining to laypeople why bootstrapping works ', None), ('Does causation imply correlation?', None), ('Does causation imply correlation?', None), ('Why does a 95% CI not imply a 95% chance of containing the mean?', None), ('Why does a 95% CI not imply a 95% chance of containing the mean?', None), (None, None), (None, None), ('R vs SAS, why is SAS preferred by private companies?', None), ('R vs SAS, why is SAS preferred by private companies?', None), (None, None), (None, None), ('What is the intuition behind beta distribution?', None), ('What is the intuition behind beta distribution?', None), (None, None), (None, None), (None, None), (None, None), ('Is Facebook coming to an end?', None), ('Is Facebook coming to an end?', None), (None, None), (None, None), (None, None), (None, None), ('Amazon interview question—probability of 2nd interview', None), ('Amazon interview question—probability of 2nd interview', None), (None, None), (None, None), (None, None), (None, None)]
----------------------------
