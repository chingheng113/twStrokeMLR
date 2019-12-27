rm(list=ls())
cat("\014")
library(tableone)
library(dplyr)

# https://rpubs.com/aaronsc32/spearman-rank-correlation

data <- read.csv("TSR_2018_3m_noMissing_validated.csv", header = TRUE)

data['Barthel_Total'] <- data$Feeding+data$Transfers+data$Bathing+data$Toilet_use+data$Grooming+data$Mobility+data$Stairs+data$Dressing+data$Bowel_control+data$Bladder_control

data['NIHSS_Total'] <-data$NIHS_1a_out+ data$NIHS_1b_out+ data$NIHS_1c_out+ data$NIHS_2_out+ data$NIHS_3_out+ data$NIHS_4_out+ data$NIHS_5aL_out+ data$NIHS_5bR_out+ data$NIHS_6aL_out+ data$NIHS_6bR_out+ data$NIHS_7_out+ data$NIHS_8_out+ data$NIHS_9_out+ data$NIHS_10_out+ data$NIHS_11_out

#data['mrs_30'] <- data$MRS_TX_1

corr_BI_mrs90 <- cor.test(x=data$Barthel_Total, y=data$MRS_TX_3, method = 'spearman')
print(corr_BI_mrs90)
corr_nihss_mrs90 <- cor.test(x=data$NIHSS_Total, y=data$MRS_TX_3, method = 'spearman')
print(corr_nihss_mrs90)
corr_mrs30_mrs90 <- cor.test(x=data$MRS_TX_1, y=data$MRS_TX_3, method = 'spearman')
print(corr_mrs30_mrs90)