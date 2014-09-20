# library('Matrix')
# library('glmnet')
library('slam');

read_data <- function(){
  
  cat("reading data ...\n");
  
  vocab <- read.table("data/vocabulary.txt");
  vocab <- vocab[,1];
  newsgroup <- read.table("data/newsgrouplabels.txt");
  newsgroup <- as.character(newsgroup[,1]);
  
  train_label <- read.table("data/train.label");
  train_label <- train_label[,1]
  test_label <- read.table("data/test.label");
  test_label <- test_label[,1];
  
  train_data <- read.table("data/train.data");
  colnames(train_data) <- c("docID", "wordID", "count");
  
  test_data <- read.table("data/test.data");
  colnames(test_data) <- c("docID", "wordID", "count");
  
  train_data <- simple_triplet_matrix(train_data$docID, 
                                      train_data$wordID,
                                      train_data$count,
                                      nrow=max(train_data$docID),
                                      ncol=length(vocab));
  
  test_data <- simple_triplet_matrix(test_data$docID, 
                                     test_data$wordID,
                                     test_data$count,
                                     nrow=max(test_data$docID),
                                     ncol=length(vocab));
  

  #train_data <- Matrix(train_data, sparse = TRUE);
  #test_data <- Matrix(test_data, sparse = TRUE);
  
  assign("vocab", vocab, envir=.GlobalEnv);
  assign("newsgroup", newsgroup, envir=.GlobalEnv);
  assign("train_label", train_label, envir=.GlobalEnv);
  assign("test_label", test_label, envir=.GlobalEnv);
  assign("train_data", train_data, envir=.GlobalEnv);
  assign("test_data", test_data, envir=.GlobalEnv);
  
  n <- length(vocab); 
  alpha <- 1/n;
  k <- length(unique(train_label))
  
  assign("n", n, envir=.GlobalEnv);
  assign("alpha", alpha, envir=.GlobalEnv);
  assign("k", k, envir=.GlobalEnv);
    
}