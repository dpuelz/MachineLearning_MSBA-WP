library(tree)
library(rpart)
library(MASS)
data(Boston)
attach(Boston)
dpl=TRUE
#--------------------------------------------------
#reduce df to just lmed and lrat
bdf = Boston[,c(13,14)] #lstat and medv
#--------------------------------------------------
#fit a big tree using rpart.control
big.tree = rpart(medv~lstat,method="anova",data=bdf,
                        control=rpart.control(minsplit=5,cp=.0005))
nbig = length(unique(big.tree$where))
cat('size of big tree: ',nbig,'\n')
#--------------------------------------------------
#look at cross-validation
if(dpl) pdf('boston-lstat-rpart-plotcv.pdf',height=10,width=10)
par(mfrow=c(1,1))
plotcp(big.tree)
if(dpl) dev.off()
#--------------------------------------------------
#show fit from some trees
if(dpl) pdf('boston-lstat-rpart-plotfits.pdf',height=12,width=8)
oo=order(bdf$lstat)
bestcp=big.tree$cptable[which.min(big.tree$cptable[,"xerror"]),"CP"]
cat('bestcp: ',bestcp,'\n')
cpvec = c(.0157,bestcp,.004)
par(mfrow=c(3,2))
for(i in 1:3) {
   plot(bdf,pch=16,col='blue',cex=.5)
   ptree = prune(big.tree,cp=cpvec[i])
   pfit = predict(ptree)
   lines(bdf$lstat[oo],pfit[oo],col='red',lwd=2)
   title(paste('alpha = ',round(cpvec[i],3)))
   plot(ptree,uniform=TRUE)
   text(ptree,digits=4)
}
if(dpl)  dev.off()
#--------------------------------------------------
#plot best tree
if(dpl) pdf('boston-lstat-rpart-plotbestree.pdf',height=10,width=12)
par(mfrow=c(1,1))
best.tree = prune(big.tree,cp=bestcp)
plot(best.tree,uniform=TRUE,branch=.5,margine=.5)
text(best.tree,digits=4,use.n=TRUE,fancy=TRUE,bg='lightblue')
if(dpl) dev.off()

rm(list=ls())

