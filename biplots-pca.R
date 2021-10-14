data <- read.csv(url("https://raw.githubusercontent.com/abarahonar/biplots-pca/master/owid-covid-data.csv"), header = TRUE)

# Remove aggregations of data
# Those are denoted as an iso_code starting with OWID
ptn <- "^[^OWID].*" # This will match anything that doesn't start with OWID
ndx <- grep(ptn, data$iso_code, perl = TRUE)
data <- data[ndx,]
# To test it: unique(data.clean[c("iso_code")])

# TODO: Determine which variables need to go
# Possible variables that need to die:
columns.to.die <- c(
  "continent", # Unnecessary
  "location", # Redundant, can be obtained from iso_code
  "excess_mortality_cumulative_absolute", # Excess mortality information, 83% of the data is NA
  "excess_mortality_cumulative",
  "excess_mortality",
  "excess_mortality_cumulative_per_million",
  "handwashing_facilities", # Unnecessary and 45% of the data is NA
  "icu_patients", # ICU and Hospitalization Information, at least 75% of the data is NA
  "icu_patients_per_million",
  "hosp_patients",
  "hosp_patients_per_million",
  "weekly_icu_admissions",
  "weekly_icu_admissions_per_million",
  "weekly_hosp_admissions",
  "weekly_hosp_admissions_per_million",
  # According to the source of the data, the variables that have "smoothed" in
  # the name means that "These metrics are averaged versions (over a rolling 
  # 7-day window) of the daily variables.". This presents two problems:
  # 1. I don't understand what it means
  # 2. I don't think its that useful
  "new_cases_smoothed",
  "new_deaths_smoothed",
  "new_cases_smoothed_per_million",
  "new_deaths_smoothed_per_million",
  "new_tests_smoothed",
  "new_tests_smoothed_per_thousand",
  "new_vaccinations_smoothed",
  "new_vaccinations_smoothed_per_million",
  "positive_rate", # 42% of the data is NA
  "tests_per_case", # 43% of the data is NA
  # Possibly relative measures should be deleted in favor of absolute measures
  # Example: delete new_cases and keep new_cases_per_million as it can be
  # compared
  "total_cases",
  "new_cases",
  "total_deaths",
  "new_deaths",
  "new_tests",
  "total_tests",
  "total_vaccinations",
  "people_vaccinated",
  "people_fully_vaccinated",
  "total_boosters",
  "new_vaccinations",
  "aged_65_older", "aged_70_older" # Don't know what this means
)

variables.representing.countries <- c(
  "tests_units",
  "population",
  "population_density",
  "median_age",
  "gdp_per_capita",
  "extreme_poverty",
  "cardiovasc_death_rate",
  "diabetes_prevalence",
  "female_smokers",
  "male_smokers",
  "hospital_beds_per_thousand",
  "life_expectancy",
  "human_development_index"
)

variables.representing.time.series <- c(
  columns.to.die,
  variables.representing.countries
)

time.series <- data[, -which(names(data) %in% variables.representing.time.series)]
countries <- data[, which(names(data) %in% c("iso_code", variables.representing.countries))]

codes <- unique(countries[c("iso_code")])
get.tests.units <- function(x) {
  units <- unique(countries[countries$iso_code == x,][c("tests_units")])
  str <- paste(head(units, n = 1), tail(units, n = 1))
  return(trimws(str))
}

# TODO: simplify the countries data frame so that it has only an entry for country
