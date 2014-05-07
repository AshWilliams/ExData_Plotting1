rm(list=ls())
household_power_consumption <- read.table("C:/Users/ayudante.desarrollo/Desktop/Exploratory Data Analysis/Week 1/Plots Assignment/household_power_consumption.txt", header=TRUE, nrows=2100000, sep=";", stringsAsFactors =FALSE)
datos = subset(household_power_consumption, (household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date== "2/2/2007"))
#Get rid of row.names
row.names(datos) <- seq(nrow(datos)) 

png("plot1.png", width=480, height= 480)
hist(as.numeric(datos$Global_active_power),xlab="Global Active Power (kilowatts)",main = "Global Active Power",col = "red")
dev.off()