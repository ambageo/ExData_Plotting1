library(dplyr)

#Read the downloaded data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
df_data<-tbl_df(data)

#subsetting the data to keep only the data related to the two dates
course_data<-filter(df_data,Date=="1/2/2007" | Date=="2/2/2007")
date_time <- strptime(paste(course_data$Date, course_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_Active_Power<-as.numeric(course_data$Global_active_power)
Global_Reactive_Power<-as.numeric(course_data$Global_reactive_power)
Sub_metering_1<-as.numeric(course_data$Sub_metering_1)
Sub_metering_2<-as.numeric(course_data$Sub_metering_2)
Sub_metering_3<-as.numeric(course_data$Sub_metering_3)
Voltage<-as.numeric(course_data$Voltage)
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(date_time,Global_Active_Power,type="l",xlab="",ylab="Global Active Power")

plot(date_time,Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(date_time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(date_time,Sub_metering_2,type="l",col="red")
lines(date_time,Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=3,col=c("black","red","blue"),bty="n")

plot(date_time,Global_Reactive_Power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()