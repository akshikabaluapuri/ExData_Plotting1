library(dplyr)
library(data.table)

if(!file.exists(".//electric")){
  dir.create(".//electric")}

unzip(zipfile = ".//electric/exdata%2Fdata%2Fhousehold_power_consumption.zip")
electric_file <- "./household_power_consumption.txt"
electric_data <- fread(electric_file, na.strings = "?", stringsAsFactors = FALSE, 
                       skip = 66637, nrows = 2880)

ele_data4 <- electric_data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1 ,V2)))),
                                      V3 = as.numeric(as.character(V3)),
                                      V4 = as.numeric(as.character(V4)),
                                      V5 = as.numeric(as.character(V5)),
                                      V7  = as.numeric(as.character(V7)),
                                      V8  = as.numeric(as.character(V8)),
                                      V9  = as.numeric(as.character(V9)))
par(mfrow = c(2,2))

with(ele_data4, plot(V1,V3, type = "l", xlab = " ", ylab = "Global Active Power(Kilowats)"))

with(ele_data4, plot(V1,V5, type = "l", xlab = "datatime ", ylab = "Voltage)"))
                                      
 with(ele_data4, plot(V1,V7, type = "n", xlab = "", ylab = "Energy Sub Metering"))
 with(ele_data4,points(V1,V7, col= "black",type = "l"))
with(ele_data4, points(V1,V8, col = "red" ,type = "l"))
with(ele_data4, points(V1,V9, col = "blue", type = "l"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
with(ele_data4, plot(V1,V4, type = "l", xlab = "datatime ", ylab = "Global reactive Power"))
                                      

dev.copy(png, file = "electric/plot4.png", width =480, height = 480)
dev.off()