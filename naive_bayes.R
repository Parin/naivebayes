train_naive_bayes <- function(alpha){
  cat("training naive bayes with alpha : ", alpha, " ...\n");
  
  p_x_given_y <- matrix(alpha, nrow=k, ncol=n);
  p_y <- matrix(0, nrow=k);
  
  for(i in 1:k){
    
    p_x_given_y[i,] <- p_x_given_y[i,] + col_sums(train_data[which(train_label == i),]);
    p_x_given_y[i,] <- p_x_given_y[i,] / sum(p_x_given_y[i,]);
    p_y[i] <- length(train_label[train_label == i]);
  }
  
  p_y <- p_y/sum(p_y);
  result <- list(p_x_given_y=p_x_given_y, p_y=p_y);
  return(result);
}

predict_naive_bayes <- function(params, data){
  cat("predicting classes ...\n");
  
  predict <- log(params$p_x_given_y) %*% t(as.matrix(data)) +
             as.matrix(log(params$p_y))[,rep(1,)];
  
  predicted_label <- apply(predict, 2, which.max);
  return(predicted_label);
}

compute_accuracy <- function(predicted_label){
  accuracy <- (sum(predicted_label == test_label)/dim(test_data)[1])*100;  
  cat("accuracy : ", accuracy, "%\n");
  return(accuracy);
}

params <- train_naive_bayes(alpha);
predicted_label <- predict_naive_bayes(params, test_data);
compute_accuracy(predicted_label);
confusion_matrix <- table(predicted_label, test_label);










