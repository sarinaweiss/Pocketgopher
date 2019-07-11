##7/11/19
head(pg2)

m1 <- glm(gopher ~ Acanthaceae, family = binomial, data = pg2)
m2 <- glm(gopher ~ Anacardiaceae, family = binomial, data = pg2)
m3 <- glm(gopher ~ Asteraceae, family = binomial, data = pg2)
m4 <- glm(gopher ~ Bromeliaceae, family = binomial, data = pg2)
m5 <- glm(gopher ~ Chrysobalanaceae, family = binomial, data = pg2)
m6 <- glm(gopher ~ Cistaceae, family = binomial, data = pg2)
m7 <- glm(gopher ~ Clusiaceae, family = binomial, data = pg2)
m8 <- glm(gopher ~ Convolvulaceae, family = binomial, data = pg2)
m9 <- glm(gopher ~ Cornaceae, family = binomial, data = pg2)
m10 <- glm(gopher ~ Dennstaedtiaceae, family = binomial, data = pg2)
m11 <- glm(gopher ~ Ericaceae, family = binomial, data = pg2)
m12 <- glm(gopher ~ Euphorbiaceae, family = binomial, data = pg2)
m13 <- glm(gopher ~ Fabaceae, family = binomial, data = pg2)
m14 <- glm(gopher ~ Fagaceae, family = binomial, data = pg2)
m15 <- glm(gopher ~ Lamiaceae, family = binomial, data = pg2)
m16 <- glm(gopher ~ Liliaceae, family = binomial, data = pg2)
m17 <- glm(gopher ~ Ophioglossaceae, family = binomial, data = pg2)
m18 <- glm(gopher ~ Oxalidaceae, family = binomial, data = pg2)
m19 <- glm(gopher ~ Pinaceae, family = binomial, data = pg2)
m20 <- glm(gopher ~ Poaceae, family = binomial, data = pg2)
m21 <- glm(gopher ~ Rosaceae, family = binomial, data = pg2)
m22 <- glm(gopher ~ Rubiaceae, family = binomial, data = pg2)
m23 <- glm(gopher ~ Smilacaceae, family = binomial, data = pg2)
m24 <- glm(gopher ~ Styracaceae, family = binomial, data = pg2)
m25 <- glm(gopher ~ Violaceae, family = binomial, data = pg2)

#View list of AIC values
AIC(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24,m25)
#     df  AIC
#m1   2 850.7463
#m2   2 851.3293
#m3   2 850.8679
#m4   2 850.3039
#m5   2 850.4349
#m6   2 845.4845
#m7   2 851.1254
#m8   2 850.3039
#m9   2 848.5504
#m10  2 845.8748
#m11  2 833.3787
#m12  2 846.6968
#m13  2 847.4079
#m14  2 832.4115
#m15  2 850.4349
#m16  2 848.8459
#m17  2 847.3844
#m18  2 851.7563
#m19  2 850.8791
#m20  2 849.5688
#m21  2 849.8836
#m22  2 851.7330
#m23  2 844.8983
#m24  2 849.3513
#m25  2 841.5027


#intalled package lme4 and MuMIn
install.packages("MuMIn")
library(MuMIn)
out.put<-model.sel(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24,m25)
View(out.put)
out.put
#Lowest AIC values are m14, m11, m25, m23

#Using stargazer package
install.packages("stargazer")
library(stargazer)
test <- stargazer(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24,m25 ,
                  type = "text",
                  title = "Regression Results",
                  align = TRUE,
                  style = "default",
                  dep.var.labels.include = TRUE,
                  flip = FALSE
                  )

View(test)

#ANOVA
anova(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24,m25, test = "Chi")

#install package sjPlot
library(lme4)
install.packages("sjPlot")
library(sjPlot)


##Additive and Interactive Effects
n1 <- glm(gopher ~ Fagaceae * Ericaceae, family = binomial, data = pg2)
n2 <- glm(gopher ~ Fagaceae * Violaceae, family = binomial, data = pg2)


#Old Code
##GLM

library(dplyr)

continuous <- select_if(pg2, is.numeric)
continuous
summary(continuous)

##standardize continuous variables?

factor <- select_if(pg2, is.factor)
ncol(factor)
factor

library(ggplot2)


xfactor = factor(pg2$gopher)
gopher_abs <- subset(pg2, gopher == "0")
gopher_pres <- subset(pg2, gopher == "1")

families <- pg2[c(1:612), -c(1:4)]
families

xfactor

#### - With pg2 error (invalid closure type), with PGdata - doesn't seem right 

glm(gopher ~ family, data = pg2, family = binomial(link = probit))
glm(family ~ gopher, data = PGdata, family = binomial(link = probit))

## - error (invalid type (list) for variable families)
glm(families ~ xfactor, family = binomial(link = probit))

##

data <- pg2[c(1:612), c(3,5:30)]
data
formula <- gopher~.
logit <- glm(formula, data = data, family = 'binomial')
summary(logit)

##

glm(gopher ~ Acanthaceae + Anacardiaceae + Asteraceae + Bromeliaceae + Chrysobalanaceae + Cistaceae + Clusiaceae + Convolvulaceae + Cornaceae + Dennstaedtiaceae + Ericaceae + Euphorbiaceae + Fabaceae + Fagaceae + Lamiaceae + Liliaceae + Ophioglossaceae + Oxalidaceae + Pinaceae + Poaceae + Rosaceae + Rubiaceae + Smilacaceae + Styracaceae + Violaceae, data = pg2, family = binomial(link = probit))

print(pg2)
attach(pg2)

lrfit <- glm(cbind(gopher) ~
               + Acanthaceae + Anacardiaceae + Asteraceae + Bromeliaceae + Chrysobalanaceae + Cistaceae + Clusiaceae + Convolvulaceae + Cornaceae + Dennstaedtiaceae + Ericaceae + Euphorbiaceae + Fabaceae + Fagaceae + Lamiaceae + Liliaceae + Ophioglossaceae + Oxalidaceae + Pinaceae + Poaceae + Rosaceae + Rubiaceae + Smilacaceae + Styracaceae + Violaceae, family = binomial)

glm(formula = cbind(gopher) ~ Acanthaceae + Anacardiaceae + Asteraceae + Bromeliaceae + Chrysobalanaceae + Cistaceae + Clusiaceae + Convolvulaceae + Cornaceae + Dennstaedtiaceae + Ericaceae + Euphorbiaceae + Fabaceae + Fagaceae + Lamiaceae + Liliaceae + Ophioglossaceae + Oxalidaceae + Pinaceae + Poaceae + Rosaceae + Rubiaceae + Smilacaceae + Styracaceae + Violaceae, 
family = binomial)

present <- gopher == "1"
absent <- gopher == "0"
