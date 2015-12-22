#dataUrl <-"https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
dataUrl <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
if(!file.exists("SwiftKey.zip")) download.file(dataUrl,"SwiftKey.zip",method="curl")
unzip("SwiftKey.zip")
#Unzip
#q1: en_US.blogs.txt
#200MB
#q2
#over 2M
#q3

getLongestLine <- function(filePath){
  loadData <- scan(file=filePath,what='character',sep='\n')
  longestLine <- 0
  for(l in loadData){
    x<- nchar(l)
    if (x > longestLine){
      longestLine <- x
    }
  }
  return(longestLine)
}
print(getLongestLine('./final/en_US/en_US.blogs.txt'))#40833
print(getLongestLine('./final/en_US/en_US.news.txt'))#11384

#q4
#4.  See ./love.sh script
#q5
#student hasn't studied for biostats exam
#q6
# cat en_US.twitter.txt | grep 'A computer once beat me at chess, but it was no match for me at kickboxing' | wc -l
# 3
