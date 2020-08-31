setwd("C:/Users/Administrator/Documents/project 2/Project-2")
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coalSource <- SCC[grepl("Coal", SCC$Short.Name),]
coalNEI <- NEI[ NEI$SCC %in% coalSource$SCC,]
plot4 <- ggplot(coalNEI, aes(x = factor(year), y = Emissions, fill =type)) + geom_bar(stat= "identity", width = .4) + xlab("year") +ylab("Coal-Related PM2.5 Emissions") + ggtitle("Total Coal-Related PM2.5 Emissions")
print(plot4)
dev.off()