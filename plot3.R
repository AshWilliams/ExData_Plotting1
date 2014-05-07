rm(list=ls())
Sys.setlocale("LC_TIME", "English")
household_power_consumption <- read.table("C:/Users/ayudante.desarrollo/Desktop/Exploratory Data Analysis/Week 1/Plots Assignment/household_power_consumption.txt", header=TRUE, nrows=2100000, sep=";", stringsAsFactors =FALSE)
datos = subset(household_power_consumption, (household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date== "2/2/2007"))
#Get rid of row.names
row.names(datos) <- seq(nrow(datos)) 

datos$Date <- as.Date(datos$Date, format = "%d/%m/%Y")
# Combinamos Date y Time creando una nueva columna "FechaLarga":
datos$FechaLarga <- as.POSIXct(paste(datos$Date, datos$Time))

png("plot3.png", width = 480, height = 480)
plot(datos$FechaLarga, datos$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(datos$FechaLarga, datos$Sub_metering_2, type="l", col="red")
lines(datos$FechaLarga, datos$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()