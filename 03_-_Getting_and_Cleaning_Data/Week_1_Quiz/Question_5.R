# The American Community Survey distributes downloadable data about United
# States communities. Download the 2006 microdata survey about housing for the
# state of Idaho and load the data into an R object using the fread() command
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "ss06pid.csv", method = "curl")

library(data.table)
DT <- fread("ss06pid.csv")

mean(DT$pwgtp15,by=DT$SEX)
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
tapply(DT$pwgtp15,DT$SEX,mean)
DT[,mean(pwgtp15),by=SEX]
sapply(split(DT$pwgtp15,DT$SEX),mean)
