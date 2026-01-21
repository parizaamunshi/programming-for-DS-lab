# Initialize a list to store library books and their borrowers
library_system <- list(
  "The Hobbit" = c("Alice", "Bob"),
  "1984" = c("Charlie", "Alice"),
  "Moby Dick" = c("Bob")
)

# 1. Function to add a new book with borrowers
add_book <- function(system, title, borrowers) {
  system[[title]] <- borrowers
  return(system)
}

# 2. Function to remove a book from the system
remove_book <- function(system, title) {
  system[[title]] <- NULL
  return(system)
}

# 3. Function to calculate borrower counts and find extremes
analyze_library <- function(system) {
  if (length(system) == 0) return("The library is empty.")
  
  # Calculate total borrowers for each book
  borrower_counts <- sapply(system, length)
  
  # Identify highest and lowest
  max_book <- names(borrower_counts)[which.max(borrower_counts)]
  min_book <- names(borrower_counts)[which.min(borrower_counts)]
  
  # Display Results
  cat("Borrower Counts per Book:\n")
  print(borrower_counts)
  cat("\nBook with Highest Number of Borrowers:", max_book, "(", max(borrower_counts), ")\n")
  cat("Book with Lowest Number of Borrowers:", min_book, "(", min(borrower_counts), ")\n")
}

# Running the analysis
analyze_library(library_system)

# Adding a new book
library_system <- add_book(library_system, "The Great Gatsby", c("Daisy", "Tom", "Nick"))
cat("\n--- After adding 'The Great Gatsby' ---\n")
analyze_library(library_system)

# Removing a book
library_system <- remove_book(library_system, "Moby Dick")
cat("\n--- After removing 'Moby Dick' ---\n")
analyze_library(library_system)

"Parizaa 23BCE0760"
