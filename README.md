## Clustering and Predictive Analysis
##### For insurance industry in US markets

### Intro

A machine learning application written in R, to build learning models in Random Forest, GBM (Gradient boosting machine) and Deep learning to make predictions. Given a set of data of past claims (to train the model), the application predicts two data points, namely;

* RTW(return to work)
* Claim amount

### Prerequisites
* [Git](https://git-scm.com/)
* [R binary](https://www.r-project.org)
* [H2O Server](https://www.h2o.ai/)
* H2O library in R, use following code to install library
```
# In R REPL
install.packages("h2o")
```

### Execution

Clone the project, go into the project root and run

```
$> rscript R_files/claims_predictions.R
```

### Results
Results will be exported as csv files under /ext_data


