# Overview

This is the course page for STA380, an introductory course on machine learning for students in the MS program in Business Analytics at UT-Austin. In the first half of the course, you'll learn about probability concepts and predictive models for labeled data (i.e. regression, or supervised learning). In the second half, we will turn to exploratory data analysis, resampling methods for uncertainty quantification, and unsupervised learning, i.e. learning to model structure in unlabeled data.

The textbook we will use heavily is *Introduction to Statistical Learning*, and it available for free in pdf form at the following [link](https://trevorhastie.github.io/ISLR/ISLR%20Seventh%20Printing.pdf).  This book will be referenced as *ISL* in the readings below.  For a more advanced (optional) book, we will use *Elements of Statistical Learning*, which is available at this [link](https://hastie.su.domains/Papers/ESLII.pdf).  This book will be referenced as *ESL* in the readings below.

# Course structure

### Week 1: The Data Scientist Toolbox 

- Introduction and toolbox [slides](slides/week1.pdf)
- Textbook readings: *ISL* Ch. 1, 2.1, and 2.3.  In these readings, you will learn about the foundations of statistical learning and R as a coding language, including basic commands, graphics, and working with data sets in the R environment. **Goals:** get familiar with the language of machine learning and the basic structure and flow of R as a computing tool.
- Other readings:
	- [Introduction to RMarkdown](http://rmarkdown.rstudio.com)  
	- [RMarkdown tutorial](https://rmarkdown.rstudio.com/lesson-1.html)  
	- [Introduction to GitHub](https://guides.github.com/activities/hello-world/)   
	- [Getting starting with GitHub Desktop](https://help.github.com/en/desktop/getting-started-with-github-desktop)  
	- [Jeff Leek's guide to sharing data](https://github.com/jtleek/datasharing)     
- Code: 
	- [Example Rmd file](code/example.Rmd) 
	- [Video tutorial of Rstudio and Rmarkdown](https://d2y36twrtb17ty.cloudfront.net/sessions/482c3219-8866-4a4c-bd99-af31010d035d/ace8beaa-c5f7-4211-b937-af31010d036d-20d525bd-49f7-410d-8e9d-af3101105ec5.mp4?invocationId=c08536fe-404e-ed11-a9ef-0a8e213f0382)
- Data: --
- [Discussion questions](discussions/week1.md)
- [Assignment](assignments/week1.md)

### Week 2: Data Visualization and Wrangling

- Data visualization [slides](slides/week2-dataviz.pdf) + data wrangling [slides](slides/week2-datawrangling.pdf)
- Textbook readings: --
- Other readings:
	- Lessons 4-6 of [Data Science in R: A Gentle Introduction](https://bookdown.org/jgscott/DSGI/).  You'll find lesson 5 a bit basic so feel free to breeze through that.  The main thing you need to take away from lesson 5 is the use of pipes (`%>%`) and the `summarize` function.    
- Code: 
	- [Example data viz R script](code/datavis_intro.R)
	- [Example data wrangling R script](code/nycflights_wrangle.R)
- Data: 
	- [olympics_top20.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/MachineLearning_MSBA-WP/blob/main/data/olympics_top20.csv) 
	- [nycflights13.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/MachineLearning_MSBA-WP/blob/main/data/nycflights13.csv)
	- [TitanicSurvival.csv](https://downgit.github.io/#/home?url=https://github.com/dpuelz/MachineLearning_MSBA-WP/blob/main/data/TitanicSurvival.csv)
- [Discussion questions](discussions/week2.md)
- [Assignment](assignments/week2.md)


### Weeks 3-4: Probability ([slides](slides/PRL-probability.pdf))

- Week 3: Definition and conditioning, independence
- Week 4: Paradoxes, fallacies, and the rule of total probability


### Weeks 5-7: Regression ([slides 1](slides/Sec1_Intro.pdf)), ([slides 2](slides/Sec2_Regression.pdf)), & ([slides 3](slides/naive_bayes_text.pdf))

- Week 5: Bias-variance tradeoff, simple and multiple linear regression
- Week 6: Dummy variables, transformations, variable selection and regularization
- Week 7: Introduction to classification regression


### Weeks  8-9: Trees: ([slides](slides/Sec4_Trees.pdf))

- Week 8: Introduction to trees
- Week 9: How to fit tree ensembles


### Week 10: Resampling ([slides](slides/bootstrap_STA380.pdf))


### Week 11: Clustering ([slides](slides/05-clustering.pdf))


### Week 12: Principal Component Analysis ([slides](slides/06-PCA.pdf))


### Week 13: Networks ([slides](slides/Networks.pdf))


### Week 14: Text ([slides](slides/text_intro.pdf))


### Week 15: Causal ML ([slides](slides/causalML.pdf))

