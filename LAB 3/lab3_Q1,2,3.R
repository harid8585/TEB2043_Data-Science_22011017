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

#Q3
# Create student records
records <- data.frame(
  Student = c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt",
              "Larson", "Holland", "Paul", "Simu", "Renner"),
  Chem = c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59),
  Phys = c(89, 86, 65, 52, 60, 67, 40, 77, 90, 61)
)

# Count failures for each subject
chemistry_failures <- sum(records$Chem < 50)
physics_failures <- sum(records$Phys < 50)

# Find top scorers
top_chem_score <- max(records$Chem)
top_chem_names <- records$Student[records$Chem == top_chem_score]

top_phys_score <- max(records$Phys)
top_phys_names <- records$Student[records$Phys == top_phys_score]

# Output summary
cat("\n--- SUBJECT PERFORMANCE SUMMARY ---\n")
cat("Chemistry failures:", chemistry_failures, "\n")
cat("Physics failures:", physics_failures, "\n")
cat("Best Chemistry score:", top_chem_score, "achieved by", paste(top_chem_names, collapse = " & "), "\n")
cat("Best Physics score:", top_phys_score, "achieved by", paste(top_phys_names, collapse = ", "), "\n")
