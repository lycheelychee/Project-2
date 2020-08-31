setwd("C:/Users/Administrator/Documents/project 2/Project-2")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
baltimore <- subset(NEI, fips == "24510")
plotdata <- aggregate(baltimore[c("Emissions")], list(type=baltimore$type, year = baltimore$year), sum)
png('plot3.png', width=480, height=480)
p <- ggplot(plotdata, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=0.1) +geom_smooth(method="loess") +
  ggtitle("Total PM2.5 Emissions in Baltimore per Type 1999-2008")
print(p)
dev.off()