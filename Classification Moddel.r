'''
Clasification Model
'''

set.seed(100)
 
TrainingIndex <- createDataPartition(iris$Species, p=0.8, list = FALSE)
TrainingSet <- iris[TrainingIndex,] 
TestingSet <- iris[-TrainingIndex,] 
