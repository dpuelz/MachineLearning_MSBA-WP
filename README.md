# Overview

This is the course page for STA380, an introductory course on machine learning for students in the MS program in Business Analytics at UT-Austin. In the first half of the course, you'll learn about probability concepts and predictive models for labeled data (i.e. regression, or supervised learning). In the second half, we will turn to exploratory data analysis, resampling methods for uncertainty quantification, and unsupervised learning, i.e. learning to model structure in unlabeled data.

The textbook we will use heavily is ***Introduction to Statistical Learning***, and it available for free in pdf form at the following [link](https://trevorhastie.github.io/ISLR/ISLR%20Seventh%20Printing.pdf).  This book will be referenced as *ISL* in the readings below.  For a more advanced (optional) book, we will use ***Elements of Statistical Learning***, which is available at this [link](https://hastie.su.domains/Papers/ESLII.pdf).  This book will be referenced as *ESL* in the readings below.

Additional readings and exercises occasionally come from ***Quantitative Social Science: An Introduction***, and here is the publisher's [link](https://press.princeton.edu/books/hardcover/9780691167039/quantitative-social-science).  This book is a great primer for many coding concepts and implementation in R. Please obtain a copy of this book for reference.  It will be referred to as *QSS* in the readings below.

## Weekly assignments

Each week there will be an assignment for you to work on individually and turned in as a report.  Prepare your report on the problems below using RMarkdown so that they are fully reproducible, carefully integrating visual and numerical evidence with prose.  You are welcome to discuss the problems with me or your classmates over canvas, but individual reports must be submitted.  The idea is for y'all to work together on all the problems and to learn from each other.

Please submit your final reports via Canvas under the "Assignments" tab as a knitted pdf document.  No other document forms will be accepted.  

## Final project

The final project is an extended set of exercises that synthesize all tools and methods we have learned in this course.  You are encouraged to work in groups of up to 4 students, and each group only needs to turn in one copy of solutions.  The final project questions can be found [here](final/final.md).

# Course structure

The grading for this course will be divided across the following categories: weekly assignments (40\%), weekly participation (20\%), and final project (40\%).  The weekly assignments must be turned in individually, although you are encouraged to work with classmates as you write up your own solutions.  Weekly participation includes submitting answers to the discussion questions and engaging with other students questions.  The final project is a larger version of our weekly assignments, and it can be completed in a group of up to 4 students.  

## Week 1: The Data Scientist Toolbox

Overview: This week we will learn about our tools for the course.  These include the coding language R, and a markup tool for writing beautiful reports with R code called RMarkdown.  At the end of this week, you should have installed R, the graphical user interface (GUI) RStudio, and the accompanying software package RMarkdown.  Additionally, you should start getting comfortable with these tools as we will use them heavily throughout this course! 

- Introduction and toolbox [slides](slides/week1_UT.pdf)
- Textbook readings: *ISL* Ch. 1 and 2.3.  In these readings, you will learn about the foundations of statistical learning and R as a coding language, including basic commands, graphics, and working with data sets in the R environment. **Goals:** get familiar with the language of machine learning and the basic structure and flow of R as a computing tool.
- Other readings:
	- [Introduction to RMarkdown](http://rmarkdown.rstudio.com)  
	- [RMarkdown tutorial](https://rmarkdown.rstudio.com/lesson-1.html)  
	- [Introduction to GitHub](https://guides.github.com/activities/hello-world/)   
	- [Getting starting with GitHub Desktop](https://help.github.com/en/desktop/getting-started-with-github-desktop)  
	- [Jeff Leek's guide to sharing data](https://github.com/jtleek/datasharing)     
- Code: 
	- [Example Rmd file](code/example.Rmd) 
	- [Video tutorial of Rstudio and Rmarkdown](https://d2y36twrtb17ty.cloudfront.net/sessions/482c3219-8866-4a4c-bd99-af31010d035d/ace8beaa-c5f7-4211-b937-af31010d036d-20d525bd-49f7-410d-8e9d-af3101105ec5.mp4?invocationId=c08536fe-404e-ed11-a9ef-0a8e213f0382)
- [Discussion questions](discussions/week1.md)
- [Assignment](assignments/week1.md)

## Week 2: Data Visualization and Wrangling

Overview: This week focuses on two crucial components of a data analysis: visualization and wrangling.  We learn these concepts early in our course so they can be deployed effectively for our assignments, discussions, and other data tasks we undertake later.  Visualization involves plotting data to effectively address a data science question or bolster an argument with evidence.  It is an art form that should be taken very seriously.  Wrangling is an early stage of the data analysis pipeline where raw data needs to be manipulated into a usable form.  Concretely, wrangling is the process of morphing raw data into a tidy data frame with observations represented by the rows and variables represented by the columns.

- Data visualization [slides](slides/week2-dataviz_UT.pdf) + data wrangling [slides](slides/week2-datawrangling_UT.pdf)
- Textbook readings: --
- Other readings:
	- Lessons 4, 5, & 6 of [Data Science in R: A Gentle Introduction](https://bookdown.org/jgscott/DSGI/).  You'll find lesson 5 a bit basic so feel free to breeze through that.  The main thing you need to take away from lesson 5 is the use of pipes (`%>%`) and the `summarize` function.    
- Code: 
	- [Example data viz R script](code/datavis_intro.R) with data [olympics_top20.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/MachineLearning_MSBA-WP/blob/main/data/olympics_top20.csv) 
	- [Example data wrangling R script](code/nycflights_wrangle.R)
- [Discussion questions](discussions/week2.md)
- [Assignment](assignments/week2.md)


## Weeks 3-4: Probability

Overview: Probability is central to all things data science.  We use it to formalize uncertainty and discuss unknown model parameters estimated with data.  It characterizes the likely outcomes of future events.  Without it, there is no point in doing data science, artificial intelligence, or machine learning.  This probability section is divided into an introduction, including notation and rules of conditioning and independence, and applications of these rules to common paradoxes and fallacies.  Understanding probability is the data scientist's secret weapon.  While computer science + engineering versions of machine learning training gloss over these concepts, you will have a solid grasp of them.  Further, it will put you ahead of these folks because you know how to characterize and interpret statistical uncertainty.

- Probability [slides](slides/week3_UT.pdf) covering both weeks 3 and 4.

### Week 3: Definition and conditioning, independence

- Textbook readings: *QSS* Ch. 6.1 - 6.3.  In these readings, you'll learn the basics of probability and simulation in R.
- Other readings: [Chapter 1 of these course notes.](./readings/Bertsekas_Tsitsiklis_Introduction_to_probability.pdf)  There's a lot more technical stuff in here, but Chapter 1 really covers the basics of what every data scientist should know about probability. 
- Code:
	- [Simulating random variables](code/probability.R)
- [Discussion questions](discussions/week3.md)
- [Assignment](assignments/week3.md)


### Week 4: Paradoxes, fallacies, and the rule of total probability

- Textbook readings: --
- Other readings:  
	- An excerpt from Chapter 7 of [AIQ: How People and Machines are Smarter Together](readings/AIQ_excerpt_contraceptive_effectiveness.pdf), by Nick Polson and James Scott.  
	- [Rich State, Poor State, Red State, Blue State](http://www.stat.columbia.edu/~gelman/research/published/rb_qjps.pdf) and a shorter prelude to this article, [Gelman's blog](https://statmodeling.stat.columbia.edu/2005/11/07/income_matters/).
- [Discussion questions](discussions/week4.md)
- [Assignment](assignments/week4.md)


## Weeks 5-7: Regression ([slides 1](slides/Sec1_Intro.pdf)), ([slides 2](slides/Sec2_Regression.pdf)), & ([slides 3](slides/naive_bayes_text.pdf))

### Week 5: Bias-variance tradeoff, simple and multiple linear regression

- Supervised learning [slides](slides/week5_UT.pdf)
- Textbook readings: *ISL* Ch. 2.1 - 2.2 and Ch. 3.  In these readings, you'll learn about a key tradeoff between model interpretability and predictive accuracy.  In Ch. 3, you'll dive into a workhorse and first tool of a data scientist: Linear regression!
- Other readings: --
- Code: 
- [Discussion questions](discussions/week5.md)
- [Assignment](assignments/week5.md)

### Week 6: Dummy variables and model selection

- Dummy variables and model selection [slides](slides/week6_UT.pdf)
- Textbook readings: 
- Other readings: --
- Code: 
- [Discussion questions](discussions/week6.md)
- [Assignment](assignments/week6.md)


### Week 7: Introduction to classification regression

- Classification regression slides [slides](slides/week7_UT.pdf)
- Textbook readings: 
- Other readings: --
- Code: 
- [Discussion questions](discussions/week7.md)
- [Assignment](assignments/week7.md)



## Weeks  8-9: Trees: ([slides](slides/Sec4_Trees.pdf))

### Week 8: Introduction to trees
### Week 9: How to fit tree ensembles


## Week 10: Resampling ([slides](slides/bootstrap_STA380.pdf))


## Week 11: Clustering ([slides](slides/05-clustering.pdf))


## Week 12: Principal Component Analysis ([slides](slides/06-PCA.pdf))


## Week 13: Networks ([slides](slides/Networks.pdf))


## Week 14: Text ([slides](slides/text_intro.pdf))


## Week 15: Causal ML ([slides](slides/causalML.pdf))

