## Bootstrapping example

library(mosaic)
library(tidyverse)
library(ggplot2)
library(usmap)
library(lubridate)
library(randomForest)
library(splines)
library(pdp)

#######################
###### EXAMPLE 1 ######
#######################

creatinine = read.csv("../data/creatinine.csv", header=TRUE)
head(creatinine)

### Bootstrapping the sample mean

# Look at the mean creatinine clearance rate
mean(creatinine$creatclear)

# OK, 125.25 +/- what?
# Bootstrap to get a standard error
boot1 = do(10000)*{
  mean(resample(creatinine)$creatclear)
}

hist(boot1$result, 30)
sd(boot1$result)

# Interpetation: our sample mean is probably off from the true population mean by about 0.95 units

# confidence interval: a range of plausible values for the population parameter, in light of the sample estimate
confint(boot1, level=0.95)


#### Bootstrapping the OLS estimator
plot(creatclear~age, data=creatinine,
     pch=19, col='grey', bty='n',
     ylab="creatinine score", xlab="Age")

lm1 = lm(creatclear~age, data=creatinine)
abline(lm1, lwd=2, col='blue')
coef(lm1)

# Bootstrap
boot1 = do(10000)*lm(creatclear~age, data=resample(creatinine))
head(boot1)

hist(boot1$Intercept)
hist(boot1$age)

# bootstrapped standard errors
sd(boot1$Intercept)
sd(boot1$age)
summary(lm1)

# confidence intervals
confint(boot1)


#######################
###### EXAMPLE 2 ######
#######################

# Power demand
# Note: before loading the data,
# you'll first need to unzip the ercot folder
# (too big for GitHub if not compressed)

# Power grid load every hour for 6 1/2 years
# throughout the 8 ERCOT regions of Texas
# units of grid load are megawatts.
# This represents peak instantaneous demand for power in that hour.
# source: scraped from the ERCOT website
load_data = read.csv("../data/load_data.csv")
head(load_data)

# Now weather data at hundreds of weather stations
# throughout Texas and the surrounding region
# Note: I've imputed a handful of sporadic missing values
# Source: National Weather Service
temperature_impute = read.csv("../data/temperature_impute.csv", row.names=1)
station_data = read.csv("../data/station_data.csv", row.names=1)

# take a peak at the weather station data
head(temperature_impute)
head(station_data)

####
# Data cleaning
####

# some dates have completely missing weather data
# Keep the load data for dates when we have weather data
mysub = which(ymd_hms(load_data$Time) %in% ymd_hms(rownames(temperature_impute)))
load_data = load_data[mysub,]

# De-duplicate the weather data by merging on first match of date in the load data
temp_ind = match(ymd_hms(load_data$Time), ymd_hms(rownames(temperature_impute)))
temperature_impute = temperature_impute[temp_ind,]

# Take the time stamps from the load data
time_stamp = ymd_hms(load_data$Time)

# Verify that the time stamps match row by row across the two data frames
all(time_stamp ==  ymd_hms(rownames(temperature_impute)))

# a lot of these station names are in Mexico or the Gulf
# and we don't have temperature data on them
station_data = subset(station_data, state != 'MX')

# Make a map.
# First, project project the lon, lat coordinates
# to the same coordinate system used by usmap
station_map = station_data %>%
  select(lon, lat) %>%
  usmap_transform 

head(station_map)

# now merge these coordinates station name
station_data = station_data %>% rownames_to_column('station')
station_data = merge(station_data, station_map, by=c('lat', 'lon'))
head(station_data)

load_combined = data.frame(load_data, 
                           hour = hour(time_stamp),
                           day = wday(time_stamp),
                           month = month(time_stamp),
                           pc_weather$x)

KHOU_squared = load_combined$KHOU^2
load_combined$KHOU_squared = KHOU_squared
numboot = 200
lm2 = do(numboot)*(lm(COAST ~ KHOU + KHOU_squared, data=resample(load_combined)))

plot(load_combined$KHOU,load_combined$COAST,col=rgb(0,0,0,alpha=0.1),pch=19,cex=0.8)

x = load_combined$KHOU
xmin = floor(min(x))
xmax = floor(max(x))
xnew = seq(xmin,xmax,length.out=500)

quadfit = array(NA,c(numboot,length(xnew)))
for(ii in 1:numboot){
  quadfit[ii,] = lm2$Intercept[ii] + lm2$KHOU[ii]*xnew +   lm2$KHOU_squared[ii]*xnew^2
  lines(xnew,quadfit[ii,],col=rgb(1,0,0,alpha=0.3),lwd=1)
}

# smaller sample
load_combined_small = sample(load_combined,50)
KHOU_squared = load_combined_small$KHOU^2
load_combined_small$KHOU_squared = KHOU_squared
numboot = 200
lm2 = do(numboot)*(lm(COAST ~ KHOU + KHOU_squared, data=resample(load_combined_small)))

plot(load_combined_small$KHOU,load_combined_small$COAST,col=rgb(0,0,0,alpha=0.1),pch=19,cex=0.8)
x = load_combined_small$KHOU
xmin = floor(min(x))
xmax = floor(max(x))
xnew = seq(xmin,xmax,length.out=500)
quadfit = array(NA,c(numboot,length(xnew)))
for(ii in 1:numboot){
  quadfit[ii,] = lm2$Intercept[ii] + lm2$KHOU[ii]*xnew +   lm2$KHOU_squared[ii]*xnew^2
  lines(xnew,quadfit[ii,],col=rgb(1,0,0,alpha=0.3),lwd=1)
}



