# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999 to 2008 for Baltimore City? Which have seen increases in
# emissions from 1999 to 2008? Use the ggplot2 plotting system to make a plot to
# answer this question.

NEI <- readRDS("expdata_prj2/summarySCC_PM25.rds")
SCC <- readRDS("expdata_prj2/Source_Classification_Code.rds")

library(plyr)
baltimore <- subset (NEI, fips == "24510")
typePM25.year <- ddply(baltimore, .(year, type), function(x) sum(x$Emissions))

colnames(typePM25.year)[3] <- "Emissions"

library(ggplot2)
png("plot3.png")
qplot(year, Emissions, data=typePM25.year, color=type, geom ="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Emmission by source, type and year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (in tons)"))
dev.off()

# Nonpoint (green line): From the plot, we see that nonpoint (green line)
# sharply decreased from 1999 to 2002. It remained steady from 2002 to 2005 with
# 1,500 Total PM2.5 emissions. Finally, a slight decrease occurred between 2005
# and 2008 from 1,500 Total PM2.5 emissions.
#
# Point (purple line): From the plot, we see that the point (purple line)
# slightly increased from 1999 to 2002. It then sharply increased in PM2.5
# emissions from 2002 to 2005. Finally, from 2005 to 2008, the PM2.5 emissions
# sharply decreased.
#
# Onroad (blue line): From the plot, we see that the onroad (blue line) slightly
# decreased from 1999 to 2002. It remained approximately steady from 2002 to
# 2005 and continued this trend from 2005 to 2008. In comparison to the nonroad
# values, this over all trend was lower compared to the nonroad values.
#
# Nonroad (red line): From the plot, we see that the nonroad (red line) followed
# the same path as the onroad values only slightly higher in PM2.5 emissions
# values. slightly decreased from 1999 to 2002. It remained approximately steady
# from 2002 to 2005 and continued this trend from 2005 to 2008.
