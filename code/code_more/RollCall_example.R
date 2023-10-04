

### *** European Protein Consumption, in grams/person-day *** ###
food = read.csv("protein.csv", row.names=1) # 1st column is country name
xfood = scale(food) 


### PCA ###
pcfood <- prcomp(xfood, scale=TRUE)
zfood <- predict(pcfood) 


par(mfrow=c(1,2))
plot(xfood[,1:2], type="n")
text(x=xfood[,1], y=xfood[,2], labels=rownames(food))
abline(h=mean(xfood[,1]),lty=2,col=2,lwd=1.5)
abline(v=mean(xfood[,2]),lty=2,col=2,lwd=1.5)
plot(zfood[,1:2], type="n", xlim=c(-4,5))
text(x=zfood[,1], y=zfood[,2], labels=rownames(food))
abline(h=mean(zfood[,1]),lty=2,col=2,lwd=1.5)
abline(v=mean(zfood[,2]),lty=2,col=2,lwd=1.5)



## how do the PCs look?
par(mfrow=c(1,1))
plot(zfood[,1:2], type="n", xlim=c(-4,5))
text(x=zfood[,1], y=zfood[,2], labels=rownames(food))
abline(h=mean(zfood[,1]),lty=2,col=2,lwd=1.5)
abline(v=mean(zfood[,2]),lty=2,col=2,lwd=1.5)


par(mfrow=c(1,1))
plot(pcfood, main="Food Principal Components Variance",xlab="PC")


##### *** rollcall voting *** #####

votes <- read.csv("rollcall-votes.csv")
legis <- read.csv("rollcall-members.csv")

pcavote <- prcomp(votes[,2:1648], scale=TRUE)
plot(pcavote, main="Rollcall-Vote Principle Components",xlab="PC")

names(summary(pcavote))
summary(pcavote)$importance[,1:10]


## the 1st is traditional left-right
loadings <- pcavote$rotation[,1:2]

hist(loadings[,1], main="", xlab="1st Principle Component Vote-Loadings",
     col=8, border=grey(.9))
abline(v=loadings[884,1], col=2)
text(x=loadings[884,1], y=550, "Afford. Health (amdt.)", xpd=TRUE, col=2, font=3)
abline(v=loadings[25,1], col=4)
text(x=loadings[25,1], y=550, "TARP", xpd=TRUE, col=4, font=3)


votepc <- predict(pcavote) 


## What congress person is more extreme?
scores = votepc[,1]
idx = sort(scores, decreasing=TRUE,index.return=T)
scores = scores[idx$ix]


hist(scores, main="", xlab="1st Principle Component Vote-Scores",col=8, border=grey(.9))
abline(v=scores[13], col=4)
text(x=scores[13], y=190,"Royball (CA-34)" , xpd=TRUE, col=4, font=3)
abline(v=scores[256], col=4)
text(x=scores[256], y=190, "Deutch (FL-19)", xpd=TRUE, col=4, font=3)
abline(v=scores[277], col=2)
text(x=scores[277], y=190, "Rosleht (FL-18)", xpd=TRUE, col=2, font=3)
abline(v=scores[435], col=2)
text(x=scores[435], y=190, "Conaway (TX-11)", xpd=TRUE, col=2, font=3)


par(mfrow=c(1,2))
plot(votepc[,1],legis$share, pch=21, bg=(4:2)[legis$party], main="",xlab="PC1",ylab="% Obama")
abline(lsfit(votepc[,1],legis$share),lwd=2)
abline(h=50,col=3,lwd=2,lty=2)
plot(votepc[,1:2], pch=21, bg=(4:2)[legis$party], main="")
abline(v=mean(votepc[,1]),lty=2,col=2,lwd=1.5)



par(mfrow=c(1,2))
plot(votepc[,1],legis$share, pch=21, bg=(4:2)[legis$party], main="",xlab="PC1",ylab="% Obama")
abline(lsfit(votepc[,1],legis$share),lwd=2)
abline(h=50,col=3,lwd=2,lty=2)

plot(votepc[,1],legis$share, pch=21, bg=(4:2)[legis$party], main="",xlab="PC1",ylab="% Obama")
abline(h=50,col=3,lwd=2,lty=2)
points(votepc[legis$flip==1,1],legis$share[legis$flip==1],pch=19,col="magenta")
legend(-38,90,"losers in 2010",pch=19,col="magenta")




summary(lm(legis$share~votepc[,1]))
summary(lm(legis$share~votepc[,1:2]))


### PLS on Roll Call data
#############################
library(pls)

votes1 = as.matrix(votes[,2:1648])

plsParty = plsr(legis$share~votes1,scale=T,ncomp=2)
summary(plsParty)


plsReg = lm(legis$share~plsParty$scores)
pcrReg = lm(legis$share~votepc[,1:2])



par(mfrow=c(1,2))
plot(votepc[,1],legis$share,pch=21, bg=(4:2)[legis$party],xlab="PC1",ylab="% Obama")
abline(lsfit(votepc[,1],legis$share),lwd=2)
plot(plsParty$scores[,1],legis$share,pch=21, bg=(4:2)[legis$party],xlab="Comp1 (PLS)",ylab="% Obama")
abline(lsfit(plsParty$scores[,1],legis$share),lwd=2)



par(mfrow=c(1,2))
plot(pcrReg$fitted,legis$share,pch=21, bg=(4:2)[legis$party],xlab="Fitted",ylab="% Obama",main=paste("PCR","(","R^2=",round(summary(pcrReg)$r.s,3),")"))
abline(0,1)
plot(plsReg$fitted,legis$share,pch=21, bg=(4:2)[legis$party],xlab="Fitted",ylab="% Obama",main=paste("PLS","(","R^2=",round(summary(plsReg)$r.s,3),")"))
abline(0,1)



par(mfrow=c(1,2))
plot(votepc[,1:2], pch=21, bg=(4:2)[legis$party], main="PCR")
abline(v=mean(votepc[,1]),lty=2,col=2,lwd=1.5)
abline(h=mean(votepc[,2]),lty=2,col=2,lwd=1.5)

plot(plsParty$scores, pch=21, bg=(4:2)[legis$party], main="PLS")
abline(v=mean(plsParty$scores[,1]),lty=2,col=2,lwd=1.5)
abline(h=mean(plsParty$scores[,2]),lty=2,col=2,lwd=1.5)








