library(shiny)
bigrams <- as.matrix(read.csv('./bigrams.csv',row.names=1))
trigrams <- as.matrix(read.csv('./trigrams.csv',row.names=1))
quadgrams <- as.matrix(read.csv('./quadgrams.csv',row.names=1))
findNgramInData <- function(ngram,dtm) head(grep(ngram,rownames(dtm),value=TRUE),n=1)

predict <- function(inputString,nGramIn=3,nGramOut=4){
  userInput <- tolower(inputString)
  userInput <- paste(tail(unlist(strsplit(userInput,split=' ')),n=nGramIn),collapse="_")#last n tokens
  userInput <- paste0('^',userInput)#look at beginning of line
  prediction <- switch(as.character(nGramOut),
     '2'=findNgramInData(userInput,bigrams),
     '3'=findNgramInData(userInput,trigrams),
     '4'=findNgramInData(userInput,quadgrams))
  prediction <- paste(unlist(strsplit(prediction,split='_'))[-(1:nGramIn)],collapse=" ")
  prediction <- paste(inputString,prediction)
  return(prediction)
}

shinyServer(function(input, output) {
  #output$predictedText <- input$inputText#renderText({
  output$predictedText <- renderText({
    nTokens <- length(unlist(strsplit(input$inputText,split=' ')))
    #assume predicting a quadgram with a trigram input is the most accurate, and work backwords from there
    for (i in min(nTokens,3):1){
      for(j in 4:2){
        result <- predict(input$inputText,nGramIn=i,nGramOut=j) 
        if(length(result)) return(result)
        
      }
    }
  })
})
