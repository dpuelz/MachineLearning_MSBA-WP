## Week 6 assignment

This assignment revisits the [Auto](https://downgit.github.io/#/home?url=https://github.com/dpuelz/MachineLearning_MSBA-WP/blob/main/data/Auto.csv) data set we analyzed last week.  Specifically, we will focus on model selection.

1. Build a regression model for *mpg* as a function of all other variables except for *name*.  Include all plausible variables and interactions, especially nonlinear transformations of variables you believe are relevant.  Be greedy!  Fit this model with the *lm()* function and produce a summary output.  Comment on the coefficient values, predictions/residuals, and anything else you notice about the fit.  What location on the bias-variance tradeoff is this model?
2. Do the same as above, but now use the *glmnet* package which includes LASSO and ridge regression to fit your model.  Report the optimal LASSO and ridge models.  How do they differ from the "unpenalized" linear model above?