data <- read.csv(url("https://raw.githubusercontent.com/abarahonar/biplots-pca/master/owid-covid-data.csv"), header = TRUE)

# According to the source of the data, the variables that have "smoothed" in the
# name means that "These metrics are averaged versions (over a rolling 7-day
# window) of the daily variables.". This presents two problems:
# 1. I don't understand what it means
# 2. I don't think its that useful

# Remove aggregations of data
# Those are denoted as an iso_code starting with OWID
ptn <- "^[^OWID].*" # This will match anything that doesn't start with OWID
ndx <- grep(ptn, data$iso_code, perl = TRUE)
data.clean <- data[ndx,]
# To test it: unique(data.clean[c("iso_code")])

# TODO: Determine which variables need to go
# Possible variables that need to die:
# Continent (Unnecessary)
# Location (Redundant, can be obtained from iso_code)
# Excess mortality information (83% of the data is NA)
# Human development index (Unnecessary)
# Life expectancy (Unnecessary)
# Hand washing facilities (Unnecessary and 45% of the data is NA)
# ICU and Hospitalization Information (At least 75% of the data is NA)