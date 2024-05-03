# Read the data
NEI <- readRDS("summarySCC_PM25.rds")

# Aggregate emissions by year
emissions_by_year <- aggregate(Emissions ~ year, NEI, sum)

# Create the plot
png("plot1.png", width = 480, height = 480)
barplot(emissions_by_year$Emissions, names.arg = emissions_by_year$year, 
        xlab = "Year", ylab = "PM2.5 Emissions (tons)", 
        main = "Total PM2.5 Emissions in the United States")
dev.off()