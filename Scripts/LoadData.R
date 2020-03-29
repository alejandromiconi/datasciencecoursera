# Functions

replaces<-function(vector) {

    nvector <- c()
    
    for ( i in 1:length(vector)) {
  
      str <- vector[i]
      
        
      nstr <- ""
      for ( j in 1:nchar(str)) {

        ch <- substr(str , j , j)
        
        # if (i==1) {
        #   message(j , ch)
        # }
        
        if (grepl("[0-9/]" , ch)) {
          nstr <- paste(nstr , ch , sep="")
        }
      }

      nvector <- append(nvector , nstr)       
    }
  
    return (nvector)
}




data <- read.csv2("data/inflation.csv", header = FALSE 
                  , col.names = c("cdate" , "inflation")
                  , colClasses = c("character" , "numeric") 
                  , dec = "." , nrows=100)

classes <- sapply(data, class)

classes



data <- read.csv2("data/inflation.csv", header = FALSE 
                  , col.names = c("cdate" , "inflation")
                  , colClasses = classes # c("character" , "numeric") 
                  , dec = ".")
# data$FixedDate <- as.Date(data$Date,format="%d/%m/%Y")

# data$date1 <- replaces(data$cdate)
data$date <- as.Date(replaces(data$cdate),format="%d/%m/%Y")

# head(data , 10)

class(data$date)

plot(data$date[20:500] , data$inflation[20:500]
     , main="Argentine Inflation")
     
     