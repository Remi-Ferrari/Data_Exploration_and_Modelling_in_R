"""
Observing Model Decision Boundaries
"""

> #Please Note that features used in the 2D plot need to be specified in the model when coding.
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
