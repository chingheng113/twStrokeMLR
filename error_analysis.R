rm(list=ls())
cat("\014")
library(tableone)
library(magrittr)
library(dplyr)

all_data <- read.csv("all_right_wrong_h.csv", header = TRUE)
attach(all_data)

all_data <- all_data %>%
  mutate(
    MRS_3=factor(MRS_3, labels=c('0','1', '2', '3', '4', '5', '6')),
    MRS_1=factor(MRS_1, labels=c('0','1', '2', '3', '4', '5', '6')),
    Mobility=factor(Mobility, labels=c('0','5','10', '15')),
    Toilet_use=factor(Toilet_use, labels=c('0','5','10')),
    Grooming=factor(Grooming, labels=c('0','5')),
    Bathing=factor(Bathing, labels=c('0','5')),
    Dressing=factor(Dressing, labels=c('0','5','10')),
    Transfers=factor(Transfers, labels=c('0','5','10','15')),
    discharged_mrs=factor(discharged_mrs, labels=c('0','1', '2', '3', '4', '5')),
    Stairs=factor(Stairs, labels=c('0','5','10')),
    Feeding=factor(Feeding, labels=c('0','5','10')),
    TRMNG_FL=factor(TRMNG_FL, labels=c('0','1')),
    NIHS_5aL_out=factor(NIHS_5aL_out, labels=c('0','1','2','3','4')),
    NIHS_5bR_out=factor(NIHS_5bR_out, labels=c('0','1','2','3','4')),
    Bladder_control=factor(Bladder_control, labels=c('0','5','10')),
    NIHS_6bR_out=factor(NIHS_6bR_out, labels=c('0','1','2','3','4')),
    Bowel_control=factor(Bowel_control, labels=c('0','5','10')),
    NIHS_10_out=factor(NIHS_10_out, labels=c('0','1','2')),
    NIHS_6aL_out=factor(NIHS_6aL_out, labels=c('0','1','2','3','4')),
    OFFDT_ID_1.0=factor(OFFDT_ID_1.0, labels=c('0','1')),
    TRMRE_FL=factor(TRMRE_FL, labels=c('0','1')),
    NIHS_6aL_in=factor(NIHS_6aL_in, labels=c('0','1','2','3','4')),
    ctype=factor(ctype, labels=c('0','1'))
  )

vars <- c('MRS_3', 'MRS_1', 'discharged_mrs', 'Mobility', 'Toilet_use', 'Grooming', 'Bathing', 'Dressing', 'Transfers', 'Stairs', 'Feeding', 'TRMNG_FL', 'NIHS_5aL_out', 'NIHS_5bR_out', 'Bladder_control', 'NIHS_6bR_out', 'Bowel_control', 'NIHS_10_out', 'NIHS_6aL_out', 'OFFDT_ID_1.0', 'TRMRE_FL', 'NIHS_6aL_in')
tabUnmatched <- CreateTableOne(vars = vars, strata = "ctype", data = all_data, test = TRUE)
print(tabUnmatched, smd = TRUE)


all_data <- read.csv("all_right_wrong_h.csv", header = TRUE)
contTable <- CreateContTable(vars = vars, strata = "ctype", data = all_data)
print(contTable)