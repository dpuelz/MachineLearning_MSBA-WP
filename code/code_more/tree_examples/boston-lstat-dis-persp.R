library(MASS)
data(Boston)
attach(Boston)
library(tree)

#--------------------------------------------------
df2=Boston[,c(8,13,14)] #pick off dis,lstat,medv
print(names(df2))

#--------------------------------------------------
#big tree
temp = tree(medv~.,df2,mindev=.0001)
cat('first big tree size: \n')
print(length(unique(temp$where)))

#then prune it down to one with 7 leaves
boston.tree=prune.tree(temp,best=7)
cat('pruned tree size: \n')
print(length(unique(boston.tree$where)))

#--------------------------------------------------
#get predictions on 2d grid
pv=seq(from=.01,to=.99,by=.05)
x1q = quantile(df2$lstat,probs=pv)
x2q = quantile(df2$dis,probs=pv)
xx = expand.grid(x1q,x2q)
dfpred = data.frame(dis=xx[,2],lstat=xx[,1])
lmedpred = predict(boston.tree,dfpred)

#make perspective plot
pdf(file='boston-lstat-dis-persp.pdf',height=12,width=12)
par(mfrow=c(1,1))
persp(x1q,x2q,matrix(lmedpred,ncol=length(x2q),byrow=T),
           theta=150,xlab='dis',ylab='lstat',zlab='medv',
           zlim=c(min(df2$medv),1.1*max(df2$medv)))
dev.off()
rm(list=ls())
