household_power_consumption <- read.table("household_power_consumption.txt", sep=";", quote="\"")
household_power_consumption$V1 <- as.Date(as.character(household_power_consumption$V1), "%d/%m/%Y")
data <- subset(household_power_consumption,V1 >= as.Date("2007-02-01") & V1 <= as.Date("2007-02-02"))

dates<-as.character(data$V1)
times<-as.character(data$V2)
x <- paste(dates, times)
y<-strptime(x, "%Y-%m-%d %H:%M:%S")
data$V10<-y

data$V7 <- as.numeric(as.character(data$V7))
data$V8 <- as.numeric(as.character(data$V8))
data$V9 <- as.numeric(as.character(data$V9))
Sys.setlocale("LC_TIME", "en")

png('plot3.png',width=480,height=480,units="px",bg = "transparent")
plot(data$V10, data$V7, type="l", ylab= "Energy sub metering", xlab="", ylim=c(0,38))
par(new=TRUE)
plot(data$V10, data$V8, type="l", col="red", ylab= "Energy sub metering", xlab="", ylim=c(0,38))
par(new=TRUE)
plot(data$V10, data$V9, type="l", col="blue", ylab= "Energy sub metering", xlab="", ylim=c(0,38))
legend("topright", lty=1, col=c("black","red","blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()