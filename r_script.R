df <- read.csv("Metadata.csv")

# which variables?

str(df)

# Start polotting
library("ggplot2")

# Make first plot
ggplot(data=df, aes(x=Timepoint ,y=ph, fill=Reactor.cycle))+
  geom_point(shape=21)

#set cols as factor
df$Reactor.cycle <- factor(df$Reactor.cycle)

ggplot(data=df, aes(x=Timepoint ,y=ph, fill=Reactor.cycle))+
  geom_point(shape=21, size = 2)


ggplot(data=df, aes(x=Timepoint ,y=temp, fill=Reactor.cycle))+
  geom_point(shape=21, size = 2)

#store ggplot object
p1 <- ggplot(data=df, aes(x=Timepoint ,y=temp, fill=Reactor.cycle))+
  geom_point(shape=21, size = 2)

p2 <- p1 + geom_point(shape=21, size = 2, alpha=.5) + theme_bw() + geom_line()

p3 <- p2 + facet_grid(~Reactor.cycle)

#to plot, type p3
p3

# How do I know what's inside reactor cycle
df$Reactor.phase

levels(df$Reactor.phase)

p4 <- p2 + facet_grid(Reactor.phase~Reactor.cycle)
p4


#try above with reactor ph
p5 <- ggplot(data=df, aes(x=Timepoint ,y=temp, fill=Reactor.phase))+
  geom_point(shape=21, size = 2, alpha=.5) + theme_bw() + geom_line() + facet_grid(Reactor.phase~Reactor.cycle)
p5

p6 <- p5 + geom_line(aes(color=Reactor.phase))
p6

#Challene time
### Right side= Cpnductivity
### Middle: Diversity DO
### Left: Cell density

p7 <- ggplot(data=df, aes(x=Timepoint, y=Diversity...D0)) + geom_point (shape=21, size=2, alpha=.5,  aes(color=Reactor.phase)) + geom_line(aes(color=Reactor.phase)) + theme_bw() + scale_y_log10()
p7
p8 <- p7 + facet_grid(~Reactor.cycle)
p8

### other examples


## Right side
p5<-ggplot(data=df, aes(x=Timepoint , y=Diversity...D0, fill=Reactor.phase ))+
  geom_point(shape=21, size=5)
P6 <- p5 + facet_grid(~Reactor.phase)+theme_dark()
P6

### Middle side
############### conductivity ###### df <- read.csv("Metadata.csv",nrows=77) pp1 <- ggplot(data=df,aes(x= Timepoint,y=Conductivity,fill=Reactor.phase)) 
pp1 <- pp1 + geom_point(shape=21,size=4,alpha = 0.5) + theme_bw() +  geom_line(aes(color=Reactor.cycle)) # Facet it pp3 <- pp1 + facet_grid(~Reactor.cycle)  # how do i know whats in reactor phase unique(df$Reactor.phase) #plot alles in fucntie van reactor phase pp4 <- pp1 + facet_grid(Reactor.phase~Reactor.cycle) pp4




