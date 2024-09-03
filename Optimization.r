'''
OPtimization through grid search
'''
>
> > library(caret)
> > > tuneGrid <- expand.grid(
+   degree = c(2, 3, 4, 5),
+   scale = c(0.1, 1, 10, 100),
+   C = c(0.1, 1, 10, 100)
+ )
>
> > > set.seed(100)
> Model_poly <- train(
+   Species ~ ., 
+   data = TrainingSet,
+   method = "svmPoly",
+   na.action = na.omit,
+   preProcess = c("scale", "center"),
+   trControl = trainControl(method = "cv", number = 10),
+   tuneGrid = tuneGrid,
+   probability = TRUE
+ )
> > print(Model_poly$bestTune)
> print(Model_poly$results)
> print(best_combinations)
