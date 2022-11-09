# Final Project

Prepare your solutions on the problems below using RMarkdown so that they are fully reproducible, carefully integrating visual and numerical evidence with prose.  You may work solo, or in groups of 4 or fewer people.  You can self-organize groups via Canvas.  

Note: the option to submit as a group is intended to give you an incentive to get to know some of your classmates.  The idea is for y'all to work together on _all_ the problems and to learn from each other, not to divide up the individual problems.

Submit via Canvas under the "Assignments" tab.  Please submit a knitted pdf of an Rmd file *and* the Rmd file itself. If both are not included, you will not receive full credit.

Notes: 
- Do not knit to .html
- Do not include raw R code in your knitted document unless explicitly asked for.  _That's what the .Rmd file is for._  
- Do not create six different sets of links, one for each problem.  We want a single document.  
- Do not directly e-mail the instructor directly with your reports.  We will ignore any e-mailed submissions.         
- For any mathematical expressions in your report, you can use LaTeX syntax within RMarkdown, which I encourage you to learn anyway.  Alternatively, you can just handwrite the math, snap a photo, and include the image in the final report.  This is a simple, low-overhead option.   
- We want your report to be fully reproducible.  Of course, it would seem that, by its very nature, one thing that cannot be reproduced exactly is a Monte Carlo simulation.  That's OK --- you can try figuring out how to set a seed for your simulation so that it is fully reproducible within RMarkdown, or you can just accept that it will be a little bit different next time the script is compiled (which is OK).   
- Submissions that are late, but received within 24 hours, will receive a 20% penalty.  Submissions more than 24 hours late will not be considered and will receive a grade of zero.      

Grading criteria:  

- Did you make an honest, concerted attempt at the problem?
- Did you address all parts of the question?  
- Did you include enough detail on what you actually did so that a well-informed reader could understand your analysis in detail?  (You won't receive full credit if it's not clear what steps you actually took in your analysis.)  
- Did you include properly annotated figures/tables where appropriate?  
- Did you write up your solution professionally, with an actual narrative flow (good), or did you just copy and paste a bunch of R code without much in the way of explanation (bad)?   
- Did you use sensible procedures to answer a given question?  
- Did you make any significant technical mistakes?


# Pricing Cars (50 points)

Your job is very simple: based on the [cars_big.csv dataset, build a predictive model to price cars based on its features.  Describe step-by-step the supervised learning method you chose, the process for fitting this model, and the out-of-sample prediction errors your model generates.  Your grade on this problem will be 50\% presentation of your results and 50\% out-of-sample forecasting accuracy.  Remember that your solution should be fully reproducible, ie, I should be able to take your copy your code, fit the same model, and generate the same error distribution.

## Market segmentation (50 points)

Consider the data in [social_marketing.csv](../data/social_marketing.csv).  This was data collected in the course of a market-research study using followers of the Twitter account of a large consumer brand that shall remain nameless---let's call it "NutrientH20" just to have a label.  The goal here was for NutrientH20 to understand its social-media audience a little bit better, so that it could hone its messaging a little more sharply.

A bit of background on the data collection: the advertising firm who runs NutrientH20's online-advertising campaigns took a sample of the brand's Twitter followers.  They collected every Twitter post ("tweet") by each of those followers over a seven-day period in June 2014.  Every post was examined by a human annotator contracted through [Amazon's Mechanical Turk](https://www.mturk.com/mturk/welcome) service.  Each tweet was categorized based on its content using a pre-specified scheme of 36 different categories, each representing a broad area of interest (e.g. politics, sports, family, etc.)  Annotators were allowed to classify a post as belonging to more than one category.  For example, a hypothetical post such as "I'm really excited to see grandpa go wreck shop in his geriatic soccer league this Sunday!" might be categorized as both "family" and "sports."  You get the picture.

Each row of [social_marketing.csv](../data/social_marketing.csv) represents one user, labeled by a random (anonymous, unique) 9-digit alphanumeric code.  Each column represents an interest, which are labeled along the top of the data file.  The entries are the number of posts by a given user that fell into the given category.  Two interests of note here are "spam" (i.e. unsolicited advertising) and "adult" (posts that are pornographic, salacious, or explicitly sexual).  There are a lot of spam and pornography ["bots" on Twitter](http://mashable.com/2013/11/08/twitter-spambots/); while these have been filtered out of the data set to some extent, there will certainly be some that slip through.  There's also an "uncategorized" label.  Annotators were told to use this sparingly, but it's there to capture posts that don't fit at all into any of the listed interest categories.  (A lot of annotators may used the "chatter" category for this as well.)  Keep in mind as you examine the data that you cannot expect perfect annotations of all posts.  Some annotators might have simply been asleep at the wheel some, or even all, of the time!  Thus there is some inevitable error and noisiness in the annotation process.

Your task to is analyze this data as you see fit, and to prepare a concise report for NutrientH20 that identifies any interesting market segments that appear to stand out in their social-media audience.  You have complete freedom in deciding how to pre-process the data and how to define "market segment." (Is it a group of correlated interests?  A cluster?  A latent factor?  Etc.)  Just use the data to come up with some interesting, well-supported insights about the audience, and be clear about what you did.