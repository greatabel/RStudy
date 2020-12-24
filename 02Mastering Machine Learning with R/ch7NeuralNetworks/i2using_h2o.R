library(h2o)

path <- "../data/bank_DL.csv"
localH2O = h2o.init(nthreads = -1)

bank <- h2o.uploadFile(path=path)
class(bank)
str(bank)
head(bank)
summary(bank)
h2o.table(bank$y)

rand <- h2o.runif(bank, seed = 123)

train <- bank[rand <= 0.7, ]
train <- h2o.assign(train, key = "train")
test <- bank[rand  > 0.7, ]
test <- h2o.assign(test, key = "test")

h2o.table(train[, 64])
h2o.table(test[, 64])

hyper_params <- list(
  activation = c("Tanh", "TanhWithDropout"),
  hidden = list(c(20,20),c(40, 40),c(30, 30, 30)),
  input_dropout_ratio = c(0, 0.05),
  rate = c(0.01, 0.25)
)

search_criteria = list(
  strategy = "RandomDiscrete", max_runtime_secs = 420,     
  max_models = 100, seed = 123, stopping_rounds = 5, 
  stopping_tolerance = 0.01
)

randomSearch <- h2o.grid(
  algorithm = "deeplearning",
  grid_id = "randomSearch",
  training_frame = train,
  validation_frame = test, 
  x = 1:63, 
  y = 64,
  epochs = 1,
  stopping_metric = "misclassification",
  hyper_params = hyper_params,
  search_criteria = search_criteria
)                        

grid <- h2o.getGrid("randomSearch", sort_by = "auc", decreasing = T)
grid

best_model <- h2o.getModel(grid@model_ids[[1]])
h2o.confusionMatrix(best_model, valid = T)

dlmodel <- h2o.deeplearning(
  x = 1:63,
  y = 64, 
  training_frame = train,
  validation_frame = 
  hidden = c(30, 30, 30),
  epochs = 3,
  nfolds = 5,
  fold_assignment="Stratified",
  balance_classes = T,
  activation = "TanhWithDropout",
  seed = 123,
  adaptive_rate = F, 
  input_dropout_ratio = 0.05,
  stopping_metric = "misclassification",
  variable_importances = T
)

dlmodel

perf <- h2o.performance(dlmodel, test)
perf

dlmodel@model$variable_importances