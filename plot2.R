#for download: please watch plot1.R
data_txt <- "./data/household_power_consumption.txt"
data <- read.table(data_txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(data_subset)
#head(data_subset)

#Problem: my days of the week occur in German
#Why: printing of Date and POSIX*t objects seems to be controlled by the LC_TIME locale category
#Solution: switching the local time
Sys.setlocale("LC_TIME", "English")
#weekdays(Sys.Date()+0:6)
#[1] "Sunday"    "Monday"    "Tuesday"   "Wednesday" "Thursday"  "Friday"    "Saturday"


datetime <- strptime(paste(data_subset$Date, data_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(data_subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
