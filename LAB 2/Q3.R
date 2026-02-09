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
