setwd("C:/Users/Administrator/Documents/project 2/Project-2")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIBaLa <- subset(NEI, fips == "24510" | fips == "06037")
vehicleSource <- SCC[grepl("Vehicle", SCC$EI.Sector),]
vehicleBaLa <- subset(NEIBaLa, NEIBaLa$SCC %in% vehicleSource$SCC)
vehicleBaLa$city <- rep(NA, nrow(vehicleBaLa))
vehicleBaLa[vehicleBaLa$fips == "06037", ][, "city"] <- "Los Angeles County"
vehicleBaLa[vehicleBaLa$fips == "24510", ][, "city"] <- "Baltimore City"
plotdata <- aggregate(vehicleBaLa[c("Emissions")], list(city = vehicleBaLa$city, year = vehicleBaLa$year), sum)
png('plot6.png', width=480, height=480)
p <- ggplot(plotdata, aes(x=year, y=Emissions, colour=city)) +
  geom_point(alpha=0.1) +geom_smooth(method="loess")+
  ggtitle("PM2.5 Emissions in Baltimore and Los Angeles for Motor Vehicles")
print(p)
dev.off() 


