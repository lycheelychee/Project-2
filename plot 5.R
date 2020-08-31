setwd("C:/Users/Administrator/Documents/project 2/Project-2")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimore <- subset(NEI, fips == "24510")
vehicleSource <- SCC[grepl("Vehicle", SCC$EI.Sector),]
vehicleBaltimore <- subset(baltimore, baltimore$SCC %in% vehicleSource$SCC)
plotdata <- aggregate(vehicleBaltimore[c("Emissions")], list(type=vehicleBaltimore$type, year = vehicleBaltimore$year), sum)
png('plot5.png', width=480, height=480)
p <- ggplot(plotdata, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=0.1) + geom_smooth(method="loess") +
  ggtitle("Total PM2.5 Emissions in Baltimore for Motor Vehicles 1999-2008")
print(p)
dev.off()