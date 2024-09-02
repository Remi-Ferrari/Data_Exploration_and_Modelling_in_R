"""
Summary Statistics

Iris Dataset
"""

head(iris, 5)

summary(iris)
  
library(skimr)
skim(iris)

> iris %>% 
+   dplyr::group_by(Species) %>% 
+   skim() 

