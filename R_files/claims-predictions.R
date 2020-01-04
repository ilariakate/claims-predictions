source("R_files/requirements.R")
source("R_files/constants.R")
source("R_files/functions.R")

h2o.init(
  nthreads = -1,
  max_mem_size = "2G")
h2o.removeAll()

df <- h2o.importFile(path = "ext_data/claims_master.csv")
splits <- h2o.splitFrame(
  df,
  c(0.6,0.2),
  seed = 1234)
train <- h2o.assign(splits[[1]], "train.hex")
valid <- h2o.assign(splits[[2]], "valid.hex")
test <- h2o.assign(splits[[3]], "test.hex")

for(predictionModelName in PREDICTION_MODEL_NAMES) {
  predictionResults <- test
  
  for(predictionColumn in PREDICTION_COLUMNS) {
    index <- switch(predictionColumn, 
                   "rtw" = RTW_INDEX, 
                   "totalAmount" = TOTAL_AMOUNT_INDEX)
    model <- buildModel(predictionModelName, train, valid, PREDICTOR_VECTOR, index)
    predictions <- h2o.predict(
      object = model,
      newdata = test
    )
    predictionResults <- h2o.cbind(predictionResults, predictions)
  }
  
  names(predictionResults) <- DESTINATION_HEADERS
  
  # This will overwrite
  h2o.exportFile(predictionResults, concat(DATA_DIR, predictionModelName, "Results.csv"), TRUE)
}

### All done, shutdown H2O    
h2o.shutdown(prompt = FALSE)


