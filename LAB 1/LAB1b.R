# 1. Generate a sequence of 20 values and compute their squares

seq_values <- seq(from = 1, to = 20)
seq_squares <- seq_values * seq_values
cat("Squares of numbers 1 to 20:\n")
print(seq_squares)
# 2. Display numbers with specific decimal places using round()

value1 <- 0.956786
value2 <- 7.8345901

formatted_v1 <- round(value1, 2)
formatted_v2 <- round(value2, 3)

cat("Value 1 (2 decimal places):", formatted_v1, "\n")
cat("Value 2 (3 decimal places):", formatted_v2, "\n")
# 3. Get radius from user and calculate area of a circle

r <- as.numeric(readline("Please enter the circle radius: "))

circle_area <- pi * r^2

cat("Calculated circle area:", circle_area, "\n")
