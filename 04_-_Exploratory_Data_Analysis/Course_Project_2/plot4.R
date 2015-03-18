# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999 to 2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalcomb.scc <- subset(SCC, EI.Sector %in% c("Fuel Comb - Comm/Instutional - Coal",
                                             "Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs -
  Coal"))

coalcomb.scc1 <- subset(SCC, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))
dif1 <- setdiff(coalcomb.scc$SCC, coalcomb.scc1$SCC)
dif2 <- setdiff(coalcomb.scc1$SCC, coalcomb.scc$SCC)
coalcomb.codes <- union(coalcomb.scc$SCC, coalcomb.scc1$SCC)

coal.comb <- subset(NEI, SCC %in% coalcomb.codes)

library(plyr)
coalcomb.pm25year <- ddply(coal.comb, .(year, type), function(x) sum(x$Emissions))

colnames(coalcomb.pm25year)[3] <- "Emissions"

library(ggplot2)
png("plot4.png")
qplot(year, Emissions, data=coalcomb.pm25year, color=type, geom="line") + stat_summary(fun.y = "sum", fun.ymin = "sum", fun.ymax = "sum", color = "purple", aes(shape="total"), geom="line") + geom_line(aes(size="total", shape = NA)) + ggtitle(expression("Coal Combustion" ~ PM[2.5] ~ "Emissions by Source Type and Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()

# Total (Purple Line): From the plot, we see that the purple line for total
# slightly declines from 1999 to 2002. From 2002 to 2005 the line has a marginal
# increase. Finally, from 2005 to 2008, the overall trend has a sharp decrease.
#
# Point (Blue Line): From the plot, we see that the blue line for point is
# slightly similar in shape to the total purple line. From 1999 to 2002 the
# point blue line has a steeper decrease. From 2002 to 2005, the point blue line
# increases only slightly. Finally, from 2005 to 2008, the overall trend has a
# sharp decrease.
#
# Nonpoint (Red Line): This line is remarkably different from the other two
# lines. From 1999 to 2002 it has an increase (although it starts from a much
# lower level than the other two lines at just above zero). From 2002 to 2005 it
# remains nearly level and does not appear to increase or decrease much.
# Finally, from 2005 to 2008, another symmetrical decrease occurs to end just
# below the initial levels for the 1999 values.
