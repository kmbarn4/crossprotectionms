# Author: KM Barnett
# Last update: 12 July 2021

# Load data
survival <- read.csv("/Users/kmbarnett/Documents/2021 summer/resubmit_july/post_Bd_challenge_survival_only.csv", header = TRUE)
head(survival)

#install.packages("survival")
#install.packages("survminer")
library("survminer")
library("survival")
library(ggplot2)

#LIVE California
survival_CA <- read.csv("/Users/kmbarnett/Documents/2021 summer/final_submission/final data/Live_CA_survival.csv", header = TRUE)
head(survival)
frogsurv_obj <- Surv(time = survival_CA$days_postBd_death, event = survival_CA$mortality_status)
fit1 <- survfit(frogsurv_obj ~ vaccine_strain, data = survival_CA)
summary(fit1)
p1 <- ggsurvplot(fit1, data = survival_CA,conf.int = TRUE,  xlim = c(0, 16), palette = c("black", "#7fbf7b", "#af8dc3"))
p1

#LIVE Panama
survival_Panama <- read.csv("/Users/kmbarnett/Documents/2021 summer/final_submission/final data/Live_Panama_Survival.csv", header = TRUE)
head(survival)
frogsurv_obj <- Surv(time = survival_Panama$days_postBd_death, event = survival_Panama$mortality_status)
fit2 <- survfit(frogsurv_obj ~ vaccine_strain, data = survival_Panama)
summary(fit2)

p1 <- ggsurvplot(fit1, data = survival_CA,conf.int = TRUE,  xlim = c(0, 16), palette = c("black", "#7fbf7b", "#af8dc3"))
p1
p2 <- ggsurvplot(fit2, data = survival_Panama,conf.int = TRUE,  xlim = c(0, 16), palette = c("black", "#7fbf7b", "#af8dc3"))
p2

##combine plots
library(gridExtra)
grid.arrange(p1$plot, p2$plot, nrow=1, ncol=2)

