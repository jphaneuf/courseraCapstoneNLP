library(shiny)
bigrams <- as.matrix(read.csv('bigrams.csv',row.names=1))
shinyServer(function(input, output) {
  #output$predictedText <- input$inputText#renderText({
  output$predictedText <- renderText({
    userInput <- tolower(input$inputText)
    userInput <- gsub(' ','_',userInput)
    userInput <- paste0('^',userInput)#look at beginning of line
    
    #qi <- head(grep(userInput,rownames(quadgrams)),n=1)
    #ti<- head(grep(userInput,rownames(trigrams)),n=1)
    bi<- head(grep(userInput,rownames(bigrams)),n=1)
    if(length(bi)) bf<-bigrams[bi,'total'] else bf <- 0#frequency
    #if(length(ti)) tf<-trigrams[ti,'total'] else tf <- 0#frequency
    #if(length(qi)) qf<-quadgrams[qi,'total'] else qf <- 0#frequency
    #print(bf)
    if(bf>0){
      predicted <- rownames(bigrams)[bi]
    }
    else{
      predicted <- userInput
    }
      
    #print(tf)
    #if(tf>0) print(rownames(trigrams)[ti])
    #print(qf)
    #if(qf>0) print(rownames(quadgrams)[qi])
    #paste0(input$inputText,' fuck you')
    predicted <- gsub('_',' ',predicted) 
    predicted
  })
})