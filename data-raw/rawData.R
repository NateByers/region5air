l <- lapply(c("data-raw/ozone.txt", "data-raw/pm2_5.txt", "data-raw/temp.txt"),
            read.csv, stringsAsFactors = FALSE)

chicago <- Reduce(rbind, l)

devtools::use_data(chicago, region5air)
