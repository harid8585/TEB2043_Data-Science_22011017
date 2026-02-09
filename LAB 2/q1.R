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
