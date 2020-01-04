DESTINATION_HEADERS <- c("ID",
                        "RTW", 
                        "Total Amount", 
                        "Cause of Injury", 
                        "Type of Injury", 
                        "Nature of Injury",
                        "Affected body part type",
                        "Affected body part",
                        "ICD Description",
                        "Claim Status",
                        "Predicted RTW",
                        "Predicted Total Amount"
                        )
PREDICTION_MODEL_NAMES <- c("randomForest", "deepLearning", "gbm")
PREDICTION_COLUMNS <- c("rtw", "totalAmount")
RTW_INDEX <- 2
TOTAL_AMOUNT_INDEX <- 3
PREDICTOR_VECTOR <- 4:10
DATA_DIR <- "ext_data/"