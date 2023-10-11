library(randomForest)
library(MASS)
data(Boston)
attach(Boston)
dpl=TRUE
#--------------------------------------------------
#get rf fits for different number of trees
#note: to get this to work I had to use maxnodes parameter of randomForest!!!
set.seed(99)
n = nrow(Boston)
ntreev = c(10,500,5000)
nset = length(ntreev)
fmat = matrix(0,n,nset)
for(i in 1:nset) {
   cat('doing Boston rf: ',i,'\n')
   rffit = randomForest(medv~lstat,data=Boston,ntree=ntreev[i],maxnodes=15)
   fmat[,i] = predict(rffit)
}
#--------------------------------------------------
#plot oob error using last fitted rffit which has the largest ntree.
if(dpl) pdf(file='boston-simple-rf-ooberror.pdf',height=10,width=10)

par(mfrow=c(1,1))
plot(rffit)

if(dpl) dev.off()
#--------------------------------------------------
#plot fits
if(dpl) pdf(file='boston-simple-rf.pdf',height=5,width=14)

par(mfrow=c(1,3))
oo = order(Boston$lstat)
for(i in 1:nset) {
   plot(Boston$lstat,Boston$medv,xlab='lstat',ylab='medv')
   lines(Boston$lstat[oo],fmat[oo,i],col=i,lwd=3)
   title(main=paste('bagging ntrees = ',ntreev[i]))
}

if(dpl) dev.off()
#--------------------------------------------------
rm(list=ls())
