# Step 1: Load the necessary library
install.packages("jsonlite")
library(jsonlite)

# Step 2: Read the existing product inventory data
# Ensure 'inventory.json' is available in your working directory
inventory_data <- fromJSON("inventory.json")
print(inventory_data)

# Step 3: Create a new product to add to the inventory
new_product <- data.frame(
  product_id = 105,
  name = "Wireless Keyboard",
  category = "Electronics",
  price = 45.50,
  stock = 30,
  stringsAsFactors = FALSE
)

# Step 4: Add the new product to the existing inventory
updated_inventory <- rbind(inventory_data, new_product)
print(updated_inventory)

# Step 5: Write the updated inventory to a new JSON file
# 'pretty = TRUE' ensures the JSON is human-readable with indentation
json_output <- toJSON(updated_inventory, pretty = TRUE)
write(json_output, "updated_inventory.json")
print(json_output)

# Step 6: Verify the update by reading and displaying the new file
verification_data <- fromJSON("updated_inventory.json")
print("--- Updated Product Inventory ---")
print(verification_data)

