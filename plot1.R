library(dplyr)
library(data.table)
library(lubridate)

if(!file.exists(".//electric")){
  dir.create(".//electric")}

unzip(zipfile = ".//electric/exdata%2Fdata%2Fhousehold_power_consumption.zip")
electric_file <- "./household_power_consumption.txt"
electric_data <- fread(electric_file, na.strings = "?", stringsAsFactors = FALSE, 
                       skip = 66637, nrows = 2880)

ele_data1 <- electric_data %>% select(V3 = as.numeric(as.character(V3)))

hist(ele_data1$V3, col = "red", main = "Global Active Power",
     xlab = "Global Active Power(Kilowats)")

dev.copy(png, file = "electric/plot1.png", width =480, height = 480)
dev.off()


#electric_name <- rename(electric_data, Date =V1,
                                       #Time =V2,
                                      # Global_active_power =V3,
                                     #  Global_reactive_power =V4 ,
                                    #   Voltage  =V5,
                                     #  Global_intensity =V6,
                                    #   Sub_metering_1 =V7,
                                     #  Sub_metering_2 =V8,
                                     #  Sub_metering_3= V9) 

#sub_electric <- electric_data[electric_data$V1 %in% c("01/02/2007| 02/02/2007") ,]

#sub_electric <- filter(electric_data,electric_data$Date == c("01/02/2007| 02/02/2007")) 
                       
#datetime <- strptime(paste(electric_data$V1,electric_data$V2 , sep = " "),"%d/%m/%y %H:%M:%S")
#datetime <- mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1 ,V2))))

#Global_active_power <- as.numeric(as.character(sub_electric$Global_active_power))



#electric_data$Date <- as.Date(electric_data$V1, format = "%d/%m/%y")
#e_date <- electric_data$V1=="01-02-2007" |electric_data$V1=="02-01-2007"


#elesub <- filter(electric_data, grep("^[01/02/2007| 02/02/2007]",V1))



#  Convert in numeric

#electric_data <- read.table(electric_file, header = TRUE, sep = ",", stringsAsFactors = FALSE, 
                           # dec = ".", comment.char = "", quote = '\"', na.strings = "?")
                           # colClasses ="character", "character", "numeric" , 
                           # "numeric" , "numeric" , "numeric" , "numeric" , "numeric" )

#electric_data$Date <- as.Date(electric_data$Date, format = "%d/%m/%y")
#e_date <- electric_data[(electric_data$Date=="01-2-2007") |(electric_data$Date=="02-01-2007"),]

            
#hist(as.numeric(as.character(electric_date$Global_active_power)), col = "red",
   #  main = "Global Active Power", xlab = "Global Active Power(Kilowats)")

