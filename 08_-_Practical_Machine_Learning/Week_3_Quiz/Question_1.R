library(AppliedPredictiveModeling)
data(segmentationOriginal)

train <- segmentationOriginal[segmentationOriginal$Case == "Train", ]
test <- segmentationOriginal[segmentationOriginal$Case == "Test", ]

library(caret)
set.seed(125)
modelFit <- train(Class ~ ., data = train, method = "rpart")

library(rattle)
fancyRpartPlot(modelFit$finalModel)
