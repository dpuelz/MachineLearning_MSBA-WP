rm(list=ls())

#############################################
# Baseball Examples                         #
#############################################

Data = read.table("RunsPerGame.txt",header=T)
attach(Data)

summary(League)


modelAVG = lm(R.G ~ AVG)

modelSLG = lm(R.G ~ SLG)

modelOBP = lm(R.G ~ OBP)

summary(modelAVG)


plot(AVG,R.G,pch=19,cex=1.5,xlab="AVG",ylab = "Runs per Game")
abline(modelAVG$coef[1],modelAVG$coef[2],col=2,lwd=2)

plot(SLG,R.G,pch=19,cex=1.5,xlab="SLG",ylab = "Runs per Game")
abline(modelSLG$coef[1],modelSLG$coef[2],col=2,lwd=2)

plot(OBP,R.G,pch=19,cex=1.5,xlab="OBP",ylab = "Runs per Game")
abline(modelOBP$coef[1],modelOBP$coef[2],col=2,lwd=2)


#############################################
# House Example                             #
#############################################

House = read.table("housedata.txt",header=T)
attach(House)

plot(Size,Price,pch=19)

Housemodel = lm(Price~Size,data=House)

summary(Housemodel)

names(Housemodel)

names(summary(Housemodel))

confint(Housemodel)
confint(Housemodel,level=0.99)


Xfuture <- data.frame(Size=seq(0,8,by=0.01))


Future1 = predict(Housemodel, Xfuture, interval = "prediction",se.fit=T)
Future2 = predict(Housemodel, Xfuture, interval = "prediction",se.fit=T,level=0.99)


plot(Size,Price,xlim=c(0,8),ylim=range(Future1$fit),pch=19,cex.lab=1.3)
abline(lsfit(Size,Price),lwd=2,col=2)
lines(Xfuture$Size,Future1$fit[,2],col=4,lwd=2,lty=2)
lines(Xfuture$Size,Future1$fit[,3],col=4,lwd=2,lty=2)



#############################################
# Salary Data                               #
#############################################

SalaryData = read.table("SalaryData.txt",header=T)

attach(SalaryData)

plot(Gender,Salary,col="red",lwd=1.5,main="Salary Data")

plot(YrHired,Salary,xlab="Year Hired")
points(YrHired[Gender=="Male"],Salary[Gender=="Male"],col="blue",pch=19)
points(YrHired[Gender=="Female"],Salary[Gender=="Female"],col="red",pch=19)

plot(YrsPrior,Salary)
points(YrHired[Gender=="Male"],Salary[Gender=="Male"],col="red",pch=19)
points(YrHired[Gender=="Female"],Salary[Gender=="Female"],col="blue",pch=19)


model1 = lm(Salary~Gender)

model2 = lm(Salary~Gender+YrHired)
plot(YrHired,Salary,xlab="Year Hired")
abline(coef=model2$coef[c(1,3)],col="red",lwd=2)
points(YrHired[Gender=="Female"],Salary[Gender=="Female"],col="red",pch=19)
abline(coef=c(model2$coef[1]+model2$coef[2],model2$coef[3]),col="blue",lwd=2)
points(YrHired[Gender=="Male"],Salary[Gender=="Male"],col="blue",pch=19)


model3 = lm(Salary~Gender*YrHired)
plot(YrHired,Salary,xlab="Year Hired")
abline(coef=model3$coef[c(1,3)],col="red",lwd=2)
points(YrHired[Gender=="Female"],Salary[Gender=="Female"],col="red",pch=19)
abline(coef=c(model3$coef[1]+model3$coef[2],model3$coef[3]+model3$coef[4]),col="blue",lwd=2)
points(YrHired[Gender=="Male"],Salary[Gender=="Male"],col="blue",pch=19)


Exp = 95-YrHired

model4 = lm(Salary~Gender*Exp)



## Another Housing Data
#######################
rm(list=ls())

MidCity = read.csv("MidCity.csv",header=T)
attach(MidCity)

n = dim(MidCity)[1]

dn1 = rep(0,n)
dn1[Nbhd==1]=1

dn2 = rep(0,n)
dn2[Nbhd==2]=1

dn3 = rep(0,n)
dn3[Nbhd==3]=1

BR = rep(0,n)
BR[Brick=="Yes"]=1


Price = Price/1000
SqFt = SqFt/1000


MidCityModel = lm(Price~dn1+dn2+SqFt)

