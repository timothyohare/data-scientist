getdt <- function() 
{
    if (!file.exists("data")) {dir.create("data")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    downloadFile <- "./data/fss06pid.xlsx"
    download.file(fileUrl, destfile=downloadFile)
    dateDownloaded <- date()
    
    
    library(data.table)
    fread(downloadFile)
    #DT = data.table()
    #1
    st = system.time(mean(DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15))
    cat (st)
    st = system.time(DT[,mean(pwgtp15),by=SEX])
    cat(st)
    st = system.time(tapply(DT$pwgtp15,DT$SEX,mean))
    cat(st)
    st = system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
    cat(st)
    st = system.time(sapply(split(DT$pwgtp15,DT$SEX),mean) )
    cat(st)
    st = system.time(mean(DT$pwgtp15,by=DT$SEX))
    cat(st)
}