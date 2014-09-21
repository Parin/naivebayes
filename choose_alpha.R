choose_alpha <- function(from=-5, to=0, n=50){
  alphas <- 10 ^ seq(from, to, length=50);
  accuracy <- rep(0, times=n);
  for(i in 1:n){
    params <- train_naive_bayes(alphas[i]);
    predicted_label <- predict_naive_bayes(params, test_data);
    accuracy[i] <- compute_accuracy(predicted_label);    
  }
  result <- list(alphas=alphas, accuracy=accuracy);
  return(result);
}

plot_line_chart <- function(data){
  plot(log(data$alphas,10), 
       data$accuracy, 
       xlab="log(alpha)", 
       ylab="accuracy(%)", 
       main="choosing prior", 
       type="l", 
       col="blue", 
       lwd=3);
}



