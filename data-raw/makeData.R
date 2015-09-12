library(dplyr)
library(stringr)
library(tidyr)
library(lubridate)

l <- lapply(c("data-raw/ozone.txt", "data-raw/pm2_5.txt", "data-raw/temp.txt"),
            read.csv, stringsAsFactors = FALSE)

airdata <- Reduce(rbind, l)
airdata <- filter(airdata, site != "END OF FILE")

solar <- read.csv("data-raw/solar.txt", stringsAsFactors = FALSE)

daily_ozone <- read.csv("data-raw/daily_ozone.csv", stringsAsFactors = FALSE)

ozone_parameter <- 44201
temp_parameter <- 62101
solar_parameter <- 63301

solar.monitors <- unique(solar$site)
ozone.monitors <- unique(filter(airdata, parameter == ozone_parameter)[["site"]])
temp.monitors <- unique(filter(airdata, parameter == temp_parameter)[["site"]])
monitor <- Reduce(intersect, list(solar.monitors, ozone.monitors, temp.monitors))[1]

d <- rbind(airdata, solar)
d <- filter(d, site == monitor, parameter %in% c(temp_parameter, solar_parameter),
            poc == min_rank(poc))
datetime <- str_split_fixed(d$datetime, "T", 2)
d$date <- datetime[, 1]
d$time <- datetime[, 2]
d <- group_by(d, parameter, date) %>% summarize(daily_max = max(value, na.rm = TRUE))

chicago_air <- spread(d, parameter, daily_max)
chicago_air$date <- as.Date(chicago_air$date, format = "%Y%m%d")
daily_ozone$Date <- as.Date(daily_ozone$Date, format = "%m/%d/%Y")
chicago_air <- full_join(chicago_air, select(daily_ozone, Date, Daily.Max.8.hour.Ozone.Concentration),
                         by = c(date = "Date"))

names(chicago_air)[names(chicago_air) == "Daily.Max.8.hour.Ozone.Concentration"] <- "ozone"
names(chicago_air)[names(chicago_air) == temp_parameter] <- "temp"
names(chicago_air)[names(chicago_air) == solar_parameter] <- "solar"

chicago_air$month <- month(chicago_air$date)
chicago_air$weekday <- wday(chicago_air$date)
chicago_air <- select(chicago_air, date, ozone, temp, solar, month, weekday)
chicago_air <- as.data.frame(chicago_air)
chicago_air <- chicago_air[chicago_air$date < as.Date("2014-01-01"), ]

hourly_windspeed <- read.csv("data-raw/wind_speed_cook.txt", stringsAsFactors = FALSE)
hourly_wind_dir <- read.csv("data-raw/wind_dir_cook.txt", stringsAsFactors = FALSE)
hourly_ozone <- read.csv("data-raw/ozone_cook.txt", stringsAsFactors = FALSE)
h <- Reduce(rbind, list(hourly_windspeed, hourly_wind_dir, hourly_ozone))
h <- filter(h, site == "840170310001")
h <- group_by(h, datetime, parameter) %>%
  filter(poc == min(poc)) %>% select(datetime, parameter, value)
h$parameter <- factor(h$parameter, levels = c(61103, 61104, 44201),
                      labels = c("wind_speed", "wind_dir", "ozone"))
chicago_wind <- spread(h, parameter, value = value)

devtools::use_data(airdata, chicago_air, chicago_wind)


