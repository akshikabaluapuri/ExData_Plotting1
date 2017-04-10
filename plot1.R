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
ele_data1 <- electric_data %>% select(V3 = as.numeric(as.character(V3)))


#plotting
hist(ele_data1$V3, col = "red", main = "Global Active Power",
     xlab = "Global Active Power(Kilowats)")


#png file
dev.copy(png, file = "electric/plot1.png", width =480, height = 480)
dev.off()