plot(SqFt,Price,xlab="Size")
abline(coef=MidCityModel$coef[c(1,4)],col=2,lwd=2)
points(SqFt[dn3==1],Price[dn3==1],col=2,pch=19)
abline(coef=c(MidCityModel$coef[1]+MidCityModel$coef[2],MidCityModel$coef[4]),col=4,lwd=2)
points(SqFt[dn1==1],Price[dn1==1],col=4,pch=19)
abline(coef=c(MidCityModel$coef[1]+MidCityModel$coef[3],MidCityModel$coef[4]),col=3,lwd=2)
points(SqFt[dn2==1],Price[dn2==1],col=3,pch=19)
legend(1.45,210,c("Nbhd = 1","Nbhd = 2","Nbhd = 3","Just Size"),lty=c(1,1,1,2),lwd=c(2,2,2,2),col=c(4,3,2,1))
abline(lsfit(SqFt,Price),col=1,lwd=2,lty=2)


Nbhd = factor(Nbhd)

model2 = lm(Price~Nbhd + SqFt + Nbhd:Brick)



############################################
# Telemarketing Example
############################################


Tele = read.table("Tele.txt",header=T)
attach(Tele)

Model1 = lm(calls~months)
summary(Model1)

plot(months,Model1$res,pch=19,cex=1.5,xlab="months",ylab="Std. Res")


months2 = months^2
Model2 = lm(calls~months+months2)
summary(Model2)


plot(months,Model2$res,pch=19,cex=1.5,xlab="months",ylab="Std. Res")

plot(months,calls,pch=19,cex=1.5,col=4)
lines(months,Model2$fitted,lwd=2,col=3)
lines(months,Model1$fitted,lwd=2,col=2)

############################################
# OJ Example
############################################
rm(list=ls())

OJ = read.table("OJ.txt",header=T)
attach(OJ)


model = lm(Sales~Price)

par(mfrow=c(1,2))
plot(Price,Sales,pch=19,col=4,main="Fitted Model")
abline(lsfit(Price,Sales),lwd=2,col=2)

plot(Price,model$res,pch=19,col=2,ylab="residuals",main="Residual Plot")

Logmodel = lm(log(Sales)~log(Price))



par(mfrow=c(1,2))
plot(Price,Sales,pch=19,col=4,main="Plug-in Prediction")
lines(sort(Price),exp(Logmodel$fitted[order(Price)]),pch=19,col=2,lwd=2)
lines(sort(Price),exp(Logmodel$fitted[order(Price)] - 2*0.38),pch=19,col=2,lwd=2,lty=2)
lines(sort(Price),exp(Logmodel$fitted[order(Price)] + 2*0.38),pch=19,col=2,lwd=2,lty=2)

plot(log(Price),log(Sales),pch=19,col=4,main="Plug-in Prediction")
abline(lsfit(log(Price),log(Sales)),lwd=2,col=2)
abline(c(Logmodel$coef[1]-2*0.38,Logmodel$coef[2]),lwd=2,col=2,lty=2)
abline(c(Logmodel$coef[1]+2*0.38,Logmodel$coef[2]),lwd=2,col=2,lty=2)



par(mfrow=c(1,1))
# residual plot...
plot(Price,Logmodel$res,pch=19,col=2,ylab="residuals",main="Residual Plot")


###########################################################
# Airline Example                                         #
###########################################################
rm(list=ls())

Data = read.table("Airline.txt",header=T)
attach(Data)

plot(Passengers,type="l",col=4,lwd=2,xlab="Time",ylab="Passengers")

X = matrix(0,144,11)
for(i in 1:11){
  for(j in 0:11){
    
    X[i+j*12,i]=1
  }
}
X = data.frame(X)
attach(X)

T = 1:144

model1 = lm(Passengers~T)
sig1 = summary(model1)$sigma

plot(Passengers,type="l",col=4,lwd=2,xlab="Time",ylab="Passengers")
abline(model1$coef[1],model1$coef[2],lwd=2,col=2)
legend(20,500,"Fitted Values",col=2,lty=1,lwd=2)


plot(model1$res/sig1,type="b",pch=19,col=4,cex=1.5,ylab="std residuals",xlab="Time",cex.lab=1.4)
abline(h=-2,lty=2,lwd=2,col=2)
abline(h=2,lty=2,lwd=2,col=2)


model2 = lm(log(Passengers)~T)
summary(model2)
sig2 = summary(model2)$sigma


plot(model2$res/sig2,type="b",pch=19,col=4,cex=1.5,ylab="std residuals",xlab="Time",cex.lab=1.4)
abline(h=-2,lty=2,lwd=2,col=2)
abline(h=2,lty=2,lwd=2,col=2)

plot(log(Passengers),type="l",col=4,lwd=2,xlab="Time",ylab="log(Passengers)")
abline(model2$coef[1],model2$coef[2],lwd=2,col=2)
legend(20,6,"Fitted Values",col=2,lty=1,lwd=2)


