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

plot(abs(coef.R[2:20]),abs(coef.L[2:20]),ylim=c(0,1),xlim=c(0,1))
abline(0,1)




