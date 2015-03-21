# Cut the GDP ranking into 5 separate quantile groups. Make a table versus
# Income.Group. How many countries are Lower middle income but among the 38
# nations with highest GDP?

breaks <- quantile(dt$rankingGDP, probs = seq(0, 1, 0.2), na.rm = TRUE)
dt$quantileGDP <- cut(dt$rankingGDP, breaks = breaks)
dt[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]
