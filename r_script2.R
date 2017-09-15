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


#### group by ####
meanph <- df %>% group_by(Reactor.phase) %>% 
                  summarise(mean.ph=mean(ph),
                            mean.d2=mean(Diversity...D2),
                            sd.ph=sd(ph))
#challenge
#generate sumary for reactor cycle 2 and add standard dev of the d2 and 
#log10 transformed cell count
challenge <- df %>% group_by(Reactor.phase) %>% 
  filter(Reactor.cycle=="2") %>% 
  summarise(sd.d2=sd(Diversity...D2),
            log.cc=mean(log10(Cell.density..cells.mL.)))

####mutate####
test <- df %>%
  filter(Reactor.cycle == 2) %>%
  mutate(condratio = Conductivity/temp) %>%   
  summarise(mean_d2 = mean(Diversity...D2),
            mean_log_celldens = mean(log(Cell.density..cells.mL.)))


####join data sets####

#split them for this example
physicochem <- df %>%  
  select(sample_title, temp, ph, Conductivity)
diversity <- df %>% 
  select(sample_title,contains("Diversity"))

#combine
physicodiversity <- dplyr::full_join(physicochem,diversity,by="sample_title")
df.nona <- na.exclude(df)

#### plot ####


p2 <- df %>% filter(Reactor.cycle==2) %>% 
  ggplot(aes(x = Timepoint,y = Cell.density..cells.mL., fill = Cell.density..cells.mL.)) +geom_point(shape = 21, size = 4)


#### combining dplyr and ggplot2 ####

p1 <- ggplot(data = df, aes(x = Timepoint,y = Cell.density..cells.mL., fill = Cell.density..cells.mL.)) +
  geom_point(shape = 21, size = 4)

df.2 <- df %>% filter(Reactor.cycle==2)

p2 <- df %>% filter(Reactor.cycle==2) %>% 
  ggplot(aes(x = Timepoint,y = Cell.density..cells.mL., fill = Cell.density..cells.mL.)) +geom_point(shape = 21, size = 4)

p2 + scale_y_log10()


