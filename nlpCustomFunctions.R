#MC_tokenizer is a function in the R tm package that cleans and tokenizes data.
#I was pretty very happy with the cleaning functions, but wanted to use ngram tokenization, so using the source code
#for MC_tokenizer and simply using the cleaning functions minus the tokenization

clean_text <-
  function(x)
  {
    x <- as.character(x)
    ASCII_letters <- "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    id <- sprintf("[%s]+", ASCII_letters)
    http <- sprintf("(http://%s(\\.%s)*)", id, id)
    email <- sprintf("(%s@%s(\\.%s)*)", id, id, id)
    http_or_email <- sprintf("%s|%s", http, email)
    
    c(unlist(regmatches(x, gregexpr(http_or_email, x))),
      unlist(strsplit(gsub(http_or_email, "", x),
                      sprintf("[^%s]", ASCII_letters))))
  }
cleanupFun<-function(x){
  x <- tm_map(x, qdap::clean)
  x <- tm_map(x, qdap::scrubber)
  x <- tm_map(x, qdap::replace_symbol)
  remove.URL <- function(y) { gsub("http[[:alnum:]]*", "", y) }
  x <- tm_map(x, remove.URL)
  remove.Amp <- function(y) { gsub("&amp;", "", y) }
  x <- tm_map(x, remove.Amp)
  remove.WWW <- function(y) { sub("www[[:alnum:]]*", "", y) }
  x <- tm_map(x, remove.WWW)
  remove.equals <- function(y) { gsub("=", "", y) }
  x <- tm_map(x, remove.equals)
  x <- tm_map(x, removeNumbers)
  x <- tm_map(x, removePunctuation)
  x <- tm_map(x, tolower)
  badwords <- readLines("https://raw.githubusercontent.com/shutterstock/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/master/en")
  x <- tm_map(x, removeWords, badwords)
  x <- tm_map(x,stripWhitespace)
  return(x)
}