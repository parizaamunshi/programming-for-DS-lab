# ---- Task 1 & 2: Create Data Frame and Write Input CSV ----
BranchID <- c("BR001", "BR002", "BR003", "BR004", "BR005", "BR006", "BR007", "BR008", "BR009", "BR010")
BranchName <- c("Vellore Town", "Chennai Central", "Mumbai Andheri", "Pune Hinjewadi", "Delhi Karol Bagh", 
                "Noida Sector 18", "Kolkata Park St", "Hyderabad Hitech", "Ahmedabad CG Rd", "Jaipur MI Road")
Region <- c("South", "South", "West", "West", "North", "North", "East", "South", "West", "North")
Segment <- c("Grocery", "Electronics", "Grocery", "Home", "Apparel", "Electronics", "Grocery", "Home", "Apparel", "Home")
Q1 <- c(120, 140, 110, 95, 150, 132, 105, 128, 115, 108)
Q2 <- c(115, 150, 118, 100, 142, 138, 107, 131, 120, 112)
Q3 <- c(130, 145, 122, 108, 155, 136, 112, 134, 125, 118)
Q4 <- c(125, 160, 120, 112, 158, 140, 115, 137, 129, 121)
Q3_Sales <- Q3  # Explicit column for tracking

branches <- data.frame(BranchID, BranchName, Region, Segment, Q1, Q2, Q3, Q4, Q3_Sales, stringsAsFactors = FALSE)

# Persist to CSV
write.csv(branches, "branches_input.csv", row.names = FALSE, na = "")
cat("--- Input CSV Created: branches_input.csv ---\n")

# ---- Task 3: Read from CSV for Analytics ----
branches_in <- read.csv("branches_input.csv", stringsAsFactors = FALSE)
cat("\n--- Structure of Imported Data ---\n")
str(branches_in)

# ---- Task 4: Per-Branch Analytics ----
q_cols <- c("Q1", "Q2", "Q3", "Q4")
branches_in$Sum <- rowSums(branches_in[, q_cols])
branches_in$Average <- round(branches_in$Sum / 4, 2)
branches_in$Rank <- rank(-branches_in$Sum, ties.method = "min")

# Sort by Rank and then BranchID for stability
branches_by_rank <- branches_in[order(branches_in$Rank, branches_in$BranchID), ]
write.csv(branches_by_rank, "branches_by_rank.csv", row.names = FALSE)
cat("\n--- Per-Branch Analytics Saved ---\n")

# ---- Task 5: Quarter-Wise Averages ----
q_avg_vals <- colMeans(branches_in[, q_cols], na.rm = TRUE)
quarter_wise_averages <- data.frame(
  Quarter = names(q_avg_vals),
  Average = as.numeric(round(q_avg_vals, 2))
)
write.csv(quarter_wise_averages, "quarter_wise_averages.csv", row.names = FALSE)
cat("\n--- Quarter-Wise Averages Saved ---\n")

# ---- Task 6: Region-Wise Averages ----
region_wise_avg <- aggregate(
  branches_in[, q_cols],
  by = list(Region = branches_in$Region),
  FUN = mean, na.rm = TRUE
)
region_wise_avg$Overall_Average <- round(rowMeans(region_wise_avg[, q_cols]), 2)
region_wise_avg <- region_wise_avg[order(-region_wise_avg$Overall_Average), ]

write.csv(region_wise_avg, "region_wise_averages.csv", row.names = FALSE)
cat("\n--- Region-Wise Averages Saved ---\n")
