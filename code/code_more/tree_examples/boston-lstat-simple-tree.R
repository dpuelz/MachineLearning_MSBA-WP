library(tree)
library(MASS)
data(Boston)
attach(Boston)
dpl=TRUE

#--------------------------------------------------
#fit a tree to boston data just using lstat.

#first get a big tree using a small value of mindev
temp = tree(medv~lstat,data=Boston,mindev=.0001)
cat('first big tree size: \n')
print(length(unique(temp$where)))
plot(temp,type="uniform")
text(temp,col="blue",label=c("yval"),cex=.5)

#then prune it down to one with 7 leaves
boston.tree=prune.tree(temp,best=7)
cat('pruned tree size: \n')
print(length(unique(boston.tree$where)))

#--------------------------------------------------
#plot the tree and the fits.
if(dpl) pdf(file="boston-lstat-simple-tree.pdf",height=5,width=12)
par(mfrow=c(1,2))

#plot the tree
plot(boston.tree,type="uniform")
text(boston.tree,col="blue",label=c("yval"),cex=.8)

#plot data with fit
boston.fit = predict(boston.tree) #get training fitted values

plot(lstat,medv,cex=.5,pch=16) #plot data
oo=order(lstat)
lines(lstat[oo],boston.fit[oo],col='red',lwd=3) #step function fit

cvals=c(9.725,4.65,3.325,5.495,16.085,19.9) #cutpoints from tree
for(i in 1:length(cvals)) abline(v=cvals[i],col='magenta',lty=2) #cutpoints

if(dpl) dev.off()
rm(list=ls())
