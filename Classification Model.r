'''
Clasification Model

This file showcases code used for the construction of the Classification model.
Additionally, the file displays code used for the observation of the functioning of the model. 
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
+                tuneGrid = data.frame(degree=1,scale=1,C=1),
+                probability = TRUE
+ )
> Model.cv <- train(Species ~ ., data = TrainingSet,
+                   method = "svmPoly",
+                   na.action = na.omit,
+                   preProcess=c("scale","center"),
+                   trControl= trainControl(method="cv", number=10),
+                   tuneGrid = data.frame(degree=1,scale=1,C=1),
+                   probability = TRUE
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
>
> #Please Note that features used in the 2D plot need to be specified in the model
> grid <- expand.grid(Sepal.Length = seq(min(iris$Sepal.Length), max(iris$Sepal.Length), length.out = 100),
+                     Petal.Length = seq(min(iris$Petal.Length), max(iris$Petal.Length), length.out = 100))
> 
> grid$Species <- predict(NewModel, newdata = grid)
> 
> 
> 
> ggplot() +
+     geom_tile(data = grid, aes(x = Sepal.Length, y = Petal.Length, fill = Species), alpha = 0.3) +
+     geom_point(data = iris, aes(x = Sepal.Length, y = Petal.Length, color = Species), size = 2) +
+     labs(title = "Decision Boundaries of SVM with Polynomial Kernel",
+          x = "Sepal Length",
+          y = "Petal Length") +
+     theme_minimal()
