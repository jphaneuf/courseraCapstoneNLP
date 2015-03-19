#Q1 how many megabytes is en_US.blogs.txt?
#200MB (I read 210MB)
file.info("final/en_US/en_US.blogs.txt")
#Q2
q2File <- "final/en_US/en_US.twitter.txt"
con <- file(q2File,"r")
for(i in 1:5){
  print(i)
	x=readLines(con,500000)
  print(length(x))
}
close(con)
#got to ~2360148, so >2M

#Q3
q3Files <- paste0("final/en_US/",c("en_US.blogs.txt","en_US.news.txt","en_US.twitter.txt"))
for(enFile in q3Files){
  print(enFile)
  con <- file(enFile,"r")
  x= readLines(con,n=-1,skipNul=TRUE)
  close(con)
  print(max(sapply(x,nchar)))
  print(length(x))
}
#blogs > 40k
# [1] "final/en_US/en_US.blogs.txt"
# [1] 40833
# [1] 899288
# [1] "final/en_US/en_US.news.txt"
# [1] 11384
# [1] 1010242
# [1] "final/en_US/en_US.twitter.txt"
# [1] 140
# [1] 2360148

#Q4
q4File <- "final/en_US/en_US.twitter.txt"
con< file(q4File,"r")
x = readLines(q4File,n=-1)
nlove = length(grep("love",x))
nhate = length(grep("hate",x))
print(nlove/nhate)
close(con)
#4.1

#Q5
con< file(q4File,"r")
x = readLines(q4File,n=-1)
print(x[grep("biostats",x)])
close(con)
#They haven't studied!

#Q6
con< file(q4File,"r")
x = readLines(q4File,n=-1)
print(x[grep("A computer once beat me at chess, but it was no match for me at kickboxing",x)])
close(con)
#3, ah ah ah


