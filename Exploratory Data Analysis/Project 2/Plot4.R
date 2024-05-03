# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset coal combustion-related sources
coal_data <- NEI[grepl("Coal", SCC$Short.Name, ignore.case = TRUE), ]

# Aggregate emissions by year
coal_emissions_by_year <- aggregate(Emissions ~ year, coal_data, sum)

# Create the plot
png("plot4.png", width = 480, height = 480)
barplot(coal_emissions_by_year$Emissions, names.arg = coal_emissions_by_year$year, 
        xlab = "Year", ylab = "PM2.5 Emissions (tons)", 
        main = "PM2.5 Coal Combustion-Related Emissions in the United States")
dev.off()