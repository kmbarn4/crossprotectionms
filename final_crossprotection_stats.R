# Author: KM Barnett
# Last update: 14 July 2021

#Data analysis for:
#Asymmetric cross-strain protection in amphibian response to Batrachochytrium dendrobatidis vaccination paper


### Survival analysis

# Load data
survival <- read.csv("/Users/kmbarnett/Documents/2020_fall/cross protection/data/xstrain_survival_analysis.csv")
head(survival)

library("KMsurv")
library("survival")

# Cox proportional hazards model
model1 <- coxph(Surv(mortality_day,mortality_status)~vaccine_strain*livebd_strain, data=survival)
summary(model1)

### Infection intensity analysis

# Load data
fullexp = read.csv("/Users/kmbarnett/Documents/2021 summer/final_submission/final data/final_cross_protection_data.csv")
head(fullexp)
library(glmmTMB)

# Zero-inflated negative binomial model on Bd counts for 3x2 experimental design
infection_intensity_model = glmmTMB(round(Final.Bd.Load) ~ Metabolite.Strain.or.Control*Live.Bd.Strain, family="nbinom2", ziformula = ~1, data = fullexp)
summary(infection_intensity_model)

# Post hoc test comparing ASW - Panama vs. California-Panama
# data set used for these models only includes ASW- Panama and California-Panama
ASW_v_CA = read.csv("/Users/kmbarnett/Documents/2021 summer/final_submission/final data/final_kmb_vaxstrain2.csv")

m2 = glmmTMB(round(final_Bd) ~ Vaccine, family="nbinom2", ziformula = ~1, data=ASW_v_CA)
summary(m2)

# Post hoc test comparing Panama-Panama vs. California-Panama
# data set used for these models only includes Panama-Panama and California-Panama only

PA_v_CA = read.csv("/Users/kmbarnett/Documents/2021 summer/final_submission/final data/final_kmb_vaxstrain3.csv")
m3 = glmmTMB(round(final_Bd) ~ Vaccine, family="nbinom2", ziformula = ~1, data=PA_v_CA)
summary(m3)

