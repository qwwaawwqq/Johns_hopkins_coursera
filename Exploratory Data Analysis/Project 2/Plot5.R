# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data for Baltimore City and motor vehicle sources
baltimore_motor_data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]

# Aggregate emissions by year for motor vehicle sources in Baltimore
baltimore_motor_emissions_by_year <- aggregate(Emissions ~ year, baltimore_motor_data, sum)

# Create the plot
png("plot5.png", width = 480, height = 480)
barplot(baltimore_motor_emissions_by_year$Emissions, names.arg = baltimore_motor_emissions_by_year$year, 
        xlab = "Year", ylab = "PM2.5 Emissions (tons)", 
        main = "PM2.5 Motor Vehicle Emissions in Baltimore City")
dev.off()