data <-read.table('household_power_consumption.txt',sep=';',header=TRUE)
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(as.character(data$DateTime),format = '%d/%m/%Y %H:%M:%S') 
data$Date  = as.Date(strptime(as.character(data$Date),format = '%d/%m/%Y'))
data.filtered <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')
data.filtered$Global_active_power <- as.numeric(as.character(data.filtered$Global_active_power))


png(file='plot1.png')
hist(data.filtered$Global_active_power,ylim=c(0,1200), breaks = "sturges",xlab='Global Active Power (kilowatts)',main='Global Active Power',col="red")
dev.off()



