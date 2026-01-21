# Initialize a list to store team scores
sports_tracker <- list(
  "Team A" = c(90, 85, 88),
  "Team B" = c(78, 82, 79),
  "Team C" = c(88, 92, 90)
)

# 1. Function to add a new team
add_team <- function(tracker, name, scores) {
  tracker[[name]] <- scores
  return(tracker)
}

# 2. Function to remove a team
remove_team <- function(tracker, name) {
  tracker[[name]] <- NULL
  return(tracker)
}

# 3. Calculate average scores and 4. Rank teams
rank_teams <- function(tracker) {
  if (length(tracker) == 0) return("No teams to rank.")
  
  # Calculate averages
  averages <- sapply(tracker, mean)
  
  # Create a data frame for ranking
  ranking_df <- data.frame(
    Team = names(averages),
    AverageScore = as.numeric(averages)
  )
  
  # Sort by average score in descending order
  ranking_df <- ranking_df[order(-ranking_df$AverageScore), ]
  return(ranking_df)
}

# Execute tracking and ranking
cat("Initial Rankings:\n")
print(rank_teams(sports_tracker))

# Adding a new team
sports_tracker <- add_team(sports_tracker, "Team D", c(95, 91, 93))
cat("\nRankings after adding Team D:\n")
print(rank_teams(sports_tracker))

# Removing a team
sports_tracker <- remove_team(sports_tracker, "Team B")
cat("\nFinal Rankings after removing Team B:\n")
print(rank_teams(sports_tracker))

"Parizaa 23BCE0760"
