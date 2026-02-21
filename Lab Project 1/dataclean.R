#HARIDVARNA RAMAN
#22011017

library(tidyverse)
library(lubridate)

# Read dataset file and convert encoding to UTF-8
raw_lines <- readLines("/content/Unclean Dataset.csv", encoding = "latin1")
raw_lines <- iconv(raw_lines, from = "latin1", to = "UTF-8", sub = "")
data_lines <- raw_lines[-1]
data_lines <- data_lines[data_lines != ""]

# Separate rows depending on whether they use pipe or comma delimiter
pipe_rows  <- data_lines[str_count(data_lines, "\\|") == 7]
comma_rows <- data_lines[str_count(data_lines, "\\|") != 7]

# Convert pipe-separated rows into dataframe format
df_pipe <- pipe_rows %>%
  strsplit("\\|") %>%
  lapply(function(x) trimws(gsub(",+$", "", trimws(x)))[1:8]) %>%
  do.call(rbind, .) %>%
  as.data.frame(stringsAsFactors = FALSE)

# Convert comma-separated rows into dataframe format
df_comma <- comma_rows %>%
  strsplit(",") %>%
  lapply(function(x) {
    x <- trimws(x)
    if (length(x) > 8) x <- c(x[1:7], paste(x[8:length(x)], collapse = ""))
    if (length(x) < 8) x <- c(x, rep(NA, 8 - length(x)))
    x[1:8]
  }) %>%
  do.call(rbind, .) %>%
  as.data.frame(stringsAsFactors = FALSE)

# Define and assign column headers
col_names <- c("Student_ID", "First_Name", "Last_Name", "Age",
               "Gender", "Course", "Enrollment_Date", "Total_Payments")
colnames(df_pipe)  <- col_names
colnames(df_comma) <- col_names

# Merge both datasets together
df <- bind_rows(df_pipe, df_comma)

# Convert empty strings and placeholder values into actual NA values
df[df == "" | df == "NA" | df == "N/A"] <- NA

# Remove rows that were incorrectly split during parsing
df <- df[!grepl("\\|", df$Student_ID), ]

# Drop duplicate records
df <- df[!duplicated(df), ]

# Ensure each record has at least one valid name
df$First_Name[is.na(df$First_Name)] <- "Unknown"
df$Last_Name[is.na(df$Last_Name)]   <- "Unknown"
df <- df[!(df$First_Name == "Unknown" & df$Last_Name == "Unknown"), ]

# Handle cases where first and last names are duplicated
dup_name <- df$First_Name == df$Last_Name & !is.na(df$First_Name)
df$Last_Name[dup_name] <- NA
two_word <- dup_name & str_count(df$First_Name, "\\S+") >= 2
df$Last_Name[two_word]  <- word(df$First_Name[two_word], -1)
df$First_Name[two_word] <- word(df$First_Name[two_word], 1)
df$Last_Name[is.na(df$Last_Name)] <- "Unknown"

# Adjust entries where first name contains two words
two_word_first <- str_count(df$First_Name, "\\S+") >= 2 & df$Last_Name == "Unknown"
df$Last_Name[two_word_first]  <- word(df$First_Name[two_word_first], -1)
df$First_Name[two_word_first] <- word(df$First_Name[two_word_first], 1)

# Ensure Student_ID is numeric and generate new IDs if needed
non_numeric_id <- is.na(suppressWarnings(as.numeric(df$Student_ID)))
max_id <- max(suppressWarnings(as.numeric(df$Student_ID[!non_numeric_id])), na.rm = TRUE)
df$Student_ID[non_numeric_id] <- as.character(seq(max_id + 1, max_id + sum(non_numeric_id)))

# Clean Age column and replace invalid values with mean age
df$Age <- suppressWarnings(as.numeric(gsub("[^0-9]", "", df$Age)))
df$Age[df$Age < 15 | df$Age > 35 | is.na(df$Age)] <- round(mean(df$Age[df$Age >= 15 & df$Age <= 35], na.rm = TRUE))

# Standardize Gender values and fill missing with most common gender
df$Gender <- toupper(gsub("[^MmFf]", "", df$Gender))
df$Gender <- recode(df$Gender, "M" = "Male", "F" = "Female")
df$Gender[is.na(df$Gender) | df$Gender == ""] <- names(sort(table(df$Gender), decreasing = TRUE))[1]

# Clean and standardize Course names
df$Course <- str_to_title(trimws(df$Course))
df$Course <- recode(df$Course,
                    "Machine Learnin" = "Machine Learning",
                    "Web Developmen"  = "Web Development",
                    "Web Developmet"  = "Web Development",
                    "Web Develpment"  = "Web Development",
                    "4"               = NA_character_)
df$Course[is.na(df$Course)] <- names(sort(table(df$Course), decreasing = TRUE))[1]

# Convert Enrollment_Date into proper date format and fix invalid dates
df$Enrollment_Date <- suppressWarnings(
  parse_date_time(df$Enrollment_Date, orders = c("Ymd", "dmy", "dmY"), quiet = TRUE) %>% as.Date()
)
df$Enrollment_Date[df$Enrollment_Date < as.Date("2019-01-01") | is.na(df$Enrollment_Date)] <-
  median(df$Enrollment_Date[df$Enrollment_Date >= as.Date("2019-01-01")], na.rm = TRUE)

# Clean Total_Payments column and cap unrealistic values
df$Total_Payments <- suppressWarnings(as.numeric(gsub("[^0-9.]", "", df$Total_Payments)))
df$Total_Payments[df$Total_Payments > 10000 | is.na(df$Total_Payments)] <-
  median(df$Total_Payments[df$Total_Payments <= 10000], na.rm = TRUE)

# Final formatting of name columns
df$First_Name <- str_to_title(trimws(df$First_Name))
df$Last_Name  <- str_to_title(trimws(df$Last_Name))

# Export cleaned dataset and display summary
write.csv(df, "Cleaned_Dataset.csv", row.names = FALSE)
cat("Cleaned_Dataset saved. \n Rows:", nrow(df), "\n")
print(colSums(is.na(df)))