model3 = lm(log(Passengers)~T+X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11)
sig3 = summary(model3)$sigma

plot(model3$res/sig3,type="b",pch=19,col=4,cex=1.5,ylab="std residuals",xlab="Time",cex.lab=1.4)
abline(h=-2,lty=2,lwd=2,col=2)
abline(h=2,lty=2,lwd=2,col=2)

plot(model3$res[1:143],model3$res[2:144],col=4,cex.lab=1.5,ylab="e(t)",xlab="e(t-1)",pch=19,lwd=1.5,main=paste("corr(e(t),e(t-1))=",round(cor(model3$res[1:143],model3$res[2:144]),3)))

plot(log(Passengers),type="l",col=4,lwd=2,xlab="Time",ylab="log(Passengers)")
lines(T,model3$fitted,col=2,lty=2,lwd=2)
legend(20,6,"Fitted Values",col=2,lty=2,lwd=2)




LogP = log(Passengers[2:144])
LogPlag = log(Passengers[1:143])

X = data.frame(X[2:144,])
attach(X)

T = 1:143

model4 = lm(LogP~T+X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11 + LogPlag)

sig4 = summary(model4)$sigma

plot(model4$res/sig4,type="b",pch=19,col=4,cex=1.5,ylab="std residuals",xlab="Time",cex.lab=1.4)
abline(h=-2,lty=2,lwd=2,col=2)
abline(h=2,lty=2,lwd=2,col=2)

plot(model4$res[1:142],model4$res[2:143],col=4,cex.lab=1.5,ylab="e(t)",xlab="e(t-1)",pch=19,lwd=1.5,main=paste("corr(e(t),e(t-1))=",round(cor(model4$res[1:142],model4$res[2:143]),3)))

plot(LogP,type="l",col=4,lwd=2,xlab="Time",ylab="log(Passengers)")
lines(T,model4$fitted,col=2,lty=2,lwd=2)
legend(20,6,"Fitted Values",col=2,lty=2,lwd=2)



#######################################################
#  California Housing Example (Model Selection)
#######################################################
rm(list=ls())

library(glmnet)


ca <- read.csv("CAhousing.csv")
logMedVal <- log(ca$medianHouseValue)

ca <- ca[,-c(4,5,9)] # lose lmedval and the room totals
n = dim(ca)[1]
tr = sample(1:n,5000)


## create a full matrix of interactions (only necessary for linear model)
## do the normalization only for main variables.
XXca <- model.matrix(~.*longitude*latitude, data=data.frame(scale(ca)))[,-1]
CAdata = data.frame(logMedVal,XXca)


null = lm(logMedVal~1, data=CAdata[tr,])
full = glm(logMedVal~., data=CAdata[tr,])

regForward = step(null, scope=formula(full), direction="forward", k=log(length(tr)))
regBack = step(full, direction="backward", k=log(length(tr)))
regForward = step(null, scope=formula(full), direction="both", k=log(length(tr)))


XXca = scale(XXca)


Lasso.Fit = glmnet(XXca[tr,],logMedVal[tr])
Ridge.Fit = glmnet(XXca[tr,],logMedVal[tr],alpha=0)

par(mfrow=c(1,2))
plot(Lasso.Fit)
plot(Ridge.Fit)

CV.L = cv.glmnet(XXca[tr,], logMedVal[tr],alpha=1)
CV.R = cv.glmnet(XXca[tr,], logMedVal[tr],alpha=0)

LamR = CV.R$lambda.1se
LamL = CV.L$lambda.1se


par(mfrow=c(1,2))
plot(log(CV.R$lambda),sqrt(CV.R$cvm),main="Ridge CV (k=10)",xlab="log(lambda)",ylab = "RMSE",col=4,type="b",cex.lab=1.2)
abline(v=log(LamR),lty=2,col=2,lwd=2)
plot(log(CV.L$lambda),sqrt(CV.L$cvm),main="LASSO CV (k=10)",xlab="log(lambda)",ylab = "RMSE",col=4,type="b",cex.lab=1.2)
abline(v=log(LamL),lty=2,col=2,lwd=2)


coef.R = predict(CV.R,type="coefficients",s=LamR)
coef.L = predict(CV.L,type="coefficients",s=LamL)

par(mfrow=c(1,1))
plot(abs(coef.R[2:20]),abs(coef.L[2:20]),ylim=c(0,1),xlim=c(0,1))
abline(0,1)


### *** European Protein Consumption, in grams/person-day *** ###
##################################################################
rm(list=ls())

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




#######################################################
##### *** rollcall voting *** #####
#######################################################
rm(list=ls())


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

#######################################################
### PLS on Roll Call data
#######################################################
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










