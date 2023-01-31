## Week 7 assignment

In this assignment, we will use [Titanic survival data](https://downgit.github.io/#/home?url=https://github.com/dpuelz/MachineLearning_MSBA-WP/blob/main/data/TitanicSurvival.csv) to practice fitting and interpreting a logistic linear model.

1. Load in the data and summarize.  Show a visual of the age distribution for each class.  What was the gender breakdown for each class?
2. Fit a logistic regression model for *survived* as a function of all other variables.  Summarize the output and interpret the coefficient on *age*.  Note: try using the *glm()* function, and be sure to specifiy the appropriate *family* parameter.
3. Generate survival probability predictions for a 30-year-old female in 1st, 2nd, and 3rd class.  Be sure to include prediction intervals.  Comment on your findings.  