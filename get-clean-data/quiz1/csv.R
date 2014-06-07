getcsv <- function()
{
    if (!file.exists("data")) {dir.create("data")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download <- "./data/fss06hid.csv"
    if (!file.exists(download)) {
        download.file(fileUrl, destfile=download)
        dateDownloaded <- date()
    }
    gd <- read.csv(download)
    gd['FES']
}