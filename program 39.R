# Step 1: Load library
library(dplyr)

# Step 2: Create Customers Dataset
customers <- data.frame(
  CustomerName = c("John Doe", "Jane Smith", "Robert Brown", "Emily Davis", "Michael Green"),
  Email = c("john.doe@example.com", "jane.smith@example.com", "robert.brown@example.com", 
            "emily.davis@example.com", "michael.green@example.com"),
  stringsAsFactors = FALSE
)

# Step 3: Create Purchases Dataset
purchases <- data.frame(
  CustomerName = c("John Doe", "Jane Smith", "Sarah Johnson", "Emily Davis"),
  PurchaseAmount = c(150, 300, 180, 220),
  Date = c("01-01-2023", "02-01-2023", "04-01-2023", "05-01-2023"),
  stringsAsFactors = FALSE
)

# Step 4: Perform Join Operations
left_join_res <- left_join(customers, purchases, by = "CustomerName")
right_join_res <- right_join(customers, purchases, by = "CustomerName")
inner_join_res <- inner_join(customers, purchases, by = "CustomerName")
full_join_res <- full_join(customers, purchases, by = "CustomerName")

# Step 5: Display Results
print("--- Left Join ---")
print(left_join_res)

print("--- Right Join ---")
print(right_join_res)

print("--- Inner Join ---")
print(inner_join_res)

print("--- Full Join ---")
print(full_join_res)