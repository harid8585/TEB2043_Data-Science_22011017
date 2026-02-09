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
