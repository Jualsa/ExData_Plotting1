household_power_consumption <- read.table("household_power_consumption.txt", sep=";", quote="\"")
household_power_consumption$V1 <- as.Date(as.character(household_power_consumption$V1), "%d/%m/%Y")
data <- subset(household_power_consumption,V1 >= as.Date("2007-02-01") & V1 <= as.Date("2007-02-02"))

dates<-as.character(data$V1)
times<-as.character(data$V2)
x <- paste(dates, times)
y<-strptime(x, "%Y-%m-%d %H:%M:%S")
data$V10<-y
data$V3 <- as.numeric(as.character(data$V3))
Sys.setlocale("LC_TIME", "en")

png('plot2.png',width=480,height=480,units="px",bg = "transparent")
plot(data$V10, data$V3, type="l", ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()

