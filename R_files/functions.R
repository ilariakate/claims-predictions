concat <- function(...) {
  return(paste(..., sep = ''))
}

buildModel <- function(type, trainingFrame, validationFrame, x, y) {
  if(type == "randomForest") {
    model <- h2o.randomForest(
      training_frame = trainingFrame,
      validation_frame = validationFrame,
      x = x,
      y = y,
      ntrees = 20,
      stopping_rounds = 2,
      score_each_iteration = T,
      seed = 1000000)
    return(model)
  } else if(type == "deepLearning") {
    model <- h2o.deeplearning(
      training_frame = trainingFrame, 
      validation_frame = validationFrame,
      x = x,
      y = y,
      epochs = 10,
      variable_importances = T,
      seed = 1000000
    )
    return(model)
  }
    else if(type == "gbm") {
    model <- h2o.gbm(
      training_frame = trainingFrame,
      validation_frame = validationFrame,
      x = x,
      y = y,
      ntrees = 10000,
      stopping_rounds = 5,
      seed = 10000
    )
  }
}