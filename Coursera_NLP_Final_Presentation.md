Coursera/JHU Data Science Capstone: Text Prediction Application
========================================================
author: Joe Phaneuf
date:1/17/2016

Introduction
========================================================

This goal of this project is to create a prediction
algorithm that, given some input text, can predict
the next input word.
The prediction is trained on a large corpus of text
sourced from blog posts, news articles, and tweets.

Methods
========================================================

At the heart of this application are a set of tables of n-grams, ranging in size from 2 to 4.  An n-gram is a series of n words, and these can be pulled from the corpus and sorted by frequency.  So if a user enters the trigram 'all of a', the table of quadgrams is searched for the most frequent entry containing that trigram, returning 'all of a sudden'.  This prediction application attempts to use as much information as possible, so if a user enters 3 or more words, a trigram is used for prediction, falling back on bigrams, then unigrams, from the input if no matching entries are found.


Shiny App Workings
========================================================
The prediction algorithm is wrapped up in a Shiny App for convenient demonstration. The App's user interface sends input text to an R server that will check the input against the n-gram tables and return the prediction.


Shiny App Usage
========================================================
**Link**
 The App consists simply of a text input box, where you can input text, and an output text box with a prediction of the next word.  Note that in this configuration, the App attepms to predict the next word, but will not attempt to fill in an incomplete input word.  Enjoy!
