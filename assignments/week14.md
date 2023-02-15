## Week 14 assignment

### The Reuters corpus  

Revisit the Reuters C50 text corpus that we briefly explored in class.  Your task is simple: tell an interesting story, anchored in some analytical tools we have learned in this class, using this data.  For example:  
- you could cluster authors or documents and tell a story about what you find.    
- you could look for common factors using PCA.    
- you could train a predictive model and assess its accuracy.  (Yes, this is a supervised learning task, but it potentially draws on a lot of what you know about unsupervised learning, since constructing features for a document might involve dimensionality reduction.)  
- you could do anything else that strikes you as interesting with this data.  

Describe clearly what question you are trying to answer, what models you are using, how you pre-processed the data, and so forth.  Make sure you include at least _one_ really interesting plot (although more than one might be necessary, depending on your question and approach.)  

Format your write-up in the following sections, some of which might be quite short:   
- Question: What question(s) are you trying to answer?
- Approach: What approach/statistical tool did you use to answer the questions?
- Results: What evidence/results did your approach provide to answer the questions? (E.g. any numbers, tables, figures as appropriate.)
- Conclusion: What are your conclusions about your questions? Provide a written interpretation of your results, understandable to stakeholders who might plausibly take an interest in this data set.

Regarding the data itself: In the C50train directory, you have 50 articles from each of 50 different authors (one author per directory).  Then in the C50test directory, you have another 50 articles from each of those same 50 authors (again, one author per directory).  This train/test split is obviously intended for building predictive models, but to repeat, you need not do that on this problem.  You can tell any story you want using any methods you want.  Just make it compelling!  

Note: if you try to build a predictive model, you will need to figure out a way to deal with words in the test set that you never saw in the training set.  This is a nontrivial aspect of the modeling exercise.  (E.g. you might simply ignore those new words.)  


This question will be graded according to three criteria:    
  1. the overall "interesting-ness" of your question and analysis.   
  2. the clarity of your description.  We will be asking ourselves: could your analysis be reproduced by a competent data scientist based on what you've said?  (That's good.)  Or would that person have to wade into the code in order to understand what, precisely, you've done?  (That's bad.)  
  3. technical correctness (i.e. did you make any mistakes in execution or interpretation?)  
