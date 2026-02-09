#Q2
# Accept two text inputs from the user
text_a <- readline("Enter first text: ")
text_b <- readline("Enter second text: ")

# Convert both strings to lowercase and compare
are_same <- tolower(text_a) == tolower(text_b)

cat(
  "String comparison result (case-insensitive):",
  are_same,
  "\n"
)
