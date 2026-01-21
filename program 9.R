# Function to calculate square of a number
calculate_square <- function(number) {
  sq <- number ^ 2
  return(sq)
}

# Test the function with different sets of inputs
num1 <- calculate_square(4)
num2 <- calculate_square(-3)
num3 <- calculate_square(0)
num4 <- calculate_square(5.7)


# Print the test results
cat("Square of 4: ", num1, "\n")
cat("Square of -3: ", num2, "\n")
cat("Square of 0: ", num3, "\n")
cat("Square of 5.7: ", num4, "\n")

"Parizaa 23BCE0760"
