# Load the `airquality' dataset form the datasets package in R.

library(datasets)
data(airquality)

# I am interested in examining how the relationship between ozone and wind speed
# varies across each month. What would be the appropriate code to visualize that
# using ggplot2?

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)
