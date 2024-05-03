# Read the data
NEI <- readRDS("summarySCC_PM25.rds")

# Subset data for Baltimore City and Los Angeles County, and motor vehicle sources
baltimore_motor_data <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
la_motor_data <- NEI[NEI$fips == "06037" & NEI$type == "ON-ROAD", ]

# Aggregate emissions by year and city
baltimore_motor_emissions_by_year <- aggregate(Emissions ~ year, baltimore_motor_data, sum)
la_motor_emissions_by_year <- aggregate(Emissions ~ year, la_motor_data, sum)

# Combine the data for both cities
emissions_data <- rbind(
  data.frame(year = baltimore_motor_emissions_by_year$year, 
             city = "Baltimore City", 
             emissions = baltimore_motor_emissions_by_year$Emissions),
  data.frame(year = la_motor_emissions_by_year$year, 
             city = "Los Angeles County", 
             emissions = la_motor_emissions_by_year$Emissions)
)

# Create the plot
library(ggplot2)
png("plot6.png", width = 480, height = 480)
ggplot(emissions_data, aes(x = factor(year), y = emissions, fill = city)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Year", y = "PM2.5 Emissions (tons)", 
       title = "PM2.5 Motor Vehicle Emissions in Baltimore City and Los Angeles County")
dev.off()