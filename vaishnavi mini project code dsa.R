# ------------------------------------------------------------
# STEP 0: (Only run once) Install packages if you haven't already
# ------------------------------------------------------------
# install.packages("tidyverse")
# install.packages("corrplot")
# install.packages("DataExplorer")

# ------------------------------------------------------------
# STEP 1: Load required libraries
# ------------------------------------------------------------
library(tidyverse)   # loads ggplot2, dplyr, readr, tidyr, etc.
library(corrplot)
library(DataExplorer)

# ------------------------------------------------------------
# STEP 2: Import your dataset (safe - choose file) OR use working dir
# ------------------------------------------------------------
# Option A (safe - choose file):
# data <- read.csv(file.choose())

# Option B (if file is in working directory):
data <- read.csv("survey.csv", stringsAsFactors = FALSE)

 o# Quick checks
head(data)
str(data)
summary(data)
names(data)

# ------------------------------------------------------------
# STEP 3: Data Cleaning
# ------------------------------------------------------------
# Check missing values per column
colSums(is.na(data))

# Create a cleaned copy (remove rows with any NA)
data_clean <- na.omit(data)

# ------------------------------------------------------------
# STEP 4: Univariate Analysis - Age
# ------------------------------------------------------------
# Make sure Age is numeric
data_clean$Age <- as.numeric(data_clean$Age)

ggplot(data_clean, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Age", x = "Age", y = "Count") +
  theme_minimal()


# ------------------------------------------------------------
# STEP 4b: Clean + Plot Gender (use data_clean as source)
# ------------------------------------------------------------
# copy to a working object for gender-cleaning
survey_data_clean <- data_clean

# Ensure Gender column exists
if(! "Gender" %in% colnames(survey_data_clean)) {
  stop("No 'Gender' column found. Check column names with names(data).")
}

# Normalize text: trim spaces and lowercase
survey_data_clean$Gender <- tolower(trimws(survey_data_clean$Gender))

# Map many common variants to "male" and "female"
male_variants <- c("m","male","cis male","cis man","man","make","mal","malr","maile","mail","msle","male (cis)",
                   "male-ish","guy (-ish) ^_^","something kinda male?","ostensibly male, unsure what that really means")
female_variants <- c("f","female","cis female","woman","femail","femake","female (cis)","female (trans)",
                     "trans-female","trans woman","cis-female/femme")

survey_data_clean$Gender[survey_data_clean$Gender %in% male_variants] <- "male"
survey_data_clean$Gender[survey_data_clean$Gender %in% female_variants] <- "female"

# Anything not male/female -> other
survey_data_clean$Gender[! survey_data_clean$Gender %in% c("male","female")] <- "other"

# Check cleaned counts and plot
print(table(survey_data_clean$Gender, useNA = "ifany"))

ggplot(survey_data_clean, aes(x = Gender, fill = Gender)) +
  geom_bar() +
  geom_text(stat='count', aes(label=..count..), vjust=-0.3) +
  labs(title = "Gender Distribution (Cleaned)", x = "Gender", y = "Count") +
  theme_minimal()

# ------------------------------------------------------------
# STEP 5: Bivariate Analysis
# Note: check that these columns exist exactly as named in your dataset
# ------------------------------------------------------------
# Example: Age vs treatment
if("treatment" %in% colnames(data_clean)) {
  ggplot(data_clean, aes(x = Age, fill = treatment)) +
    geom_histogram(binwidth = 5, color = "black", position = "stack") +
    labs(title = "Age vs Mental Health Treatment", x = "Age", y = "Count") +
    theme_minimal()
} else {
  message("Column 'treatment' not found - skipping Age vs Treatment plot.")
}

# Family history vs Treatment (proportion)
if(all(c("family_history","treatment") %in% colnames(data_clean))) {
  ggplot(data_clean, aes(x = family_history, fill = treatment)) +
    geom_bar(position = "fill") +
    labs(title = "Family History vs Treatment (Proportion)", x = "Family History", y = "Proportion") +
    theme_minimal()
} else {
  message("Columns 'family_history' or 'treatment' missing - skipping plot.")
}

# Work interference vs Treatment
if(all(c("work_interfere","treatment") %in% colnames(data_clean))) {
  ggplot(data_clean, aes(x = work_interfere, fill = treatment)) +
    geom_bar(position = "dodge") +
    labs(title = "Work Interference vs Treatment", x = "Work Interference", y = "Count") +
    theme_minimal()
} else {
  message("Columns 'work_interfere' or 'treatment' missing - skipping plot.")
}

# ------------------------------------------------------------
# STEP 6: Correlation (numeric columns only)
# ------------------------------------------------------------
num_data <- select_if(data_clean, is.numeric)
num_cols <- ncol(num_data)
message("Number of numeric columns: ", num_cols)

if (num_cols > 1) {
  corr_matrix <- cor(num_data, use = "complete.obs")
  corrplot(corr_matrix, method = "color", addCoef.col = "black",
           tl.col = "black", tl.srt = 45)
} else {
  message("Correlation plot skipped – only ", num_cols, " numeric column(s) available.")
}


# ------------------------------------------------------------
# STEP 8: Quick checks you can run interactively
# ------------------------------------------------------------
# How many numeric columns?
num_data <- select_if(data_clean, is.numeric)
ncol(num_data)

# Current working directory (where files like survey_report.html are saved)
getwd()

# Show column names (useful if any named differently)
colnames(data_clean)
