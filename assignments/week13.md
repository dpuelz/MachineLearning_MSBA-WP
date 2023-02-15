## Week 13 assignment

### Association rule mining

Revisit the notes on association rule mining and the R example on music playlists: [playlists.R](../code/playlists.R) and [playlists.csv](../data/playlists.csv).  Then use the data on grocery purchases in [groceries.txt](../data/groceries.txt) and find some interesting association rules for these shopping baskets.  The data file is a list of shopping baskets: one person's basket for each row, with multiple items per row separated by commas.  Pick your own thresholds for lift and confidence; just be clear what these thresholds are and say why you picked them.  Do your discovered item sets make sense?  Present your discoveries in an interesting and visually appealing way.  
 
Notes: 
- This is an exercise in visual and numerical story-telling.  Do be clear in your description of what you've done, but keep the focus on the data, the figures, and the insights your analysis has drawn from the data, rather than technical details.  
- The data file is a list of baskets: one row per basket, with multiple items per row separated by commas.  You'll have to cobble together your own code for processing this into the format expected by the "arules" package.  This is not intrinsically all that hard, but it is the kind of data-wrangling wrinkle you'll encounter frequently on real problems, where your software package expects data in one format and the data comes in a different format.  Figuring out how to bridge that gap is part of the assignment, and so we won't be giving tips on this front.  
