household_power_consumption <- read.table("household_power_consumption.txt", sep=";", quote="\"")
household_power_consumption$V1 <- as.Date(as.character(household_power_consumption$V1), "%d/%m/%Y")
data <- subset(household_power_consumption,V1 >= as.Date("2007-02-01") & V1 <= as.Date("2007-02-02"))

data$V3 <- as.numeric(as.character(data$V3))

dates<-as.character(data$V1)
times<-as.character(data$V2)
x <- paste(dates, times)
y<-strptime(x, "%Y-%m-%d %H:%M:%S")
data$V10<-y
Sys.setlocale("LC_TIME", "en")

data$V7 <- as.numeric(as.character(data$V7))
data$V8 <- as.numeric(as.character(data$V8))
data$V9 <- as.numeric(as.character(data$V9))
data$V5 <- as.numeric(as.character(data$V5))
data$V4 <- as.numeric(as.character(data$V4))

png('plot4.png',width=480,height=480,units="px",bg = "transparent")
par(mfrow=c(2,2))
with(data,{
  plot(V10, V3, type="l", ylab= "Global Active Power", xlab="")
  plot(V10, V5, type="l", ylab= "Voltage", xlab="datetime")
  plot(V10, V7, type="l", ylab= "Energy sub metering", xlab="", ylim=c(0,38))
  par(new=TRUE)
  plot(V10, V8, type="l", col="red", ylab= "Energy sub metering", xlab="", ylim=c(0,38))
  par(new=TRUE)
  plot(V10, V9, type="l", col="blue", ylab= "Energy sub metering", xlab="", ylim=c(0,38))
  legend("topright",lty=1, col=c("black","red","blue"), box.col = "transparent", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(V10, V4, type="l", ylab= "Global_reactive_power", xlab="datetime")
})
dev.off()