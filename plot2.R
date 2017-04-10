library(dplyr)
library(data.table)
library(lubridate)

if(!file.exists(".//electric")){
  dir.create(".//electric")}

unzip(zipfile = ".//electric/exdata%2Fdata%2Fhousehold_power_consumption.zip")
electric_file <- "./household_power_consumption.txt"
electric_data <- fread(electric_file, na.strings = "?", stringsAsFactors = FALSE, 
                       skip = 66637, nrows = 2880)


#extracted data
ele_data2 <- electric_data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1 ,V2)))),
                                      V3 = as.numeric(as.character(V3))) %>% select(V1,V3)

#ploting
with(ele_data2, plot(V1,V3, type = "l", xlab = " ", ylab = "Global Active Power(Kilowats)"))

# png file
dev.copy(png, file = "electric/plot2.png", width =480, height = 480)
dev.off()
