library(MASS)
data(Boston)
attach(Boston)
library(tree)

dpl=TRUE
#--------------------------------------------------
df2=Boston[,c(8,13,14)] #pick off dis,lstat,medv
print(names(df2))

#--------------------------------------------------
#big tree
temp = tree(medv~.,df2,mindev=.0001)
cat('first big tree size: \n')
print(length(unique(temp$where)))

#--------------------------------------------------
#then prune it down to one with 7 leaves
boston.tree=prune.tree(temp,best=7)
cat('pruned tree size: \n')
print(length(unique(boston.tree$where)))

#--------------------------------------------------
if(dpl) pdf(file="boston-lstat-dis-simple-tree.pdf",height=5,width=12)
par(mfrow=c(1,2))
plot(boston.tree,type="u")
text(boston.tree,col="blue",label=c("yval"),cex=.8)
partition.tree(boston.tree)
if(dpl) dev.off()
rm(list=ls())
