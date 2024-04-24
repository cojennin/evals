-- PROBLEM # 714
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

-- External Knowledge: comments refer to Text; username of Harvey Motulsky refers to DisplayName = 'Harvey Motulsky';
-- Using valid SQLite and understading External Knowledge, answer the following questions for the tables provided above.
-- List the comments commented by the user with a username of Harvey Motulsky.
Generate the SQL after thinking step by step: 
SELECT 
----------------------------

-- RESPONSE
SELECT c.Text FROM comments c WHERE c.UserDisplayName = 'Harvey Motulsky'
----------------------------




-- RESULTS FROM GENERATED SQL
[]
----------------------------



-- RESULTS FROM BIRD BENCH GROUND TRUTH SQL
[("I don't see any distinction.",), ('It is not quite correct to say "you cannot change z". In fact, you have to change z to make the sum equal 10. But you have no choice (no freedom) about what it changes to. You can change any two values, but not the third.',), ('Thanks Andreas. I fixed it. You are right of course, and that is what I entered into R. I am not sure how I copy and pasted something totally different into this answer, but it is fixed now.',), ("But you don't and can't know mu or sigma. What you know are the mean and SD of the sample, mean(S) and stdev(S).",), ('A related question: People often use the nonparametric Mann-Whitney test for this kind of data. Since there are only five possible values, there will be lots of tied ranks. The Mann-Whitney test adjusts for tied ranks, but does this adjustment work when there are a huge number of ties?',), ("Bernstein et. al. show some reasons (small n, ties) that cause the two methods to be inaccurate or different. But all of the discrepancies they showed are small. So I don't think anything in that paper explains the three fold discrepancy I saw that prompted this question. See below for the answer I came up with.",), ("I figured out the answer two days ago, and posted it here as a new answer. I also then expanded and updated the web page at graphpad.com that you found. I just edited that page again to include a link to an Excel file with the problem data (http://www.graphpad.com/faq/file/1226.xls). I couldn't do that until I got permission from the guy who generated the data (he wants to be anonymous, and the data is vaguely labeled).",), ('@chi: I think you are mixing up two acronyms. \nROC curve = Receiver Operator Characteristic curve\nAUC = Area Under Curve',), ('The title should say "peak height" rather than "peak mean".',), ('I presume you are referring to a situation where one first does a normality test, and then uses the result of that test to decide which test to perform next.',), ('With 21 subjects and 8 variables, and without any stated question, hypothesis or model .... what question would ridge regression answer?',), ("I think you'll get more useful help if you take a few steps back, and ask us what scientific question  you are trying to answer. Why are you looking for the smallest normalized SD?",), ("In the earlier question, he pointed out that the goal was to compare the SD of raw data with the SD of smoothed data with the SD of highly smoothed data. I don't think the F test (or Bartlett's or Levene's) tests will do any more than complete the circle. The whole point of smoothing is to reduce the variation, so tests that compare variation will tell you smoothed data are smoother. I don't see how this circular logic will get you anywhere.",), ('Are you fitting all three models to one data set? Why would youbwant to average those parameters?',), ('I edited my answer a bit to take into account the comments of Dikran and probabilityislogic. Thanks.',), ('Guido: Read up on quality control statistics. I know very little about this field, but I think it is designed to do exactly what you want (while ANOVA is not).',), ('It seems to me that the SE values computed in the first paragraph must be the standard errors of the logarithm of the odds ratio, not the standard errors of the odds ratio itself.',), ('@probabilityislogic: The SEM of the three experiment means is 5.168  (not 2.98 as you wrote), and the confidence interval I gave in the original post (17.4 to 61.9) is correct. The SEM is computed from the SD (8.95) by dividing by the square root of n (square root of 3). You divided by n (3) instead.',), ('Using the variance components leads to the same confidence interval I computed in the original post. The ANOVA table has a SS between columns of 480.7 with 2 df, which means the MS is 240.3. The SD is sqrt(MSbetween/n) = sqrt(240.3/3) = 8.95, which leads to the same CI I originally posted (17.4 to 61.9).\n\nI found it very hard to follow the Jarasova paper you cited, and am not entirely sure it is relevant here (it seems to be about repeated measures designs). ???',), ('I am thinking of the common situation in labs where the triplicates are simply three different test tubs (or wells). The order of the three as presented in the table is arbitrary. There is no connection or correlation between replicate #2 in the first experiment with replicate #2 in the second or third experiments. Each experiment just has three measurements. So not really repeated measures. Right?',), ('@whuber. I added a paragraph pointing out that with linear regression, R2 can be negative only when the intercept (or perhaps the slope) is constrained. With no constraints, the R2 must be positive and equals the square of r, the correlation coefficient.',), ("@anne. With linear regression with no constraints, R2 cannot be negative. I can't understand why the results you show include a negative R2. It might help to include your data file and screen captures of all the SPSS options, so that others (who know SPSS well) can figure out what happened.",), ("whuber: I'd be curious to know how you did those simulations. Bootstrapping from the original data? Or truly simulations? If the latter, what value of mean and SD did you use to simulate data??",), ('You begin with "as far as I know..." and end with "there is no doubt...". How sure are you? I\'ll wait until I hear from others to be sure...',), ("@Charlie. Thanks. I've added a sentence to our GraphPad Prism FAQ explaining that we use cov to mean the normalized covariance matrix (each value ranges from -1 to 1). I've also added a link to this page, which is great for anyone seeking mathematical details.",), ('Thanks. In that case, why not edit  your answer to delete "As far as I know,". With that phrase, it sounds like you wish to contribute to a discussion. Without it, it sounds like you answer the question.',), ("markk: I still don't understand what your experimental design is, what statistical test you plan to use, or what question you are asking on this site.",), ('One reason why a value can differ from a prediction is that the experimenter messed up. That is like a spelling mistake. But why is your weight different than the average weight of all people of your gender and age? Why is your income different than the mean income? In statistics, this deviation from a mean is an "error" but it isn\'t a mistake, just variation.',), ("Why do I care? I don't! Why do I ask? One of our customers asked. Our program (GraphPad Prism), it turns out, uses the $p \\\\leq \\\\alpha$ rule, and I wondered how standard that was.",), ('I agree it is trivial. I agree that the probability of P exactly equalling alpha is small (but not zero when you consider the practical issues of computer precision). I agree it is splitting hairs. I agree it doesn\'t matter. But I disagree that it cannot be automateable. If the whole idea of "significance" is going to be used, the program has to either use a less than, or a less than or equals to, inequality. Which should it be?',), ('Thanks for the great graph. I had not seen it before. Funny. And apt. Yes, scientists put way way too much emphahsis on the 0.05 cutoff.  I agree that either <.05 or ≤.05 can be equally justifiable from a logical or mathematical, point of view. What I am asking is whether there is any convention for which is used more often.',), ('Are the three quantities you call X, Y and X measured in the same units? If not, simultaneous fitting would require somehow normalizing those values. Minimizing the sum (for the three variables) of the sum (over all points) of squares only makes sense when the three variable are in the same units, or normalized to be so.',), ('Joe, there is no need to base sample size calculations on a two sample t test. It is easy enough to find the equations that compute sample size to compare two proportions.',), ('@Dan: In quality control, "six sigma" is a goal for an acceptable number of defects. That is different than a threshold for accepting evidence. And now "six sigma" refers to a lot of organizational best practices for reducing defects, so that phrase (as used in business) often has no numerical meaning. Are there other scientific fields (besides particle physics) that have adapted such a stringent alpha?',), ('Do you agree that physics uses standard statistical hypothesis testing with a very low alpha (in this case, anyway). Or do they use some kind of Bayesian approach as Nestor said in a comment above?',), ('@AleksandarDimitrov: It would be good to show the box-whisker plots here so others can see how transforming solved the problem. Were there any "outliers" in the transformed data? Or (my guess) were the outliers before simply the tail of a nongaussian distribution? Did the transformed data pass normality tests?',), ("@whuber: Of course you are right. It is the variance (SD squared) that won't change predictably as you add more data. The SD will get a bit larger as sample size goes up, especially when you start with tiny samples. This change is tiny compared to the change in the SEM as sample size changes.",), ('Wait. Or rather Weight! Is the question about the number of each types of nuts in the bag (in which case the chi-square will do the job as Macro explains) or about the weights (as the original question seems to imply)?',), ("You say that neither the chi-square test for independence in contingency tables nor the chi square goodness of fit test require normality. That's true, but some may misunderstand that statement, because it is not strong enough. Those tests analyze categorical outcomes, which (by definition) is never Gaussian.",), ('@codeguy: I think what Michael was asking is whether there is pairing. Is the (say) fifth value of group A matched to the fifth value of group B and C? Your answer seemed to be about the logical order of the three treatment groups, not about pairing or matching of the values in the groups.',), ('Someone asked me this, so I am posting both the question and my answer.',), ("Are you sure you care about the mean? Maybe what you want to quantify is the number of points far from that mean... Or maybe you want to quantify scatter somehow... It doesn't sound like the mean will be helpful to you.",), ('With large samples, the sample variance will be quite close to the population variance, so the sample SD will be close to the population SD. With smaller samples, the sample variance will equal the population variance on average, but the discrepancies will be larger. If symmetrical as variances, they will be asymmetrical as SD. Example: Population variance is 100. Two sample variances are 80 or 120 (symmetrical). The sample SD ought to be 10, but will be 8.94 or 10.95. Average sample SDs from a symmetrical distribution around the population variance, and the mean SD will be low, with low N.',), ('Huh? The graph shows the S&P over time. The title talks about butter and cheese production, which are not visible on the graph. ???',), ('Chocolate consumption (per capita) also significantly correlates with the per capita number of serial murderers.\nhttp://replicatedtypo.com/chocolate-consumption-traffic-accidents-and-serial-killers/5718.html',), ('I asked three Nobel prize winners I (vaguely) know, and all three said they have eaten way more chocolate than most of their colleagues. Of course, these answers came after they read the NEJM paper!',), ('OK, now I see. The graph shows the prediction of a multiple regression model, showing that including three silly variables does a pretty good job of making the model predict change in the SP500 over time. This is a good example of overfitting in multiple regression, and indirectly shows that correlation (or improved goodness-of-fit of a fancy model) does not imply causation.',), ('Thanks Daren. I updated the link as you suggest.',), ('@StasK: Thanks. I updated the answer accordingly.',), ("@largh: I'm sure about SD vs. SEM as explained in my answer. Thanks for pointing out the issue of z vs. t. I'm not sure about that, but think that probably t is the right distribution to use.",), ('I agree with the suggestion for the new tag. Or maybe just make it "FDA".',), ('I think it would help to phrase the question without using the term "significantly". What do you really want to know?',), ("The only exception would be if some of your values are zero or negative. The logarithm is not defined for zero or for negative numbers. So in this crazy case, you'd lose some data in the transform, so would get different results.",), ('@cbeleites. Yes, you can create misleading bar graphs with a linear axis by changing the baseline. But with a linear axis, the natural baseline is zero. With logarithmic axes, in most contexts, there is no natural baseline.',), ('@cbeleites  I agree that if the variable is a ratio so 1.0 is a natural baseline, then showing it on a log scale makes sense.',), ('"use estimated se"... for what purpose? Without some context about goals, your question cannot be answered.',), ("No, I mean the log(dose) v. response graph is symmetrical -- that the steepness from low concentrations to the IC50 is about the same as the steepness from the IC50 to high concentrations. If this is symmetrical when X is log(dose), it won't be symmetrical when X is concentration.",), ("No one will be able to answer this without more detail. If you show the calculation that leads to the answer of 35%, we'll will be able to help you understand what that means.",), ('@BrentonHorne: No. It is not free software.',), ("@lucas: Yes, model selection is what I am after -- an algorithm to choose between the two models and quantify their likelihood. I'll edit the question accordingly. The context: Our program GraphPad Prism can do normality tests. I am looking to add an automatic method to notice when the data actually fit a lognormal distribution better, and ask the user to think about using logs. Lognormal distributions are common in data, but many working scientists don't think to transform their data to logs. So I want Prism to make that suggestion when appropriate.",), ('@alittleboy. Are the findings (on average) in fact in the direction opposite to your hypothesis? You should be able to figure that out by looking at the differences, without thinking about P values.',), ("I've barely used R or the concept of maximum likelihood, so here is a basic question. I know we can't compare the AIC (or BIC) from fitting a normal distribution to the data vs. to the logs of the data, because the AIC or BIC would not be comparable. One needs to fit two models to one set of data (with no transforms; no outlier exclusions etc.), and transforming the data will change AIC or BIC regardless making the comparison bogus. What about ML? Is this comparison legit?",), ('Clever. Maybe this is enough, and avoids the need to explain likelihood calculations.... Thanks.',), ("@Ricardo: I'd just make a graph showing all four combinations, showing every individual data point as a dot. Then the readers can see what actually happened.",), ('Do you mean to say that you know the population mean in advance? How can you know that? Some context would help people give a better answer.',), ('For the sake of others who may read this thread in the future: The question refers to the Mann-Whitney test, and @user27008 refers to the Wilcoxon rank-sum test. These are two different names for the same test.',), ('Power to detect what? It only makes sense to compute power to detect some hypothetical effect that must be stated.',), ("Are you sure about dividing by the square root of n? I don't think that will be helpful here. What he wants is a SD to use (with the log(OR) as the mean) to simulate odd's ratios. I think the top part of your equation (without the division by sqrt[n]) answers that.",), ('"Power" has a very definitive meaning in statistics. Like many statistical terms, it is also an ordinary word so it is easy to get mixed up and apply non-rigorous definitions when in fact "power" in statistics is rigorously defined.',), ("@DikranMarsupial: Right, power does not depend on the observations. But it does depend on sample size and variability. And it can't be computed without defining a clear alternative hypothesis. So power is the characteristic of a test, given a sample size & SD, and a defined alternative hypothesis.",), ("I think you'll get better answers if you give some scientific context to your data, and state what scientific questions you hope the interaction P values will answer.",), ('How are you defining "correlates with"? My guess is that you mean the corresponding P value is less than an arbitrary cutoff. As Peter said, this question really can\'t be answered without knowing what the variable are and the actual value of the correlation coefficients.',), ('@whuber. The OP said he wanted to test "that both are fair", so I took that to be combined. But it probably makes more sense to ask if each is fair, so that would require two binomial tests. I\'ll reword.',), ("I wouldn't. Winning \\\\$200 won't change my life, nor will losing \\\\$20. So why waste my time on this?",), ('That is a great long answer. Why not move it from comments to be the answer?',), ('Either something changed in the last minute, or I saw it wrong. It is a great answer, and posted as such.',), ("In fact, the results are not statistically significant. The P value with Fisher's exact test is 0.26, and 0.38 with a chi-square test (with Yate's correction).",), ("I agree about the nonlinear fit, but why search for a P value less than some threshold? The answer depends on number of replicates etc. I'd suggest searching for a response that is far enough away from the maximum to be clinically or physiologically or scientifically interesting.",), ('Please tell us what hypothesis you are testing. Also fix a mistake: "less" and "greater" are flipped.',), ("@rocinante. Given the information stated in the original question, I don't see what else you can do but pick the largest dollars per day. Given more information (sales on each day; reason for why some ads ran longer than others....), you can do more.",), ('Here is another way to distinguish SD and SEM.Standard deviation quantifies variation or scatter. A standard error quantifies precision of a computed value.',), ('Now you switched from 85% confidence interval to 95%, which is more typical. You can be 95% confident that the range you computed includes the true population value. I say "value" which is vague, because your question is vague. Are you computing a confidence interval for a mean, a median, a proportion, a percent survival....?',), ('The "range" is what you included in the question: .96x to 1.04x\n\nif you repeated the experiment and calculations many times, you\'d expect 95% of those confidence intervals to include the true population mean, and for the other 5% to exclude that true population mean. Unless you are doing simulations, you won\'t know the true population mean, so will never know if a particular experiment is part of the 85% or part of the 15%.\n\nYou\'ll need to read elsewhere about the fundamental concept of analyzing a sample of data to make inferences about the population it was drawn from.',), ("Since you only care about how far a score is from the mean score, just make up a mean score as its value won't affect the answer.",), ("It might help to realize that simply changing the units of the data can drastically change the AIC values, and even change the sign (positive or negative) of the AIC. But changing the units won't change the difference between the AIC of competing models.",), ('@user3269. You answered your own question perfectly in the comment above. Turn that into a proper answer, rather than a comment.',), ("If you use the GraphPad Prism demo, you can fit data to any model you want, and view the covariance matrix (an optional result chosen in the Diagnostics tab) and the confidence or prediction bands (as both numbers and a graph; also choose in Diagnostics tab). That isn't quite a good as a worked example, but at least you can compare the covariance matrix and see if the problem is before or after...",), ('1. The covariance matrix shows the degree to which the parameters are intertwined. So there is one value for every pair of parameters that you ask nonlinear regression to fit.\n2. Look on the Range tab to ask Prism to make a table of the XY coordinates of the curve, with plus/minus values for the confidence or prediction bands. \n3. For tech support with Prism, email support@graphpad.com  Use this forum for statistical questions, not tech support.',), ("@Jonathan. That is one theory. You'd need to draw the graph of per capita income values vs. nobel prizes to see if that explanation makes sense.",), ('It is impossible for anyone to answer this question until you explain how the 27 "actual values" were selected from the "14,000 observations".',), ('1. You might want to change "STD" to "SD" which is more standard and STD had another meaning (to medical people, STD means sexually transmitted disease).\n2. Your final equation isn\'t quite right. The multiplier is not 1.96 but rather is a constant from the t distribution. With large n, it is 1.96 but with smaller n that multiplier is larger.',), ('I removed "low" from the title and first sentence of the box, for the reasons that @hibernating pointed out.',), ('Your question is about how to compare models with the AICs have values fairly close together. High or low is irrelevant (and can change simply by changing the units the data are expressed in). So why put those words back? They are misleading.',), ('But "low" doesn\'t matter. You\'d interpret AICc=(c1000234.2, 1000234.1, 1000677.1) the same way. It is the difference, not the ratio, of AICc values that matters. (I did revert the quote).',), ('Does anyone else want to get involved here about the wording of the question?',), ('@Hibernating. Thanks for clarifying. Now I understand. Would this wording for the question express your intent: "Choosing from a set of models when the two lowest AIC values are nearly equal"',), ("Isn't the F to compare variances traditionally computed with the larger variance in the numerator, so F is always greater than 1.0? It won't change the answer or conclusion, but makes it easier to follow.",), ('The P value is not 0.00000000000.... It is simply smaller than the lowest fraction your program can print.',), ('seems to me that the word "normalize" in the title and question is the wrong word and confusing people. You want to analyze the data in a way that takes into account differences among individuals on the first questionnaire. Is it correct to say that your goal is to describe/quantify how much the reported emotions change between the two questionnaires?',), ('@CousinCocaine. Now we need to understand what your scientific question is. Avoid the word "significantly\' which often gets i the way of clear thinking. What question do you want to ask. Clearly the different rows vary a lot, and the replicates in each row vary a bit. What calculation would be helpful?',), ('Please improve the title of your question, so it will be meaningful to people who browse lists of questions here.',), ('While this link may answer the question, it is better to include the essential parts of the answer here and provide the link for reference.  Link-only answers can become invalid if the linked page changes.',), ('You can only perform repeated measures ANOVA if you had data on all ten subjects, so you know the value for each subject for each of your 8 treatments. Since you only know the mean and SD for each treatment groups, repeated measures ANOVA is not possible.',), ('The Excel function TDIST takes in a t ratio (and df and #tails) and reports a probability. TINV takes in a two-tailed probability (and df) and reports a t ratio.\n\nFrom the Excel help:\n\nTINV returns that value t, such that P(|X| > t) = probability where X is a random variable that follows the t-distribution and P(|X| > t) = P(X < -t or X > t).\n\nA one-tailed t-value can be returned by replacing probability with 2*probability.',), ("I don't see how anyone could answer this without: 1. Some details about the scientific questions you are trying to answer, and 2. The results from each program and a comment about which discrepancies you are asking about.",), ('You use the variables "p" and "p0" to denote the response rates. To avoid the possibility that some people will see this as a P value, I\'d suggest using a different variable name.',), ("The simplest prediction is that it will be exactly the same next week. Any other prediction requires assumptions, which you haven't stated...",), ("Not 85/1618! That would be very misleading, implying that everyone who didn't send back the questionairre would have answered no.  85/217 is the fraction of those answering yes or no who answered yes. 85/220 is the fraction of those answering yes, no or don't-know who answered yes.",), ('@gung I understand that "nonlinear" means the relationship between Y and the parameters is not linear, so polynomial models are "linear" even though a graph of X vs. Y is curved. But where does "curvilinear" fit. Is a polynomial function curvilinear? How about a true nonlinear function?',), ('Thanks. You provide a clear overview of controlling family wise error rates (Bonferroni etc.) vs controlling the FDR, but I still don\'t understand what "positive dependency" means. Consider that I have 1000 P values, testing expression of 1000 different genes comparing people with and without some disease. I use the BH method to decide which of these comparisons are "discoveries". What does "positive dependency" mean in this context?',), ('You explain FDR vs. Bonferroni, but don\'t define "positive dependency" but rather just reword it to "positively correlated" but I don\'t understand. Consider that I have 1000 P values, testing expression of 1000 different genes comparing people with and without some disease. I use the BH method to decide which of these comparisons are "discoveries". What does "positive dependency" mean in this context?',), ('@ChrisC  I still don\'t understand. "Covariance matrix between elements"? I start with a list of P values, and want to decide which are low enough to be called "discoveries" worth following up on (with the FDR controlled). What are the elements of the covariance matrix? Say each P value is comparing expression of a particular gene between groups, and there are many such genes. For each gene, a t test compares the groups resulting in a P value. What does it mean, in this situation, for "elements to vary together" or having "positive correlations between themselves"?',), ("@ChrisC Thanks. It is become more clear, but I still don't really grasp what this assumption means. The whole point of knowing about the assumption behind the method is to know when you are likely to be violating it. So it would help to list some scenarios where the assumption is not true. When would a lower P value not be associated with a higher probability of the null hypothesis being false?",), ('It seems to me that the problem is not explained well enough. You want a "significant" score. What is the null hypothesis? What alternative hypothesis are you proposing? What decision will you make with that conclusion? And backing up, what plans are you talking about? And why any statistical calculations. Just take the one with the smallest (best) score?',), ("@adam The P value is accurate even if you don't assume anything about the shape of the distribution. But then it is asking about the discrepancy in mean ranks. If you want to make an inference about the discrepancy between the medians, you'll need to assume that the shape of the two population distributions is the same, even if the two are shifted (and so have different medians). I corrected my answer to be more clear.",), ("I posted my graph within a few minutes of Russ Lenth posting his. I hadn't seen his, or I wouldn't have posted mine.",), ('Peter: I agree. That is why I have always used "Gaussian". But a comment from a reviewer on the new (concise) edition, strongly pushed "normal".',), ('@Glen_b  The "Look inside" feature of amazon.com lets you preview the book. Also, three chapters are available here:\nhttp://www.intuitivebiostatistics.com/excerpts/',)]
----------------------------
