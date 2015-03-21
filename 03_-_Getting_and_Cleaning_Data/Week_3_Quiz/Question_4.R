# What is the average GDP ranking for the "High income: OECD" and "High income:
# nonOECD" group?

dt[, mean(rankingGDP, na.rm = TRUE), by = Income.Group]
