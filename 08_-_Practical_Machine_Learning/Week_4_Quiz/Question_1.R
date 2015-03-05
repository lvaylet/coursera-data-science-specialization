library(ElemStatLearn)
data(vowel.train)
data(vowel.test)

vowel.train$y <- as.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)

set.seed(33833)

library(caret)

modelFit.RF <- train(y ~ ., method = "rf", data = vowel.train)
modelFit.Boost <- train(y ~ ., method = "gbm", data = vowel.train)

modelFit.RF$finalModel
modelFit.Boost$finalModel

RF.pred <- predict(modelFit.RF, vowel.test)
confusionMatrix(RF.pred, vowel.test$y)

Boost.pred <- predict(modelFit.Boost, vowel.test)
confusionMatrix(Boost.pred, vowel.test$y)
