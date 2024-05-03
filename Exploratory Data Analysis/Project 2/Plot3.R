# Read the data
NEI <- readRDS("summarySCC_PM25.rds")

# Subset data for Baltimore City
baltimore_data <- NEI[NEI$fips == "24510", ]

# Create the plot
library(ggplot2)
png("plot3.png", width = 480, height = 480)
ggplot(baltimore_data, aes(x = factor(year), y = Emissions, fill = type)) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ type) +
  labs(x = "Year", y = "PM2.5 Emissions (tons)", 
       title = "PM2.5 Emissions in Baltimore City by Source Type")
dev.off()