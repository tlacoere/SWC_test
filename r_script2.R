###part2###

### libs
library(ggplot2)
library(dplyr)
###load data
df <- read.csv("Metadata.csv")

### mean of controlphase within column ph
mean(df[df$Reactor.phase == "Control", "ph"])

levels(df$Reactor.phase)

####select####
physicochem <- select(df,ph,temp,Conductivity)

####pipe dataframe ####
physicochem <- df %>% select(ph,temp,Conductivity) 

physicochem.control <- df %>% 
  filter(Reactor.phase=="Control") %>% 
  select(ph,temp,Conductivity)

#challenge: select only Diversity parameter for reactor phase startup
diverisity <- df %>% 
  filter(Reactor.phase=="Startup") %>% 
  select(contains("Diversity"))




