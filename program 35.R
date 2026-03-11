# ---- Task 1: Create Data Frame from Table ----
RegNo <- c("24BCE1001", "24BCE1002", "24BCE1003", "24BCE1004", "24BCE1005", 
           "24BCE1006", "24BCE1007", "24BCE1008", "24BCE1009", "24BCE1010")
Name <- c("Aadesh Kumar", "Bhavya Reddy", "Charan Iyer", "Divya Sharma", "Esha Nair", 
          "Farhan Khan", "Gayathri Raj", "Harish Kumar", "Ishita Menon", "Jai Verma")
Programme <- rep("B.Tech", 10)
Specialization <- c("CSE", "AI", "DS", "IT", "CSE", "ECE", "Cyber", "AI", "DS", "IT")
Assess1 <- c(18, 15, 20, 14, 20, 12, 17, 16, 19, 18)
Assess2 <- c(17, 16, 19, 15, 20, 14, 18, 17, 18, 17)
Assess3 <- c(19, 14, 18, 15, 19, 13, 17, 16, 19, 16)
Assess4 <- c(18, 18, 20, 16, 20, 16, 19, 15, 18, 19)

students <- data.frame(
  RegNo, Name, Programme, Specialization, 
  Assess1, Assess2, Assess3, Assess4, 
  stringsAsFactors = FALSE
)

cat("--- Initial Data Structure ---\n")
str(students)
print(head(students, 3))

# ---- Task 2: Write Input CSV ----
write.csv(students, "students_input.csv", row.names = FALSE, na = "")

# ---- Task 3: Read from CSV for Analytics ----
students_in <- read.csv("students_input.csv", stringsAsFactors = FALSE)

# ---- Task 4: Per-Student Analytics ----
assess_cols <- c("Assess1", "Assess2", "Assess3", "Assess4")
students_in$Total <- rowSums(students_in[, assess_cols])
students_in$Average <- round(students_in$Total / 4, 2)
students_in$Rank <- rank(-students_in$Total, ties.method = "min")

# Sort by Rank and RegNo
students_by_rank <- students_in[order(students_in$Rank, students_in$RegNo), ]
write.csv(students_by_rank, "students_by_rank.csv", row.names = FALSE)

# ---- Task 5: Assessment-Wise Averages ----
avg_vals <- colMeans(students_in[, assess_cols], na.rm = TRUE)
assessment_wise_averages <- data.frame(
  Assessment = names(avg_vals),
  Average = as.numeric(round(avg_vals, 2))
)
write.csv(assessment_wise_averages, "assessment_wise_averages.csv", row.names = FALSE)

# ---- Task 6: Specialization-Wise Averages ----
spec_avg <- aggregate(
  students_in[, assess_cols],
  by = list(Specialization = students_in$Specialization),
  FUN = mean, na.rm = TRUE
)
spec_avg$Overall_Average <- round(rowMeans(spec_avg[, assess_cols]), 2)
spec_avg <- spec_avg[order(-spec_avg$Overall_Average), ]

write.csv(spec_avg, "specialization_wise_averages.csv", row.names = FALSE)

cat("\n--- Analytics Complete. Files generated: students_by_rank.csv, assessment_wise_averages.csv, specialization_wise_averages.csv ---\n")