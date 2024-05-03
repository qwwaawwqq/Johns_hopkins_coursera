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