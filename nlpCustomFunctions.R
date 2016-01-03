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