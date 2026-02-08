#Q1
# Read user input for height and weight
h <- as.numeric(readline("Input your height (meters): "))
w <- as.numeric(readline("Input your weight (kilograms): "))

# BMI calculation
bmi_value <- w / (h * h)
cat("BMI value:", round(bmi_value, 2), "\n")

# Determine BMI category
if (bmi_value < 18.5) {
  bmi_category <- "Underweight"
} else if (bmi_value < 25) {
  bmi_category <- "Normal weight"
} else if (bmi_value < 30) {
  bmi_category <- "Overweight"
} else {
  bmi_category <- "Obese"
}

cat("BMI Category:", bmi_category, "\n")

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

#Q3
# Get user details
user_name <- readline("Please enter your name: ")
user_phone <- readline("Please enter your phone number (at least 7 digits): ")

# Convert name to uppercase
name_caps <- toupper(user_name)

# Extract phone number parts
phone_length <- nchar(user_phone)
prefix <- substring(user_phone, 1, 3)
suffix <- substring(user_phone, phone_length - 3, phone_length)

# Display verification message
cat(
  "Hello,", name_caps,
  "\nA verification code has been sent to",
  paste0(prefix, "-xxx", suffix),
  "\n"
)
