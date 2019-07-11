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
