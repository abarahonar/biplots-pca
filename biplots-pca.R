data <- read.csv(url("https://raw.githubusercontent.com/abarahonar/biplots-pca/master/owid-covid-data.csv"), header = TRUE)

# According to the source of the data, the variables that have "smoothed" in the
# name means that "These metrics are averaged versions (over a rolling 7-day
# window) of the daily variables.". This presents two problems:
# 1. I don't understand what it means
# 2. I don't think its that useful
