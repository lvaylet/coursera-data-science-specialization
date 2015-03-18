# Have total emissions from PM_2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset (NEI, fips == "24510")
total.PM25yr <- tapply(baltimore$Emissions, baltimore$year, sum)

png("plot2.png")
plot(names(total.PM25yr), total.PM25yr, type = "l", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "Emissions (tons)"), main=expression("Total for Baltimore City" ~ PM[2.5] ~ "Emissions by Year"), col = "blue")
dev.off()

# The data indicate a sharp decline between 1999 and 2002. A sharp increase
# occurred from 2002 to 2005. Finally, another sharp decrease occurred from 2005
# to 2008.
