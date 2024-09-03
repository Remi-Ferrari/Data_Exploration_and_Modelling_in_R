"""
Models used 

Models below only differ in methods. 
All methods were based on the classification models of support vector machines. 
Different parameters where used throughout the project. 
"""

#svmPoly
Model <- train(Species ~ ., data = TrainingSet,
               method = "svmPoly",
               na.action = na.omit,
               preProcess=c("scale","center"),
               trControl= trainControl(method="none"),
               tuneGrid = data.frame(degree=1,scale=1,C=1)
)

#svmPoly Cross-validation
Model.cv <- train(Species ~ ., data = TrainingSet,
                  method = "svmPoly",
                  na.action = na.omit,
                  preProcess=c("scale","center"),
                  trControl= trainControl(method="cv", number=10),
                  tuneGrid = data.frame(degree=1,scale=1,C=1)
)
#svmRadial
Model <- train(Species ~ ., data = TrainingSet,
               method = "svmRadial",
               na.action = na.omit,
               preProcess=c("scale","center"),
               trControl= trainControl(method="none"),
               tuneGrid = data.frame(sigma=1, C=1)
)

#svmRadial Cross-validation
Model.cv <- train(Species ~ ., data = TrainingSet,
                  method = "svmRadial",
                  na.action = na.omit,
                  preProcess=c("scale","center"),
                  trControl= trainControl(method="cv", number=10),
                  tuneGrid = data.frame(sigma=1, C=1)
)
#svmLinear
Model <- train(Species ~ ., data = TrainingSet,
               method = "svmLinear",
               na.action = na.omit,
               preProcess=c("scale","center"),
               trControl= trainControl(method="none"),
               tuneGrid = data.frame(C=1)
)

#svmLinear Cross-validation
Model.cv <- train(Species ~ ., data = TrainingSet,
                  method = "svmLinear",
                  na.action = na.omit,
                  preProcess=c("scale","center"),
                  trControl= trainControl(method="cv", number=10),
                  tuneGrid = data.frame(C=1)
)
#Keep in mind that if all tunegrid values are held at 1, all the above models are effectively the same. 
