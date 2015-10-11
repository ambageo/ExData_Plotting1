library(dplyr)

#Read the downloaded data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
df_data<-tbl_df(data)

#subsetting the data to keep only the data related to the two dates
course_data<-filter(df_data,Date=="1/2/2007" | Date=="2/2/2007")
course_data$Global_active_power<-as.numeric(course_data$Global_active_power)
png("plot1.png",width=480,height=480)
hist(course_data$Global_active_power,ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()
