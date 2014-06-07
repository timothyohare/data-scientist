getxml <- function() 
{
    #install.packages("XML")
    library("XML")
    #if (!file.exists("data")) {dir.create("data")}
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
    downloadFile <- "./data/restaurants.xml"
    #download.file(fileUrl, destfile=downloadFile)
    dateDownloaded <- date()
    
    doc <- xmlTreeParse(downloadFile, useInternal=TRUE)
    rootNode <- xmlRoot(doc)
    xmlName(rootNode)
    #sum(//zipcode)
    zipcodes <- xpathSApply(rootNode,"//zipcode",xmlValue)
    sum(zipcodes == 21231)
}