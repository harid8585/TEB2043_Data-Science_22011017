#Q2
# Store student information
students <- data.frame(
  student_name = c("Robert", "Hemsworth", "Scarlett", "Evans",
                   "Pratt", "Larson", "Holland", "Paul", "Simu", "Renner"),
  mark = c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)
)

# Calculate statistics
max_mark <- max(students$mark)
min_mark <- min(students$mark)
avg_mark <- mean(students$mark)

# Identify students with extreme scores
top_students <- students$student_name[students$mark == max_mark]
bottom_students <- students$student_name[students$mark == min_mark]

# Display results
cat("\nScore Analysis Summary\n")
cat("Highest score:", max_mark, "\n")
cat("Lowest score:", min_mark, "\n")
cat("Average score:", round(avg_mark, 2), "\n")

cat("Top scoring student(s):", paste(top_students, collapse = " & "), "\n")
cat("Lowest scoring student(s):", paste(bottom_students, collapse = ", "), "\n")
