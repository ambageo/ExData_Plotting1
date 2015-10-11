library(dplyr)

#Read the downloaded data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
df_data<-tbl_df(data)

#subsetting the data to keep only the data related to the two dates
course_data<-filter(df_data,Date=="1/2/2007" | Date=="2/2/2007")


Sub_metering_1<-as.numeric(course_data$Sub_metering_1)
Sub_metering_2<-as.numeric(course_data$Sub_metering_2)
Sub_metering_3<-as.numeric(course_data$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(date_time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(date_time,Sub_metering_2,type="l",col="red")
lines(date_time,Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=3,col=c("black","red","blue"))
 dev.off()
