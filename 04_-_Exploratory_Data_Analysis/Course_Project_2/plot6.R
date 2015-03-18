# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California, California (fips
# == "06037"). Which city has seen greater changes over time in motor vehicle
# emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mv.sourced <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))

mv.sourcec <- SCC[SCC$EI.Sector %in% mv.sourced, ]["SCC"]

emMV.ba <- NEI[NEI$SCC %in% mv.sourcec$SCC & NEI$fips == "24510", ]
emMV.LA <- NEI[NEI$SCC %in% mv.sourcec$SCC & NEI$fips == "06037", ]

emMV.comb <- rbind(emMV.ba, emMV.LA)

tmveYR.county <- aggregate (Emissions ~ fips * year, data =emMV.comb, FUN = sum )
tmveYR.county$county <- ifelse(tmveYR.county$fips == "06037", "Los Angeles", "Baltimore")

library(ggplot2)
png("plot6.png", width=750)
qplot(year, Emissions, data=tmveYR.county, geom="line", color=county) + ggtitle(expression("Motor Vehicle Emission Levels" ~ PM[2.5] ~ "  from 1999 to 2008 in Los Angeles County, CA and Baltimore, MD")) + xlab("Year") + ylab(expression("Levels of" ~ PM[2.5] ~ " Emissions"))
dev.off()

# Comparisons of PM2.5 emissions between Baltimore, MD (a city in MD) and Los
# Angeles, CA (county). In this case, we are asked to compare a city to a
# county. In plot 6, we notice that Baltimore, MD starts considerably lower in
# terms of PM2.5 emissions.
#
# Baltimore, MD [city] (Red Line): The red line starts marginally above zero and
# below 1,000 PM2.5 emission values. Between 1999 and 2002, it slowly declines
# and remains nearly static between 2002 and 2008.
#
# Los Angeles, CA [county] (Blue Line): The blue line starts significantly
# higher than the Baltimore, MD line. Starting with 1999, slightly below 4,000
# PM2.5 emisions and steadily increases to 2005. The value of PM2.5 emissions
# for 2005 hits a peak at approximately 4,500 PM2.5 emision levels and then
# decreases between 2005 and 2008 with an ending value point of slightly above
# 4,000 PM2.5 emissions.
