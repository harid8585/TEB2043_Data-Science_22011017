#Q1
# Student scores
marks <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61,
           13, 44, 26, 24, 73, 73, 90, 39, 90, 54)

# Assign grades using nested ifelse
grade_list <- ifelse(marks >= 90, "A (90–100)",
                ifelse(marks >= 80, "B (80–89)",
                ifelse(marks >= 70, "C (70–79)",
                ifelse(marks >= 60, "D (60–69)",
                ifelse(marks >= 50, "E (50–59)",
                       "F (≤49)")))))

# Create grade distribution table
grade_dist <- table(factor(
  grade_list,
  levels = c("A (90–100)", "B (80–89)", "C (70–79)",
             "D (60–69)", "E (50–59)", "F (≤49)")
))

# Determine pass and fail counts
passed <- sum(marks >= 50)
failed <- sum(marks < 50)

# Display results
cat("\n==== GRADE DISTRIBUTION ====\n")
print(grade_dist)

cat("\n==== PASS / FAIL SUMMARY ====\n")
cat("Number of students passed:", passed, "\n")
cat("Number of students failed:", failed, "\n")
