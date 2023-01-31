## Week 9 assignment (*ISL* Ch. 8)

In this assignment, we will use the *Carseats* data that can be found in the *ISLR* R library.  Please install and load the library to retrieve this data set.

We would like to predict *Sales* using regression trees and related approaches.

1. Split the data set into a training set and a test set.
2. Fit a regression tree to the training set. Plot the tree, and interpret the results. What test MSE do you obtain?
3. Use cross-validation in order to determine the optimal level of tree complexity. Does pruning the tree improve the test MSE?
4. Use the bagging approach in order to analyze this data. What test MSE do you obtain? Use the `importance()` function to determine which variables are most important.