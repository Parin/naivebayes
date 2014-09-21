naivebayes
==========

Naive Bayes document classifier for the classic 20 newsgroups dataset

##Introduction

This project, implements the Naive Bayes document classifier and apply it to the classic 20 newsgroups dataset.In this dataset, each document is a posting that was made to one of 20 different usenet newsgroups. The goal is to write a R program which can predict which newsgroup a given document was posted to.

###Training Data

The data file (available on the data folder) contains six files:

1. **vocabulary.txt** is a list of the words that may appear in documents. The line number is word’s id in other files. That is, the first word (’archive’) has wordId 1, the second (’name’) has wordId 2, etc.

2. **newsgrouplabels.txt** is a list of newsgroups from which a docment may have come. Again, the line number corresponds to the label’s id, which is used in the .label files. The first line (’alt.atheism’) has id 1, etc.

3. **train.label** Each line corresponds to the label for one document from the training set. Again, the document’s id (docId) is the line number.

4. **test.label** The same as train.label, except that the labels are for the test documents.

5. **train.data** Specifies the counts for each of the words used in each of the documents. Each line is of the form “docId wordId count”, where count specifies the number of times the word with id wordId in the training document with id docId. All word/document pairs that do not appear in the file have count 0

6. **test.data** Same as train.data, except that it specified counts for test documents.

###Implementation

Implemetation contains following files.

1. *read_data.R* - reads newsgroup data into R data structures ('slam' package is used to represent each document in a sparse mattrix form).
2. *naive_bayes.R* - contains functions to train, predict and compute stats for naive bayes.
3. *choose_alpha.R* - performs model selection over prior to pick the best alpha (prior is drawen from the Dirishlet Distribution).
4. *feature_selection.R* - Please see TODO.

##Confusion Matrix
##Overfitting

![alt tag](https://github.com/Parin/naivebayes/blob/master/plot.png)

##TODO

