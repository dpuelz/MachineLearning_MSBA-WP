library(gbm) #boost package
library(MASS)
data(Boston)
attach(Boston)
dpl=TRUE
#--------------------------------------------------
#fit boosting for various number of trees
set.seed(99)
n = nrow(Boston)
ntreev = c(5,20,100)
nset = length(ntreev)
fmat = matrix(0,n,nset)
for(i in 1:nset) {
   cat('doing Boston boost: ',i,'\n')
   boostfit = gbm(medv~lstat,data=Boston,distribution='gaussian',
                interaction.depth=2,n.trees=ntreev[i],shrinkage=.2)
   fmat[,i] = predict(boostfit,n.trees=ntreev[i])
}
#--------------------------------------------------
#plot fits
if(dpl) pdf(file='boston-simple-boost.pdf',height=5,width=14)

par(mfrow=c(1,3))
oo = order(Boston$lstat)
for(i in 1:nset) {
   plot(Boston$lstat,Boston$medv,xlab='lstat',ylab='medv')
   lines(Boston$lstat[oo],fmat[oo,i],col=i+1,lwd=3,lty=1)
   title(main=paste('boosting, ntree= ',ntreev[i]))
}

if(dpl) dev.off()
#--------------------------------------------------
rm(list=ls())
