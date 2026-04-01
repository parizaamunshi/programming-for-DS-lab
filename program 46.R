# 1. Install and load the ggplot2 package
install.packages("ggplot2")
library(ggplot2)

# 2. Create a dataframe for the given dataset
plant_data <- data.frame(
  Plant_ID = c(1, 2, 3, 4, 5),
  Growth_Rate = c(3.2, 1.8, 2.6, 0.9, 3.8),
  Condition_Label = c("Sunny", "Shade", "Rainy", "Drought", "Cloudy")
)

# 3. Create the scatter plot with specific formatting requirements
ggplot(data = plant_data, mapping = aes(x = Plant_ID, y = Growth_Rate)) +
  # Points in dodgerblue with size 4
  geom_point(color = "dodgerblue", size = 4) +
  # Text labels below the points in darkorange
  geom_text(aes(label = Condition_Label), 
            color = "darkorange", 
            vjust = 1.5) +
  # Adding axis labels and title
  labs(title = "Scatter Plot of Plant Growth Data",
       x = "Plant ID",
       y = "Growth Rate") +
  # Clean theme for better visualization
  theme_minimal()

