# Overview

This is the course page for STA380, an introductory course on machine learning for students in the MS program in Business Analytics at UT-Austin. In the first half of the course, you'll learn about probability concepts and predictive models for labeled data (i.e. regression, or supervised learning). In the second half, we will turn to exploratory data analysis, resampling methods for uncertainty quantification, and unsupervised learning, i.e. learning to model structure in unlabeled data.

The textbook we will use heavily is ***Introduction to Statistical Learning***, and it available for free in pdf form at the following [link](https://trevorhastie.github.io/ISLR/ISLR%20Seventh%20Printing.pdf).  This book will be referenced as *ISL* in the readings below.  For a more advanced (optional) book, we will use ***Elements of Statistical Learning***, which is available at this [link](https://hastie.su.domains/Papers/ESLII.pdf).  This book will be referenced as *ESL* in the readings below.

Additional readings and exercises occasionally come from ***Quantitative Social Science: An Introduction***, and here is the publisher's [link](https://press.princeton.edu/books/hardcover/9780691167039/quantitative-social-science).  This book is a great primer for many coding concepts and implementation in R. Please obtain a copy of this book for reference.  It will be referred to as *QSS* in the readings below.

Occassionally, *ISL* and *QSS* exercises will be used for our assignments.  Thanks to the authors for providing these resources.

## Weekly assignments

Each week there will be an assignment for you to work on individually and turned in as a report.  Prepare your report on the problems below using RMarkdown so that they are fully reproducible, carefully integrating visual and numerical evidence with prose.  You are welcome to discuss the problems with me or your classmates over canvas, but individual reports must be submitted.  The idea is for y'all to work together on all the problems and to learn from each other.

Please submit your final reports via Canvas under the "Assignments" tab as a knitted pdf document.  No other document forms will be accepted.  

## Final project

The final project is an extended set of exercises that synthesize all tools and methods we have learned in this course.  The final project questions can be found [here](final/final.md).

# Course structure

The grading for this course will be divided across the following categories: weekly assignments (40\%), weekly participation (20\%), and final project (40\%).  The weekly assignments must be turned in individually, although you are encouraged to work with classmates as you write up your own solutions.  Weekly participation includes submitting answers to the discussion questions and engaging with other students questions.  The final project is a larger version of our weekly assignments, and it can be completed in a group of up to 4 students.  

## Week 1: The Data Scientist Toolbox

Overview: This week we will learn about our tools for the course.  These include the coding language R, and a markup tool for writing beautiful reports with R code called RMarkdown.  At the end of this week, you should have installed R, the graphical user interface (GUI) RStudio, and the accompanying software package RMarkdown.  Additionally, you should start getting comfortable with these tools as we will use them heavily throughout this course! 

- Introduction and toolbox [slides](slides/week1_UT.pdf)
	- What is the structure of this course?
	- What is the difference between supervised and unsupervised learning?
- Textbook readings: *ISL* Ch. 1 and 2.3.  In these readings, you will learn about the foundations of statistical learning and R as a coding language, including basic commands, graphics, and working with data sets in the R environment. **Goals:** get familiar with the language of machine learning and the basic structure and flow of R as a computing tool.
- Other readings:
	- [Introduction to RMarkdown](http://rmarkdown.rstudio.com)
		- What are the advantages of this markup tool relative to just turning in raw code?
		- How is it useful for consolidating messy code and disjoint data analyses?  
	- [RMarkdown tutorial](https://rmarkdown.rstudio.com/lesson-1.html)
		- What are the steps for creating a RMarkdown file?
		- Describe how one should organize directories (folders) with data and code to make RMarkdown easily reproducible.  Put differently, what are common coding pitfalls/mistakes that make life hard?  
	- [Introduction to GitHub](https://guides.github.com/activities/hello-world/) (optional)
	- [Getting starting with GitHub Desktop](https://help.github.com/en/desktop/getting-started-with-github-desktop) (optional)
	- [Jeff Leek's guide to sharing data](https://github.com/jtleek/datasharing)
		- Describe the important steps for sharing data with a statistician.
		- What should you expect in return?     
- Code: 
	- [Example Rmd file](code/example.Rmd) 
		- What is the basic structure of an Rmd file?
		- How do you embed code and figures among prose?
- [Discussion questions](discussions/week1.md)
- [Assignment](assignments/week1.md)

## Week 2: Data Visualization and Wrangling

Overview: This week focuses on two crucial components of a data analysis: visualization and wrangling.  We learn these concepts early in our course so they can be deployed effectively for our assignments, discussions, and other data tasks we undertake later.  Visualization involves plotting data to effectively address a data science question or bolster an argument with evidence.  It is an art form that should be taken very seriously.  Wrangling is an early stage of the data analysis pipeline where raw data needs to be manipulated into a usable form.  Concretely, wrangling is the process of morphing raw data into a tidy data frame with observations represented by the rows and variables represented by the columns.

- Data visualization [slides](slides/week2-dataviz_UT.pdf) + data wrangling [slides](slides/week2-datawrangling_UT.pdf)
	- Why is data visualization so important?
	- Describe an example data wrangling task and how it's broken down into steps.
	- Why is dividing up a wrangling task into simple steps so important? (video)
- Textbook readings: --
- Other readings:
	- Lessons 4, 5, & 6 of [Data Science in R: A Gentle Introduction](https://bookdown.org/jgscott/DSGI/).  You'll find lesson 5 a bit basic so feel free to breeze through that.  
		- What are the fundamental plots for data, and what type of data can be visulized with each? 
		- Why are pipes (`%>%`) useful and how do they operate?
		- Where does data wrangling fit in a data analysis pipeline, and why is it so important to get right?
- Code: 
	- [Example data viz R script](code/datavis_intro.R) with data [olympics_top20.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/MachineLearning_MSBA-WP/blob/main/data/olympics_top20.csv) 
	- [Example data wrangling R script](code/nycflights_wrangle.R)
		- How do you use piping to wrangle data and answer a complex question?
		- How do you group by more than one variable and mutate variables to other forms?
- [Discussion questions](discussions/week2.md)
- [Assignment](assignments/week2.md)


## Weeks 3-4: Probability

Overview: Probability is central to all things data science.  We use it to formalize uncertainty and discuss unknown model parameters estimated with data.  It characterizes the likely outcomes of future events.  Without it, there is no point in doing data science, artificial intelligence, or machine learning.  This probability section is divided into an introduction, including notation and rules of conditioning and independence, and applications of these rules to common paradoxes and fallacies.  Understanding probability is the data scientist's secret weapon.  While computer science + engineering versions of machine learning training gloss over these concepts, you will have a solid grasp of them.  Further, it will put you ahead of these folks because you know how to characterize and interpret statistical uncertainty.

- Probability [slides](slides/week3_UT.pdf) covering both weeks 3 and 4.
	- Give an example of how you use conditional probability in your day-to-day life. (video)
	- When is the independence assumption reasonable, and when does it fail? (video)
	- Why is the rule of total probability sometimes referred to as "the mixture rule"? (video)
	- What is the aggregation paradox and how does it relate to Simpson's paradox? (video)

### Week 3: Definition and conditioning, independence

- Textbook readings: *QSS* Ch. 6.1 - 6.3.
	- What is conditional probability?  Provide a real-life example of conditional probability.
	- What are random variables, and how are they related to probability?
	- How do you simulate from probability distributions in R?
- Other readings: [Chapter 1 of these course notes.](./readings/Bertsekas_Tsitsiklis_Introduction_to_probability.pdf)  There's a lot more technical stuff in here, but Chapter 1 really covers the basics of what every data scientist should know about probability. (optional)
- Code:
	- [Simulating random variables](code/probability.R)
		- What is the naming convention in R for built-in probability distributions and random variable simulation?
- [Discussion questions](discussions/week3.md)
- [Assignment](assignments/week3.md)


### Week 4: Paradoxes, fallacies, and the rule of total probability

- Textbook readings: --
- Other readings:  
	- An excerpt from Chapter 7 of [AIQ: How People and Machines are Smarter Together](readings/AIQ_excerpt_contraceptive_effectiveness.pdf), by Nick Polson and James Scott. 
		- What is the compounding rule of probability?
		- What fatal mistake did the New York Times make when calculating the long-term failure rate of birth control? 
	- [Rich State, Poor State, Red State, Blue State](http://www.stat.columbia.edu/~gelman/research/published/rb_qjps.pdf) and a shorter prelude to this article, [Gelman's blog](https://statmodeling.stat.columbia.edu/2005/11/07/income_matters/).
		- What is the prevailing belief of the relation between a state's wealth and political ideaology?
		- What does the data actually show when looking at state-level and individual-level trends in wealth and political ideaology?
		- What is the aggregation paradox?
- [Discussion questions](discussions/week4.md)
- [Assignment](assignments/week4.md)


## Weeks 5-7: Regression 

Overview: The next three weeks are focused on supervised learning.  This basically means modeling/estimating a relationship between a specific outcome variable and set of associated input variables.  We will first discuss a fundamental tradeoff of statistical model building that relates model complexity to its predicitive performance.  Then, we will discuss dummy variables and their important role in regression modeling as well as develop tools for navigating the bias-variance tradeoff.  Finally, we will develop approaches for modeling binary and categorical outcomes using classification regression.

### Week 5: Bias-variance tradeoff, simple and multiple linear regression

- Supervised learning [slides](slides/week5_UT.pdf)
	- What is the difference between an outcome variable and input variables and how are they related?
	- Describe the defining feature of a supervised learning task. (video)
- Textbook readings: *ISL* Ch. 2.1 - 2.2 and Ch. 3.  In these readings, you'll learn about a key tradeoff between model interpretability and predictive accuracy.  In Ch. 3, you'll dive into a workhorse and first tool of a data scientist: Linear regression!
	- Describe intuitively why the bias-variance tradeoff interpolates between model complexity and predictive ability
	- What are the assumptions of a linear regression model?
	- How do you estimate the parameters of a linear regression model and how are they interpreted?
- Other readings: --
- Code: 
- [Discussion questions](discussions/week5.md)
- [Assignment](assignments/week5.md)

### Week 6: Dummy variables and model selection

- Dummy variables and model selection [slides](slides/week6_UT.pdf)
	- Give an example of how dummy variables are used in regression models?
	- How many dummy variables need to be created to represent a 5-level categorical variable?
	- How do the geometries of the Ridge and LASSO penalties affect the shrinkage of regression coefficients?
	- Can LASSO coefficients be exactly zero?  Provide evidence why or why not?
- Textbook readings: *QSS* Ch. 2.1 - 2.2 and *ISL* Ch. 6.1 - 6.2
	- Define a binary or dummy variable. (*QSS*)
	- How are dummy variables related to logical statements? (*QSS*)
	- How are dummy variables created in R? (*QSS*)
	- Describe the differences and similarities between subset selection methods and shrinkage methods for regularization and model selection. (*ISL*)
	- What is the difference between LASSO and ridge regression? (*ISL*)
	- What is the "solution path", and how is it used to determine the "optimal model"? (*ISL*)
- [Discussion questions](discussions/week6.md)
- [Assignment](assignments/week6.md)


### Week 7: Introduction to classification regression

- Classification regression [slides](slides/week7_UT.pdf)
	- What are the statistical metrics that measure a logistic regression predictive performance?
	- How is log-odds defined?
	- What is a link function, and what is it "linking" exactly?
	- What is the "naive" assumption of Naive Bayes, and why does it work so well in practice?
	- How is Naive Bayes used for classification?
	- How does Naive Bayes use conditional probability?
	- What are the key differences between Naive Bayes and classification regression?
- Textbook readings: *ISL* Ch. 4.1 - 4.3
	- Why not just fit a linear regression model to a binary outcome?
	- What is the logistic regression model and how does it constrain the outcome to be between 0 and 1?
	- How do you interpret coefficient in a logistic regression model?
- [Discussion questions](discussions/week7.md)
- [Assignment](assignments/week7.md)


## Weeks  8-9: Trees

Overview: This section focuses on a powerful technique for supervised learning relying on the technology of "trees".  While simple to visualize, regression trees are powerful tools for capturing interactions and nonlinearities in data.  Further, when ensembled together, combinations of trees are one of the most competitive predictive modeling methods available.

### Week 8: Introduction to trees

- Introduction [slides](slides/week8_UT.pdf)
	- How are regression trees represented?
	- What defines the structure of a regression tree?
	- How does a tree split on continuous and categorical variables?
	- How does the depth of a tree relate to the bias-variance tradeoff?
	- Why do ensembles of trees lead to better models for prediction? (video)
	- Describe why individual tree models are not the best for prediction (video) 
- Textbook readings: *ISL* Ch. 8.1
	- What is the process of "tree pruning"?
	- How does a regresson tree incorporate interactions between input variables?
	- How are predictions generate from a tree fit?
	- How are regression trees different from linear models?
- [Discussion questions](discussions/week8.md)
- [Assignment](assignments/week8.md)


### Week 9: How to fit tree ensembles

- Model fitting approaches and details [slides](slides/week9_UT.pdf)
	- Why does ensembling lead to better fitting models?
	- How does the bias-variance tradeoff appear in this setting, i.e., what notion of model complexity needs to be controlled?
	- What is boosting, bagging, and random forest modeling?
- Textbook readings: *ISL* Ch. 8.2
	- What is the general idea of the bootstrap (*ISL* Ch.5), and how is it used to build and ensemble decision trees?  Why does it lead to improved predictions?
	- How do you measure variable importance with trees?
	- Describe the boosting algorithm for regression trees.
- [Discussion questions](discussions/week9.md)
- [Assignment](assignments/week9.md)


## Week 10: Resampling

Overview: This module focuses on a key aspect of data science: Understanding uncertainty.  If statistical uncertainty is not well understood, reliable data-driven decisions will not be made.  Resampling and bootstrapping data provide a simple, all-purpose solution for characterizing sampling variability and will be the focus of this section. 

- Quantifying uncertainty and the bootstrap [slides](slides/week10_UT.pdf)
	- Why do we care about quantifying uncertainty?
	- What does sampling variability actually mean?  Describe in the context of a sampling distribution.
	- How does the bootstrap approximate sampling variability?
	- Why can't we just compute the actual sampling distribution?  Why is this infeasible? (video)
	- Describe a situation where running the bootstrap is computationally burdensome?  Where is the computational "bottleneck" in the bootstrapping algorithm? (video)
	- Why is the bootstrapped sampling distribution only approximating the true sampling distribution? (video)
- Textbook readings: *ISL* Ch. 5.2
	- How does the bootstrap relate to calculating investment portfolio risk?
	- Why is sampling with replacement important?
	- When might the bootstrap not be a reliable way of calculating sampling variability?
- Other readings:
	- For the assignment, you will need to refer to any basic explanation of the concept of value at risk (VaR) for a financial portfolio, e.g. [here](https://en.wikipedia.org/wiki/Value_at_risk), [here](http://www.investopedia.com/articles/04/092904.asp), or [here](http://people.stern.nyu.edu/adamodar/pdfiles/papers/VAR.pdf). 
		- What are the two quantities that need to be specified in order to define VaR?
		- How does VaR differ from a standard measures of portfolio risk like standard deviation of portfolio return?
		- Describe how VaR is used to managed risk in the financial sector.
	- Lessons 8 and 9 of [Data Science in R: A Gentle Introduction](https://bookdown.org/jgscott/DSGI/)
		- What are different sources of statistical uncertainty?
		- What are the important "moments" of the sampling distribution?
		- What are "bootstrap gotchas"?
		- When does bootstrap not work?
- Code: 
	- [Two examples of bootstrap resampling, one simple and one complex](code/bootstrap.R)
		- How do you bootstrap uncertainty for simple sample quantities, like the mean?
		- How can the above be extended for my complex sample quantities, liek regression functions?
		- What are the computational bottlenecks to bootstrapping, i.e., when can the bootstrap become prohibitvely slow?
	- [Code demonstration for portfolio risk modeling](code/portfolio.R)
		- Describe how the bootstrap is useful for calculating portfolio risk?
		- What layering of loops is needed for computing portfolio value uncertainty at the end of an investor's time horizon?
		- Why do all asset returns need to be resampled jointly, i.e., all at once?
- [Discussion questions](discussions/week10.md)
- [Assignment](assignments/week10.md)

## Week 11: Clustering

Overview: In this module, we will turn to our first unsupervised learning technique in clustering.  There will be a focus on desirable features for clustering, algorithmic techniques for finding a data clustering, and best-practice guidelines for choosing the number of clusters.

- K-means and hierarchical clustering [slides](slides/week11_UT.pdf)
	- What is the purpose of "clustering" data?
	- What is the main drawback of default k-means, and how does k-means++ remedy this problem?
	- What are some best practices for selecting "k", the number of clusters in the k-means algorithm?
	- Describe hiearchical clustering, and how is it different from k-means.
	- Describe the key features of a "nice" clustering. (video)
	- How is a clustering quantitatively evaluated?  What are some useful metrics (video)
	- Describe the importance of balance and separation in clustering. (video)
- Textbook readings: *ISL* Ch. 10.1 and 10.3 or *ESL* Ch. 14.3 (more advanced)
	- What is a distance function and why is it needed for clustering?
	- Describe within and between cluster variation and why they are useful metrics.
	- When does the k-means algorithm terminate?
	- What are the different linkage functions used for hiearchical clustering, and what are their pros/cons?    
- Other readings:  
	- K-means++ [original paper](http://ilpubs.stanford.edu:8090/778/1/2006-13.pdf) or [simple explanation on Wikipedia](https://en.wikipedia.org/wiki/K-means%2B%2B).  This is a better recipe for initializing cluster centers in k-means than the more typical random initialization.
		- What problem is k-means++ trying to solve?
		- How well does this new strategy work in practice?
		- Describe why "multiple restarts" of the algorithm is a useful practice for getting better clusterings.
- Code:
	- [cars.R](code/cars.R) and [cars.csv](data/cars.csv) 
		- How is k-means applied to clustering cars?
		- Why is it important to center and scale covariates before clustering?
	- [hclust_examples.R](code/hclust_examples.R)   
		- How do you run hierarchical clustering in R?
		- Given a hierarchy, what functions are used to "cut" a tree to give a specified number of clusters? 
	- [linkage_minmax.R](code/linkage_minmax.R) 
		- How is 2-D Gaussian data simulated in R?
		- How do the complete, single, and max linkage functions change the data clusterings?
		- Which linkage function is a good all-purpose choice?
- [Discussion questions](discussions/week11.md)
- [Assignment](assignments/week11.md)

## Week 12: Principal Components Analysis

Overview: Principal components analysis is an unsupervised learning alternative to clustering.  Instead of determing a discrete classification of data, PCA represents each data point as a continuous mixture of "fundamental dimensions".  We will learn how to find these dimensions and mixture weights using intuitive examples.  Then, we will practice using and interpreting PCA in real-life applications.

- PCA [slides](slides/week12_UT.pdf)
	- How is PCA different from clustering?
	- What's the difference between the scores and principal components?  How are they related?
	- How is PCA like reverse engineering how a baked good was made? (video)
	- Are principal components and scores interpretable?  How are they typically used in a data analysis? (video)
	- How does PCA maximally preserve information in the data? (video)
- Textbook readings: *ISL* Ch. 10.2 for the basics or *ESL* Ch. 14.5 (more advanced)
	- How should you interpret the output of a PCA?
	- What are some useful plots for determining the right number of summary dimensions?
	- What is the relationship between PCA and the eigenvalue decomposition?
- Code:
	- [PCA intro code](code/pca_intro.R)  
		- How does PCA work in practice?
		- When determining principal component directions, what is being "maximally" preserved?
		- How is PCA related to linear algebra and vector spaces?
	- [Surveys of NBC shows](code/nbc.R), [nbc_showdetails.csv](data/nbc_showdetails.csv), [nbc_pilotsurvey.csv](data/nbc_pilotsurvey.csv 
		- What is the row-centric and column-centric view of a PCA?
		- How does one interpret the one-number-summaries for each observation on each principal component?
		- Describe how these summaries relate to "data compression".
	- [congress109.R](code/congress109.R), [congress109.csv](data/congress109.csv), and [congress109members.csv](data/congress109members.csv) 
		- Describe how PCA is used to summarize text data?
		- Do data from congressional speeches accurately separate representatives into political parties?
	- [ercot_PCA.R](code/ercot_PCA.R), [ercot.zip](data/ercot.zip)
		- How can PCA be applied to temperature and spatial data?
		- Describe the importance of PCA in "contrasting" dimensions of the column-space.
- More examples of code we might not get to:
	- [FXmonthly.R](code/FXmonthly.R), [FXmonthly.csv](data/FXmonthly.csv), and [currency_codes.txt](data/currency_codes.txt) / [NCI60.R](code/NCI60.R) /[gasoline.R](code/gasoline.R) and [gasoline.csv](data/gasoline.csv)   
		- How is PCA used in other settings, including financial data?    
- [Discussion questions](discussions/week12.md)
- [Assignment](assignments/week12.md)


## Week 13: Networks

Overview: Data points are usually connected with each other in some way, e.g. social networks, street networks, disease spread, corporate hierarchy, ... .  Most of the time, these connections are disregarded.  However, if information on these links is gathered, data analyses can be much richer.  In this module, we will set up the notation and language of "networked" data and discuss how we might use this underlying information for data science tasks.

- Networks [slides](slides/week13_UT.pdf)
	- How are networks represented mathematically?
	- What are association rules, and how do they relate to probability?
	- How can you generate network connections in data using conditional probabilities?
	- Why are networks so useful to study in data science? What information are they capturing? (video 1)
	- How are networks represented and stored in a data structure? (video 1)
	- What is degree and betweenness? (video 1)
	- What are lift, support, and confidence and how do they relate to probability? (video 2)
	- How do you go from association rule measures to generate edges connecting your data points? (video 2)
- Software you'll need: [Gephi](https://gephi.org/), a great piece of software for exploring graphs and [The Gephi quick-start tutorial](https://gephi.org/tutorials/gephi-tutorial-quick_start.pdf)
	- Why might we prefer Gephi compared to other graph visualization tools?
	- What are useful visualization features that Gephi provides?
- Code:
	- [medici.R](code/medici.R) and [medici.txt](data/medici.txt)
		- How does the igraph package work in R?
		- What are some useful functions for summarizing a graph?  
	- [playlists.R](code/playlists.R) and [playlists.csv](data/playlists.csv)
		- How does the arules package work in R?
		- What is a typical output of an association rules analysis, and how do you create a network from it?    
- [Discussion questions](discussions/week13.md)
- [Assignment](assignments/week13.md)

## Week 14: Text data

Overview: There is a tremendous amount of information in raw text.  From speeches to emails to books and journal articles, it's natural for data scientists to wonder how to capture this content for modeling tasks.  This module will describe the text-to-data pipeline, data structures for text, and touch on modeling approaches that bring in topics from previous modules.

- Text as data [slides](slides/week14_UT.pdf)
	- Describe the process of converting raw text to a usable data structure.
	- What are tokens and what is tokenization?
	- What are the common data types for text?
	- What is the document term matrix, and what are common transformations of it?
	- What information is potentially lost when converted raw text to data? (video)
	- What are examples of text data used for classification? (video)
	- What is a key-value store and vector representation of text data? (video)
	- How is the vector representation related to the document term matrix (video)
- Code:
	- [tm_examples.R](code/tm_examples.R) and [selections from the Reuters newswire](https://github.com/dpuelz/MachineLearning_MSBA-WP/tree/main/data/ReutersC50)
		- How do you process text data in R?
		- How do you transform a DTM with term frequency and inverse-document frequency weighting in R?
	- [smallbeer.R](code/smallbeer.R) and [smallbeer.csv](data/smallbeer.csv)  
		- How would you convert raw text descriptions of beers into variables for regression analysis?
		- What regression model of quantity on price can provide an estimate of "price elasticity"?
		- Describe how including text interactions modulates the price elasticity of beer.
- [Discussion questions](discussions/week14.md)
- [Assignment](assignments/week14.md)


## Week 15: Causal ML

Overview: Understanding causality with data is one of the most illusive tasks a data scientist can undertake.  What exactly is a cause-effect question?  Is the data your investigating this question with observational or experimental?  Are you controlling for appropriate "confounders"?  This module will address these questions with a focus on the latest techniques in machine learning.  The best supervised learning techniques for prediction can be used for causal inference *if* they are deployed in the right way!

- Causal machine learning [slides](slides/week15_UT.pdf)
	- What is a typical causal question, and how can we use regression to answer it?
	- What happens to treatment effect estimates when too many control variables are added to the model?
	- What is regularization-induced confounding?
	- What nonlinear regression models can be used for treatment effect estimation?
	- How are causal questions different from prediction questions? (video)
	- How are causal questions similar to prediction questions? (video)
	- What parameter in a linear model typically tells us about the "treatment effect"? (video)
- Code:
	- [BART example](code/makeBARTsim.R)
		- How is a BART model fit in R?
	- [Freakonomics example, crime and abortion](code/levitt.R)
		- What is the effect of abortion on future crime?
		- What happens to the treatment effect when you include many more controls and use an appropriately designed ML method?
- [Discussion questions](discussions/week15.md)
- Assignment: None for this week since it's our last!






