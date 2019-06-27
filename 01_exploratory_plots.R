<<<<<<< HEAD
####this is for exploratory plots

PGdata <- read.csv("PG_data.csv", header = TRUE, sep = ",")
str(PGdata)
#612 obs. of  10 variables:

head(PGdata)
tail(PGdata, n = 3)
summary(PGdata)
View(PGdata)
library(tidyverse)
############ code addition
pg2<- PGdata %>% 
  rowid_to_column() %>%  #creates unique id as some row was repeated
  select(rowid,site,gopher,field_id,percent_comp,family) %>%  #selects few columns
spread(key= family,value=percent_comp ) #spreads the data based on some value
  library(plyr)

  pg2[is.na(pg2)]<- 0 ##converts NA to 0
  head(pg2)
  

library(help = "graphics")
plot(PGdata$genus)
plot(PGdata$common)
plot(PGdata$percent_comp)

plot(PGdata$genus, PGdata$percent_comp)

plot(PGdata)

#subsetting data - pocket gopher presence vs. pocket gopher absence
PGAdata <- subset(PGdata, gopher == "0") #PG Absent
str(PGAdata)
#296 obs. of 10 variables 
head(PGAdata, n = 3)
tail(PGAdata, n = 3)
summary(PGAdata)

PGPdata <- subset(PGdata, gopher == "1") #PG Present
str(PGPdata)
#316 obs. of 10 variables 
head(PGPdata, n = 3)
tail(PGPdata, n = 3)
summary(PGPdata)

plot(PGAdata$genus)
plot(PGPdata$genus)
plot(PGAdata$genus, PGAdata$percent_comp)
plot(PGPdata$genus, PGPdata$percent_comp)
plot(PGAdata)
plot(PGPdata)

#points and lines 
plot(PGAdata$genus, PGAdata$percent_comp, xlab = 'Genus', ylab = 'Percent Composition', main = 'Vegetation Percent Composition at Gopher-Absent Sites')
plot(PGPdata$genus, PGPdata$percent_comp, xlab = 'Genus', ylab = 'Percent Composition', main = 'Vegetation Percent Composition at Gopher-Present Sites')


install.packages("ggplot2")
library(ggplot2)
attach(PGdata)

PGdata$gopher <- as.factor(PGdata$gopher)

pa_genus <- ggplot(PGAdata, aes(genus, percent_comp))
pa_genus +geom_bar(stat = "identity")

pa_family <- ggplot(PGAdata, aes(family, percent_comp))
pa_family +geom_bar(stat = "identity")

pp_genus <- ggplot(PGPdata, aes(genus, percent_comp))
pp_genus +geom_bar(stat = "identity")

pp_family <- ggplot(PGPdata, aes(family, percent_comp))
pp_family +geom_bar(stat = "identity")

pa <- ggplot(PGAdata, aes(genus))
pa +geom_bar()

pp <- ggplot(PGPdata, aes(genus))
pp +geom_bar()

p <- ggplot(PGdata, aes(genus, percent_comp))
p +geom_bar(stat = "identity", aes(fill = gopher), position = "dodge") +
  xlab("Genus") + ylab("Percent Composition") +
  ggtitle("Comparison of Vegetation Percent Composition by Genus in Pocket Gopher-Present vs. Pocket Gopher-Absent Sites")

pf <- ggplot(PGdata, aes(family, percent_comp))
pf +geom_bar(stat = "identity", aes(fill = gopher), position = "dodge") +
  xlab("Family") + ylab("Percent Composition") +
  ggtitle("Comparison of Vegetation Percent Composition by Family in Pocket Gopher-Present vs. Pocket Absent Sites")

library(tidyverse)
ggplot(data = PGAdata) +
  geom_bar(mapping = aes(x = genus))

ggplot(data = PGAdata, mapping = aes(x = genus, y = percent_comp)) +
  geom_bar(stat = "identity")

PGAdata %>% 
  count(genus)

ggplot(data = PGPdata) +
  geom_bar(mapping = aes(x = genus))

ggplot(data = PGPdata, mapping = aes(x = genus, y = percent_comp)) +
  geom_bar(stat = "identity")

PGPdata %>% 
  count(genus)

ggplot(data = PGdata, mapping = aes(x = genus, y = percent_comp)) +
  geom_bar(mapping = aes(colour = gopher), stat = "identity", position = "dodge")

ggplot(data = PGdata, mapping = aes(x = genus, y = percent_comp)) +
  geom_boxplot(mapping = aes(colour = gopher))

ggplot(data = PGdata, mapping = aes(x = family, y = percent_comp)) +
  geom_bar(mapping = aes(colour = gopher), stat = "identity", position = "dodge")

ggplot(data = PGdata, mapping = aes(x = family, y = percent_comp)) +
  geom_boxplot(mapping = aes(colour = gopher))
=======
####this is for explorTORY PLOTS
a<-c(1,2,3,4,5)
a
>>>>>>> fb584115d8b63f1bd8f21715a4777bbac16f9c4b
