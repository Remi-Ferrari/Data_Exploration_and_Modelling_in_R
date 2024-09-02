'''
Clasification Model

This file showcases code used for the construction of the Classification model. Additionally, the file displays code used for the observation of the functioning of the model. 
'''

> set.seed(100)
> 
> TrainingIndex <- createDataPartition(iris$Species, p=0.8, list = FALSE)
> TrainingSet <- iris[TrainingIndex,] 
> TestingSet <- iris[-TrainingIndex,]
>
> Model <- train(Species ~ ., data = TrainingSet,
+                method = "svmPoly",
+                na.action = na.omit,
+                preProcess=c("scale","center"),
+                trControl= trainControl(method="none"),
+                tuneGrid = data.frame(degree=1,scale=1,C=1)
+ )
> Model.cv <- train(Species ~ ., data = TrainingSet,
+                   method = "svmPoly",
+                   na.action = na.omit,
+                   preProcess=c("scale","center"),
+                   trControl= trainControl(method="cv", number=10),
+                   tuneGrid = data.frame(degree=1,scale=1,C=1)
+ )
> Model.training <-predict(Model, TrainingSet)   
> Model.testing <-predict(Model, TestingSet)    
> Model.cv <-predict(Model.cv, TrainingSet) 
>
> print(Model.training.confusion)
> print(Model.testing.confusion)
> print(Model.cv.confusion)
>
> Importance <- varImp(Model)
> plot(Importance)
> plot(Importance)
>
> importance <- varImp(Model, scale = FALSE)
> print(importance)

