# 1. Load Libraries
install.packages("ggplot2")
install.packages("plotly")
library(ggplot2)
library(plotly)

# 2. Load Dataset
data(iris)

# --- Task 1: Static Visualization ---
static_plot <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point(size = 2) +
  labs(title = "Static Iris Data: Sepal vs Petal Width",
       x = "Sepal Width",
       y = "Petal Width")

print(static_plot)

# --- Task 2: Converting Static to Interactive ---
interactive_converted <- ggplotly(static_plot)
interactive_converted

# --- Task 3: Interactive Visualization using plot_ly() ---
direct_interactive <- plot_ly(data = iris, 
                              x = ~Sepal.Width, 
                              y = ~Petal.Width, 
                              color = ~Species, 
                              type = 'scatter', 
                              mode = 'markers') %>%
  layout(title = "Iris Data Set Visualization",
         xaxis = list(title = "Sepal Width", ticksuffix = "cm"),
         yaxis = list(title = "Petal Width", ticksuffix = "cm"))

direct_interactive
