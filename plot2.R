library(dplyr)

#Read the downloaded data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
df_data<-tbl_df(data)

#subsetting the data to keep only the data related to the two dates
course_data<-filter(df_data,Date=="1/2/2007" | Date=="2/2/2007")
course_data$Global_active_power<-as.numeric(course_data$Global_active_power)
png("plot2.png",width=480,height=480)
 date_time <- strptime(paste(course_data$Date, course_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
 plot(date_time,course_data$Global_active_power,ylab="Global Active Power (kilowatts)",xlab=" ",type="l")
 dev.off()
