# How have emissions from motor vehicle sources changed from 1999 - 2008 in
# Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mv.sourced <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))

mv.sourcec <- SCC[SCC$EI.Sector %in% mv.sourced, ]["SCC"]

emMV.ba <- NEI[NEI$SCC %in% mv.sourcec$SCC & NEI$fips == "24510",]

library(plyr)
balmv.pm25yr <- ddply(emMV.ba, .(year), function(x) sum(x$Emissions))
colnames(balmv.pm25yr)[2] <- "Emissions"

library(ggplot2)
png("plot5.png")
qplot(year, Emissions, data=balmv.pm25yr, geom="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + xlab("Year") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
dev.off()

# Starting with 1999, the PM2.5 emissions was just below 350, the levels fell
# sharply until 2002. From 2002 to 2005 the levels plateaued. Finally from 2005
# to 2008, the PM2.5 emissions drop to below 100 PM2.5 emissions.
