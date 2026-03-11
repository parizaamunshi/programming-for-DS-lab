# Step 1: Install and Load the necessary packages and data 
# install.packages("dplyr") 
library(dplyr)
data("starwars", package = "dplyr")

# Step 2: Select relevant columns 
starwars_subset <- starwars %>%
  select(name, species, height, mass, homeworld, gender)

# Step 3: Filter for species with more than two characters
# We use n() to count occurrences within each species group
starwars_filtered <- starwars_subset %>%
  group_by(species) %>%
  filter(n() > 2) %>%
  ungroup()

# Step 4: Create New Columns 
# Convert height to meters and categorize weight
starwars_analysis <- starwars_filtered %>%
  mutate(
    height_m = height / 100,
    weight_cat = case_when(
      mass < 50 ~ "Underweight",
      mass >= 50 & mass <= 100 ~ "Normal",
      mass > 100 ~ "Overweight",
      TRUE ~ "Unknown"
    )
  )

# Step 5: Average height for each species-gender combination 
avg_height_data <- starwars_analysis %>%
  group_by(species, gender) %>%
  summarize(avg_height = mean(height, na.rm = TRUE), .groups = 'drop')

# Step 6: Identify top 3 species with highest average height
top_3_tallest <- avg_height_data %>%
  group_by(species) %>%
  summarize(species_avg = mean(avg_height, na.rm = TRUE)) %>%
  arrange(desc(species_avg)) %>%
  head(3)

# View results 
View(starwars_analysis)
View(avg_height_data)
View(top_3_tallest)
