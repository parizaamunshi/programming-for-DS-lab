# ---- Task 1: Create Column Vectors ----
PatientID <- c("HOS1001", "HOS1002", "HOS1003", "HOS1004", "HOS1005", 
               "HOS1006", "HOS1007", "HOS1008", "HOS1009", "HOS1010")
Name <- c("Arjun Menon", "Bhavana Iyer", "Chirag Gupta", "Devika Nair", "Eshwar Rao", 
          "Farida Sheikh", "Gaurav Kumar", "Harini Krishnan", "Ishita S", "Jatin Verma")
Department <- c("Cardiology", "Neurology", "Endocrinology", "Pulmonology", "Cardiology", 
                "Endocrinology", "Neurology", "Pulmonology", "Cardiology", "Endocrinology")
Diagnosis <- c("Hypertension", "Migraine", "Type-2 Diabetes", "Asthma", "Hypertension", 
               "Thyroid Disorder", "Epilepsy", "COPD", "Arrhythmia", "Type-1 Diabetes")
Test1 <- c(82, 71, 90, 64, 95, 60, 78, 68, 87, 83)
Test2 <- c(76, 69, 92, 70, 94, 63, 82, 72, 85, 79)
Test3 <- c(88, 73, 86, 67, 93, 61, 79, 70, 90, 77)
Test4 <- c(84, 75, 91, 72, 96, 66, 81, 69, 88, 85)
Test3_Score <- Test3  # Explicit column as per instructions

# ---- Task 2: Build the Data Frame ----
patients <- data.frame(
  PatientID, Name, Department, Diagnosis, 
  Test1, Test2, Test3, Test4, Test3_Score,
  stringsAsFactors = FALSE
)
cat("--- Structure of Patients Data Frame ---\n")
str(patients)
cat("\n--- Head of Patients Data Frame ---\n")
print(head(patients))

# ---- Task 3: Patient-Level Sum, Average, Rank ----
test_cols <- c("Test1", "Test2", "Test3", "Test4")
patients$Sum <- rowSums(patients[, test_cols])
patients$Average <- round(patients$Sum / 4, 2)

# Tie strategy: "min" (Competition ranking: 1, 2, 2, 4...)
patients$Rank <- rank(-patients$Sum, ties.method = "min")

cat("\n--- Sorted Patients by Rank ---\n")
patients_sorted <- patients[order(patients$Rank), ]
print(patients_sorted)

# ---- Task 4: Test-Wise Average (Overall) ----
test_wise_avg <- colMeans(patients[, test_cols])
cat("\n--- Test-Wise Averages Across All Patients ---\n")
print(round(test_wise_avg, 2))

# ---- Task 5: Department-Wise Averages ----
dept_avg <- aggregate(
  patients[, test_cols],
  by = list(Department = patients$Department),
  FUN = mean
)
dept_avg$Overall_Average <- round(rowMeans(dept_avg[, test_cols]), 2)

cat("\n--- Department-Wise Summary ---\n")
print(dept_avg[order(-dept_avg$Overall_Average), ])
