getexcel <- function() 
{
    if (!file.exists("data")) {dir.create("data")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    download.file(fileUrl, destfile="./data/fdata_gov.xlsx")
    dateDownloaded <- date()
    library(xlsx)
    gd <- read.xlsx("./data/getdata_data_DATA.gov_NGAP.xlsx",sheetIndex=1,header=TRUE)
    head(gd)
    colIndex <- 7:15
    rowIndex <- 18:23
    dat <- read.xlsx("./data/getdata_data_DATA.gov_NGAP.xlsx", sheetIndex=1,colIndex=colIndex,rowIndex=rowIndex)
    sum(dat$Zip*dat$Ext,na.rm=T)
}