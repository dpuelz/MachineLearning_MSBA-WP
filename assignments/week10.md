## Week 10 assignment

Portfolio modeling!  In this problem, you will construct three different portfolios of exchange-traded funds, or ETFs, and use bootstrap resampling to analyze the short-term tail risk of your portfolios.  If you're unfamiliar with exchange-traded funds, you can read a bit about them [here](http://www.investopedia.com/terms/e/etf.asp).

### The goal  

Suppose you have $100,000 in capital.  Your task is to:  
- Construct two different possibilities for an ETF-based portfolio, each involving an allocation of your $100,000 in capital to somewhere between 3 and 10 different ETFs.  You can find a [big database of ETFs here.](https://etfdb.com/etfdb-categories/)  
- Download the last five years of daily data on your chosen ETFs, using the functions in the `quantmod` package, as we used in class.   Note: make sure to choose ETFs for which at least five years of data are available.  There are tons of ETFs and some are quite new!  
- Use bootstrap resampling to estimate the 4-week (20 trading day) value at risk of each of your three portfolios at the 5% level.  
- Write a report summarizing your portfolios and your VaR findings.  

You should assume that your portfolios are rebalanced each day at zero transaction cost.  For example, if you're allocating your wealth evenly among 5 ETFs, you always redistribute your wealth at the end of each day so that the equal five-way split is retained, regardless of that day's appreciation/depreciation.  
 
Notes:
- Make sure the portfolios are different from each other!  (Maybe one seems safe, another aggressive, or something like that.)  You're not being graded on what specific portfolios you choose... just provide some context for your choices.

