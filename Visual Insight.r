'''
Visual insights of iris dataset
'''

#Panel Plots
plot(iris)

#Scatter Plot
#Sepal Length vs Sepal Width
#Colour can be added through ", col="xxx"" within plot arguments
plot(iris$Petal.Width, iris$Petal.Length)

#Histogram
hist(iris$Sepal.Width)

#Feature Plots
#import caret library
featurePlot(x = iris[,1:4], 
             y = iris$Species,  
             plot = "box",
             strip=strip.custom(par.strip.text=list(cex=.7)),
             scales = list(x = list(relation="free"), 
                           y = list(relation="free")))
