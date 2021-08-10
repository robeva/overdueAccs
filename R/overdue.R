usethis::use_testthat()
library(testthat)

# Load functions file
setwd("C:/Users/robev/Documents/Companies_House/overdueAccs/R")
getwd()
source("functions.R")

# Call function
my_function(3,4)

# Read CSV file
ch_data <- read.csv("BasicCompanyData-2021-07-01-part1_6.csv", header = T)
ch_data

# Summary of ch_data
summary(ch_data)

# Get a dataframe with only 3 columns (discard the rest)
all_companies <- ch_data[c("CompanyName", "CompanyStatus", "Accounts.NextDueDate")]

# Get all active companies (discard the rest)
active <- all_companies[all_companies$CompanyStatus == "Active", ]
active

# Convert date column to R date
active$Accounts.Due = as.Date(active$Accounts.NextDueDate, "%d/%m/%Y")
summary(active)

# Get current date
current <- Sys.Date()
class(current)

# Append column with overdue dates and select only these rows
active$due <- active$Accounts.Due - current
overdue <- active[active$due <0, ]
# na.omit gets rid of any row with N/A
overdue <- na.omit(overdue)
overdue

# Calculate percentage of overdue accounts ... pod
all_companies_number <- nrow(all_companies)
all_companies_active <- nrow(active)
overdue_number <- nrow(overdue)
overdue_number
all_companies_active

pod <- (overdue_number / all_companies_active) * 100
print("Percentage overdue is ", pod)

# double % in the following expression prints the % symbol
# .1 is 1 decimal place
sprintf("The percentage of overdue accounts is %.1f%%", pod)

