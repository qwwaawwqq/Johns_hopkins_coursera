# Read the data
NEI <- readRDS("summarySCC_PM25.rds")

# Subset data for Baltimore City
baltimore_data <- NEI[NEI$fips == "24510", ]

# Aggregate emissions by year for Baltimore City
baltimore_emissions_by_year <- aggregate(Emissions ~ year, baltimore_data, sum)

# Create the plot
png("plot2.png", width = 480, height = 480)
barplot(baltimore_emissions_by_year$Emissions, names.arg = baltimore_emissions_by_year$year, 
        xlab = "Year", ylab = "PM2.5 Emissions (tons)", 
        main = "Total PM2.5 Emissions in Baltimore City")
dev.off()