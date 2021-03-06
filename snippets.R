#readlines
BASH:
  cat en_US.blogs.txt | awk 'NR >= 0 && NR <= 10 { print }' > en_US.blogs_sub.txt
cat en_US.news.txt | awk 'NR >= 0 && NR <= 10 { print }' > en_US.news_sub.txt

x[grep('string',x)]#subset x matching 'string'
hist(sapply(en_US.blogs,function(x) log(nchar(x))))

Got English Dictionary using command 'cat /usr/share/dict/words > englishDictionary.txt'

looking at NLP. Regexp_Tokenizer   and tm.MC_Tokenizer
NLP.ngrams(x,n) to create bi or trigrams
use DirSource on directory into Corpus
docs <- Corpus(DirSource(cname))   
https://rstudio-pubs-static.s3.amazonaws.com/31867_8236987cf0a8444e962ccd2aec46d9c3.html
tm_map to apply functions to corpora
Remove stop words stopwords(kind='en')


myTable         <- myTable[ ,.N, by=list(V1)]
setnames(myTable, 1:2, c("phrase","freq"))
Assuming that myTable starts out as a data table with a single variable containing all individual occurrences of phrases that interest you (e.g. of length 4 words, say) then those 2 lines will give you myTable containing only unique instances of all phrases with a second variable which is the frequency count for each unique phrase. And it'll do it blazingly fast too.

x<-ec[[3]]$content[1:10]
x<-VCorpus(VectorSource(x))
x<-tm_map(x,bigramTokenizer) 
x <- tm_map(x, PlainTextDocument)#per stack over flow error mitigation
x<- TermDocumentMatrix(x)

options(mc.cores=1) #per stack overflow
bigramTokenizer <- function(x) {NGramTokenizer(x,Weka_control(min=2,max=2))}
#x<-tm_map(x,bigramTokenizer)
ec <- tm_map(ec,MC_tokenizer)
#ec <- tm_map(ec, content_transformer(tolower))
#ec <- tm_map(ec, removePunctuation)
#ec <- tm_map(ec, stripWhitespace)
#ec <- tm_map(ec, removeWords, stopwords("english"))
#x[[1]]$content
