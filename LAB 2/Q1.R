weight <- as.numeric(readline("Enter weight (kg): "))
height <- as.numeric(readline("Enter height (m): "))

bmi <- weight / (height^2)

cat("Your BMI is:", round(bmi, 2), "\n")

if (bmi <= 18.4) {
  cat("Category: Underweight\n")
} else if (bmi <= 24.9) {
  cat("Category: Normal\n")
} else if (bmi <= 39.9) {
  cat("Category: Overweight\n")
} else {
  cat("Category: Obese\n")
}
