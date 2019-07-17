rm(list=ls())
cat("\014")
library(tableone)

all_data <- read.csv("all_right_wrong_h.csv", header = TRUE)
all_data <- all_data[ , -which(names(all_data) %in% c("ICASE_ID","IDCASE_ID"))]
attach(all_data)

model <- glm(ctype~., data=all_data,family=binomial(link = "logit"))
summary(model)