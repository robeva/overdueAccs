# Show example data
ex <- example()
ex

# Read CSV file
ch_data <- read.csv("../../CH_backup/data/BasicCompanyData-2021-07-01-part1_6.csv", header = T)

pod <- overdue(ch_data)
pod

# double % in the following expression prints the % symbol
# .1 is 1 decimal place
sprintf("The percentage of overdue accounts is %.1f%%", pod)
