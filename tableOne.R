rm(list=ls())
cat("\014")
library(tableone)
library(dplyr)

data <- read.csv("TSR_2018_3m_noMissing_validated.csv", header = TRUE)

data['Barthel_Total'] <- data$Feeding+data$Transfers+data$Bathing+data$Toilet_use+data$Grooming+data$Mobility+data$Stairs+data$Dressing+data$Bowel_control+data$Bladder_control
data['Barthel_Total'] <- cut(data$Barthel_Total, c(100,79,59,39,19,-1), labels = c('Totally dependent', 'Very dependent', 'Partially dependent', 'Minimally dependent', 'Independent'))

data['NIHSS_Total'] <-data$NIHS_1a_out+ data$NIHS_1b_out+ data$NIHS_1c_out+ data$NIHS_2_out+ data$NIHS_3_out+ data$NIHS_4_out+ data$NIHS_5aL_out+ data$NIHS_5bR_out+ data$NIHS_6aL_out+ data$NIHS_6bR_out+ data$NIHS_7_out+ data$NIHS_8_out+ data$NIHS_9_out+ data$NIHS_10_out+ data$NIHS_11_out
data['NIHSS_Total'] <- cut(data$NIHSS_Total, c(42,20,15,4,0,-1), labels = c('No stroke symptoms', 'Minor stroke', 'Moderate stroke', 'Moderate to severe stroke', 'Severe stroke'))

data['discharged_mrs'] <- cut(data$discharged_mrs, c(2) , labels = c('good','poor'))


select_data <- dplyr::select(data, Gender, onset_age, ICD_ID, discharged_mrs, Barthel_Total, NIHSS_Total)

select_data <- select_data %>%
  mutate(
    Gender=factor(Gender, labels =c('0', '1') ),
    Barthel_Total=factor(Barthel_Total, labels=c('Totally dependent', 'Very dependent', 'Partially dependent', 'Minimally dependent', 'Independent')),
    NIHSS_Total=factor(NIHSS_Total, labels=c('No stroke symptoms', 'Minor stroke', 'Moderate stroke', 'Moderate to severe stroke', 'Severe stroke')),
    discharged_mrs=factor(discharged_mrs, labels=c('good','poor')),
    ICD_ID=factor(ICD_ID, labels = c('1','2','3','4'))
  )

vars <- c('onset_age', 'ICD_ID', 'discharged_mrs', 'Barthel_Total', 'NIHSS_Total')
tabUnmatched <- CreateTableOne(vars = vars, strata = "Gender", data = select_data, test = TRUE)
print(tabUnmatched, smd = TRUE)