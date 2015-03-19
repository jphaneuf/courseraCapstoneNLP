dataUrl <-"https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
if(!file.exists("SwiftKey.zip")) download.file(dataUrl,"SwiftKey.zip",method="curl")
unzip("SwiftKey.zip")
#Unzip