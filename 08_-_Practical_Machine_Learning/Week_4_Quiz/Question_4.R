library(lubridate)  # For year() function below
dat = read.csv("http://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)
tstest = ts(testing$visitsTumblr)

library(forecast)
fit <- bats(tstrain)
fcast <- forecast(fit, level = 95, h = nrow(testing))

accuracy(fcast, testing$visitsTumblr)

result <- c()
l <- length(fcast$lower)

for (i in 1:l){
  x <- testing$visitsTumblr[i]
  a <- fcast$lower[i] < x & x < fcast$upper[i]
  result <- c(result, a)
}

sum(result)/l * 100
