library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

set.seed(33833)

vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)

modelFit <- train(y ~ ., method = "rf", data = vowel.train)

varImpPlot(modelFit$finalModel, sort = TRUE)
