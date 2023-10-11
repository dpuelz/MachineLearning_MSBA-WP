library(gbm) #boost package
library(randomForest) 
library(MASS)
data(Boston)
attach(Boston)
dpl=TRUE

#--------------------------------------------------
#fit boot and plot boot
boostfit = gbm(medv~.,data=Boston,distribution='gaussian',
                interaction.depth=2,n.trees=100,shrinkage=.2)

par(mfrow=c(1,1))
p=ncol(Boston)-1
vsum=summary(boostfit,plotit=FALSE) #this will have the variable importance info
row.names(vsum)=NULL #drop varable names from rows.

#plot variable importance
#the package does this automatically, but I did not like the plot
if(dpl) pdf(file='boston-all-simple-boost-varimport.pdf',height=10,width=14)
plot(vsum$rel.inf,axes=F,pch=16,col='red')
axis(1,labels=vsum$var,at=1:p)
axis(2)
for(i in 1:p) lines(c(i,i),c(0,vsum$rel.inf[i]),lwd=4,col='blue')

if(dpl) dev.off()
#--------------------------------------------------
#fit boot and plot rf
rffit = randomForest(medv~.,data=Boston,mtry=3,ntree=500)
if(dpl) pdf(file='boston-all-simple-rf-varimport.pdf',height=10,width=10)

varImpPlot(rffit)

if(dpl) dev.off()

rm(list=ls())


